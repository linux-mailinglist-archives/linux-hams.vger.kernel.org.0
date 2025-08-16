Return-Path: <linux-hams+bounces-559-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 154BEB28FE4
	for <lists+linux-hams@lfdr.de>; Sat, 16 Aug 2025 19:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10ACE1B64C98
	for <lists+linux-hams@lfdr.de>; Sat, 16 Aug 2025 17:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9642F5323;
	Sat, 16 Aug 2025 17:35:14 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66941C2DB2
	for <linux-hams@vger.kernel.org>; Sat, 16 Aug 2025 17:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755365714; cv=none; b=tFd/JLGyedLaJuw6d63GUDrNCnKS8fzjBzhfk3ZOhXIhJI7k82NHDis44b6w3VieFnupVHWZKfufr8/ZSOYElwUVWNTbcZvJccgLg15f0oxLvvmk05ZA60lBYL3XzowR1mWXKM1TdCK/GLYXw5RFqgnZjq/L3ak/8ycTbNyhe44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755365714; c=relaxed/simple;
	bh=wQIhlRAswKJHt8h4sB+gtYezOM83VDX9o+EVC+ceoy4=;
	h=From:Subject:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aQw0oVpQMnYLqW4X99l4zf5/RH5qzdPup+t9i9jSBWtjr4NQgrUHHxN9jSgX3xMeLsDzY5NAypW45mkNAex9+qbMYkrFUff+zC5mCQ13YxsiFeETVRdS7TZ8646Qv3+r6M2m7mwKaMkSn9h+rLa3sIE20pcadZpikfqhn5dmcDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 57GHZCJE024718
	for <linux-hams@vger.kernel.org>; Sat, 16 Aug 2025 10:35:12 -0700
From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: linux-hams@vger.kernel.org
References: <57258a4d-50bd-47a1-b83a-c47051c54876@free.fr>
Message-ID: <58b534b6-98e5-0e55-d65b-eaff719cfa18@trinnet.net>
Date: Sat, 16 Aug 2025 10:35:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <57258a4d-50bd-47a1-b83a-c47051c54876@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Hey Bernard,

Thanks for posting this issue.  Can you copy/paste in the Oops you're 
seeing?  I did see a recent ROSE issue on 
6.16.0-rc6-next-20250718-syzkaller and I wonder if that could have 
created this issue:

https://groups.google.com/g/syzkaller-bugs/c/0TmBbcJ2PKE

Btw, I would say that posting this to netdev@vger.kernel.org would 
probably be more important than this Debian list since this is most 
likely a kernel issue and not a distro issue per se.

--David
KI6ZHD


On 08/16/2025 10:02 AM, Bernard Pidoux wrote:
> Hi,
>
> I am continuously working on AX25 ROSE/FPAC node since decades, 
> running a number of RaspBerry Pi (Raspi OS 64bit) plus Ubuntu LTS on a 
> mini PC.
>
> Stable FPAC version 4.1.4 is performing packet switch quite well 
> although some improvements are underway.
>
> FPAC runs flawlessly with kernel 6.14.11.
>
> However, trying FPAC under stable kernel 6.15.10 experienced a frozen 
> system when issuing some commands like connect request.
>
> Investigations seem to show that ax25 connect is fine and that the bug 
> is probably in ROSE module .
>
> I am presently trying to find the faulty bug that triggers the kernel 
> oops by compiling and installing previous kernel versions starting 
> with 6.15.1.
>
> 73s de Bernard, f6bvp / ai7bg
>
> http://f6bvp.org
>


