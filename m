Return-Path: <linux-hams+bounces-313-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693488CC900
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 00:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A9A02821C5
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 22:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6FA1482FD;
	Wed, 22 May 2024 22:22:14 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DDC811E0
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 22:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716416534; cv=none; b=qEYWowMiQ2HrrACLsE/tigp9oNP6ymbyAnOgVIwfJBJIY0ADdni6UfJcT9Y00RPLa6kEXugzDZmsSDupyX+w9uI6p7cuyn7e2PjNeTF5Q6z5pfHivEEx/Z6R6uyi+fZBI6pF3UMCHk413IURNXRuoeJy/OiUmr1vhnu3v7euXbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716416534; c=relaxed/simple;
	bh=kTYEFWLyMVi4azCI9xoyntgrbwx9U12BAIADPopUuuQ=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BW4hCqm9Mo9NQq1LLMFkEik+WAtaSTOHY6fFXrbQkqpWhBBT0dkg4El6ZGSKULkkoHjkrz8JyWJaxr4W/T0w7AWq2j+eVuuan0j0Pyk8HmM1MMB/kogxDY2MgkIXViuepNvsrwIpLe0uODUWo/4UGvN95C6I2UdA7VDIuFS7sl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 44MMM5fK031270;
	Wed, 22 May 2024 15:22:05 -0700
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>, Dan Cross <crossd@gmail.com>
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
Cc: Chris Maness <christopher.maness@gmail.com>,
        Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
        dan.carpenter@linaro.org
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <e0643fcd-fc41-0d56-0497-684fc7c157ae@trinnet.net>
Date: Wed, 22 May 2024 15:22:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <g2tpfzyhdwq2ink7phx3hpt4djjqpihf2efmcz4lwypwkgnhon@ihnhjwbj6lp7>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Wed, 22 May 2024 15:22:06 -0700 (PDT)


I've already asked several people about this and the reality is that the 
Direwolf AX.25 protocol stack is currently only accessible via the AGW 
interface.  I then asked if the Linux libax25 user-space library could 
be adapted to make AGW calls and the answer I've received was: partially.

There are a lot of fine protocol details in the Linux stack that are NOT 
exposed via the "defacto" AGW API standard that stands today.  Maybe if 
the AGW API was heavily enhanced, maybe it would be possible but there 
is a whole other level of potential legal issues with that.
The following was posted years after tools like ldsped, soundmodem, 
direwolf, etc. were already creating AGW "Server" API services:

https://www.sv2agw.com/Home/Developers
--
License Agreement

You must not reverse engineering the TCP/IP protocol that Packet Engine 
uses to communicate with client applications. This protocol copyright 
belongs to me and you cannot emulate it. You can only use it for writing 
client applications.

Your program is totally independent from Packet Engine. You can disturb 
your program any way you like. Freeware, Shareware or as commercial 
application. Since AGW Packet Engine is self-standing application its 
license agreement is not applied to your program. However the end user 
must respect the Packet Engine License agreement.
--

--David
KI6ZHD


>
> Wondering out loud: Direwolf already has a user-space ax.25 implementation
> (and apparently IL2P); would that be a better starting point than the
> kernel implementation?
>

