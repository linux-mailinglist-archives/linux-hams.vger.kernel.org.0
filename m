Return-Path: <linux-hams+bounces-689-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D8C06802
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 15:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F240B4FE6E4
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 13:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4552431D370;
	Fri, 24 Oct 2025 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="Yz5FFmXq"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4631D379
	for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761312507; cv=none; b=WNM0Se2QSEbD1wz7khOkL7WkhjDs4ucTY0Jmh9h4gOz9M6Nv5h7gxvIYC9xZ591VAxvw9VBhFdamxl4FYEiogvU6dcFUe8koEkHJ8fEwZ7Kdd9JyF76c+4RSO+lEfitQwTybu8H/Hag+D/SSBf+AYG/+lDJE5oYD/rgqkaYk0OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761312507; c=relaxed/simple;
	bh=NZmbiiV7nwd7QdTx0sVSZ7laPQgZnSeqd4oZaxDbvAY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OYYCTsPhZZaLEc2h5hbdIDD97OHqm0rVT2PE6RLkhWZOfu2dygqgXmqd2ayqb6D9iFPB5L57VtL6gQbIX4Gxj58COJbIRrGwb5mGT/LQhkkgrzq3nFVgPLQRHuOWou982LSO2lV4kUZB9CIVadDv33V//GyqqmPmWq2WcceDJQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=Yz5FFmXq; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6E24019F73B;
	Fri, 24 Oct 2025 15:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1761312496;
	bh=NZmbiiV7nwd7QdTx0sVSZ7laPQgZnSeqd4oZaxDbvAY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Yz5FFmXqQSOS+WxmwqO0DMlxykx/ZsneVp+/F2Y/JE2LwW5eZ9dS5rNep5DdPV/+B
	 wycd3Ne1IBvY1/3yMthA1oHjLqgHE5dUpqmnvT8Q8AKwBwVF8W8Ghc1hYVDWG4dAgt
	 gOrjU7kJMAqnK3PruPxSVqLk045VxN9R8t68v98nJedXtQz6a33UljI6njflsJpQFu
	 an6s+SXvMK5fsfTBOKRsAv+4uFetJtihQ8xIvAFtNOx1A31Ax75P7aZYgElxxOX7ZV
	 YV5DPFNL3rCRu2XBrJ9paKmYwf2nLvwvl8KqhC6SsZjqQjgPsx0SzxugxPIkfmqXzR
	 EYWGiMZRZpsMw==
Message-ID: <57c0e5be-5a9e-4868-950e-3ccd05f14b1b@free.fr>
Date: Fri, 24 Oct 2025 15:28:10 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [AX25] fix lack of /proc/net/ax25 labels header
From: F6BVP <f6bvp@free.fr>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Woldanski <ve7fet@tparc.org>, David Ranch <dranch@trinnet.net>,
 F3KT <f3kt@free.fr>, linux-hams@vger.kernel.org
References: <E3ABD638-BF7B-4837-8534-F73A1BB7CEB3@gmail.com>
 <e949c529-947f-4206-9b03-bf6d812abbf2@free.fr>
 <7741c41f-ea8d-44d2-bf62-8aab659a4368@lunn.ch>
 <70056265-2f04-4c0c-a5bf-d2192e40b65b@free.fr>
Content-Language: en-US
In-Reply-To: <70056265-2f04-4c0c-a5bf-d2192e40b65b@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

(net: ax25: Add header line to /proc/net/ax25 for ABI consistency)

The current format of /proc/net/ax25 is an outlier within the Linux
amateur radio networking subsystem, as it lacks a descriptive header
line that is present in both /proc/net/rose and /proc/net/nr. This
inconsistency forces external tools to rely on hard-coded column
indexes, making them fragile and difficult to maintain.

This patch introduces a header line to /proc/net/ax25, aligning its
format with its peers.

ABI BREAKAGE JUSTIFICATION:
Introducing a header line constitutes an Application Binary Interface
(ABI) break for user-space applications that parse this file, as it
shifts the column positions by one line. This break is justified
because:

1.  CONSISTENCY: This change normalizes the output, making the AX.25
     interface consistent with other protocols in the same amateur radio
     namespace (ROSE and Net/Rom). This improves the predictability of
     the entire subsystem.

2.  ROBUSTNESS & FUTURE-PROOFING: The existing format provides zero
     metadata, making it impossible for user-space tools to detect any
     future changes in column order, count, or type. The header acts as
     a minimal **versioning mechanism**, allowing external applications
     (like a modern netstatAX25 utility) to detect structure changes and
     adapt gracefully, making the interface more robust against future
     kernel modifications.

3.  LOW IMPACT: AX.25 is a niche protocol, and the number of user-space
     tools relying on its /proc file is limited. Existing applications
     can be trivially updated to regain compatibility by simply skipping
     the first line of output. The benefit of a normalized and more
     robust interface outweighs the minor breakage in this area.

Regards,

Bernard, f6bvp / ai7bg


> Le 09/09/2025 à 18:11, Andrew Lunn a écrit :
> 
>>
>> All files in /proc are ABI. You need to include in your commit message
>> a justification for breaking the ABI backwards compatibility and
>> potentially breaking any applications which are using this file, even
>> if it is not so easy to read.
>>
>> I would also suggest you read:
>>
>> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
>> https://docs.kernel.org/process/submitting-patches.html
>>
>>      Andrew
>>
>> ---
>> pw-bot: cr
>>
> 
> 


