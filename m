Return-Path: <linux-hams+bounces-348-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43788D4F81
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 17:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F7A7285FF7
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 15:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4F4224DE;
	Thu, 30 May 2024 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="BKC8V19u"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp116.iad3b.emailsrvr.com (smtp116.iad3b.emailsrvr.com [146.20.161.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F2C224D4
	for <linux-hams@vger.kernel.org>; Thu, 30 May 2024 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717084729; cv=none; b=L47yx4EnMfTvWYK1hdA5koT/5sM3UBYQy4GpzqsMl8gUtAMrPkZXerZy1tM4V6ydjZ1Ojs2g8vu8CDokTq/ciS9cUQQpRob/d28ALsXErh8pvKFe3wv03G8jMyKynvUSkcgOOQ6wfD0BvREja1ol6yeyCcPyn0gu2PxricHmwQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717084729; c=relaxed/simple;
	bh=YE8BsWU1m0dtfjhyQtUj+X20La8Q2U3scD3zaOVIT0k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSX2STc2aqwMjtJgTr4DU/beJZLqJUR47oed20fQDjpzjZBy6ClJ4kOqqVQ5Gq0Kunolm9k4FlFdmqPqTalLJU/1+1nQt/0mTaTK/xC7eD4vU0ug7mmO6i0/bfd59yNitOkUwyWYFvrboo5MWSyi2hS0WE0h/mwxBmxZ5ofeFJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=BKC8V19u; arc=none smtp.client-ip=146.20.161.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1717084726;
	bh=YE8BsWU1m0dtfjhyQtUj+X20La8Q2U3scD3zaOVIT0k=;
	h=Date:From:To:Subject:From;
	b=BKC8V19uEjXWJpJZ2qb4rgGWMwgsOM2eS7l8/ifgpjXsnmnH4ChGJNvCzQ68yd6Lh
	 NO2LudtfZuLMfFfGTxBSpOjAVjAraF2rxm2/epvO+HFKU9ysxai9lMKoFKPobhNY8o
	 GTtBT3jptuf/rCXsdHFkvWs/EM772pkRZ2xIPK/o=
X-Auth-ID: lars@oddbit.com
Received: by smtp7.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id D05EF6010D
	for <linux-hams@vger.kernel.org>; Thu, 30 May 2024 11:58:46 -0400 (EDT)
Date: Thu, 30 May 2024 11:58:46 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: linux-hams <linux-hams@vger.kernel.org>
Subject: Kernel fails to flush queues when closing sockets
Message-ID: <2qncrme5xuch2w2vzznk5eoiebdiiwcwck3dmxet73mzos7zh2@lgdxko4x5bsj>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Classification-ID: b5fff0e4-048a-480f-bbe5-2b9e4f42b01f-1-1

I have a new problem I'd like to solve.

For testing purposes, I wanted a simple ax25 listener that would accept
a new connection, send a fixed string, and then disconnect. I wrote some
test code (see below) with a simple accept/write/close loop, but while I can
successfully connect to the listener using e.g. axcall, I never receive
any data:

    host1:~# call -r udp1 host1
    GW4PTS AX.25 Connect 2.1.0
    Trying...
    *** Connected to host1
    Rawmode
    *** Cleared

If I add a short sleep (e.g., sleep(1)) after the write() but before
close(), the data is received successfully by the client:

    $ call -r udp1 host1
    GW4PTS AX.25 Connect 2.1.0
    Trying...
    *** Connected to host1
    Rawmode
    HELLO AX.25 USER

    *** Cleared

It looks like ax25 sockets lack the behavior provided by the SO_LINGER
option for tcp sockets:

> When enabled, a close(2) or shutdown(2) will not return
> until all queued messages for the socket have been
> successfully sent or the linger timeout has
> been reached.

I have a few questions:

1. Is the behavior I'm seeing right now expected?
2. Is there any way to determine (from userspace) if an ax25 socket has
   unsent data (so that I could test for that rather than using a fixed
   timeout)? Or is there some sort of "flush socket" operation?
3. Is there any equivalent to SO_LINGER in the current kernel ax25
   implementation?
4. If not, *should* there be? And should that be the default behavior?

Thanks!

Test code follows:

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <sys/socket.h>
    #include <unistd.h>

    #include <netax25/ax25.h>
    #include <netax25/axconfig.h>
    #include <netax25/axlib.h>

    #define OPT_PORT 'p'
    #define OPTSTRING "p:"

    char *msg = "HELLO AX.25 CALLER\r\n";

    int main(int argc, char *argv[]) {
      int ch, sock;
      socklen_t addrlen;
      char *port = NULL, *addr = NULL;
      struct full_sockaddr_ax25 sockaddr;

      addrlen = sizeof(struct full_sockaddr_ax25);

      while ((ch = getopt(argc, argv, OPTSTRING)) != -1) {
        switch (ch) {
        default:
          fprintf(stderr, "unhandled option: %c\n", ch);
          exit(2);
          break;
        }
      }

      if (argc != 2) {
        fprintf(stderr, "you must provide an ax.25 port name\n");
        exit(2);
      }

      if (ax25_config_load_ports() == 0) {
        fprintf(stderr, "ax25d: no AX.25 port data configured\n");
        return 1;
      }

      port = argv[1];
      if ((addr = ax25_config_get_addr(port)) == NULL) {
        fprintf(stderr, "%s: invalid ax.25 port name\n", port);
        exit(1);
      }
      fprintf(stderr, "port %s -> addr %s\n", port, addr);

      sockaddr.fsa_ax25.sax25_family = AF_AX25;
      sockaddr.fsa_ax25.sax25_ndigis = 0;
      ax25_aton_entry(addr, sockaddr.fsa_ax25.sax25_call.ax25_call);

      if ((sock = socket(AF_AX25, SOCK_SEQPACKET, 0)) < 0) {
        perror("socket");
        return 1;
      }

      if (bind(sock, (struct sockaddr *)&sockaddr, addrlen) < 0) {
        perror("bind");
        return 1;
      }

      if (listen(sock, SOMAXCONN) < 0) {
        perror("listen");
        return 1;
      }

      while (1) {
        struct full_sockaddr_ax25 clientaddr;
        socklen_t clientlen;
        int new;
        char buf[1];

        if ((new = accept(sock, (struct sockaddr *)&clientaddr, &clientlen)) < 0) {
          perror("accept");
          exit(1);
        }

        fprintf(stderr, "accepted connection from %s\n",
                ax25_ntoa(&clientaddr.fsa_ax25.sax25_call));
        write(new, msg, strlen(msg));
        
        /*
         * for this to actually work you need to uncomment the following
         * call to sleep(); otherwise clients (almost) never receive the
         * data from the write() operation.
         */
        //sleep(1);

        fprintf(stderr, "disconnecting.\n");
        close(new);
      }
    }

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

