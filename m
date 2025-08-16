Return-Path: <linux-hams+bounces-558-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B4BB28FAE
	for <lists+linux-hams@lfdr.de>; Sat, 16 Aug 2025 19:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F22AE4443
	for <lists+linux-hams@lfdr.de>; Sat, 16 Aug 2025 17:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8042F659D;
	Sat, 16 Aug 2025 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="k62k6qI8"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD512F8BE0
	for <linux-hams@vger.kernel.org>; Sat, 16 Aug 2025 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755363798; cv=none; b=EMxtU4iP2xo+tBT18PG0NEorT7MKc5ymbsfQXAQs3RZct+V37MedlXhhDEhc7vX7wr6WCC4WHlidUrfmvIuPSS45BgM0FS8pPSth5cWf6e0fOOZky1QvFEgiwxzldqWgW12biFQ4izfXLHq2uYyzVQC6wVf3U5Cu1X/b6cv9f60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755363798; c=relaxed/simple;
	bh=gFibgT+U8iv6Ihgm81A9bDvoOzuCbx/QZGk979K2G1Q=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=j6pczIX64/b4KWMByTG2OQIhf5Gd9wOVqmRZuzjK/EiHcg9CZ11333acj6NqIl2g7qtW99dql30XrVs2jU4B2wNr7sCN6EjgtlBQqMSu+GBuPRRPEPICYttFtnPT/wk5SnOqXc5xqugimjtE+8/2HoadeKEbdUfI2+DTVayLzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=k62k6qI8; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 66D714CD61
	for <linux-hams@vger.kernel.org>; Sat, 16 Aug 2025 19:03:05 +0200 (CEST)
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: bernard.pidoux@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id A8A0719F5A5;
	Sat, 16 Aug 2025 19:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1755363777;
	bh=gFibgT+U8iv6Ihgm81A9bDvoOzuCbx/QZGk979K2G1Q=;
	h=Date:To:From:Subject:From;
	b=k62k6qI8B1NmhF6XJcIQX2SUK6IBDaMKtMp39UA9CSMs2HVyF6ZPRJQTBhPLCravk
	 2n5y5910IPCC7JESSMfdAY4VjHk/rD19uftsxTj7Nig7Fy7e6hg57jLBYOFi+DZRdK
	 h/vBrzWUQXHA+mUoZo6csyCbmlpwOnz26bwDdKgx6MyyCJQ1ACyP12EtiHmmCYhn+K
	 N89WwtPVoEgb/XBUHgwgAHW90vTP+cB+9G13u7HZWFQ950ntNmYA/3rrMSdxlpG/L8
	 bkPoMm5OobNMssujhqH1/nKbwauAoCp0c4Zf8tupuCNiHIgTepf9Brc1d/xd2P0yWc
	 NW253wHKwPDgA==
Message-ID: <57258a4d-50bd-47a1-b83a-c47051c54876@free.fr>
Date: Sat, 16 Aug 2025 19:02:56 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-hams@vger.kernel.org, David Ranch <dranch@trinnet.net>
From: Bernard Pidoux <bernard.pidoux@free.fr>
Subject: [ROSE] [AX25] 6.15.10 long term stable kernel oops
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am continuously working on AX25 ROSE/FPAC node since decades, running 
a number of RaspBerry Pi (Raspi OS 64bit) plus Ubuntu LTS on a mini PC.

Stable FPAC version 4.1.4 is performing packet switch quite well 
although some improvements are underway.

FPAC runs flawlessly with kernel 6.14.11.

However, trying FPAC under stable kernel 6.15.10 experienced a frozen 
system when issuing some commands like connect request.

Investigations seem to show that ax25 connect is fine and that the bug 
is probably in ROSE module .

I am presently trying to find the faulty bug that triggers the kernel 
oops by compiling and installing previous kernel versions starting with 
6.15.1.

73s de Bernard, f6bvp / ai7bg

http://f6bvp.org



