Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725A820B65A
	for <lists+linux-hams@lfdr.de>; Fri, 26 Jun 2020 18:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgFZQyz (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 26 Jun 2020 12:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgFZQyy (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 26 Jun 2020 12:54:54 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEBFC03E979
        for <linux-hams@vger.kernel.org>; Fri, 26 Jun 2020 09:54:54 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so11047185ljc.8
        for <linux-hams@vger.kernel.org>; Fri, 26 Jun 2020 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=qyfJ7rlKHi80QWYEFhgDft7oO+HZpsE5iYNVH2coXhQ=;
        b=P5OvVQ4zr59ilULmRe3FJmmbb46DOz6WIQrXUP5/Y4bMJjOntx1mHwA7fFkob5paO5
         IVerOcjGRLayKJHKjtxsFliguOM/1qZG0l4GCSa8s+wxN85t6PzDTyptDgcPBMtPBi7s
         GKPsRfD4mTIDy+2daFWFOehX4OXmSWZSbUUl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qyfJ7rlKHi80QWYEFhgDft7oO+HZpsE5iYNVH2coXhQ=;
        b=oRwrZw9bTJMjzghrTaVItKiSfy9EGgBnagWIwqgNZR8GE5OnKixKAjkSKvFWzQ5L+q
         w0rrAj6Q/H9XPlusC56d/aDiRpBoy0vp3tsN5el97PZ56wKoJ3TfjuPD2RYjG8l6NXk4
         jFD/TjgSknMbTrKmiSMEd762lvLjgaW4Nfnr3al7puphl6BCevp64ZOFhmMzqsWLYFJM
         ZRxRoNGyHFQyJWjym8NVHzCIramrpRs+Q4HhIeQkTOjHlQTmwy/TlLwcapoorCjis0so
         FXDy1BOvM9khOhksJYq7BjDSqMQBtW1oNLFRWTsLswCKkG/tUoAWqGcNCOlg1FfubE37
         r9KA==
X-Gm-Message-State: AOAM5314S8SKfLb9h6DY5HUfwMxRP9OzNf8YI5OVOamKISNonVbDYqs5
        xtip0NVVYwhOtn163BOCfGb5DW6hKsxVQ24SouGNvgYei7g=
X-Google-Smtp-Source: ABdhPJypdt1tB6BQ091cM0LnCUhuZBNE98lwh6HgsrcfoE39Cwlonx0qxamNG9KzbZV8rNLB2VGhTBCQzNByHd3kplI=
X-Received: by 2002:a2e:9b16:: with SMTP id u22mr1768635lji.295.1593190492625;
 Fri, 26 Jun 2020 09:54:52 -0700 (PDT)
Received: from 195210475306 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2020 09:54:51 -0700
MIME-Version: 1.0
From:   thomas@habets.se
Date:   Fri, 26 Jun 2020 09:54:51 -0700
Message-ID: <CA+kHd+cdzU2qxvHxUNcPtEZiwrDHFCgraOd=BdksMs-snZRUXQ@mail.gmail.com>
Subject: [PATCH] ax25: Don't hold skb lock while doing blocking read
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Here's a test program that illustrates the problem:
https://github.com/ThomasHabets/radiostuff/blob/master/ax25/axftp/examples/client_lockcheck.cc

Before this patch, this hangs, because the read(2) blocks the
write(2).

I see that calling skb_recv_datagram without this lock is done in
pep_sock_accept() and atalk_recvmsg() and others, which is what makes
me think it's safe to do here too. But I'm far from an expert on skb
lock semantics.

I see some other socket types are also locking during
read. E.g. qrtr_recvmsg. Maybe they need to be fixed too.

Before:
strace -f -eread,write ./examples/client_lockcheck M0THC-9 M0THC-0 M0THC-2
strace: Process 3888 attached
[pid  3888] read(3,  <unfinished ...>
[pid  3887] write(3, "hello world", 11
[hang]

After:
strace -f -eread,write ./examples/client_lockcheck M0THC-9 M0THC-0 M0THC-2
strace: Process 2433 attached
[pid  2433] read(3,  <unfinished ...>
[pid  2432] write(3, "hello world", 11) = 11
[pid  2433] <... read resumed> "yo", 1000) = 2
[pid  2433] write(1, "yo\n", 3yo
)         = 3
[successful exit]


diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index fd91cd34f25e..378ee132e4d0 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1617,22 +1617,22 @@ static int ax25_recvmsg(struct socket *sock,
struct msghdr *msg, size_t size,
        int copied;
        int err = 0;

-       lock_sock(sk);
        /*
         *      This works for seqpacket too. The receiver has ordered the
         *      queue for us! We do one quick check first though
         */
        if (sk->sk_type == SOCK_SEQPACKET && sk->sk_state != TCP_ESTABLISHED) {
                err =  -ENOTCONN;
-               goto out;
+               goto out_nolock;
        }

        /* Now we can treat all alike */
        skb = skb_recv_datagram(sk, flags & ~MSG_DONTWAIT,
                                flags & MSG_DONTWAIT, &err);
        if (skb == NULL)
-               goto out;
+               goto out_nolock;

+       lock_sock(sk);
        if (!sk_to_ax25(sk)->pidincl)
                skb_pull(skb, 1);               /* Remove PID */

@@ -1677,6 +1677,7 @@ static int ax25_recvmsg(struct socket *sock,
struct msghdr *msg, size_t size,

 out:
        release_sock(sk);
+out_nolock:

        return err;
 }
