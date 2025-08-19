Return-Path: <linux-hams+bounces-568-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA21AB2CEB3
	for <lists+linux-hams@lfdr.de>; Tue, 19 Aug 2025 23:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A261C244D9
	for <lists+linux-hams@lfdr.de>; Tue, 19 Aug 2025 21:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EAB2609C5;
	Tue, 19 Aug 2025 21:48:35 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from newsmtp.uns.ac.rs (smtp.uns.ac.rs [147.91.173.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6D725A2DA;
	Tue, 19 Aug 2025 21:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.91.173.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755640115; cv=none; b=JiS0ICIFVeRo/3R4sZyvQ3QuR4Tgthjuq0ITH/ogR8ZFT4Sr+KhZEXJSeNVmVbKBlw1Sht4h+8RbXWjYWG5Uz+NBUy2dZRAl11IV1DOEa5MVqKUP81QuPhq3dr49CiBX0exDWY5szW7PBS0zm34MllCyn6RaJglfl7FQvjDoRDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755640115; c=relaxed/simple;
	bh=F46LWby5n9zQSfOV6XgHq7tjvhMPB2oEX5bCs3mw8E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UngtTqx5WkM5LZjbVYVoBAuRVvtU8JKi2Y7lJoRb470LRfCqh0X/RT0SEvrgjTVGLfd+stayI3zhWPynRnONRIUsoXeqDtXH+rTG4PUWk549QGCDOyz8O4mwqGWi8UbPGqpfcvXUaMEzFTdBIhepPqXQKrwdU0rfnugNd7gdeJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uns.ac.rs; spf=pass smtp.mailfrom=uns.ac.rs; arc=none smtp.client-ip=147.91.173.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uns.ac.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uns.ac.rs
Received: from newsmtp.uns.ac.rs (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with ESMTP id ED46A259CD2;
	Tue, 19 Aug 2025 23:25:51 +0200 (CEST)
Received: from [147.91.175.7] (unknown [147.91.175.7])
	by smtp.uns.ac.rs (Postfix) with ESMTP id DD0E3259CD0;
	Tue, 19 Aug 2025 23:25:49 +0200 (CEST)
Message-ID: <8cacd186-c95c-c5a3-a341-c67b9e55a13c@uns.ac.rs>
Date: Tue, 19 Aug 2025 23:17:37 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [OT] Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
Content-Language: en-GB
To: F6BVP <f6bvp@free.fr>, Dan Cross <crossd@gmail.com>,
 Bernard Pidoux <bernard.pidoux@free.fr>
Cc: David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org,
 netdev <netdev@vger.kernel.org>
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr>
 <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
 <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
From: Miroslav Skoric <skoric@uns.ac.rs>
In-Reply-To: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

On 8/18/25 8:28 PM, F6BVP wrote:
> Hi Dan,
> 
> I agree that it must be the same bug and mkiss module is involved in 
> both cases although the environment is quite different.
> I am using ROSE/FPAC nodes on different machines for AX25 messages 
> routing with LinFBB BBS.
> Nowadays I do not have radio anymore and all are interconnected via 
> Internet using IP over AX25 encapsulation with ax25ipd (UDP ports).
> 

Hi Bernard, et al.

Sorry for hijacking the thread. I have a question: As an experimental 
station based on Ubuntu 18.04 LTS (not connected to the Internet for 
several years, using kernel Linux ubuntu 4.15.0-212-generic #223-Ubuntu 
SMP Tue May 23 13:08:22 UTC 2023 i686 i686 i686 GNU/Linux), I run a 
rather old FPAC-Node v 4.0.3 (built Jan  3 2016), and on top of it an 
FBB bbs V7.0.10 (Feb 28 2021).

All works well for my basic packet needs. However it makes me wonder 
whether it would be of any use to try upgrading FPAC and FBB, having in 
mind that upgrading the distro is not possible.

Best regards, 73

Misko YT7MPB


