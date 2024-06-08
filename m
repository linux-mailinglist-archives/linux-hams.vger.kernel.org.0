Return-Path: <linux-hams+bounces-362-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4E901251
	for <lists+linux-hams@lfdr.de>; Sat,  8 Jun 2024 17:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39D2E1C2105E
	for <lists+linux-hams@lfdr.de>; Sat,  8 Jun 2024 15:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E6B14534D;
	Sat,  8 Jun 2024 15:23:16 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B621B28D
	for <linux-hams@vger.kernel.org>; Sat,  8 Jun 2024 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717860196; cv=none; b=Xy9h2eErQPYrr2aJrgoqjxdhzzmT3xhXfSxtj01N1Hu5hfF9XfFe2mgGyJfXbaGVTMKr+fs8YwWtWkxUU6WFPjJ0bu+4CxMr83gSKJj4EBOK2RWNw3pwqkuzzMvY5yQHxuIvq0eqPoVk600i3k+WgJlarjclS0pDQDelDIMADYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717860196; c=relaxed/simple;
	bh=vBOaH88hcwJZRM6OhxzIsiRaKE9Y1cGnnLo9Omho9hM=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=F4qG7wej04oVU1xKFHpQJwYEv9JTlPoLaTQsVGnPqJjyI0uJ1NoFTsB3SnJNI7qLh7zxU0E6wsKxAIjQhw3KvvdmM3RIuhFbdUgvOSR/BGlsl2dVDHvPvTqZIIG+giM9ceIIVE4cwHLSdSMJThuPcbfScMzVGqLzduh1dkHOAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 458FN6Pq028502;
	Sat, 8 Jun 2024 08:23:07 -0700
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>
References: <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
 <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <6e5f3lkbpd5u725kcaja65fncl5y436wlt6q26c4gigl7ppdip@anlb3w6gyjz2>
 <416ce037-7fb1-48d5-20ff-97b3d70bfaa6@trinnet.net>
 <3a4sohalyrvgnxyia3kmt3pbohcixtalk2vmxjxqio4a4e4hyl@tjt2ntm6a6rp>
Cc: linux-hams <linux-hams@vger.kernel.org>
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <d747b1ea-bd40-e6d6-260e-8f859f5bc7fc@trinnet.net>
Date: Sat, 8 Jun 2024 08:23:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3a4sohalyrvgnxyia3kmt3pbohcixtalk2vmxjxqio4a4e4hyl@tjt2ntm6a6rp>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sat, 08 Jun 2024 08:23:07 -0700 (PDT)


Thank you for doing that Lars!  Thinking of other packet users, do you 
know of an easy way to request this for other distros?  I know a lot of 
packet users use Mint, Ubuntu, etc.  All this kernel tree fragmentation 
across distros is a mess but it's the reality of what Linux is these days.

--David


On 06/07/2024 06:59 PM, Lars Kellogg-Stedman wrote:
> On Fri, Jun 07, 2024 at 06:49:57AM GMT, David Ranch wrote:
>> I'm personally very interested in seeing this get into the Raspberry
>> Pi Bookworm 6.6.x kernels.
>
> I've submitted a pull request [1] against the Raspberry Pi 6.6.x kernel
> tree. I don't know if that's the right way to do it or not; I guess
> we'll find out.
>
> [1]: https://github.com/raspberrypi/linux/pull/6213
>

