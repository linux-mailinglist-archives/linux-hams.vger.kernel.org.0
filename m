Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E76F4179DD
	for <lists+linux-hams@lfdr.de>; Fri, 24 Sep 2021 19:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344281AbhIXRb3 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 24 Sep 2021 13:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344204AbhIXRb2 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 24 Sep 2021 13:31:28 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B8AC061571
        for <linux-hams@vger.kernel.org>; Fri, 24 Sep 2021 10:29:55 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id a3so15418305oid.6
        for <linux-hams@vger.kernel.org>; Fri, 24 Sep 2021 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google;
        h=in-reply-to:mime-version:references:from:date:message-id:subject:to
         :cc;
        bh=ImZHlD8vpTg1IENLY/HYCrR+jdIjWpW67Dz39Qo8qGg=;
        b=WFU0vaFKTDP05DjqbpF0L5byzgHSeulE5t4id8wVrTyZavcNQX773wtKtwyMfC96AV
         KZJH4VXxfoVSonKSvi2FiJY/RMIc2jM/FML/3gPQ7L6q5TPmDxrVzTigPEWOpkDLR4bS
         ZTjU+jGAhHXwKNvBDJt6vi8fwZvjz8Y0d+fEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:in-reply-to:mime-version:references:from:date
         :message-id:subject:to:cc;
        bh=ImZHlD8vpTg1IENLY/HYCrR+jdIjWpW67Dz39Qo8qGg=;
        b=MIUl3DlwAh+Vqgvw0AuKxLhyrAt1rjcJclvyyR8U919l500bfIX+aBXUx4OKQrrYDA
         cDUx4XQMpOgKHiONrCRmCBzfGHzWeOT99/OVQiDDKNRJ+l6BiC5qXNpQ+cR2xjAVnhJ6
         xoyb1wGocYqDwC95wX52/1aCIY8bumwjZIWWBBJKmLbuxe7nILwJam34+fw2EFpi1XpE
         VjxHmspbnfI08KQGZGNTL6zRS/IeoIwsqvW+Y2c3zebiyJPE4n3ZhWzSduufYgiTP2bo
         9vdTCEidO3FfEx0h0fEA/K6iRELkJL1dMmzbNa/+UljL4JQzfdjac2qlYo1gXrYBJhRH
         E8rg==
X-Gm-Message-State: AOAM533sfNCDYpcPO+14deHlWzCI31CEYRs0g+tJw3OdRNRFEFlQ5TgS
        Budqq2NCsjO3YL5XIvx8x+usIXglD2VdR1/q4Lp0ib6063Zrog==
X-Google-Smtp-Source: ABdhPJzqHHFjW2zJyLCLAgVGzSaw+Py8drpt65y2fvOD5uevGzSMEpvDn+640ErArgmxos7k97WmnY4ZlvFG56Fr9C8=
X-Received: by 2002:a05:6808:b02:: with SMTP id s2mr2357876oij.27.1632504594198;
 Fri, 24 Sep 2021 10:29:54 -0700 (PDT)
Received: from 195210475306 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Sep 2021 10:29:53 -0700
In-Reply-To: <CA+kHd+cvbwz+T2rwnGG7JpcK33DAn25kk4FWUckVT3P9nY+2=A@mail.gmail.com>
MIME-Version: 1.0
References: <CA+kHd+e=XQ6m7YgMGMmK5FjkX=bYVEQ7n57GaY8j0qHtwzZPpg@mail.gmail.com>
 <e235ee10-5774-f690-0c5e-5dc575482936@trinnet.net> <CA+kHd+cvbwz+T2rwnGG7JpcK33DAn25kk4FWUckVT3P9nY+2=A@mail.gmail.com>
From:   thomas@habets.se
Date:   Fri, 24 Sep 2021 10:29:53 -0700
Message-ID: <CA+kHd+fZgoTd=H7wCOqTh1HS3Co-cydpQW5jf48Sv3z=ZdpL2A@mail.gmail.com>
Subject: Re: Unable to receive UI frames with DGRAM socket
To:     David Ranch <linux-hams@trinnet.net>
Cc:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Wed, 22 Sep 2021 22:11:11 +0100, thomas@habets.se said:
> But surely there should be a way to use SOCK_DGRAM, in any capacity at
> all?

I made an ugly patch that at least will make SOCK_DGRAM work.

I didn't make too much effort into perfecting it, because it's unclear
to me how SOCK_DGRAM is supposed to even work.

E.g. it seems to be possible to bind() to addresses that don't have an
axparms --assoc, but should it be?

And I'm not sure if I should change the transport header size for UI
frames without L3 information so that it's 1 for AX25_P_TEXT
frames. Seems that I should seeing as how experimentally when you send
it it's only one byte.

There's also the issue of multiple sockets listening to the same
SSID. Should that be possible? Currently the input handling code only
looks up the first `struct sock` and gives the packet there.

Summary of problems before this patch:
* AX25 SOCK_DGRAM just plain seems broken, meaning SEQPACKET and
  PACKET (effectively RAW) are the only two options for userspace.
* And PACKET, the only way to receive UI frames, requires root
* PACKET also requires parsing the header, including digipeater path,
  by the user.

Summary of problems with this patch:
* Transport header is probably set incorrectly
* Only one socket can receive the data, including broadcast data
* It's unclear what socket semantics are intended
* Unclear what socket security restrictions are intended

But it works. Aside from the problems above it does work:

recvfrom(3, "PING", 4196, 0, {sa_family=AF_AX25,
fsa_ax25={sax25_call={ax25_call="\x9a\x60\xa8\x90\x86\x40\x69"} /*
M0THC-4 */, sax25_ndigis=0}}, [72]) = 4

(actually should the local interface SSID be added to the sax25_ndigis
here. It's not, as you can see)

diff --git a/include/net/ax25.h b/include/net/ax25.h
index 8b7eb46ad72d..acc557d53cb7 100644
--- a/include/net/ax25.h
+++ b/include/net/ax25.h
@@ -303,7 +303,7 @@ extern struct hlist_head ax25_list;
 extern spinlock_t ax25_list_lock;
 void ax25_cb_add(ax25_cb *);
 struct sock *ax25_find_listener(ax25_address *, int, struct net_device *, int);
-struct sock *ax25_get_socket(ax25_address *, ax25_address *, int);
+struct sock *ax25_get_socket(ax25_address *, int);
 ax25_cb *ax25_find_cb(ax25_address *, ax25_address *, ax25_digi *,
                      struct net_device *);
 void ax25_send_to_raw(ax25_address *, struct sk_buff *, int);
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 269ee89d2c2b..4c41717530b8 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -176,17 +176,15 @@ struct sock *ax25_find_listener(ax25_address
*addr, int digi,
 /*
  *     Find an AX.25 socket given both ends.
  */
-struct sock *ax25_get_socket(ax25_address *my_addr, ax25_address *dest_addr,
-       int type)
+struct sock *ax25_get_socket(ax25_address *my_addr, int type)
 {
        struct sock *sk = NULL;
        ax25_cb *s;

        spin_lock(&ax25_list_lock);
        ax25_for_each(s, &ax25_list) {
-               if (s->sk && !ax25cmp(&s->source_addr, my_addr) &&
-                   !ax25cmp(&s->dest_addr, dest_addr) &&
-                   s->sk->sk_type == type) {
+               if (s->sk && s->sk->sk_type == type &&
+                   !ax25cmp(&s->source_addr, my_addr)) {
                        sk = s->sk;
                        sock_hold(sk);
                        break;
diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
index cd6afe895db9..9872b92a58ca 100644
--- a/net/ax25/ax25_in.c
+++ b/net/ax25/ax25_in.c
@@ -231,12 +231,11 @@ static int ax25_rcv(struct sk_buff *skb, struct
net_device *dev,

                ax25_send_to_raw(&dest, skb, skb->data[1]);

-               if (!mine && ax25cmp(&dest, (ax25_address
*)dev->broadcast) != 0)
-                       goto free;
-
                /* Now we are pointing at the pid byte */
                switch (skb->data[1]) {
                case AX25_P_IP:
+                       if (!mine && ax25cmp(&dest, (ax25_address
*)dev->broadcast) != 0)
+                               goto free;
                        skb_pull(skb,2);                /* drop PID/CTRL */
                        skb_reset_transport_header(skb);
                        skb_reset_network_header(skb);
@@ -247,6 +246,8 @@ static int ax25_rcv(struct sk_buff *skb, struct
net_device *dev,
                        break;

                case AX25_P_ARP:
+                       if (!mine && ax25cmp(&dest, (ax25_address
*)dev->broadcast) != 0)
+                               goto free;
                        skb_pull(skb,2);
                        skb_reset_transport_header(skb);
                        skb_reset_network_header(skb);
@@ -257,7 +258,7 @@ static int ax25_rcv(struct sk_buff *skb, struct
net_device *dev,
                        break;
                case AX25_P_TEXT:
                        /* Now find a suitable dgram socket */
-                       sk = ax25_get_socket(&dest, &src, SOCK_DGRAM);
+                       sk = ax25_get_socket(&dest, SOCK_DGRAM);
                        if (sk != NULL) {
                                bh_lock_sock(sk);
                                if (atomic_read(&sk->sk_rmem_alloc) >=
@@ -267,7 +268,7 @@ static int ax25_rcv(struct sk_buff *skb, struct
net_device *dev,
                                        /*
                                         *      Remove the control and PID.
                                         */
-                                       skb_pull(skb, 2);
+                                       skb_pull(skb, 1);
                                        if (sock_queue_rcv_skb(sk, skb) != 0)
                                                kfree_skb(skb);
                                }
