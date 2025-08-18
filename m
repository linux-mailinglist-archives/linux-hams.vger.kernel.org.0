Return-Path: <linux-hams+bounces-565-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 346BCB2B063
	for <lists+linux-hams@lfdr.de>; Mon, 18 Aug 2025 20:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D460C1B60D41
	for <lists+linux-hams@lfdr.de>; Mon, 18 Aug 2025 18:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE84175BF;
	Mon, 18 Aug 2025 18:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="J+c4rNOs"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C8125484D;
	Mon, 18 Aug 2025 18:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755541751; cv=none; b=Kx6Ck3f7I4Y1lgIKVIsCFQTch6Sk3ZuOiGN2Nq2o6qMf0/2JZu/u1HVauvkTmOA3WOY1QTqQ/a3iv5K1VGZUS0finjWLxKrFzp3+DeKRsF3uDy8940Nqzke0+N8KdbvdYySQUZqQtQCuAvDIwXaXBcWmAOJQaSrwdK2tNQAflX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755541751; c=relaxed/simple;
	bh=ED8kNp1rWnbnKy7zRbhLyJo7VD7cKdhxeAEQmHCZhKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LD22FzuIHFIH5ZQ7DSOi2jAIrr02a+wNYBHBmWaS3KqZVhwCb1Djbxs78Yrd2TxP8fctVyVH7Jg5zu9eSTeNxYqxCWOWIbvQx/0JGqBrBMUlp34b39K3ydR42Fht44x5x2m53VAnqXGD6Dym8tui3yOlgG9NV5x24TUzfMM+5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=J+c4rNOs; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3B07119F5C2;
	Mon, 18 Aug 2025 20:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1755541746;
	bh=ED8kNp1rWnbnKy7zRbhLyJo7VD7cKdhxeAEQmHCZhKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J+c4rNOs7PBuqxajWhTiyTCWKJg2ePL02OYEw5IHBFL0pHBuG5F6KF7HppqL2HQ0o
	 oQYSGrDXKIRDS9cGLnOmDiC3LpSuqydIykNQ61KJ1OyvBQP0upeO4VQ72UsRhfTiIZ
	 ulz8r6xTlIJQ19VIvJ4csO/7Z3CQeiS/i7OfZxDSvp8Of3M/nUZIB/Y10AEnagMr5K
	 QN/fWilkYbkjRsLST9HNU7hj04BLsvej5XCerq532DDtWMuRGp8vA68UiO+Q+Zby4O
	 CsrDRr50VOT08muQxvRJhjH3HJpYoTVtQaEBuynh/F8QvvY31G8bgyUh3umO5NyBM+
	 ob1cHpZ/NIW2w==
Message-ID: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
Date: Mon, 18 Aug 2025 20:28:59 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: Dan Cross <crossd@gmail.com>, Bernard Pidoux <bernard.pidoux@free.fr>
Cc: David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org,
 netdev <netdev@vger.kernel.org>
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr>
 <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dan,

I agree that it must be the same bug and mkiss module is involved in 
both cases although the environment is quite different.
I am using ROSE/FPAC nodes on different machines for AX25 messages 
routing with LinFBB BBS.
Nowadays I do not have radio anymore and all are interconnected via 
Internet using IP over AX25 encapsulation with ax25ipd (UDP ports).

I am running two RaspBerry Pi 3B+ with RaspiOS 64Bit and kernel 6.12.14.
AX25 configuration is performed via kissattach to create ax0 device.
ROSE / FPAC suite of applications manage ROSE, NetRom and AX25 protocols 
for communications. FBB BBS forwards via rose0 port and TCP port 23 
(telnet).

I do not observe any issue on those RasPiOS systems.

Another mini PC with Ubuntu 24-04 LTS and kernel 6-14.0-27-generic is 
configured identiquely with FPAC/ROSE node and have absolutely no issues 
with mkiss, ROSE or NetRom.

A few years ago I had been quite active on debugging ROSE module. As I 
wanted to restart AX25 debugging I installed Linux-6.15.10 stable 
kernel. This was the beginning of my kernel panic hunting...

My strategy is to find the most recent kernel that do not have any issue 
with mkiss and progressively add AX25 patches in order to find the 
guilty instruction. I will use a buch of printk in order to localize the 
wrong code. We will see if it works.

Bernard
f6bvp / ai7bg


Le 18/08/2025 à 18:30, Dan Cross a écrit :
> On Mon, Aug 18, 2025 at 6:02 AM Bernard Pidoux <bernard.pidoux@free.fr> wrote:
>> Hi,
>>
>> I captured a screen picture of kernel panic in linux-6.16.0 that
>> displays [mkiss]. See included picture.
> 
> Hi Bernard,
> 
>      This is the same issue that I and a few other folks have run into.
> Please see the analysis in
> https://lore.kernel.org/linux-hams/CAEoi9W4FGoEv+2FUKs7zc=XoLuwhhLY8f8t_xQ6MgTJyzQPxXA@mail.gmail.com/#R
> 
>      There, I traced the issue far enough to see that it comes from
> `sbk->dev` being NULL on these connections. I haven't had time to look
> further into why that is, or what changed that made that the case. I
> now think that this occurs on the _first_ of the two loops I
> mentioned, not the second, however.
> 
>          - Dan C.
> 
> (Aside: I'm pretty sure that `linux-hams@vger.kernel.org` is not a
> Debian-specific list.)


