Return-Path: <linux-hams+bounces-332-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1ED8CFCE5
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 11:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C06481F24F59
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 09:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2025813A3EB;
	Mon, 27 May 2024 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FazKieuv"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514C713A24D
	for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802252; cv=none; b=en55pLZISLkGHHb4XcWxCHKn0hQKAKHBErOujvIxo7XNpBqM99tsHkUEfq0TGpej/fDn42d0coP1IMv+U0oujJ/Yqt0gpnkxc/JHUZEeoZ86ZdBUVMXImP1J4J2CW9YcAPcChHQ8XKhi7s2m8lSk5cT2nM7A6GqNW8GMRXGBQXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802252; c=relaxed/simple;
	bh=IHad4bR5jBE1dNhL0R0Y5eoXxXtkLjED4ojWbzf7zek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYYvV/yoxIIUNSM6wCLWOf8NjevBWy2lMXO2ljBDPqtIVoxiRR/WNFNQsbrr6rUFtCCpx5wdA5S1z/bn5f7CdFF51Lw1HRwHfoW0/r3SansyzAeUf7WnWyWY2wezGdXz+M31586Ge0ZSaSkywuFLJnCGhVH+44KtRWzuHW45w0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FazKieuv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57883b25b50so1858453a12.2
        for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 02:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716802250; x=1717407050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oDAbUxuTsmalhjjsgyWuukOEqACwiq+KTjA7Os0Np/g=;
        b=FazKieuvpuw2d7pjGjtxFEYLvvcbwcomoD9iUFbdWqxz1/8TzavUfOuG1qaxlNFcV4
         +V3tnbjl2X1PJMhbcOpts4x8fFdnhOqMOtn/Wnp/84lOPJBbg/7k5ZIALdidRy9vPIHb
         RaVVQtRPzb3UUr0KZKNfrX62RRsD5jpRBd0OfkwvPkq6H1PqEQ2kg/0M2gDhFuxr+Sy8
         n8mq65gHWjl83rxBSTQP3VYKPROi1e503rXRPIW/Yb3jRJoHyP+hkXwEEcRSbzC++CQC
         XBQ4h758NtiGfMcOmRvR1iDdolS1KbZ8AwOQQDonylTjwgu8XTaK+ScAXn89EZVlqYl1
         BjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802250; x=1717407050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDAbUxuTsmalhjjsgyWuukOEqACwiq+KTjA7Os0Np/g=;
        b=QD1sSI11IujYlSLGf+7dTcHtmxsvtEMwVjWtn3g9H5r9q2jMW3k6Xz1uoR7ZB0GfzE
         HaQtgPoSiYTUPHAzePydL8XElXEDV2kcOm9bY50F/aUxi8DtcFUXG2MK3WjLeYp4bjlD
         L1mFCoJnAYGPvS7geEM/JzFqvazLY1OdxXRNocSk7+O1XwT59Qk7vquflI6QascQyRj6
         va76/vdRclZ8oKcuixaBunMEILmNWe96fenqVXpGzzwF/jUJ9v71BuB2MN8u9TwgH6yI
         KASczmFIALusfcJq/n47Ckx0NUTEKWqBK9LuD8yjQC3wgnVYJychfDxDQqwiGn9NCCmu
         vCfA==
X-Forwarded-Encrypted: i=1; AJvYcCVf67WuNq60sqRz+dbUK4JUj6MCykidH1ITICjvGXq/AKrtcXgVUxFBA7/XvW+1+YLXy1KMB+KX6bAgaqtf6gbT8/u/Pn1CDb6PZw==
X-Gm-Message-State: AOJu0Yyw6yXjbTyG4U/pgHyebn1VbPDXXqiPV1mzrpFvv1vU/vUc8ih1
	MRbmd6NumbhFOmgOqzvcsFDRDs0f2YeiRZMGptYXix9PuI+xmvDKUAGKNp+VROwPHoq4E58oZWG
	d
X-Google-Smtp-Source: AGHT+IGq3HGBMMYfBtMpzbUCZCi+D/fetUueNMslkr7Q9Y3rQU6buElaDJWbrAQTgkYiTo9cZEvZtQ==
X-Received: by 2002:a50:d794:0:b0:578:649c:9e3d with SMTP id 4fb4d7f45d1cf-578649c9e9emr4029878a12.9.1716802249479;
        Mon, 27 May 2024 02:30:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785240d1f9sm5558627a12.51.2024.05.27.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:30:49 -0700 (PDT)
Date: Mon, 27 May 2024 12:30:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chris Maness <christopher.maness@gmail.com>
Cc: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>,
	Lars Kellogg-Stedman <lars@oddbit.com>,
	Dan Cross <crossd@gmail.com>
Subject: Re: Mainline Kernel Question
Message-ID: <5d40d8ee-e4e6-41cb-a8d7-b2590b549494@moroto.mountain>
References: <CANnsUMGJvG6Cs57_ar-iixCpyRKq_ScMZFNaq-SpdHX53ou6fQ@mail.gmail.com>
 <CANnsUMFWHd1kvbDubMnX4aS9La=0EpiCzee7NDNqkCMUwLXPaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANnsUMFWHd1kvbDubMnX4aS9La=0EpiCzee7NDNqkCMUwLXPaw@mail.gmail.com>

On Sun, May 26, 2024 at 03:25:48PM -0700, Chris Maness wrote:
> I am looking at the [view diff] in the mainline kernel, and I think I
> see the AX.25 patches that were going back and forth a couple of days
> ago (a good thing).  I imagine that I will have to wait for another
> stable fork (say 6.10.1) before I can expect to find this code in
> Slackware-current.   Slackware current is following the most recent
> stable fork of the mainline tree.  Does this sound correct?
> 
> Now, when I see this new code can I simply update the net directory in
> say 5.15.145 or whatever is running at the time in Slackware15 and
> recompile?  Also, what can I/WE do to have all the deltas from the
> mainline (as far as the AX.25 stuff) backported to longterm branches?

Let's get this working and then we can easily send an email to Greg to
backport the necessary patches.

Btw, ax25 was broken for two years and that's not great.  Could someone
commit to testing upstream?

regards,
dan carpenter


