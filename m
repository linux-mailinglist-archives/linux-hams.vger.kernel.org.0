Return-Path: <linux-hams+bounces-238-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED668BDCB4
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 304771F22A7E
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 07:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E44613C69B;
	Tue,  7 May 2024 07:49:15 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE26D13BAE9;
	Tue,  7 May 2024 07:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715068154; cv=none; b=kzDhgND4h1ys3PKHSCfpmrAehE4BToR5V2KmjpCePgV5W74li009Ex4uqfSlHQBRm2TPH4TXejiy2c/50VGbxA7hi4qfxTayMalM7oj4D7cSv1CLU5qr4LxSszdr06E6i3Wm3osCYed9XQfcxykzX9LdLQ6H0mFS6fflM95J2O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715068154; c=relaxed/simple;
	bh=GWECqdmQZWkHzypUm0RFLuu+9TdWMf/u981cpS2Ikpc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=U2qfYmwmXKHoMk2NHLoEkz/8X0wciWZmRk25TXVE/z/IvxiPwbxfL9fHanKIGsNaG6kHRPYg8WIlfPYdZNE7I4abvgDwmv5WP3wEdu+ie04D6cvDJvtCzEkrA7U3Y3VEU1aLWwta6jWEGs79ZYOAn1i2BKxPSKtNhQ0QoBr2huQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from duoming$zju.edu.cn ( [221.192.179.90] ) by
 ajax-webmail-mail-app3 (Coremail) ; Tue, 7 May 2024 15:48:49 +0800
 (GMT+08:00)
Date: Tue, 7 May 2024 15:48:49 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: duoming@zju.edu.cn
To: "Markus Elfring" <Markus.Elfring@web.de>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	"Eric Dumazet" <edumazet@google.com>,
	"Jakub Kicinski" <kuba@kernel.org>,
	=?UTF-8?Q?J=C3=B6rg_Reuter?= <jreuter@yaina.de>,
	"Paolo Abeni" <pabeni@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Lars Kellogg-Stedman" <lars@oddbit.com>,
	"Simon Horman" <horms@kernel.org>
Subject: Re: [PATCH RESEND net v4 0/4] ax25: Fix issues of ax25_dev and
 net_device
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT5 build
 20231205(37e20f0e) Copyright (c) 2002-2024 www.mailtech.cn zju.edu.cn
In-Reply-To: <0334480f-1545-455b-8d5f-0f7a804ad186@web.de>
References: <cover.1715062582.git.duoming@zju.edu.cn>
 <0334480f-1545-455b-8d5f-0f7a804ad186@web.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <29ce806b.40d0.18f5206d01d.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cC_KCgBn4Vjh3DlmTZI2AA--.5163W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIOAWY4-AkPhQAOsh
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUCw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

T24gRGF0ZTogVHVlLCA3IE1heSAyMDI0IDA5OjMwOjE2ICswMjAwIE1hcmt1cyBFbGZyaW5nIHdy
b3RlOgo+IERvZXMgdGhpcyBjaGFuZ2UgYXBwcm9hY2ggcmVwcmVzZW50IGFub3RoZXIgc3Vic2Vx
dWVudCBwYXRjaCB2ZXJzaW9uCj4gaW5zdGVhZCBvZiBhIOKAnFJFU0VOROKAnT8KPiAKPiBIb3cg
ZG8geW91IHRoaW5rIGFib3V0IHRvIGltcHJvdmUgcGF0Y2ggY2hhbmdlbG9ncyBhY2NvcmRpbmds
eT8KClRoYW5rIHlvdSBmb3IgeW91ciByZXBseSBhbmQgc3VnZ2VzdGlvbnMsIEkgaGF2ZSBhbHJl
YWR5IHNlbnQgdGhlIHY1OgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbmV0
ZGV2YnBmL2xpc3QvP3Nlcmllcz04NTEwNTIKCkJlc3QgcmVnYXJkcywKRHVvbWluZyBaaG91Cgo=


