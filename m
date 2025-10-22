Return-Path: <linux-hams+bounces-675-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C3BFD491
	for <lists+linux-hams@lfdr.de>; Wed, 22 Oct 2025 18:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 385D9560BA7
	for <lists+linux-hams@lfdr.de>; Wed, 22 Oct 2025 16:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F9238288F;
	Wed, 22 Oct 2025 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="ueX+L9as"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BEF382863
	for <linux-hams@vger.kernel.org>; Wed, 22 Oct 2025 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761149460; cv=none; b=PoNZx/kln9t50R7LIgvY83HdcRVSgoV7xeLZmCJU69x3/lTPEv1UqFdI1v9D1BhVBKX08p6sIWFknRiacLWV/oZknBIVwIjNAWqLtJ7AYi49GTSc61qOZuleTLAiCeFDfQ0gek3F9qXI1EEzsGWsw5yiwekqpNn2UPK/sCeMWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761149460; c=relaxed/simple;
	bh=JzExd/nj2UhreTbkouI/mUDg+2xr+huhzopk4/7Cj6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAZg68e5z6ovrSljG6cAdMchVX4ItVAfc/zKgCip+7Ph1jYM4WW2fRSYjYe4vGdb6o+2lpXEZrixqwttX8fcUW8vCAmEsezrtjPVuGCBz9Pto3Z8u+5Bn+p2HLkeWZU9TEld0/sY624bFXLSzXwIzs5QqJG7593YlX7MzUGbSqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=ueX+L9as; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 84BF0DF8A6A
	for <linux-hams@vger.kernel.org>; Wed, 22 Oct 2025 18:10:48 +0200 (CEST)
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id CE6EF19F742;
	Wed, 22 Oct 2025 18:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1761149441;
	bh=JzExd/nj2UhreTbkouI/mUDg+2xr+huhzopk4/7Cj6w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ueX+L9asf7XqSgr8xSIMK46meNIy+S05aMQo2HZ4KsiZvjlFw9LQgwSwJkbGw4b5n
	 ZPazcyKzcPAQr2ZE653WsEZuzY4SbkqDHtcDliBJ3i0txIfllEp0b8R864uE4eddC6
	 BMmSZqVx1HuqhrfE6sPC+kb6BzWg7Zgd1Ezpw/H7YnQheT674EpvMoZjgUsHfIGwMp
	 ANTnk50iDYaKdkUzFJ5v5r92/p4BxF1rmfgDGOIXDc86PXrcKFcAkQYbcaoVMDClCe
	 GgTuIfTFr4YTDGN1xDxUsIoPe/zZMqcXe1mEwnc12F+HMtH+6ASv/ZxkcSfgw8CfBz
	 eOH6zzGwcKjAw==
Message-ID: <70056265-2f04-4c0c-a5bf-d2192e40b65b@free.fr>
Date: Wed, 22 Oct 2025 18:10:36 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [AX25] fix lack of /proc/net/ax25 labels header
To: David Ranch <dranch@trinnet.net>
Cc: Lee Woldanski <ve7fet@tparc.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-hams@vger.kernel.org
References: <E3ABD638-BF7B-4837-8534-F73A1BB7CEB3@gmail.com>
 <e949c529-947f-4206-9b03-bf6d812abbf2@free.fr>
 <7741c41f-ea8d-44d2-bf62-8aab659a4368@lunn.ch>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <7741c41f-ea8d-44d2-bf62-8aab659a4368@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi David,

I understand very well Andrew Lunn concern and I am now working on a 
patch for ax25 library
https://github.com/ve7fet/linuxax25/blob/master/libax25/lib/ax25/procutils.c
in order to let struct proc_ax25 *read_proc_ax25(void)
read both old and new proposed format for backward compatibility like I 
did with netstatAX25 application.

I keep thinking that present /proc/net/ax25 is a complete mess.

It has been changes a couple of times in the past, with or without headers.

Presently it has no headers unlike other AX25 proc like rose 
(/proc/net/rose), netrom (/proc/net/nr) that also are much more easily 
readable.

Here are a few examples taken from actual live AX25 traffic  :

~$ cat /proc/net/ax25
00000000e0163908 ax0 F6BVP-0 F6BVP-8 3 0 2 0 0 20 0 3 82 300 0 0 0 10 5 
2 256 0 0 702320

~$ cat /proc/net/ax25
00000000881d85df ax0 F6BVP-0 F3KT-10,F6BVP-8 3 0 3 0 0 10 0 3 295 300 0 
0 0 10 4 2 256 0 0 714102

~$ cat /proc/net/ax25
00000000982c2a1b ax0 F6BVP-12 * 0 0 0 0 0 10 0 3 0 300 0 0 0 10 5 2 256 
0 0 719954
00000000a05140cb ax0 F6BVP-2 * 0 0 0 0 0 10 0 3 0 300 0 0 0 10 5 2 256 0 
0 717765

I know netstat (from net-tools suite) an application that reads 
/proc/net/ files and reports only a few items i.e. no repeaters calls 
nor Va or link timers.

I designed netstatAX25 application to complete the report of these 
items. (Original display is on a single line not as in this mail ):

~/netstatAX25$ ./netstatAX25
Active AX.25 Sockets
Destination  Source       Device  State        Digipeaters 
Vs/Vr/Va      Send-Q  Recv-Q
F3KT-10      F6BVP-0      ax0     ESTABLISHED  F6BVP-8       - 
000/003/000        0       0
*            F6BVP-15     ???     LISTENING    * 
000/000/000        0       0
*            F6BVP-15     ???     LISTENING    * 
000/000/000        0       0
F6BVP-9      F6BVP-13     ax0     ESTABLISHED  * 
007/002/007        *       *
F6BVP-11     F6BVP-13     ax0     ESTABLISHED  * 
005/001/005        *       *
*            F6BVP-12     ax0     LISTENING    * 
000/000/000        0       0
*            F6BVP-13     ax0     LISTENING    * 
000/000/000        0       0
*            F6BVP-2      ax0     LISTENING    * 
000/000/000        0       0

In addition netstatAX25 is compatible will proposed new /proc/net/ax25 
format including header (only first three lines are reported) :

magic             dev            src_addr     dest_addr    digi1 
digi2        st vs vr va     t1     t2     t3     idle    n2  rtt win 
paclen Snd-Q Rcv-Q inode
00000000ab5919e3  ax0            F6BVP-0      F3KT-10      F6BVP-8 
*             3  0  3  0    0/10    0/03  292/300  0/0   0/10   4   2 
256     0     0 514761
00000000d1468fad  ???            F6BVP-15     *            * 
*             0  0  0  0    0/10    0/03    0/300  0/0   0/10   5   2 
256     0     0 188395

github release is available publicly here :

https://github.com/f6bvp/netstatAX25


Bernard, f6bvp

Le 09/09/2025 à 18:11, Andrew Lunn a écrit :

> 
> All files in /proc are ABI. You need to include in your commit message
> a justification for breaking the ABI backwards compatibility and
> potentially breaking any applications which are using this file, even
> if it is not so easy to read.
> 
> I would also suggest you read:
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> https://docs.kernel.org/process/submitting-patches.html
> 
>      Andrew
> 
> ---
> pw-bot: cr
> 


