Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2336F413A66
	for <lists+linux-hams@lfdr.de>; Tue, 21 Sep 2021 20:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbhIUS5j (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 21 Sep 2021 14:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhIUS5i (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 21 Sep 2021 14:57:38 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387F1C061574
        for <linux-hams@vger.kernel.org>; Tue, 21 Sep 2021 11:56:10 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id n65-20020a9d2047000000b00547334367efso2790671ota.1
        for <linux-hams@vger.kernel.org>; Tue, 21 Sep 2021 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=suK7qtQVX//DQGursJ7xjQdf3jIpf7FbYnt7ebLQCH4=;
        b=Jm8OELwp3BjQ2RxWOOu4oZuhJeSWugIHtOW+kPdpDV9vNSNIOVswoR1ckobHWGaqLf
         lOPQrWCThKuiTe5c/xL+LNIIi/+pJafHMe0xFhFgtKgZfaPWBVQ860XJ7hKFVUxefJjo
         nEguonSaP3Xj/hyFaYV60WnF2F3n5G+ObCMP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=suK7qtQVX//DQGursJ7xjQdf3jIpf7FbYnt7ebLQCH4=;
        b=0WhA9P6SQQaPPkgr8op2vEjUTP7sHioCincdYYl5a3geMFYZCTCySihsumLVg2+qIi
         EbfB/wlIWl1Gc/V+XrEuow3ihbdqAMe53jhagD1MfVQChH691w50sxgTPsbVNVUL5oS6
         FWUv3jmrsdkRUiDyXYnX/o0+fF/o/DwTnHOTOvxPM2pBQHFGjuyB2ey4y5ck0pv6tsjZ
         vqqydaQ+SnPpRWxgSVQ2If9jKViaNS2tQtZojXzSv3Q94nrM9RD3wdKUjbOl275kMtO6
         mUW1pLHef8Zs+aFQp99ozOEFGebZrpcUITSEbUZLyo4oUTSKPCZ5Cpk1Yd6XmO4or2s2
         qX2g==
X-Gm-Message-State: AOAM531UlW+a8DHs41FDinQftyPWhmksdHSbbdEO6mmBylFx+Ge01sOG
        dSlFaO2Z4J2Gqu2wkbtwUSUMXJTw7Q8PZjJt1DIci8VZfhC1lg==
X-Google-Smtp-Source: ABdhPJwm856IhmrLarvqsfkf6cAPkM11/KJQYzPgSOwSP5eB8NnlUe85X90RtjynwkvwCuxnwkF6hKyVeRkpikGpfyA=
X-Received: by 2002:a9d:5a8e:: with SMTP id w14mr14233385oth.322.1632250569199;
 Tue, 21 Sep 2021 11:56:09 -0700 (PDT)
Received: from 195210475306 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 11:56:08 -0700
MIME-Version: 1.0
From:   thomas@habets.se
Date:   Tue, 21 Sep 2021 11:56:08 -0700
Message-ID: <CA+kHd+e=XQ6m7YgMGMmK5FjkX=bYVEQ7n57GaY8j0qHtwzZPpg@mail.gmail.com>
Subject: Unable to receive UI frames with DGRAM socket
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi.

I'm trying to send and receive UI frames with a DGRAM socket, but am
not having any success. I've resorted to using bpftrace to find where
the frames are dropped and the code looks very strange to me.

After bind() to an address, netstat -nap shows:

Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
*          M6VMB-1    ax0     LISTENING    000/000  0       0

That seems fine, but note the unspecified destination. That's on
purpose, since I want to listen to any and all UI frames going to
M6VMB-1.

But it looks like UI frames will only work when both source and
destination are an exact match.

ax25_get_socket() checks both[1], and it's called from ax25_rcv[2].

And that's where the packet is dropped. With my bpftrace[3] I see this
(annotated. function name means kprobe, tilde-version means kretprobe):

Attaching 11 probes...
ax25_kiss_rcv()        # Packet received
ax25cmp                # Is it our port address?
~ax25cmp 0             # ... yes it is
ax25_send_to_raw(,0xffff9d2078d37e00, f0)
    Type (3 for UI): 3     # UI packet
    Proto: f0              # AX25_P_TEXT
ax25cmp                    # is this socket listening for this?
~ax25cmp 0                 # ... yes, but it's not a raw socket,
                           #     so never mind.
~ax25_send_to_raw
ax25_get_socket(l@,d`g,type=2)   # ok, time to find the right socket
ax25cmp              # does this dst address match local?
~ax25cmp 0           # .. yes it does!
ax25cmp              # does the src match... "*" from netstat?
~ax25cmp 1           # ... of course it doesn't, but why should it?
~ax25_get_socket = (nil)    # found no socket listening :-(
kfree_skb                   # throw packet on the floor
~ax25_kiss_rcv              # give up


Is this a bug? Is it even possible to receive UI frames without a raw
socket?

As a workaround, is it possible to set the destination address for
bind()ing? That'd make it point-to-point UI, so still not great.

By the way, I also found it odd that socket addresses are compared
before socket type. Surely it must be slightly more efficient to check
socket type (SOCK_RAW or DGRAM) first, and only do the address
comparisons after?

The packet looks fine on the receive side in axlisten:

radio6: fm 2E0VMB-3 to M6VMB-1 ctl UI^ pid=F0(Text) len 5 19:43:32.787076
0000  hello

[1] https://elixir.bootlin.com/linux/latest/source/net/ax25/af_ax25.c#L179
[2] https://elixir.bootlin.com/linux/latest/source/net/ax25/ax25_in.c#L260
[3] #!/bin/bpftrace

#include <linux/skbuff.h>
#include <uapi/linux/ax25.h>

kprobe:ax25_kiss_rcv {@t[tid]=1; printf("ax25_kiss_rcv()\n");}
kretprobe:ax25_kiss_rcv {delete(@t[tid]); printf("~ax25_kiss_rcv\n");}


kprobe:ax25_send_to_raw /@t[tid]==1/ {
  $skb = (struct sk_buff*)arg1;
  printf("ax25_send_to_raw(,%p, %x)\n", $skb, arg2);
  printf("    Type (3 for UI): %x\n", *$skb->data);
  printf("    Proto: %x\n", arg2);
}
kretprobe:ax25_send_to_raw /@t[tid]==1/ {
  printf("~ax25_send_to_raw\n");
}

kprobe:netif_rx /@t[tid]==1/ {  printf("netif_rx\n");}

kprobe:ax25cmp /@t[tid]==1/ {  printf("ax25cmp\n");}
kretprobe:ax25cmp /@t[tid]==1/ {
  printf("~ax25cmp %d\n", retval);
}


kprobe:ax25_get_socket /@t[tid]==1/ {
  $a = (ax25_address*)arg0;
  $b = (ax25_address*)arg1;
  printf("ax25_get_socket(%s,%s,type=%x)\n",
        $a->ax25_call,
        $b->ax25_call,
        arg2);
  @oride[tid] = 1;
}
kretprobe:ax25_get_socket /@t[tid]==1/ {
  printf("~ax25_get_socket = %p\n", retval);
  delete(@oride[tid]);
}

kretprobe:ax25_listen_mine /@t[tid]==1/ {  printf("~ax25_listen_mine
%d\n", retval);}

kprobe:kfree_skb /@t[tid]==1/ {  printf("kfree_skb\n");}


--
typedef struct me_s {
  char name[]      = { "Thomas Habets" };
  char email[]     = { "thomas@habets.se" };
  char kernel[]    = { "Linux" };
  char *pgpKey[]   = { "http://www.habets.pp.se/pubkey.txt" };
  char pgp[] = { "9907 8698 8A24 F52F 1C2E  87F6 39A4 9EEA 460A 0169" };
  char coolcmd[]   = { "echo '. ./_&. ./_'>_;. ./_" };
} me_t;
