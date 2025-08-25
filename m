Return-Path: <linux-hams+bounces-589-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20417B33FC0
	for <lists+linux-hams@lfdr.de>; Mon, 25 Aug 2025 14:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C83E117624C
	for <lists+linux-hams@lfdr.de>; Mon, 25 Aug 2025 12:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0FB1C5D59;
	Mon, 25 Aug 2025 12:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOLM+6qm"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A031A5BA2
	for <linux-hams@vger.kernel.org>; Mon, 25 Aug 2025 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756125650; cv=none; b=OsDVsOCWOUGZDZpAb6HiiFIIVISWgJl3eYbI+NGTNxOatUOYf9V8g8OUwp4d5egf8phy8JYTVp/nOWmmjqu+ff4K6qELwrAWOGd3SaLmmWcj9Qr4TgO57FOfJ9ZSKrE8cQ+tBBPpN4vJVSXL4DKyx3dhC/IPGxYk3iVtNRIHeAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756125650; c=relaxed/simple;
	bh=YLoOSnAIdgarnwk8uFSTUkwrPlZZxe4hvFL/64ixOho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfhJWPaZW33Wn4aizB3ja9UwFCoL1pIjKzzHw//mZpE50i8RfqPyhcZjjRxRXrJiOsGmUiBoNauYRiDI9WAJkPjp43KzVi/1pIzTzuKsy0nof2HPJqmx48t3ZM4j+GBNC3C/yjufBYb9geSXMMRuKs2d92ClhUewwJcRkevV8yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOLM+6qm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c73d3ebff0so695369f8f.1
        for <linux-hams@vger.kernel.org>; Mon, 25 Aug 2025 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756125647; x=1756730447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LTosloLQ3YuyXDH+QuOGGkkdswqFnw/93ewHj7HME/g=;
        b=TOLM+6qm1kq4dzlwBo/KMRY9iKJPJXiHbroBqAUD/Sl5Hc3RKl47MFGOHgigDFxWHg
         L8iAokqtpDvQ/C8HS5mkVqebD3jVEp2itPZUTQ2Tb1mHfQuvYZUgjjpLfyon7+tkLCs/
         Psg/4qdgxzCDViuEzpCAqcyKMp4joYuE4ytSadzfXTP9cFm68wasSRvXHBVOevy0f4f+
         Rs4U3/ipzx+T8NHoIinTvmQgj0c5dIgnMfV4gUhCmWuQ4Z17A2A0lPraIF/AKuFl2hHs
         57X6p4oQH5mFappu/MIccU+fbGhx1SkauIP7C0qkOrFjJdWe+h53IrJ4zTCAF7R1FcWZ
         ltLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756125647; x=1756730447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTosloLQ3YuyXDH+QuOGGkkdswqFnw/93ewHj7HME/g=;
        b=GNGhol7eomX5bxoMqiH+kzjf8newURHvUkpx+1rnDq5AkCCh8lETcJUTAzITdhAQMu
         dxhsA5ol8Zr1nRV912FmU3ANgdvuRnyBw6ciAGOrhOi12mu9U2/aSFooVfyieNAbkGQL
         otKQ1t/rQnpd++fjt5K3/ostbK86D+k/GNKuSGnDi23bKYi8Y/Iqq86a/4MfL/9vj8t1
         xCshPAQ5Z0IqZ5JMmMuT0i0bjGiIEJHckUp9xKD3bOiKo7GYk9pEXNRrRmArfNGgpiHz
         jKPSMdl35kKVswc7asnqd//1+tteKKkmvWQhzBpYTEceIl7zl7JmeIZLMaMuX2eycqnF
         yRGg==
X-Gm-Message-State: AOJu0YyfJOwPKOE+EXODNl83fN1Zq8mFxGdjX0VZsz60aPYT0DRox4nn
	U2WKlLNBeGUvSpomfM7LhhabGt1FF9FTFD9RNAyHY/OrrpnBDF36xh32cq72JRkxWgM=
X-Gm-Gg: ASbGnctIMA3pxpsl02Gl/tlAaL9m8YD+HyOHPZ9bFfUOrB1osgEJhDdZDqzspZukNBn
	FE5y1wjRbSi9uBIiHB6cOK3QvIhPhKBxUUpDqYoz1dVvpEfc0UiH5PlyxxeruR6ufUsR8vG//iH
	eDafRIVOuiZGSdpRKrMuaSSynDKVX1A1o90fl5h0+aXCiaEdVPKxJSQnYBJhC1dDLBpMFe79p2E
	7Yk1YbawLU6b/W6Tgd4xvtGiMoF1IuAtzBIV7yqACNFJjlzzSpNlsoyP9mVhiXJvuWo6Tx0QwOM
	R1AQIsS1wBT+CIkpD4BqR3cCfNSXunHjGoX3hIADDcRNm73W7o4/qNN0pdEB5xXjoun4QYnyL6y
	jei7e2b55VMf/W0+o1lggyyeoj9A=
X-Google-Smtp-Source: AGHT+IGYnRFBxjlOFgSEK5V1glXjk8f05pfjihNiBtPsj4TS5/Z8XylNOYygqLLEKXdAYPz0RaRh/Q==
X-Received: by 2002:a5d:5d08:0:b0:3b7:885d:d2ec with SMTP id ffacd0b85a97d-3c5d4320764mr10255477f8f.18.1756125647309;
        Mon, 25 Aug 2025 05:40:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c70e4ba390sm11920651f8f.12.2025.08.25.05.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 05:40:46 -0700 (PDT)
Date: Mon, 25 Aug 2025 15:40:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: F6BVP <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>,
	Dan Cross <crossd@gmail.com>, David Ranch <dranch@trinnet.net>,
	Eric Dumazet <edumazet@google.com>,
	Folkert van Heusden <folkert@vanheusden.com>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
Message-ID: <aKxZy7XVRhYiHu7c@stanley.mountain>
References: <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
 <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
 <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
 <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
 <d073ac34a39c02287be6d67622229a1e@vanheusden.com>
 <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>

No, this patch doesn't do anything.  "p" is never used without being
initialized.  Plus, I bet that if you do:

	grep CONFIG_INIT_STACK_ALL_ZERO .config

You will find it is set to =y which means the compiler is already
initializing pointers to NULL anyway.

Perhaps you're worried that about this line:

	p = kmalloc(struct_size(p, data, 2 * size), GFP_ATOMIC | __GFP_NOWARN);

where it seems to call "struct_size(p" where p is not initialized?  On
that line the compiler is just doing a sizeof(*p) and not really using
the value of p at all.

regards,
dan carpenter


