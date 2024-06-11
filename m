Return-Path: <linux-hams+bounces-363-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C99030F1
	for <lists+linux-hams@lfdr.de>; Tue, 11 Jun 2024 07:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E74BB250D7
	for <lists+linux-hams@lfdr.de>; Tue, 11 Jun 2024 05:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E20171E71;
	Tue, 11 Jun 2024 05:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0H6ikQH"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BF9171060
	for <linux-hams@vger.kernel.org>; Tue, 11 Jun 2024 05:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718083266; cv=none; b=oxWzrdFNI+E9r13z4Nw/KW6IW/jibPz9YgK6pK3sJBzTAYjnyiy4hz6lphtjAUTfGdZEV39+ZHh9falDaNblb0hsCFBbVa2UKTi5yR0k3xxMXqxSOze5tOItO9O1/5Uzf2jd3ckzt+FhK4S37/c8iSfonUO9WmJKcBh03AKSna4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718083266; c=relaxed/simple;
	bh=A2URNTemG34f5CSREwviPqRgIkVVYS+sdM1N9/ovraQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QCIQw+kUbX3trFnkw5g6bcrvWrbVpGbDBZgkuC+b0o18J2EnsK1clJ3qgFXwau9RYZUofYtwzMEUYoP3CD7pB8aLr/kvHMKL+XYlOg3L+4+MuWo85xOvxYLYmfMETR7gbGB6DpAO7zwKbb3ZE7gvJZe1cGsmRj8OKp4QHqfC/4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0H6ikQH; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfa629b4e0eso630599276.2
        for <linux-hams@vger.kernel.org>; Mon, 10 Jun 2024 22:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718083264; x=1718688064; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZTaMsGc/jIaq66IS8sYxb4ncHruxOSSdbFDjF0w7THs=;
        b=C0H6ikQH+hPPZkA1MKdH7uPYJME6WaD06hSmYKtFriwE5TXFa1zAC3YNI/3Owk6i4g
         mHeX7mnonRTxgdnm4gLSYPSXwKb5uX5rtQ/37GhRxH5ZsJseBaHSOmMwUs6IzXkYk3aA
         7g5mK0h/erhu/+I2tF6ZHLzokjulSMhE5ELwgvSyAz4cxXHgHMxBJHaRRibvPLClH6KX
         N7rOtKxxzYp4mamocf/vc7fTnCGeL6tFsX55o25QBfyurUWgN0171spKd37quOtMD8ur
         71cUdBZpYAkktJtBvxbU1ocS6GcfXgj4rtZvmnx0kY4N8BwzOWf1H/gQnbEJYGTLuhRU
         2VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718083264; x=1718688064;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTaMsGc/jIaq66IS8sYxb4ncHruxOSSdbFDjF0w7THs=;
        b=FbPBIC+JeH92Hwqy6ALinV5q8Ag3a+uIlSBcECTsPKbzQl5ZAZQ9XQqe4Jw9d1qEEU
         79yNA1g0p9v6x3Dnsh+ofXWpp2/LM8S95eiF8Ud9e2cyqJvqT0PM39iAw172179tgatt
         BisLiokonwrU53CyHSp2iNkGAVkdreL46ZOpTWE+4K3RNTOhurjF/vAoV3BfIJOLNH8X
         VPKrXrLR7+P+78nIPzCCOovQAgRVnR+GKEYoIPE7ehAODG9WxNEz8RdKYzVhsSk3sK8H
         EU8MB/EpHkTNBGS/5SCOltfqfBFjKsa6EeneHOfAnuFsQhOXME/rNq8qOv+N7w5LyrQg
         OuVg==
X-Forwarded-Encrypted: i=1; AJvYcCVI3KPAFgY0gD0ttfw+mQ1sFKaiyoFKsK0mdb8krNLSDqi9vC1Zt5Bq91CBsg62qT0YI4oSVUImbE/+EM6I3IccIHTjSIZ17Z93Cw==
X-Gm-Message-State: AOJu0YzbItZ+MmLV+g/rqhzANnepUDy0B2EIrRf9FPdsw3MqS5y48Nlk
	i/prL2zKI1ug5pu7G60LXCfraRQr/H3fKVWNCXc3L7LkwWHZUPS+ccbwghX6bCrBCHAtlOj2qaC
	M2uetTJoOunt+kHwqoZxriPqsxWk=
X-Google-Smtp-Source: AGHT+IFFG82uG4c2rK2Ri4In3iJTRkqVyQxhgRDKIfs/WiFKDSI3IngnvfETdfogZH6PVeIudcfeb7hV12kknBcjRSY=
X-Received: by 2002:a5b:1ce:0:b0:dfb:22:5712 with SMTP id 3f1490d57ef6-dfb00228993mr9876932276.63.1718083263814;
 Mon, 10 Jun 2024 22:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chris Maness <christopher.maness@gmail.com>
Date: Mon, 10 Jun 2024 22:20:53 -0700
Message-ID: <CANnsUMGvdJqDa8eJJP5mub-rxMK-wJDRPG=9VPmgBuTbf_S+pA@mail.gmail.com>
Subject: Backports to Longterm Releases?
To: Lars Kellogg-Stedman <lars@oddbit.com>, linux-hams@vger.kernel.org, 
	Duoming Zhou <duoming@zju.edu.cn>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Dan Cross <crossd@gmail.com>, David Ranch <linux-hams@trinnet.net>
Content-Type: text/plain; charset="UTF-8"

I am wondering what needs to be done to get the code in 6.10
backported to the longterm forks?  I tried just taking Lars' patch and
applying it to 5.15.145, and failed to compile, so I am thinking there
are a bunch of changes leading up to that that need to be applied.  I
have no idea what tho.  Very happy with 6.1 with Lars' patch.  It is
running like a champ.  Before that the latest version of Slackware I
could run AX.25 stuff on was 14.1 with a version 3 kernel.

-Chris KQ6UP

-- 
Thanks,
Chris Maness

