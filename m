Return-Path: <linux-hams+bounces-549-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37636B1A445
	for <lists+linux-hams@lfdr.de>; Mon,  4 Aug 2025 16:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A73F818A1539
	for <lists+linux-hams@lfdr.de>; Mon,  4 Aug 2025 14:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70C326FA67;
	Mon,  4 Aug 2025 14:13:33 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from vps001.vanheusden.com (fatelectron.soleus.nu [94.142.246.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677D926FA6F
	for <linux-hams@vger.kernel.org>; Mon,  4 Aug 2025 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.246.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316813; cv=none; b=g9dWzU0IUbDLSBZUJ/sYeK4IzIbEoQktu0kKmJiSgJ5gKxrfVKJKDtyTHZzMLF7bZoDiYtLMdVTnMRV+sLLzTgABIGllAe53QLG3hN3wvgEw8W5iwA1Cau/K4sYPuJLXT8a1iXL78nrsO/hij0iQ8BmfvLUSMIOh4PbmT2DqOzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316813; c=relaxed/simple;
	bh=xBMwtRfU24CooLt5Gy4aI5WLK4nuN0Xgyu2z8L5JAh8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=GkO4tHg/LC6/AUbau670UCoodNnBrwV6LqTYuAj09kTkDW0A9EobQ2gRgzJhu1jwADSkVzlb3beK83TzwvqQ19sa5hYFs5T0BJNcm+FR1kZpJevxUCHB1W7VqmF0Ne5kBg0OwkqzCsAPy8/DFDHkFvnGMRxS3lxAOc983tJsrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanheusden.com; spf=pass smtp.mailfrom=vanheusden.com; arc=none smtp.client-ip=94.142.246.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanheusden.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vanheusden.com
Received: from webmail.vanheusden.com (unknown [172.29.0.1])
	by vps001.vanheusden.com (Postfix) with ESMTPA id B218750065B;
	Mon,  4 Aug 2025 16:13:26 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 04 Aug 2025 16:13:26 +0200
From: Folkert van Heusden <folkert@vanheusden.com>
To: Chris Maness <christopher.maness@gmail.com>
Cc: linux-hams@vger.kernel.org
Subject: Re: ax.25 & linux, 4th send attempt
In-Reply-To: <CANnsUMHzqZF3VmVLBiOS5QRv6i0TfvzWKy4=6Z1RbnqHn4iLfQ@mail.gmail.com>
References: <018e5e9f979d1c2076b198b1ec970c6b@vanheusden.com>
 <CANnsUMEbVBPV89WCktZt7XpnUc6fhT84J1b5ZFTPCJUfApay3g@mail.gmail.com>
 <73e2457e74a34adb45eb365ae8febe31@vanheusden.com>
 <CANnsUMHzqZF3VmVLBiOS5QRv6i0TfvzWKy4=6Z1RbnqHn4iLfQ@mail.gmail.com>
Message-ID: <d37f5f67e2c9c7b5430497b17222ab94@vanheusden.com>
X-Sender: folkert@vanheusden.com
Organization: www.vanheusden.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

I'll keep a close eye on it. I've setup netconsole and 
remote-systemd-journald-logging and will add a framegrabber if that 
doesn't help.
I also got a few tips fro David that I'm going to try.
Will keep the list posted.

On 2025-08-04 16:02, Chris Maness wrote:
> That is an issue I have not seen before.  I was having crashes with
> pre-patched (before version 6) kernels, but since I have been
> following this email reflector I have not seen AX.25 issues with v. 6
> kernels.  I run slackware, and they are still using 5.15.*, so I have
> to use a custom kernel that is version 6.  I have not had any packet
> related crashes on x86 since running v. 6.  Someone would need to try
> to reproduce the crash.  I don't have a Pi 5.  Hopefully someone here
> does.
> 
> -Chris KQ6UP
> 
> On Sun, Aug 3, 2025 at 11:56 PM Folkert van Heusden
> <folkert@vanheusden.com> wrote:
>> 
>> This is a 6.12.34+rpt-rpi-v8 kernel on a pi-5.

