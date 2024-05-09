Return-Path: <linux-hams+bounces-271-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 036D08C0E15
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 12:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 893A11F222E9
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 10:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE3914AD1A;
	Thu,  9 May 2024 10:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMHKc7b6"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC8F101E3
	for <linux-hams@vger.kernel.org>; Thu,  9 May 2024 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715250094; cv=none; b=dyPEXYENEedVnPyVdebrVt+sKfwBwC6KGFQ4dMZ2UUzIF9eyafFZxDiWZXw9uV09+QiNC/cmg/XFAmqyUdfF0SYRPXGIHOgf7bZd3src/BEbj8NLdZk/2wRklWksij8DWRFw0qKvSuUKOjSd0BZjo8T9COPGRTjq3CqK4uv8Ezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715250094; c=relaxed/simple;
	bh=j+SA/H92X3WKkKhevEKvRq51nKopQ2fPeU33+rOUUVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2x5fST48rctAn+XYyDUN14aYF1eBLjAX6b0pRzDD/J55SPFZjFXVyCx0SUvvSKn9s1ZxOoSXfYnbXUOscPhaMHXDT7BeyRr5SQT2HFc/OXJeh9Q2YYjKOiOKk4+g2fs+leHp/YtT7k6r1lVWeD7JnqIzZQwtn14F/4+BI18Y28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMHKc7b6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59b49162aeso158987166b.3
        for <linux-hams@vger.kernel.org>; Thu, 09 May 2024 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715250091; x=1715854891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MiqLxRYMUhidn66UhJZrdQy5laE1IzDzKiUK50VqTa0=;
        b=KMHKc7b6zWIRmDI7Vq0g0ZtigXRY6Jz8tglsrcYFuhtdfmpox6ybJRBjYBr1MqyQQX
         iMGjC9vYf5NlhhG5xqNJuL22jNxFFX457SnU6lWOAtDseFI8QX84bU0uUhVjl/M5XoZ4
         gKJJtPtFVsf9f4SEfa6lAABSavL/PfrpRxiIWTdprzjyU9IkDIFsSafYrXnu9GYEqtLw
         WtotZ0xXVmS4GZmvtUwjzuXF10AgTXJa842rAi6Yoh1v7zmnwSU8Lzzof/fiRbZc1yNx
         Mlc1SXpwds4RtO9fZrXnECJLo04Ysqlfd6hcxgG+h+DfbrAgw+dFaqA5KjXY5LfYcBFc
         F2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715250091; x=1715854891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiqLxRYMUhidn66UhJZrdQy5laE1IzDzKiUK50VqTa0=;
        b=o1BfI8VGcet1U6tlKjSMu2Lw+18y5v7IhfmTFBzAmcM1ae9WnET20rLffNxFFw/yga
         XC0ApgNNT178jsoK4MVMsP5G6iUZqaZZE8Wi2ONpjdxdAH56C6ixazNXkaqkJ+0w+ATf
         iv07n3+rpUOhI/78sSmYHLEiG79qR0WWPxQ4FSjzVXStSWdT8MkT9AidoOACWcYwgiVI
         YgLxyCCoXucMnW+y/OiR1v7aVcft6sMoRniQQrBY3rON5o3tCXVzdl/8zykPJqVbUIjX
         1vZpTd95EwnMDTTkEHQFeicUQU5R28T7Pf1mtBTWfXfakp6M5dQ3pkqhV8ztOMDjgX9n
         DRaw==
X-Gm-Message-State: AOJu0Yw6/ohc0O8ryO4sL0wYRpxQH6tv1aIqCrMz3XLFtvs9usNOnDL6
	uoilvJAeo7KKF6SO1bhWGtCxbx+O9dMmRV5mdWY78z0livjj4cabr6SkYyJNtlTAx/1kG+NLR97
	E
X-Google-Smtp-Source: AGHT+IFMgJk8s+dKtnI2g5Qpii1OxOiCSLswCyFU9u4UAQbJQ7jCkDMc98GeaZIlluqf4wnMRRB0ZQ==
X-Received: by 2002:a17:906:68c7:b0:a59:b807:330a with SMTP id a640c23a62f3a-a59fb94cd10mr310894266b.32.1715250090689;
        Thu, 09 May 2024 03:21:30 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7f49sm57478566b.101.2024.05.09.03.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 03:21:30 -0700 (PDT)
Date: Thu, 9 May 2024 13:21:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: SP2L Tom <tewues@gmail.com>
Cc: linux-hams@vger.kernel.org
Subject: Re: Unsubscribe
Message-ID: <18d0e209-d152-4e68-9b0b-1d85fd8b7449@moroto.mountain>
References: <18f5cd4cca8.2802.8f75195883235ac341a2526b993b57c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18f5cd4cca8.2802.8f75195883235ac341a2526b993b57c3@gmail.com>

On Thu, May 09, 2024 at 12:10:01PM +0200, SP2L Tom wrote:
> Unsubscribe
> 

You need to send an email to "linux-hams+unsubscribe@vger.kernel.org" to
unsubscribe.

regards,
dan carpenter


