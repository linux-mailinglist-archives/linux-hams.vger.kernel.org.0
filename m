Return-Path: <linux-hams+bounces-514-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A82A90BC5
	for <lists+linux-hams@lfdr.de>; Wed, 16 Apr 2025 20:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 123D65A04B4
	for <lists+linux-hams@lfdr.de>; Wed, 16 Apr 2025 18:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77902224220;
	Wed, 16 Apr 2025 18:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kth.se header.i=@kth.se header.b="V+PEeZlj"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp-5.sys.kth.se (smtp-5.sys.kth.se [130.237.48.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449DC2248A6
	for <linux-hams@vger.kernel.org>; Wed, 16 Apr 2025 18:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.237.48.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829877; cv=none; b=X41mJhSiIRilQNF7ufZhJFGDd2pBfs21CUR0YYqfKN4nJcO43D/RG68FBh0ZFUTTycHJF5zyv/uS0ydrtu8EH8S/M4xoHc/R/2qVtK7jYByvew01tWUuz4td2o94i3qok158vfagGbIdUNSmC28ojmKkNv7wzSLFmn11kzfiphs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829877; c=relaxed/simple;
	bh=u7jH4BubpsuTFxGhbmdCbwsSCL47+Ejzh7sludJ74E8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=AhGevHzaDFnqm4LSh08ET58c2TlngGihrPBmQknzPlIXRaE9M+hsYcjIilYGnruaFofBTKdkooLX3cQWgfvn5bbOEY8OvoMSmyqwefjwEX7aROnyCifMLv8rejsOJW8l39+nXIe+xJ20j3gk9LdBRsQK9fSxRX7wzRjlpFt8Uo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kth.se; spf=pass smtp.mailfrom=kth.se; dkim=pass (1024-bit key) header.d=kth.se header.i=@kth.se header.b=V+PEeZlj; arc=none smtp.client-ip=130.237.48.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kth.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kth.se
Received: from [192.168.1.44] (ww193-234-157-70.cust.wintherwireless.se [193.234.157.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bpehrson)
	by smtp-5.sys.kth.se (Postfix) with ESMTPSA id 4Zd97G6ncdzPNPx;
	Wed, 16 Apr 2025 20:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp-5.sys.kth.se 4Zd97G6ncdzPNPx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kth.se; s=default;
	t=1744829387; bh=u7jH4BubpsuTFxGhbmdCbwsSCL47+Ejzh7sludJ74E8=;
	h=Date:To:From:Subject:From;
	b=V+PEeZljfQCeTNWytjyB1Y7yja5PC9Cgp8BoS/ksyeaOrtN4I8vaELOEL91WX77P7
	 m9ScDViGLYs+pBrfcPFO98tAr+xeHav8chMlA4X8/qKOyRcitLgfV5Pvxvam1ZRdts
	 TVJvgLVTFWWzZUtn/UiiFkO2CmbjURSOZ9VOYnh4=
Message-ID: <b96fe8d8-9547-4de2-9290-0a507ae301ea@kth.se>
Date: Wed, 16 Apr 2025 20:49:46 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-hams@vger.kernel.org
Content-Language: en-US
From: =?UTF-8?Q?Bj=C3=B6rn_Pehrson?= <bpehrson@kth.se>
Subject: subscribe linux-hams
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

subscribe linux-hams


