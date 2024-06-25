Return-Path: <linux-hams+bounces-372-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DB4915AD3
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 02:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C672830CC
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 00:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CDD7E9;
	Tue, 25 Jun 2024 00:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDYL+D5e"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DA8184
	for <linux-hams@vger.kernel.org>; Tue, 25 Jun 2024 00:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719273906; cv=none; b=lmdy9FOhn8tmdmIwiqTQwvS9dxeoKrOeNZGrRqUPraXefN01fHFPFG19gkOzqBmZ9uBKnpXUPIIriO2H7lW+GJYDrLW3kylwA7iEH0ePCmsxqwDLqcUCBt94CVOV1IoUcG0p8xDF+KnvCOj9Ju/qTiJigJDenxsELctr1D/51EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719273906; c=relaxed/simple;
	bh=prtNeu6mLcIHBJe2VhjX8RCHILjhta2XaxBCi849YTs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=pvqh8paupAehVSYQofu9xyxt63YesZ2gLdxaQwA4HbDj5zaFyF4FBaFAOfvUtKDYKab1+EJ2DcX3me4PpMke3zBbMoTnHQQF6A2mUjzSrq9ptNHElQ0KMX2LvqyqoQIOeOLCkrMexhtCcZG/Y+2dGcIx9rhiGGQvMxkW/5gJt8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDYL+D5e; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dfe1aa7cce2so4613086276.1
        for <linux-hams@vger.kernel.org>; Mon, 24 Jun 2024 17:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719273903; x=1719878703; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bAFT+BRVJv7fiGMV2oADsYHunTQFRCc6xzc/0g71sUc=;
        b=MDYL+D5eO3JZFHmUYQ7w9FREfeOFFFdEPycoY/YsmrUrtKCcOOCMRQnkzzOj9f7pfI
         aQa6Fru+xzztllq0z9XuDQOrL/CWhxTHnZ9dwomSWInNOu1usFnNXgiUcUbGAaUmQ+eJ
         4C7Y/sYZfR4LgtB5eAzGoy0D0rgjk5YYYL4N7DbdmLXjbaV/YjMAc4gpbUqjnRg7A5H5
         bKEu48Loo84xZfy2gXm3EcnvR/uHdIoDjJ+ECGEgEdvuNEZqu6sHyMCRJHIC+4V0qic2
         MgBNBXEWZCGZBQ+6Zj0lnZnnd8g701OuN4FTeSUerHcNqX/K/uGb+S1dzbTGdRKdO7Fz
         E1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719273903; x=1719878703;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAFT+BRVJv7fiGMV2oADsYHunTQFRCc6xzc/0g71sUc=;
        b=ViFZDlOYnW+r+Audni/2oE0eq8YUYEsZwBpuUT7Zd8IjpySgS3c9nJwQ3diy9L4xyH
         Jv91yQcbAPfow+G3rWLbqkSDKX0n4Z20IQ2lWTZ+UVSvK7n+QpjLliiCeRX9G9TdDbna
         HtJdMMVpOkqkMLeSUYlI+6nDe8x18t2cPMIKc40EAG5FhdYJURhqIIiZTHn3dVpEoGhf
         zLBgUtAWWfusNeWdray4O0AhCwFREIJ4yEXTOxhFnfJNWd5GOKQe/SB12NLm7dopiGv8
         0Sh9OogZoy4mAOQBq7bU86HA/IbC0O3WQJeIAQmZ25e7Wp5vUv4iTkw8F4U0o10xRxL4
         FwsA==
X-Forwarded-Encrypted: i=1; AJvYcCV2dhRdkG5rnKlvVhHwwQEoRsirZ7KKSpF4olu/rLYSmWr9e6U+fyViTk+h1u+dDsSCPP02g8Qcps6BtLtPAVy0GAd0MQWnTVde0g==
X-Gm-Message-State: AOJu0YzVEoJllyUcd6lGoDlvOeWKzoBS5VCQHxZ1mtrYmb/9gQNcnGBV
	Dr2VK6mSgI7Za/Uau8Cm/7Pw0QjCVT3i71pLbADRI88mz39PmG+IT66KXI2tEl+W0Vx/+pV06gL
	2TZOg0Mq8JbnwuPiwyTSvB1/Hj8jRPg==
X-Google-Smtp-Source: AGHT+IFtrciidI/M7k2NVlInXU1dUqzKWOGBUXmV+s9pawoJYSmpSyw9qID10Kf5k3e+T6mbUCtOrUB7+62GjZ6DvXE=
X-Received: by 2002:a5b:7c3:0:b0:e02:9dd0:e637 with SMTP id
 3f1490d57ef6-e0303f2c949mr5199972276.22.1719273903617; Mon, 24 Jun 2024
 17:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chris Maness <christopher.maness@gmail.com>
Date: Mon, 24 Jun 2024 17:04:52 -0700
Message-ID: <CANnsUMFi2H+PK43cLdVE3vqwL5MqLqbkb=qgS4u-kUrP9rwG9w@mail.gmail.com>
Subject: AX.25 Fix now in v6 kernel stable/longterm forks
To: Lars Kellogg-Stedman <lars@oddbit.com>, David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the work again Lars.  I see that your deltas have been back
ported to all the stable/longterm forks on Kernel version 6.

-Chris KQ6UP

-- 
Thanks,
Chris Maness

