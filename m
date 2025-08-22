Return-Path: <linux-hams+bounces-581-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC1B30C59
	for <lists+linux-hams@lfdr.de>; Fri, 22 Aug 2025 05:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B5C9A004D4
	for <lists+linux-hams@lfdr.de>; Fri, 22 Aug 2025 03:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FF4265629;
	Fri, 22 Aug 2025 03:10:27 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from vps001.vanheusden.com (fatelectron.soleus.nu [94.142.246.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5134B433AC;
	Fri, 22 Aug 2025 03:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.246.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832227; cv=none; b=b0ic8GnJ1mYX/GnDPVDNMnHoOHMQd2hyaba34d9XMpSmMLmA0/VyChAObMDU1+xKOVdZ6bVftuNtngr84O/AR9DPFJ8EckKHFekVk9XqIY3NWGXQVov2vaJWdA8XYWPpvxAlz5fzFQfHKHWGlQn8o0ZzRv5OEqScIscGgGQOLH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832227; c=relaxed/simple;
	bh=3v/UItQUkPnWr+6aYg27gw53Yu1purR0/0Y9QXeZR6c=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=K6p9Wy/xm7gSn69XMNGCTLdyuCczZ4uAv/i8841+jFkP2N1qbhQxkLuonYo9nUHSe+Jfa84AKxCWGDpQbWNdh+htoNYKpWAtm/NyfGM7Pp33FZjLVRkfL/uHRaoI7DEweKnj9vsUl3vHf2erowNcW/Wf/aFQ+XZcRA+a9OECqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vanheusden.com; spf=pass smtp.mailfrom=vanheusden.com; arc=none smtp.client-ip=94.142.246.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vanheusden.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vanheusden.com
Received: from webmail.vanheusden.com (unknown [172.29.0.1])
	by vps001.vanheusden.com (Postfix) with ESMTPA id 22EC3503D5F;
	Fri, 22 Aug 2025 05:10:14 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 22 Aug 2025 05:10:14 +0200
From: Folkert van Heusden <folkert@vanheusden.com>
To: F6BVP <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>, Dan Cross
 <crossd@gmail.com>, David Ranch <dranch@trinnet.net>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
In-Reply-To: <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr>
 <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
 <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
 <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
 <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
Message-ID: <d073ac34a39c02287be6d67622229a1e@vanheusden.com>
X-Sender: folkert@vanheusden.com
Organization: www.vanheusden.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Bernard,

I skimmed over the diff between the latest 6.14.y and latest 6.15.y tags 
of the raspberry pi linux kernel and didn't saw anything relevant 
changed. Altough changes in 'arch' could in theory affect everything.


On 2025-08-22 00:39, F6BVP wrote:
> As I already reported mkiss never triggered any Oops kernel panic up to 
> linux-6.14.11.
> 
> In that version I put a number of printk inside of mkiss.c in order to 
> follow the normal behaviour and content outside and during FPAC 
> functionning especially when issuing a connect request.
> 
> On the opposite an FPAC connect request systematically triggers a 
> kernel panic with linux-6.15.2 and following kernels.
> 
> In 6.14.11 I observe that when mkiss runs core/dev is never activated 
> i.e. neither __netif_receive_skb nor __netif_receive_skb_one_core.
> 
> These functions appear in kernel 6.15.2 panics after mkiss_receive_buf.
> 
> One can guess that mkiss_receive_buf() is triggering something wrong in 
> kernel 6.15.2 and all following kernels up to net-next.
> 
> The challenge to locate the bug is quite difficult as I did not find 
> the way to find relevant code differences between both kernels in 
> absence of inc patch...
> 
> I sincerely regret not knowing how to go further.
> 
> Bernard,
> hamradio f6bvp /ai7bg

-- 
www.vanheusden.com

