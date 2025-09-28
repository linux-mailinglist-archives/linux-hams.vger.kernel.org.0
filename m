Return-Path: <linux-hams+bounces-645-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B32BA70AA
	for <lists+linux-hams@lfdr.de>; Sun, 28 Sep 2025 15:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5453616D106
	for <lists+linux-hams@lfdr.de>; Sun, 28 Sep 2025 13:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6098B22D78A;
	Sun, 28 Sep 2025 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="ni/gzsPD"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F64C147C9B;
	Sun, 28 Sep 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759064416; cv=none; b=Op2NIe8b5kcqfYbdklH5UmkY0Qg618eAGD6AkwRcKzOWB3Gq5sm/GZSqbuePvyEg8bmNDIetE1Phqruvx7ma+rkualurGoBu6I8l/yoWFsg0P08KEOKf4jE5XqSD4GJy5Bx0oiU1HA6j6wK36DDiCjbVTSYgNye+hmz+lWbz+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759064416; c=relaxed/simple;
	bh=K20e9g5tQsgiW0VQ85uT1zIAazLLqmDoSJet8HtycMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4JGwLXbEwlsWf1NPcXU+NFYHujmD7zPjyDklwgXmXw8pcqGoBSChXLBUgNv27Yd91s+m4XYpXY4dS88uMTfYYe7JmTn5feBKDDIZvATQbdlHfaYU2gL5FrKGRBZtxH43U3BcQAOeogRFuzRIcirqr1GwyadK3AdwGvX0y2Sv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=ni/gzsPD; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id A48A0DF8DD0;
	Sun, 28 Sep 2025 15:00:03 +0200 (CEST)
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: bernard.pidoux@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id BD78719F57E;
	Sun, 28 Sep 2025 14:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1759064396;
	bh=K20e9g5tQsgiW0VQ85uT1zIAazLLqmDoSJet8HtycMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ni/gzsPDKhfYMdvjaLjLpP53nG58aqF6P18Mco9PVqgNODa7hpa/5gG47NE++as11
	 0RHuotcGHhKJksXXMtUNPlQQZpN6bIBXwF4+tTjx23eFPYvIStX9dKT2nEICwrcalF
	 tUXclYQSUa03g9uWJ9UB9FzZr1nYKAlPvR54myeG3rs973dxMbTvqB8g3cY1LKwkaa
	 v+Tnhxk1RHZpCKNmV8Gk/NyW+S4z8DZXKhCenXiDbl/CH4IRWbe/cFq5SASaotFTkf
	 TceIWgiIl1YyCEF0pc0rsY6ISrK8hfjj6CHU7EhEtA+9XgVMlJRqisnty/7z7WpagQ
	 4Zwa4YWA+mAIw==
Message-ID: <02b4fa63-cf06-4138-8ae2-6ada09362706@free.fr>
Date: Sun, 28 Sep 2025 14:59:47 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net/rose: Fix uninitialized values in rose_add_node
To: Eric Dumazet <edumazet@google.com>, rodgepritesh@gmail.com
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250912212216.66338-1-rodgepritesh@gmail.com>
 <CANn89i+6naPhD_XJ-qjQ8mRGN1aQdSzMy1446d+0iOk_UjpMOw@mail.gmail.com>
Content-Language: en-US
From: Bernard Pidoux <bernard.pidoux@free.fr>
In-Reply-To: <CANn89i+6naPhD_XJ-qjQ8mRGN1aQdSzMy1446d+0iOk_UjpMOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


ROSE protocole is extensively used for level 2 or level 3 networking 
packet AX25 frames through neighbours and digipeaters stations in order 
to exchange data or messages by radio or Internet links.

nodes and routes are most often managed by FPAC suite of applications.

fpad sets up local nodes and adjacent neighbours using fpac.conf, 
fpac.nodes and fpac.routes configuration files.

Then at any time it is possible to add or delete rose nodes from the 
list of previously defined nodes to help routing and connections using 
ax25tools application rsparms:

# rsparms  -nodes list
2080175520/0010 -> ax0    F6BVP-9
2080175526/0010 -> ax0    F6BVP-11
2080835201/0010 -> ???    RSLOOP-0

# rsparms  -nodes add 2080444501/0 axudp F3KT-11 F6BVP-9

# rsparms  -nodes list
2080175520/0010 -> ax0    F6BVP-9
2080175526/0010 -> ax0    F6BVP-11
2080835201/0010 -> ???    RSLOOP-0
          */0000 -> ax0    F3KT-11   via F6BVP-9

# rsparms  -nodes d 2080444501/0 axudp F3KT-11 F6BVP-9

# rsparms  -nodes list
2080175520/0010 -> ax0    F6BVP-9
2080175526/0010 -> ax0    F6BVP-11
2080835201/0010 -> ???    RSLOOP-0

Up to now no issues have been encountered during add or delete nodes 
process.

Bernard Pidoux, F6BVP / AI7BG

https://github.com/ve7fet/linuxax25


