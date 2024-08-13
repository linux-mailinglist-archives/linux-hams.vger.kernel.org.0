Return-Path: <linux-hams+bounces-401-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D97950CC2
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 21:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2792D1C22540
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 19:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B39519AD5C;
	Tue, 13 Aug 2024 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=vk4msl.com header.i=@vk4msl.com header.b="aiXMMhng"
X-Original-To: linux-hams@vger.kernel.org
Received: from gapmx.vk4msl.com (eth2015.qld.adsl.internode.on.net [150.101.176.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0646019D8AC
	for <linux-hams@vger.kernel.org>; Tue, 13 Aug 2024 19:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.101.176.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723575774; cv=none; b=VS2sYWBsNNNySXApblGK9ozXZrj7yDBsCO5pUjs84Eh5yI4JYc2eLxUNsBjDXhwqfAbOjo4Q1f/wD6YyvAuYFfga2fUnKaf0iaPzen5RbsaLj2c8dMiO/GuXckBon7hpnrtkApbFyw6DYtIPnhBpy0ksrno1uSENw74QJCH4GkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723575774; c=relaxed/simple;
	bh=AzJExha6FdQ6DjOT4kz6UiIqKORGgwGfEMRbiAUJqlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P63ffi8QUzZePPLZsY0c1f8/+fFOcTjpo2KmtQAhbRrLgv1NPUPSNOZWXugq3iFoXPiUEwV/RwCPGDP2eomaNd8x5Yks8oUWUHczdBue7BH+lr5WY4pyc+FNNhhbT3BVpO9wfyk+4sj21eeKRn35y/UC/4ExaZGe0WdIKXhbkVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vk4msl.com; spf=pass smtp.mailfrom=vk4msl.com; dkim=pass (4096-bit key) header.d=vk4msl.com header.i=@vk4msl.com header.b=aiXMMhng; arc=none smtp.client-ip=150.101.176.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vk4msl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vk4msl.com
Received: from gapmx.vk4msl.com (gapmx.vk4msl.com [127.0.0.1])
	by gapmx.vk4msl.com (Postfix) with ESMTP id D5F881B2D8;
	Wed, 14 Aug 2024 04:51:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=vk4msl.com; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=gapmx; bh=M8Psp4I+zJf
	eCQgjsc6rSVCb/B0=; b=aiXMMhng0xN0XR/suWgVAynLZBJ6AQxvrKm/L9znvwg
	0cqg6INpYAok9BLKA4tn6gpZk4PrLnsoK2Fg1SmGZJjvj5tSOZHq5TS5YuP7s1lp
	fmB0qKgNZrSPMXR7FVVvMrCPQgKIjptklPxmsLQxtHxEi1LZpzrw8I3cvhgXzApG
	zAJ15oTAk3RbewxgZuk3LYiQ+oVkxJiqLbyjn8fegx0dqCXDJC7Su0M3NRyYcoJ2
	5nX3YxqMOdGLz6CCtZTdOHh0FXdR5BWw7e159QyXnlK3Lt2NpSt6tk1e3ZXNfco7
	Dj/BqAy9LQkon35K6HdxLCMUij0ERuydTmiAx69eX6h1F2GhSH0LeQlTTuAHpazu
	S+OYQtoWbZUMdIMHosooJ6Mk/0XvRHFtd616pINLQZa/vpoM4eIxSOK766gRWvxb
	g8S83+EYad9ukZz35pbtTjmu+IHiRFcaMjQkojM7GHon1UYmvHZHTdfe+px9W6HN
	Y0FTvHk4ZIM55q8FsoT2XLekH9QOcTlF4dqD2ApVRWPMWEPByFkU3oNIH04Gf3bF
	LpDxk4Opcv+oU05EAvXZFy2dpfnXqQJN77qNCwWSlj1cq+Kcvs40gAg9kPR/+rYe
	MW6adbI83yvLnoCmAT/0Rs/81cdLgSqi5Wysa3RJvq9iIMVwLTjSlPm50V/hws8g
	=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=vk4msl.com; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gapmx; b=pgAbJ
	Mhnk/AS+cIpo59vz2BNVBbwpMcctUQu1UrnI2AXyPshUrBJQxdud6ReENS1BcsNo
	S5hdyddBGnv4FuPMevaYuwoMHcEXEguh8v70JBI0qZ31LCsEV8e824y51ukpe20t
	RJ0IKuy9gr10mxpn/9mC2F1rnoKraHDVqtRKxUIfsiZlGGkAN/A592dGZvWN50zP
	wi9D3xbpTAd2qf8T/grGqGsff9sXTH64V+u+UYHmxuvkkV0IQfXQLDPN2VDxIA1W
	BKkovyg7rGRzHQp32VqEtgb+vpN36QWrnmBPutph37TdkV1xm7JPS1Xz1vyBfmIQ
	QT9fxIKBqTddbtS3pZ0bH0NqIGATxT6hX6Y4A90tbp6/MF1CT8izL14GDxQrZYhH
	1x7uNPq9KwEvtN2BcMSkRCzeFW84Qz/2L96r78S5b81Cb48a+/HEVLO4gkKsLC7Y
	EbOjS5W4lQ7R9DEpOD7G3hNHkDvHkB9otE3hSoeYgE5eV+WnHFIYaRcDr+q2OuGQ
	zXQ532G0tGMw/z3DI3/bEiyLV589Hksne1HtpZ/Mf0cpw88KynA/kLsQ6ksdma1U
	qA/wagl/YDAeOFCoSI4NlhrS2jpsjSCdI5xnXlpU7xyL04ZiY5WMPlnZEhU347jQ
	mEVpp854N/pujbgiQBXMoM3/elDp9AcUrmS/YE=
Received: from [IPV6:2001:44b8:21ac:7053:42a3:8dd8:71b7:9032] (unknown [IPv6:2001:44b8:21ac:7053:42a3:8dd8:71b7:9032])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by gapmx.vk4msl.com (Postfix) with ESMTPSA id 9A4AB1B2D7;
	Wed, 14 Aug 2024 04:50:56 +1000 (AEST)
Message-ID: <56a1ec91-68d5-477b-bad2-bc2453383c63@vk4msl.com>
Date: Wed, 14 Aug 2024 04:53:56 +1000
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: what does an APRS packet actually look like
To: Kristoff <kristoff@skypro.be>, Hugh Blemings <hugh@blemings.org>,
 linux-hams@vger.kernel.org
References: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>
 <5a8b4906-192f-4ea3-b483-f3bd25887f7d@skypro.be>
 <1907cec3-4501-471f-b0ad-c4924adf94b3@blemings.org>
 <288e1eb0-f1b8-433c-a813-0fbc3e0d7b43@skypro.be>
From: Stuart Longland VK4MSL <me@vk4msl.com>
Content-Language: en-AU
In-Reply-To: <288e1eb0-f1b8-433c-a813-0fbc3e0d7b43@skypro.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/8/24 01:52, Kristoff wrote:
> On the contrast. I've check both "APRS101" and "AX25 2,2" and neither
> of these documents mention anything about the physical layer.

The physical layer of AX.25 should probably be the focus here… as I 
understand it, there are two very common ones:

- 1200-baud AFSK modulation (heavily inspired by the Bell 202 modem: 
https://en.wikipedia.org/wiki/Bell_202_modem)
- 9600-baud GFSK modulation (G3RUH: 
https://www.amsat.org/amsat/articles/g3ruh/109.html)

HDLC is used to serialise the AX.25 frames on the physical layer.

APRS packets at this point, are just AX.25 UI frames.  If you can send 
any arbitrary AX.25 UI frame, you can send an APRS frame.
-- 
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
   ...it's backed up on a tape somewhere.


