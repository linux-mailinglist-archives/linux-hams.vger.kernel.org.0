Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3381A3D7B1D
	for <lists+linux-hams@lfdr.de>; Tue, 27 Jul 2021 18:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhG0QgR (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 27 Jul 2021 12:36:17 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:40801 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhG0QgR (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 27 Jul 2021 12:36:17 -0400
Received: (Authenticated sender: ralf@linux-mips.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 10D4C20004
        for <linux-hams@vger.kernel.org>; Tue, 27 Jul 2021 16:36:15 +0000 (UTC)
Date:   Tue, 27 Jul 2021 18:36:13 +0200
From:   Ralf Baechle <ralf@linux-mips.org>
To:     linux-hams@vger.kernel.org
Subject: SIOCGIFHWADDR errors and long network device names
Message-ID: <YQA1/VD9E8bnj1Ox@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

While I've analyzed the issue years ago I've finally thrown the gauntlet
at this bug - which unfortunately is a whole class of bugs.  At this
point I've fixed the listen program to use the strategy I've lined out in
previous postings.  What the existing code does:

  struct sockaddr sa;		/* really is a struct sockaddr_pkt  */
  socklen_t asize = sizeof(sa);
  struct ifreq ifr;
  int sock;

  sock = socket(PF_PACKET, SOCK_PACKET, htons(proto));
  size = recvfrom(sock, buffer, sizeof(buffer), 0, &sa, &asize);
  strcpy(ifr.ifr_name, sa.sa_data);
  ioctl(sock, SIOCGIFHWADDR, &ifr);

where the problem was that struct sockaddr's sa_data[] as returned by
recvfrom is only 14 bytes long and thus 2 bytes shorter than IFNAMSIZ.
And SOCK_PACKET is deprecated anyway.

So the new solution is to use a SOCK_RAW socket.  This will make recfrom
return it's address result in a struct sockaddr_pkt instead which does
no longer hold an interface name but an interface index.  We thus will
have to convert the interface index to an interface name using an
SIOCGIFNAME ioctl.

  struct sockaddr_ll sa;
  socklen_t asize = sizeof(sa);
  struct ifreq ifr;
  int sock;

  sock = socket(PF_PACKET, SOCK_RAW, htons(proto));
  size = recvfrom(sock, buffer, sizeof(buffer), 0, &sa, &asize);
  fr.ifr_ifindex = index;
  res = ioctl(sock, SIOCGIFNAME, &ifr);
  printf("if_name: %s\n", ifr.ifr_name);

It's just a sketch but it should demonstrate the gist.

Please help to finally stamp out the issue in other packages!

Thanks,

  Ralf
