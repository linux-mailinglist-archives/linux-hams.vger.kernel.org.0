Return-Path: <linux-hams+bounces-579-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4BBB30178
	for <lists+linux-hams@lfdr.de>; Thu, 21 Aug 2025 19:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2314AA7C81
	for <lists+linux-hams@lfdr.de>; Thu, 21 Aug 2025 17:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272DA338F57;
	Thu, 21 Aug 2025 17:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="jDs6dwNC"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22F94AEE2
	for <linux-hams@vger.kernel.org>; Thu, 21 Aug 2025 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755798556; cv=none; b=kdzwodwSkI+bsmdVuYT14sS6tN43asKuqx0oPT0afFF3z59vvyrG1Ft95edv5F5PJoIm9OHMkJW2MKi1GWyDlvay3pDCyvT/BQY6YOPDRKpyVyvrcNJLx7Ur18GzZ5hwTycEyfFwJ1/DT2bF57zfcLaTkNQX/pSTEXlXRaEYDIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755798556; c=relaxed/simple;
	bh=haw37NIx7SXEWqbfrqHpDYcPWWrmn25d0KvP516faK0=;
	h=Message-ID:Date:MIME-Version:From:To:References:In-Reply-To:
	 Content-Type; b=bIeDDDgzmPR5bc64OhyNJ/ugV7id6L9Z2tSSTSQIRBoS3kbCJY9n0T65eHubtiJaQTkC3Jb6Thj/WCRrsPnOgKlynuH/3+sC4RGNtrGzsp60ei+PlxIjjzgc104nIgYKFlOuuhJ8I1iI/X7jDBNptjm0caT9B865ZYQtEUNZzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=jDs6dwNC; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2DD5419F5BE
	for <linux-hams@vger.kernel.org>; Thu, 21 Aug 2025 19:49:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1755798552;
	bh=haw37NIx7SXEWqbfrqHpDYcPWWrmn25d0KvP516faK0=;
	h=Date:From:To:References:In-Reply-To:From;
	b=jDs6dwNCm4MwbvAzDXTyAy3D8PSTC7gp5D4l7eG9EXR1/ZA2WXaMcHDE+LRNsEMXu
	 GCIgAlB4ipd4O6SL3FHgzqFyNhPoCQfRUVnMr3M80h+Rb4ixVFFxwCOUb4lzl7kQUC
	 wL0W+YTUWBuwtC3miBrE/fdCE3ocQsp15Qn25RsAf8xP8pQHDpk6LrO6JDZHV+iLoe
	 ugeGphdzP3TK58OCHun8i4JWasf4NAEFIrMIem4aNWPA565mFu3Uj4NgneQ4xPlv2c
	 +3lktmNe7eVGYPcILrNrrqcIZEYDR82FZyELW3EFAGglBn58pGLcZ0vnvOF5DnwCPV
	 PuFPo54TLIvsg==
Message-ID: <2a9e4a37-d124-4841-86cb-3ca70305cdfd@free.fr>
Date: Thu, 21 Aug 2025 19:49:10 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: F6BVP <f6bvp@free.fr>
To: linux-hams@vger.kernel.org
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr>
 <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
 <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
 <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
Content-Language: en-US
In-Reply-To: <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

subscribe linux-ham


