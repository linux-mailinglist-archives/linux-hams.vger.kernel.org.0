Return-Path: <linux-hams+bounces-421-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66E9745E8
	for <lists+linux-hams@lfdr.de>; Wed, 11 Sep 2024 00:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F0D81C21FF4
	for <lists+linux-hams@lfdr.de>; Tue, 10 Sep 2024 22:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EA61AB506;
	Tue, 10 Sep 2024 22:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=habets.se header.i=@habets.se header.b="e2CVe8/s"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C917BB3D
	for <linux-hams@vger.kernel.org>; Tue, 10 Sep 2024 22:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726007025; cv=none; b=V+DBhgw1AFrAuJZyTYcKTAufTvNk2PmWDokY7BbKsCwtQKCWiW4tnNXr5wPGn4Mp/9vIsMEhgCURiq9uQ/3t56ocMSYplIJh83TV5+Nk7QQe8RwZSQFnma/8+8CG3cQykadw9dWECCjLmonoVxT155TvIlPenB9SzH+wOMm+saI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726007025; c=relaxed/simple;
	bh=d4vKZED0aF3FclvNlVtTlYcUjoc0GvsFAi7OHcG2oSg=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Content-Type; b=F1rG+iqwcBJnb01g9V8/ARxV2Wb6QWmBqVF9QfFk/P3KRlnGhh4u3bo4zaGLDXJtCwxnLq3/wgBDsSjixryS8JjGySAfXHIJkAwZa7g7nF3fhFspRmGvWjLqxYi+2PlwHCdUx8G20+ijmHCuJJX4hoD67yup5S3IiqwyM+ZZ9/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=habets.se; spf=pass smtp.mailfrom=habets.se; dkim=pass (1024-bit key) header.d=habets.se header.i=@habets.se header.b=e2CVe8/s; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=habets.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=habets.se
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7d50e7a3652so3489240a12.3
        for <linux-hams@vger.kernel.org>; Tue, 10 Sep 2024 15:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google; t=1726007022; x=1726611822; darn=vger.kernel.org;
        h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9zrjl1ObneS3udZlxy1h2CAP+S+OPE49vPWbS+eyR4M=;
        b=e2CVe8/sG486Te33sJZSVqnRNC0PFz0/9R+w2rOt4SqoH//2U5+6cvflgeei3UlzKG
         ZAswTQhWd2CgK8pAfXpGvWy5yMtgINjjFgqU8os5lhFb21/qK9pMxBOrnit9IeWvn78I
         4jlw/VHuLAQ/jwrjt61Jx7ppdeSzwqIHeabc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726007022; x=1726611822;
        h=to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zrjl1ObneS3udZlxy1h2CAP+S+OPE49vPWbS+eyR4M=;
        b=XA5tGJux+mt7a4Bj6rzsMluPgxvKwzBDf7pBKbxaBdF4MNX2gX/yYWAoClzdRC/JGd
         O5YwipTjMjB2RJIn0Jbsxkn9exhb0UskIAlGeRTti3JWi64R3kZnVn0Z28t5fr7fxVdT
         H6kz6lcCBF/lpUsagwq9zr+0+eCP0McSOKbjwKNzjrT3z+nDQBkUGWGhUMYfr6gOgFFy
         cdvrqY/jkStKPFigO2KYsZLvMWsij9IadqVJcek4ShGKX9tJATHojI6f2Xncl52+PkOc
         g07g9j8MoarSSJJOz9IYA9z1/u889DWibhjywb4Yyce43N/YwXAXWbGl3ijvEB/1TQ6Z
         sFiA==
X-Gm-Message-State: AOJu0YyCZ26gY4JugPxuV4+37UFNVQkKNg0sW333HOF3dV8lAw/6gP23
	8sJjDI/uOD/nkXAOr53wAcTu337P8A22DeZF6grhiHVfnPzFGsOJoPlg/bkfu+5RiDg5kiA77lv
	6X3ugCPsczmzGNd4E05NfHRvJPy202hMXQ8+T0jUkWLEpdkz5
X-Google-Smtp-Source: AGHT+IF9erSzyU0FePzRXyGHUac46TSPYvDEXQbAs/ygFE3q7qXB1vOefewgvwqWNR4hIOg004bmNY464TLAGhgvElo=
X-Received: by 2002:a17:90b:3bd0:b0:2c9:3370:56e3 with SMTP id
 98e67ed59e1d1-2dad5196fb7mr15263661a91.34.1726007021907; Tue, 10 Sep 2024
 15:23:41 -0700 (PDT)
Received: from 195210475306 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Sep 2024 15:23:40 -0700
From: Thomas Habets <thomas@habets.se>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 15:23:40 -0700
Message-ID: <CA+kHd+e1pjfbzAJnkjqx5pM4Sk+fnSLg-KJw0aZwiwc-fTFyBQ@mail.gmail.com>
Subject: Duplicate and reordered frames in kernel AX.25 stack
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi.

I'm writing my own AX.25 stack, and am testing it against the Linux
kernel stack for compatibility.

I encountered strange duplicated and reordered frame numbers (NS), and
after initially assuming the issue was with my implementation, I'm now
pretty sure it's a kernel bug.

Kernel tested is 6.10.0, built locally, with config
https://blog.habets.se/tmp/stammer2.config.bz2.

## tl;dr:

The kernel stack seems to sometimes skip incrementing the NS / VS, and
reorder frames, when sending out frames very fast. They're duplicated,
but don't then "skip ahead" to go back in sync.

I believe this is a race condition that may in practice never happen
at the usual 1200/9600bps speeds, yet is still there. I believe anyone
who runs KISS over TCP could be hit by this, not just my special
setup.

This bug corrupts user data in transit.

## Hypothesis

My guess would be that ax25_kick() needs some sort of locking, either
around it, or within it. It has:

(a)   next = (ax25->vs + 1) % ax25->modulus;
      [...]
(b)   ax25_send_iframe( with old VS )
(c)   ax25->vs = next;

I believe that a well timed context switch or race or something causes:
  Thread 1: (a) Set next to be the next VS
  <switch>
  Thread 2: (a) Set next to be the next VS (same number)
  Thread 2: (b) Send iframe with NS=old VS
  Thread 2: (c) set VS to next
  Thread 1: (b) Send iframe with NS *also* equal to old VS
  Thread 1: (c) Set VS to next (same number)

This would explain the duplicated NS, the reordering, and that NS
numbers continue to be off. But something else could be happening too.

I'm not familiar enough with kernel locks and skb to know how this
should be fixed. I was urged to write up my findings, in the hope that
someone else would be.

## Supporting data

I have https://blog.habets.se/tmp/stammer2.pcap capturing ax0, so this
should be the kernel's view of things. Looking at it, I'd say that the
kernel (M0THC-2) is in the wrong.

I have added support to wireshark for extended sequence numbers, but
it's not in a wireshark released version yet. But you can either
compile it yourself and run:

    tshark -Vo ax25.extended:true -r stammer2.pcap

or use the output I've prepared here:
https://blog.habets.se/tmp/stammer2.txt.bz2

### Interpreting the data

It's not super easy to read, sorry about that. Here's a start:
* M0THC-1 is the client, my implementation
* M0THC-2 is the server, the kernel
* Relevant frames 110-113 are all sent by the server (kernel).
* Frame 111 and 112 both have the NS 98
* The correct order (confirmed by stitching the data manually) should be:
    frame 110 (with NS 97) -- correct
    frame 112 (with NS 98) -- correct
    frame 111 (with NS 99) -- bad order, NS 1 too low at 98
    frame 113 and on (with NS 100 and on) -- NS 1 still too low

### Reproducing the data

There's a lot of custom code to reproduce the data. So this bug report
is not ideal.

In my implementation repo (https://github.com/ThomasHabets/rax25)
there's ./extra/testenv.sh, that sets up a tty loopback between my
implementation and kissattach to the kernel implementation.

On the kernel side I run axsh[1], but you can modify the script to use
anything, or start the server manually.

The only requirement of the server, AFAIK, is that it produces a lot
of data fast. It may also need to use EXTSEQ.

As you can see in the pcap, I trigger this by having the client ask
the server to run `find`. With build artefacts and .git dir, that's
16496 lines and 1.6MB.

On the client side (rax25 implementation), I run:

```
cargo build --example async_client
./target/debug/examples/async_client -e -p ~/tmp/rax25.serial \
    -s M0THC-1 M0THC-2 -v 5 2>&1 | tee log
```

It'll only take a second or so, after which you can kill it. Or you
can grep the log file from the tee command for "not in order" to
ensure it happened.

[1] https://github.com/ThomasHabets/radiostuff/tree/master/ax25/axsh

-- 
typedef struct me_s {
 char name[]      = { "Thomas Habets" };
 char email[]     = { "thomas@habets.se" };
 char kernel[]    = { "Linux" };
 char *pgpKey[]   = { "http://www.habets.pp.se/pubkey.txt" };
 char pgp[] = { "9907 8698 8A24 F52F 1C2E  87F6 39A4 9EEA 460A 0169" };
 char coolcmd[]   = { "echo '. ./_&. ./_'>_;. ./_" };
} me_t;

