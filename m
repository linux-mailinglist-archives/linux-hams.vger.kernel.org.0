Return-Path: <linux-hams+bounces-580-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 208DAB30992
	for <lists+linux-hams@lfdr.de>; Fri, 22 Aug 2025 00:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF9E31BA7D39
	for <lists+linux-hams@lfdr.de>; Thu, 21 Aug 2025 22:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472C52EBDC9;
	Thu, 21 Aug 2025 22:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="q0Jz9M/s"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3770B2EBDC4;
	Thu, 21 Aug 2025 22:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755815978; cv=none; b=t+/5Mo8woZIM4N8Qg9hWyr47pJAMaB9fnU3tfzb6lDZrbzL2y9HPOlZQGTBt5miXYMP0NKlb3Asd90/aHMl1Yv3wRTZVlKivkntOJDVKOpCCwsNB26ZNz5rMIN8sccsxnok2e6pYIDJcM7072pExTDfIdaav1L+5SeZuMobseUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755815978; c=relaxed/simple;
	bh=VQDnQI7JXoVAaOTdgqbZmWufqmscrmlNXYg7GFGXTJg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qYWcHTh9LC5O9ok8G+zGRZNJPRYgzh/m/VlgeTJuMXRONEPFXKLnAhBcKXT/8df4HdsElJ08R16mBnncaJA6jUTqX12cZIzL2rfI/0UrBw5xAvvDwaqZaE5zwQeAbrCceIlvhSRvX5yR0fTURBJ3IMB1ZlbJ4ngWu1CEmls3Fbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=q0Jz9M/s; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id D634A19F576;
	Fri, 22 Aug 2025 00:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1755815973;
	bh=VQDnQI7JXoVAaOTdgqbZmWufqmscrmlNXYg7GFGXTJg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=q0Jz9M/sO4aRmVrenhxinwabmHTZkabVYf3lxHm9BGC8wSibHRSJ1PtVI5UlexYJa
	 ThkmSCdOOOhMs/6taMWbQMATUmWY9KeGV653mz822vQNbq9Yx6Uh8nxZrCmE3xLtYY
	 VzBESPrdlLWmHv/BGuVwm5LRyXu12LHb6xUY4X4oULN6PEHSnvNJNcy5zA0ukbSLPa
	 bV7/MpnSf2yJNpI5b/qHAOQRyyb/mAP/L3y5fc20ThWbVCD0Z9TqVFZ3xs/FEfepj8
	 wI5kw1Np4q34VCu6BdpwQy7ikJcNRdZruO0XqzTgx0cNHCmvepBmEmklsT3Gz+vlEF
	 WRlmsg+G3Hidw==
Message-ID: <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
Date: Fri, 22 Aug 2025 00:39:27 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
From: F6BVP <f6bvp@free.fr>
To: linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>
Cc: Dan Cross <crossd@gmail.com>, Folkert van Heusden
 <folkert@vanheusden.com>, David Ranch <dranch@trinnet.net>
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr>
 <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
 <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
 <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
Content-Language: en-US
In-Reply-To: <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

As I already reported mkiss never triggered any Oops kernel panic up to 
linux-6.14.11.

In that version I put a number of printk inside of mkiss.c in order to 
follow the normal behaviour and content outside and during FPAC 
functionning especially when issuing a connect request.

On the opposite an FPAC connect request systematically triggers a kernel 
panic with linux-6.15.2 and following kernels.

In 6.14.11 I observe that when mkiss runs core/dev is never activated 
i.e. neither __netif_receive_skb nor __netif_receive_skb_one_core.

These functions appear in kernel 6.15.2 panics after mkiss_receive_buf.

One can guess that mkiss_receive_buf() is triggering something wrong in 
kernel 6.15.2 and all following kernels up to net-next.

The challenge to locate the bug is quite difficult as I did not find the 
way to find relevant code differences between both kernels in absence of 
inc patch...

I sincerely regret not knowing how to go further.

Bernard,
hamradio f6bvp /ai7bg

