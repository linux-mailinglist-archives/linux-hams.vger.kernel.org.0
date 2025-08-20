Return-Path: <linux-hams+bounces-575-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE2B2E906
	for <lists+linux-hams@lfdr.de>; Thu, 21 Aug 2025 01:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09ECC5E2965
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 23:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26712E1753;
	Wed, 20 Aug 2025 23:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="K03PU2yH"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A2227816B
	for <linux-hams@vger.kernel.org>; Wed, 20 Aug 2025 23:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733843; cv=none; b=OkjnipvdOC7G7X5DgU552DmoqsknwKUb9rUBmFeIF83nEpVorvU9zV4X7YNgE5yoA8/5hz+1thzeKQ0AoyMQQvUEXXSsBuosD6p+5C+KbR9O9PcZroxW4oHbeKTvObNoi327P4mempibzP7oejks2MqjU2oyy+IzjlfR6GYtcNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733843; c=relaxed/simple;
	bh=80Tn/LvtDWaPkxLGsvzHqThC9OLDcyQloaCIGdZYvk4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=HpqjeI712vXpK7NigXmzNWFdwoPWa/igOPAyUNzpQtKF+PgEzRvvR0TDRNrMEOLNnQXeGTnnoEF/owNrhFgZ7ogmRRWZLK5+DALIb8pq/fhZQTjxCV1l4V6HvhVdrR9k7pUyNPBA+FPabUNveqLWd4exqLAHxfcMQxyx8NrBn1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=K03PU2yH; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9AC0719F522
	for <linux-hams@vger.kernel.org>; Thu, 21 Aug 2025 01:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1755733836;
	bh=80Tn/LvtDWaPkxLGsvzHqThC9OLDcyQloaCIGdZYvk4=;
	h=Date:To:From:Subject:From;
	b=K03PU2yHu/W0NQR7808NQ6xBsYj5/YDS6dMBH8n/k4ybmg2kpOSGAzZQCihyGdpYY
	 I+rD3GY5bKp8u8dibV4nlAqEE0AZww8YZnIknPtt81QWGfmADSdL+dTBfQBh6K//7z
	 LLGhmlx5jzQ3cZ2Bi+FAc65Imu/vMPy+rcw2Q8bWgoE5fmTb/iAJGXAUclVf3Okoo3
	 my7HoGv+XnHAcDmNX2LqEBVwFxWTpRnznxKeSCmn8k0kERZyIGqTmrMSEQNdb1anLq
	 4yWrLahzBXV1lQ16hpbTnHWOfaP2i+i9alwg/+zbOqCSbrJKeuj1SCNhJJi050rjMM
	 wdf/a2Hgas3CA==
Message-ID: <7974d84e-8ecb-48fd-8b1c-67850ae874bc@free.fr>
Date: Thu, 21 Aug 2025 01:50:35 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-hams@vger.kernel.org
From: F6BVP <f6bvp@free.fr>
Subject: [PATCH v1 net 0/3] net: rose: introduce refcount_t for reference
 counting of rose_neigh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

3 patchs applied to net-next

Could not find functions rose_neigh_put() and rose_neigh_hold()


make modules error:

   CALL    scripts/checksyscalls.sh
   DESCEND objtool
   INSTALL libsubcmd_headers
   CC [M]  net/rose/rose_in.o
net/rose/rose_in.c: In function ‘rose_state1_machine’:
net/rose/rose_in.c:59:16: error: implicit declaration of function 
‘rose_neigh_put’ [-Werror=implicit-function-declaration]
    59 |                rose_neigh_put(rose->neighbour);
       |                ^~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287 : net/rose/rose_in.o] Erreur 1
make[3]: *** [scripts/Makefile.build:556 : net/rose] Erreur 2
make[2]: *** [scripts/Makefile.build:556 : net] Erreur 2
make[1]: *** [/media/udisk/net-next/Makefile:2011 : .] Erreur 2
make: *** [Makefile:248 : __sub-make] Erreur 2


