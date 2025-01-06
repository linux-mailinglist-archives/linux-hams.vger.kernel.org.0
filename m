Return-Path: <linux-hams+bounces-461-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF994A02240
	for <lists+linux-hams@lfdr.de>; Mon,  6 Jan 2025 10:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C3B518851C9
	for <lists+linux-hams@lfdr.de>; Mon,  6 Jan 2025 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B20B1DA305;
	Mon,  6 Jan 2025 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QbxExXK8"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D1A1D79B3
	for <linux-hams@vger.kernel.org>; Mon,  6 Jan 2025 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157315; cv=none; b=n7/quWSLLHrKIPYfcLH2MH0MnhWLlv8V8Occ9gFAbFjdPkk02FtodUgGXf5JsWxCH8ffq5JaOEPQ2s7fsObf51EIG8BLhQPL7k32RGGr88pH3IPIRaTSjaU+F3FRzkR6eEQSSOun1HWh+zfbhlU2ESVy/ow0fOY14fN2hylD07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157315; c=relaxed/simple;
	bh=xkrRsNvf6yCgfIDOwAoPR1Rz7RRFedHEpLTM2m5X3h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VilgsFwUJyJ8jB9GPvgBY6pJHV9+C2LbWj+sj7I2KT5GCSkxtmDiL3U7xuqot3mDHXbf6G5EYEQd5m2r4/ZIOA3/NVmqXK0sggu9FvOBLehSY9lPb7dXZoqm9HiJfxUW3lwV+IEPSunLN2xrmOX795iqC/2STI9OLYJcp5Xi4kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QbxExXK8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38634c35129so10896042f8f.3
        for <linux-hams@vger.kernel.org>; Mon, 06 Jan 2025 01:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736157312; x=1736762112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0jGxr5wqDmdeu5IyMbxmx0edpfWmeZJ8iItGM3saxJ8=;
        b=QbxExXK8AsKXjPfctpi2B8HP9DNavwgdzXkg1JzviqQTjEQ2oxdlCo8lXbs140IMpB
         K8GLNnhcA3Yq/brb0bSYDmTF847zQPt9m4j56cTisMxYjKWROql3SiaimZS280+RAKPF
         3oL9kI2E2INUazKtl/53zlxVTfhLaoJHKU1D8eY+ysTm9639f80vmw/3h/lYTdwMOljC
         pRnX308map36rn1HcqoDq1/m4WQHC+Vl+l6MmHnlLEwLc5/D5i2TNE7XAzeMCRsP3hBb
         0r2eF8+OGKOMImYHkCoqh98l92bkHywJl0AMbrN8YXQU+qu41WbtGvDHl4JyrGLc5RLf
         Klww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157312; x=1736762112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jGxr5wqDmdeu5IyMbxmx0edpfWmeZJ8iItGM3saxJ8=;
        b=Vz9bsSdn8Km7BoF6h47FNHU3FYZtYCrvvTNqabvNGfNZqYMOq/d9aDUtCM3YH3WuWb
         RvA2kO2uvaDkqEan8m1kVvtHlAh8PqztF6MrPJArC5BgLl7si4mwLf45Lp4km9Rhcqyt
         UMcs/04vQxF/R9caAHVTJT2fMLKWtnDvWaSvibLwpejdISZioluPxnBdUsmEFbBWGyO2
         4xr/4dMvgeufv6tyH+zZO9c7F8vfSZRaUxCFv5HKBBEUi1iy//VJqMPD1GmzN5XRgsQN
         KqjwOgWQZnhphPmFwRGIGuE+Wiba+2I5+AWff0YJtvKVZf1FL/TeHqVwK0n5aeF6G/Od
         Jpyw==
X-Forwarded-Encrypted: i=1; AJvYcCUJkFnTwGQpVW6Mo9XZeuOMGp/WCds7H4ufgMqeyzN44q+edzzcGs/l/lKJy7Dv8UB+h2CQvi8OpMsX@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgB6BHPt1qiIyA2HJIkVUieaplyVjpoaPbacscftLKFZOuvxw
	DIJ1OINHx4iceG482FgDNspEF7ab5E/9WD7pIZk34NaGMjMHj1X4BsVWHr1xF4w=
X-Gm-Gg: ASbGncsmeA8lsqJnWaTxliQhz6oOW/JiNIxkTMJyvTGo10HxqAUhnP7wFPHCL27V39g
	1VU70Xl37s1rINSSYwx0bJvdv4ERupceGEWq6ACpNs/ttCOsSo6gXX/P4Dyx0LvUEc/CgWaCoAM
	tt87g0ZIMb2/76nQBgNrEnWrCEGusT8rb+2E4d3fDjDot1O1ao2WK3cbsCkZTut4MTwbkKCC4OZ
	Cil7G6sTxjYppkDs8Gcg3TxVOQUpYtdPGMZIZVKPTpVAldJj8Bg+sMZBjfAFg==
X-Google-Smtp-Source: AGHT+IGNXWrBifkbf6Mc5XVTxlnrLSIUOacFUlygfldDtXdlkhQyyDqSAPjIYaAKYqyIhFVj+vr26A==
X-Received: by 2002:a05:6000:1561:b0:385:e013:73f0 with SMTP id ffacd0b85a97d-38a22405c97mr50260491f8f.59.1736157312087;
        Mon, 06 Jan 2025 01:55:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e69sm47002685f8f.35.2025.01.06.01.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:55:11 -0800 (PST)
Date: Mon, 6 Jan 2025 12:55:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: "t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>
Subject: Re: [PATCH] hamradio: baycom: replace strcpy() with strscpy()
Message-ID: <c2072355-157a-4fd3-9635-c94b7167e637@stanley.mountain>
References: <bqKL4XKDGLWNih2jsEzZYpBSHG6Ux5mLZfDBIgHckEUxDq4l4pPgQPEXEqKRE7pUwMrXZBVeko9aYr1w_E5h5r_R_YFA46G8dGhV1id7zy4=@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bqKL4XKDGLWNih2jsEzZYpBSHG6Ux5mLZfDBIgHckEUxDq4l4pPgQPEXEqKRE7pUwMrXZBVeko9aYr1w_E5h5r_R_YFA46G8dGhV1id7zy4=@ethancedwards.com>

On Mon, Dec 23, 2024 at 03:13:42PM +0000, Ethan Carter Edwards wrote:
> The strcpy() function has been deprecated and replaced with strscpy().
> There is an effort to make this change treewide:
> https://github.com/KSPP/linux/issues/88.
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/net/hamradio/baycom_par.c     | 4 ++--
>  drivers/net/hamradio/baycom_ser_fdx.c | 2 +-
>  drivers/net/hamradio/baycom_ser_hdx.c | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/hamradio/baycom_par.c b/drivers/net/hamradio/baycom_par.c
> index 00ebc25d0b22..47bc74d3ad8c 100644
> --- a/drivers/net/hamradio/baycom_par.c
> +++ b/drivers/net/hamradio/baycom_par.c
> @@ -427,7 +427,7 @@ static int baycom_ioctl(struct net_device *dev, void __user *data,
>                 break;
> 
>         case HDLCDRVCTL_GETMODE:
> -               strcpy(hi->data.modename, bc->options ? "par96" : "picpar");
> +               strscpy(hi->data.modename, bc->options ? "par96" : "picpar", sizeof(hi->data.modename));

strscpy() has macro magic so you can just write this as:

	strscpy(hi->data.modename, bc->options ? "par96" : "picpar");

Looks nicer and it's easier to review.

regards,
dan carpenter


