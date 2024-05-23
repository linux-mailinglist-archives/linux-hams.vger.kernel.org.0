Return-Path: <linux-hams+bounces-315-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD08CCA39
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 03:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C98B282779
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 01:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6544B17FF;
	Thu, 23 May 2024 01:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=vk4msl.com header.i=@vk4msl.com header.b="mJoHA4yp"
X-Original-To: linux-hams@vger.kernel.org
Received: from gapmx.vk4msl.com (eth2015.qld.adsl.internode.on.net [150.101.176.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5DC17EF
	for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 01:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.101.176.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716426257; cv=none; b=b4YM9PKG5j2GTBcVXBFGlWps3tKhKKIOGL5p30LDhEZrC7YaKvY1haWMq0DHEabUQZu8+7s9tDKxTyLw/rb5+oaHfrtndG74EIY7Zhq1WYUTa8jlNQcq2cphErjDVRSBkOQerIXRU497s4BjDHUpYcvzCo5CWM74T0DrJEAo240=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716426257; c=relaxed/simple;
	bh=9kwJ2zglQI6FEzAlwS1s3kLvFAO2hw3c+J6bFZhbYWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgnA2e5VAEhy8D7NnFlTD6W8Cn7qmXvGiZq9tnCV9XYYAiaMKCsImJEVCd2EBYOTYVWUPPwMpP9LlSzYisAITr6zTponyUbfpEimD3p+WWS4G+VSkkzZldjKIFKB30/XBdZC+ptMvhqmjeakH8vs+pLijM/k0/IcqdBfuHSlt1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vk4msl.com; spf=pass smtp.mailfrom=vk4msl.com; dkim=pass (4096-bit key) header.d=vk4msl.com header.i=@vk4msl.com header.b=mJoHA4yp; arc=none smtp.client-ip=150.101.176.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vk4msl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vk4msl.com
Received: from gapmx.vk4msl.com (gapmx.vk4msl.com [127.0.0.1])
	by gapmx.vk4msl.com (Postfix) with ESMTP id 23FCB185AD;
	Thu, 23 May 2024 10:54:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=vk4msl.com; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=gapmx; bh=f5MuodC2kg2
	sKm6afNj7hjVuFBM=; b=mJoHA4ypptC6HYRgezdRMZalraXSEY8bQvLHxMVUN12
	UQnf3EQvNxspbDybm0dF8D96Hnd90Q9YVV5DH6tL3mOn6EYM/VedFapcVDLJ2nTv
	AeK/jURJpv9BAdROqHIgho6llJqqtJa7oURZYknJ3+8C7wpuvtFkYRs5THcRoTzq
	mHae4rx3ZgrZL8/DffNIjosPyk26+5GrDDp24B5xR/5tb2x2AYrV0sy423gzXyic
	EQK5sMjqAuCeJRmmU3Au66Fd2ikiM0HpKNE5mlr4ARnSCW7tnWCFbltY24iIMFK4
	kDXf/DBzmoEhb/0PDaZd9bBMleWAp1GTtboE1vVxd2R17JpQ6jUfk81r8T79pV4t
	ygzjSmpvHW1feosm4FJjIT9J1YRLUFZNUKEJc+gQgjCJ4SUCPyOgGlWjYPnC/BsS
	cxJqakE9GXyEkb2dhCrHORq7BngqemBatZbdFx3SVK4HoCPWq0wBxZFJwUcledoa
	qmggzpupMSwYukArrgZ/RyCiojk/53Qj24fU5Rl8XPe32DnVuifAq51edLXqe6N8
	jes8TaSas0f2V6GZGRV2SCFIFhlDNqH+v3ceo2g7erxbV/FKNdp6ezFSqI4B0Ifo
	2wRmejiXTm6oMs7ileEaYRjlb8oEVELoKnOXA3aDnK2q8QZr0RJ1FXbMLu3aHPZM
	=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=vk4msl.com; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gapmx; b=AFdoG
	oHTVhMTBgCa7Q+yfu6jx/9HNqkMKDVo3uOeBHkGI4J0/IHeNSHr6Gia9hAAzKNGR
	W6Tnw3RSAyWOnoNV2dxbzFPRFKZinmfBJDJLapc73k4N7mh3dsB4CH7ZLNZV69WK
	F461PGjmDhc9pz05gE/k737w998tkuYsZb9mG6Agj1IAKvgWW9nj2ThnTka8kTe5
	WxNxDGAOl/Li47jLSbhqMigG3/DyTi2TiQbqgV8zu3LDyjQJQD0HcUu9oteBvrSR
	W38pa1TIB5Osy9nCJQj9wnlsNdzgcAkW6OEfew6djqkqlLpXah/dlEHTfpeYAEJb
	JIab4FvA558O9Mj9F8uLDTHQmOhD2sfYeUk5Xr2UduyKagYBXSBn5ztc7OU2NvSr
	JmXvovpwhfRwckKV1bzcXuM34fj2Vbc49Pwj1+bpmFFIc1ITyli+zLn4wLJ5GIxs
	42wSntX5trRI0LUzpj0DBmDlq6Q2mRa83q/MVgwh34jVrbuYkcqa6QqdnSWTXPFo
	shE7KZzwuHK0dPxtBS18HOmL3P/E72Jn/dNJyQSzpcF/PUMD09ndjUeFL1CbjC7u
	kGx9sDJX7vNYyI0YqJoORvdj4kt6nqnSnGaKCndrmD5LfAZLktx/grV0Z6WRFK1n
	qhKdo8Rs/NaAWhDiQRuXS8aKjxV/SF4qOZTrJ4=
Received: from [IPV6:2001:44b8:21ac:7053:8440:caff:fefe:a4bf] (unknown [IPv6:2001:44b8:21ac:7053:8440:caff:fefe:a4bf])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by gapmx.vk4msl.com (Postfix) with ESMTPSA id EBC08185AC;
	Thu, 23 May 2024 10:54:15 +1000 (AEST)
Message-ID: <9f43ddd7-4e61-4a37-a8d5-aadb1e26f38b@vk4msl.com>
Date: Thu, 23 May 2024 10:54:38 +1000
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Userspace AX.25 stack library [was Re: Kernel 6.9.1 AX.25 Crash]
To: David Ranch <linux-hams@trinnet.net>,
 Lars Kellogg-Stedman <lars@oddbit.com>, Dan Cross <crossd@gmail.com>
Cc: Chris Maness <christopher.maness@gmail.com>, linux-hams@vger.kernel.org,
 dan.carpenter@linaro.org
References: <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
 <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
 <v6ybd4paw7eossjr2qiqvi5zqmvub7avy4cxpd6oyhfattia6j@ygablb7u2rpr>
 <CAEoi9W7VJhnSMD=YJX-92Lmxo+y6if_rFCAPrJiwJ8iuxz_7Bw@mail.gmail.com>
 <g2tpfzyhdwq2ink7phx3hpt4djjqpihf2efmcz4lwypwkgnhon@ihnhjwbj6lp7>
 <e0643fcd-fc41-0d56-0497-684fc7c157ae@trinnet.net>
Content-Language: en-GB
From: Stuart Longland VK4MSL <me@vk4msl.com>
In-Reply-To: <e0643fcd-fc41-0d56-0497-684fc7c157ae@trinnet.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/5/24 08:22, David Ranch wrote:
> There are a lot of fine protocol details in the Linux stack that are NOT 
> exposed via the "defacto" AGW API standard that stands today.  Maybe if 
> the AGW API was heavily enhanced, maybe it would be possible but there 
> is a whole other level of potential legal issues with that.
> The following was posted years after tools like ldsped, soundmodem, 
> direwolf, etc. were already creating AGW "Server" API services:
> 
> https://www.sv2agw.com/Home/Developers
> -- 
> License Agreement
> 
> You must not reverse engineering the TCP/IP protocol that Packet Engine 
> uses to communicate with client applications. This protocol copyright 
> belongs to me and you cannot emulate it. You can only use it for writing 
> client applications.

Ehh, fun stuff.  I suppose the question then is, what would a home-grown 
packet API look like?

I recall looking at the AGW API and observing some of its limitations 
(the full list illudes me just now, but I recall things like the 
reserved bits were inaccessible).

One thing I observed recently, is that other userspace stacks like BPQ32 
will switch protocols after connecting, so the initial I-frame might be 
sent without routing protocol data (PID 0xf0), but then it'll switch to 
NETROM (PID 0xcf) with its own "frame" format within.

https://gist.github.com/sjlongland/0199d5a7cc7bbc71e83d0cc5577a2509

For someone like myself who's been used to dealing with TCP/IP, AX.25 
seems quite weird… yes, there's UI frames that behave like UDP and 
connected-mode that's sort-of like TCP; but then that connected-mode 
stream is actually functions as a multiplex separated by PID code.

I haven't tried picking apart NETROM yet, nor have I looked at how ROSE 
was structured.  Finding relevant documentation for these protocols is 
getting tricky now.  So the Linux kernel stack, for all its faults and 
failings, is still valuable as it at least implements these once 
documented protocols.

Do we start with maybe defining a wire-representation of the Linux 
kernel AX.25 stack data types and an RPC mechanism?  Or should we toss 
that and start afresh?

Regards,
-- 
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
   ...it's backed up on a tape somewhere.


