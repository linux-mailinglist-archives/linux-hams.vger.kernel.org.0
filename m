Return-Path: <linux-hams+bounces-370-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C790EE08
	for <lists+linux-hams@lfdr.de>; Wed, 19 Jun 2024 15:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4736BB22DA9
	for <lists+linux-hams@lfdr.de>; Wed, 19 Jun 2024 13:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8E2146A85;
	Wed, 19 Jun 2024 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyPv0jcU"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4311E143757
	for <linux-hams@vger.kernel.org>; Wed, 19 Jun 2024 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803486; cv=none; b=Js9pkb2GwB/xBHi4cXXT9gOdBcZvLHeMS3cgePnfp3QXUqfdhxhqrG4uyst3vxOdTJ2Mb7KYStmF55qwofxmiDMmuuFBbt4OQgDnErN/0RIlvuXrDJPhHtYkTa8Z02u8OqAjHMn+RQF094a7DMVa1MRPWMbFL43+5PKWuVNb6os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803486; c=relaxed/simple;
	bh=+f0cAWkIrz4y9f+1eS8VaCwECTcuUvuRu1f/P3L78d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzTCccM6zjaYGSOChQSAvnvnbalwcpeuYYHtEs2P3TZCgJm6QPqUT2Im6mjf1AyjgT1rnTyjfuTSbuhXm4OquDNjtvPpbqFa2vu3GQdFa3n2ZKH05CyxjaN/IREZKCf9OOcrWNucqVLxM6m1jLYgiKZVNeM5zEDQUVNAuOiAdME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyPv0jcU; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so405653a12.1
        for <linux-hams@vger.kernel.org>; Wed, 19 Jun 2024 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718803483; x=1719408283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/85lcKBJlO6Kb/QAyU6WAmh7WhaR+ej2sU7f5pYu5lk=;
        b=MyPv0jcUTWrE4rG0sA+/PWuqFQ7EC0eDQtqyqOBmEm89k1jrrqhfWZ5AhKKLbwo16X
         Qt6N4QpqMG3FISlAOtPB0MaKiP1eWY76J4MAIv4BLa3JDkOAe1Rl9OM+VZRRKS8oFtqY
         D5ADn9uudVQ3onvFNQXzhOvRw4AmKnD0xs0cyMSqEleivwfzvc+zZdmphIpoyB4+iqLL
         qsH93JDe/STN98PpVO7vkad+6ISVlf9/qd9xBS2k55fI1IaOnvc0VPCbVXwPXRRe9l37
         grggaI+U0/5Z1le84m0TrPWhrgRQQuvS7S6uRagDe4y9h4RbZDPkvoSfqZe7RxdnPchW
         7JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718803483; x=1719408283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/85lcKBJlO6Kb/QAyU6WAmh7WhaR+ej2sU7f5pYu5lk=;
        b=KsYYHKO3msK3bKfzD6NZi1Ay6avdG2xxRzHLWsjJRYyGN7LRlZfHYWw/lFRXYryrIM
         vq6MMcYeChhEWtBt1cNL3TKQe9NiCN0kWqxo02oMje+DV+oACB4kixAPzhieluku+prg
         t3iYLFlOf1056CTIDmT5tG/5T5e1rPHgLcozc0r9Zjd8mk6xnFr8PYM0L90DU7dlYbcd
         tTtuhP2alf8I6a1ClwvZqbwkmN9VUXECdMit8ShLeje4LCIPp/1mlK3bCvnMeY5o+ZXw
         k38MelIY6hji5pYcrO+yxgBuVGDKHeAhvybbmnTY1L+P8cDuOy2soQjbp1SX9CU2+dc6
         BBDw==
X-Forwarded-Encrypted: i=1; AJvYcCUfN+udlI2/zlquvDzhoz8b1OBp6Iu34l94cbOKYL0XduX3QRc8PloM3K+GLYfLkcGAjh1EDHLhUY0sYcjooczMhkpbluWgg1NWRQ==
X-Gm-Message-State: AOJu0YzlUeXlJ+qnOVNWkvA97ld96pQLDsf9xMpGQnJosnDs64pRQOUZ
	RNWbmKwXEM+IeaX1b4i7I+XOeIfWhkvEs5LVuk/0CWQJ9RLCC+xGDjEvHak/QOA=
X-Google-Smtp-Source: AGHT+IEL5Vd5aGtScDLTtECdw9s829zvfuQ5Bstaigh6QKACgLsd1Hengt+Bj1p8b4PMDcXLUnwCbw==
X-Received: by 2002:aa7:d6c2:0:b0:57d:590:d106 with SMTP id 4fb4d7f45d1cf-57d0590d14dmr1856869a12.4.1718803483250;
        Wed, 19 Jun 2024 06:24:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb743b026sm8321793a12.97.2024.06.19.06.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:24:42 -0700 (PDT)
Date: Wed, 19 Jun 2024 16:24:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Chris Maness <christopher.maness@gmail.com>,
	David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>, Dan Cross <crossd@gmail.com>
Subject: Re: Mainline Kernel Question
Message-ID: <f761b615-7495-4455-a893-1d97015fb659@moroto.mountain>
References: <CANnsUMGJvG6Cs57_ar-iixCpyRKq_ScMZFNaq-SpdHX53ou6fQ@mail.gmail.com>
 <CANnsUMFWHd1kvbDubMnX4aS9La=0EpiCzee7NDNqkCMUwLXPaw@mail.gmail.com>
 <5d40d8ee-e4e6-41cb-a8d7-b2590b549494@moroto.mountain>
 <CANnsUMH9Of7q4NyTnWPE6e-XdezTTxiQeRVDPWzofW82Smj+zg@mail.gmail.com>
 <putxyik6yrsixppkef6v4jqmy743bxqf5uupoh6biwnjdr2vrg@s7axcoh4rv3s>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <putxyik6yrsixppkef6v4jqmy743bxqf5uupoh6biwnjdr2vrg@s7axcoh4rv3s>

Greg is busy queuing some of these patches up for 6.6 and 6.9.

https://lore.kernel.org/all/20240619125606.979500617@linuxfoundation.org/

I suspect he'll automatically queue them for older kernels as well.
They'll hit this weekend or next weekend.

I've been meaning to figure out which all patches are necessary for the
4.19 kernel but I've been busy with other stuff.  Sorrry for that.

regards,
dan carpenter


