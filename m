Return-Path: <linux-hams+bounces-731-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D54CC5C85
	for <lists+linux-hams@lfdr.de>; Wed, 17 Dec 2025 03:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFD79303459B
	for <lists+linux-hams@lfdr.de>; Wed, 17 Dec 2025 02:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1178276041;
	Wed, 17 Dec 2025 02:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lzg5sj2A"
X-Original-To: linux-hams@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EC3A1E67
	for <linux-hams@vger.kernel.org>; Wed, 17 Dec 2025 02:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765939032; cv=none; b=fATy3+pL0R9Wn5kiZxl2YEFWbewpxneSA7Kb9PdM7gVGi5+5YauxUtq3wyRDRakmGwMuVhKDS6YFcegp7wg01EU4BV04yLv6s+KeGK+MfT7agLPxZILv9qtQtI4uO9emh31/+lTg97HNinhG1tQ9pn1h2SMVz7pex9fT1vsGkHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765939032; c=relaxed/simple;
	bh=1Isj4mX6Vyt9m69TWfVdj//SpgR8fxG2ZGl1Vfa4+eo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JLwYsASikWnDnrR6ZAKjipi23AcP60b0em29rrKxH2HrIFU/aWjzdAMNIpl2LwFKW4Y+CilVJD4QRezdQO+lc2q1WxaS0v+2grIaX3FHBVh3vF7Pwd3F7dx8LrZEF/Qdur5Mj/HJzw2w8HrOEj1ERJy+QkoPzMWrS5hhdOWlsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lzg5sj2A; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765939024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5aRivHaTbegQNkRt7bHX8ZRS4dbuKQr87Iksclf1c8=;
	b=lzg5sj2Af0uN5n5WEceRyn60EP0Y1NDyr7zCCa/DJy6H+UD5tVVHmYd20vrXxUPZj2Zvxf
	wdiPid6tfeyabO61YC4gaoHfpdpvckoAx4zMi8BysVSYTaif2sGJ2A0PR4kDtQJJ8Lg8s2
	GYDV7lpx5CoriRZmPpfY/JW93ODHF5k=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCH] sysctl: Remove unused ctl_table forward declarations
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251215-jag-sysctl_fw_decl-v1-1-2a9af78448f8@kernel.org>
Date: Wed, 17 Dec 2025 10:36:24 +0800
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 linux-hams@vger.kernel.org,
 netdev@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <8975859D-F82B-4829-9744-171B7EBEE749@linux.dev>
References: <20251215-jag-sysctl_fw_decl-v1-1-2a9af78448f8@kernel.org>
To: Joel Granados <joel.granados@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 15, 2025, at 23:25, Joel Granados <joel.granados@kernel.org> wrote:
> 
> Remove superfluous forward declarations of ctl_table from header files
> where they are no longer needed. These declarations were left behind
> after sysctl code refactoring and cleanup.
> 
> Signed-off-by: Joel Granados <joel.granados@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

For HugeTLB.

Thanks.


