Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0264C43B8D4
	for <lists+linux-hams@lfdr.de>; Tue, 26 Oct 2021 19:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbhJZSCA (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 26 Oct 2021 14:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbhJZSCA (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 26 Oct 2021 14:02:00 -0400
X-Greylist: delayed 367 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Oct 2021 10:59:36 PDT
Received: from n1uro.ampr.org (n1uro.ampr.org [IPv6:2001:470:8a1e::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8299AC061745
        for <linux-hams@vger.kernel.org>; Tue, 26 Oct 2021 10:59:36 -0700 (PDT)
Received: from n1uro.ampr.org (n1uro [44.88.0.9])
        by n1uro.ampr.org (Postfix) with ESMTP id 0E8082088E
        for <linux-hams@vger.kernel.org>; Tue, 26 Oct 2021 13:53:17 -0400 (EDT)
Received: from n1uro.ampr.org (n1uro.ampr.org [IPv6:2001:470:8a1e::3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by n1uro.ampr.org (Postfix) with ESMTPSA id E2CEB205DA
        for <linux-hams@vger.kernel.org>; Tue, 26 Oct 2021 13:53:16 -0400 (EDT)
Message-ID: <1635270796.2318.2.camel@n1uro.com>
Subject: NetRom stack bug
From:   Brian <n1uro@n1uro.com>
Reply-To: n1uro@n1uro.com
To:     linux-hams@vger.kernel.org
Date:   Tue, 26 Oct 2021 13:53:16 -0400
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-AV-Checked: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Greetings;

Is there any status report on the NetRom status bug getting fixed?
Unfortunately many users feel this is a bug within URONode code and it
is NOT. This is a bug where the kernel protocol stack is NOT closing
unused sockets which could in theory make it vulnerable to compromise.
-- 
I crashed into a dwarf at a traffic light. He said "I'm not
happy." so I asked which one was he.
-----
73 de Brian N1URO
Linux Partner Developer
Decades long Linux SysAdmin, DNS Host, Email Host
IPv6 Certified
URONode, axMail-FAX, HTPPU Ham software developer
Nutmeg VHF NTS Net - Net Manager
