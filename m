Return-Path: <linux-hams+bounces-598-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF82B388AB
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 19:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E52B31B26DF6
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 17:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8E42D29CE;
	Wed, 27 Aug 2025 17:30:38 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F99528B51E;
	Wed, 27 Aug 2025 17:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315838; cv=none; b=eQjuJUUIJV37/D+FKNvveTljFQ25FQzsJYOdWjtBJG4DVQcs290w1kUVVjb4+e/l5yU50aO2jWuYw6SDuD4aH6X+cMvB65Q+ewXyd4eKhYNF8w9nHs9ItnwYfcvBYDxVU/nbUjEZG0vh8SoP12S8lPOlgipEkwWhZJ8XbhY5C9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315838; c=relaxed/simple;
	bh=HxRmy5lo9fMc6veiwYDQoLPN6GW42YC+ed1V+NnH/bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4SjVd+nzBi53+M89NEh6/xB5QIvCpyNFqJnGGkpkk7AQguA7zGUUqxjasEA8WN6F58NkHhMxmMmW8R45hVERVF8tpVT46KwzEufubdKjHr2MaVfqqz6/2X6iHXwStKKmATQe0PP2BFd2Yo9Ao+Wi41lQWylIm0Vx/HbcuRJ/hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 2030B60288; Wed, 27 Aug 2025 19:30:34 +0200 (CEST)
Date: Wed, 27 Aug 2025 19:30:33 +0200
From: Florian Westphal <fw@strlen.de>
To: F6BVP <f6bvp@free.fr>
Cc: Eric Dumazet <edumazet@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>,
	Dan Cross <crossd@gmail.com>, David Ranch <dranch@trinnet.net>,
	Folkert van Heusden <folkert@vanheusden.com>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
Message-ID: <aK9AuSkhr37VnRQS@strlen.de>
References: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
 <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
 <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
 <d073ac34a39c02287be6d67622229a1e@vanheusden.com>
 <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>
 <aKxZy7XVRhYiHu7c@stanley.mountain>
 <0c694353-2904-40c2-bf65-181fe4841ea0@free.fr>
 <CANn89iJ6QYYXhzuF1Z3nUP=7+u_-GhKmCbBb4yr15q-it4rrUA@mail.gmail.com>
 <4542b595-2398-4219-b643-4eda70a487f3@free.fr>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4542b595-2398-4219-b643-4eda70a487f3@free.fr>

F6BVP <f6bvp@free.fr> wrote:
> Here I am. Next step is probably to discover why the call to 
> receive_buf() fails when bytes are not small and tty_ldisc_deref() is 
> acting after flush_to_ldisc probably leading to an error. What value is 
> wrong ? ld->tty , p, f ?

Did you enable CONFIG_KASAN?

Also, since you seem to be able to reproduce this easily, did you
try a 'git bisect' to identify the breaking change?

That would allow to CC the author of that change.

> 4,19346,153786988,-;Hardware name: To be filled by O.E.M. To be filled by O.E.M./CK3, BIOS 5.011 09/16/2020
> 4,19347,153786990,-;Workqueue: events_unbound flush_to_ldisc
> 4,19348,153786998,-;Here I am: tty_ldisc_deref:283 !tty
> 4,19349,153787003,-;Here I am: tty_ldisc_deref:283 !tty
> 4,19350,153787005,-;RIP: 0010:__netif_receive_skb_core.constprop.0+0xfe5/0x12d0
> 4,19398,153787265,-; __netif_receive_skb_one_core+0x3d/0xa0

as Eric noted, you need to pipe this through

scripts/decode_stacktrace.sh so this gets translated to line numbers.

