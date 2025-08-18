Return-Path: <linux-hams+bounces-564-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D926B2AE3C
	for <lists+linux-hams@lfdr.de>; Mon, 18 Aug 2025 18:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 028901B619CB
	for <lists+linux-hams@lfdr.de>; Mon, 18 Aug 2025 16:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31B4270575;
	Mon, 18 Aug 2025 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+NbObLT"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BDC26F298;
	Mon, 18 Aug 2025 16:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755534680; cv=none; b=Di4yqcC57WyjiCzKDRYV+vTPOpRVq4UZX0VvdJ/RL1gvrH1zOuOIeJi/AN22l/qsnOuTBM+62/sIut1x6hCLQqLJ0fgvP6laz3cYd7xucUaacniX+yW2a0jszTS8jwNYOeS3ddv7P2TmBhAKIEK5m3stMyV091FRxwqEexUk364=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755534680; c=relaxed/simple;
	bh=4W+M0DnhFavBRatc1zjaxS4aidXvRFa1a6thKSEV5qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JColfHaITPsotADyj6kzXQew4CUMDGsxQRVYoza6xfxuRcJqf9bH3SDOvr+PUKG40WAzZNDVC8s9a8VPrTm+FTEVmpUsck41LyQ3ejMUf2vlb6Q36h7nVVbJ3ry0yyeBvW68oVSvC0S8gznBf5QxYjv2WKbWbZY9qeN/j/QJrKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+NbObLT; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71d71bcab6fso25422847b3.0;
        Mon, 18 Aug 2025 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755534678; x=1756139478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcVzA15Zndb0VzLRM9uKhyIsXmWhNVBswjaftf2gS9A=;
        b=X+NbObLTBwi4LfPZ0aoF9yPeKLFU6kHBxdJjK90jtXkD84Bnk1oCvBfNBZkr2pcnsa
         EzDTgNtaQHSHbVeabRUgto3vagLMKmYCIUDkkY3Z6ujsmcFcmhuZ66OLbhSKnnQcoU9J
         FoCM/fbAy0nzr+4OGxCM21vRtKlBm+IQo4LWg4/UZKohTwp0S5q672goHhd4H6HMdvoc
         i2OGCFggPCfA/SaXQ9jHW96vSukkD7yO8uDee2LhcTfelmffjsdXFe/USvJ6z4LOBdqW
         0CFs2XkeGLjAVPMXdP4py92sRuyX2t6+97w2D+dFj5+rE/afV4oQ280cSerFBzzIrjT0
         8ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755534678; x=1756139478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcVzA15Zndb0VzLRM9uKhyIsXmWhNVBswjaftf2gS9A=;
        b=lbRgKGPZVGAKAdx7UQTW2hPqPYDAgckVBgx1hzjoITrN/m/SIh4M3+kuMaSXpgVLwF
         OjJW1jlP4kJI3zCWvg3X5uHXiWjsMXvJLOzf7fA45KY1MvVqoT+djsNNXCFOet/QJI+4
         5s3rCe43mjxOSIdlzYQww8eef/EWKQXgimqR6dsu6pz3xbWFsKajRCzt1QtSDUR36OfB
         eXXl9Nlu69ubdYlyS/s/liVZJcixPP/J7sdbiSOpRQYvPXbNbI2+2RV8JIdugMMsZ06w
         +Mtj4e8yw222LVX+q50u4i9PyPWwKzVtroOB/yEUtQZA8BLlqRf8StCHwzq1h2xthpu9
         i0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUPJT6kFzx7ldJjtmkj8v0tLAYjOyiTlIYh3E5iuoSo/3a8Is+vktnYpQCEOim5HenFdNPS1D7DhmJW@vger.kernel.org, AJvYcCUag8MAaJU+7MxHvm9jLEaylkCRQymdeKY0OSvzmVNftzyoI8985FvRtsh38QW+RAMRlsnlTrEJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcVik0Jaf1P2C0YvUYthP3qXMqlWBwA+GtkzGwOX7cyEhb8ox
	7onYhL76UMpifEKc0Qf2Q3snCu/LraCKOb7JSf7zqV8y+3stQcd30Z1x+DAV8FAalQMjUBmsqyr
	/6l2dNzumGVMKZwBJDAnJN9vGzxfwmXE=
X-Gm-Gg: ASbGncvOi8iYRRVK03IPm3P+j1j3USSQk0HfY/Vzi5fewkf1FANhKEf4SmwgX10146q
	FwT3SivKfxcRbnftN0cwO6QkgauqNw8aN9WucKaCYNV/0TOWTIQXeBTtJnt/8pxO5jX0PhlqO2F
	A10zI3sEmqwo1umpYpobxkD9Rwpy4Vj2HBUWHYBKbsAVKy01kAJqOqp6ZL5SRjvL/SMtfumddUn
	DHyvZ9pWesdo1+0LzPXdtXSKgiWRm4Pq65P2AfM
X-Google-Smtp-Source: AGHT+IHMqtlR04OSX772/FVNzUY+rUAMBXT6OfENn+AfkavIE0s8BhjzH/WqS7rbn0YXd2AYRqMabf31B8QNQ0xfW2c=
X-Received: by 2002:a05:690c:30e:b0:71d:5640:4aeb with SMTP id
 00721157ae682-71e6da2877amr147718557b3.10.1755534677811; Mon, 18 Aug 2025
 09:31:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr> <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr> <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
In-Reply-To: <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
From: Dan Cross <crossd@gmail.com>
Date: Mon, 18 Aug 2025 12:30:41 -0400
X-Gm-Features: Ac12FXwP1mErao0AelUr2Ba5Bh5qC8eqwKLPOjovzcdVZEUdF2z735NKJEjTk8k
Message-ID: <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: Bernard Pidoux <bernard.pidoux@free.fr>
Cc: David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org, 
	netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 6:02=E2=80=AFAM Bernard Pidoux <bernard.pidoux@free=
.fr> wrote:
> Hi,
>
> I captured a screen picture of kernel panic in linux-6.16.0 that
> displays [mkiss]. See included picture.

Hi Bernard,

    This is the same issue that I and a few other folks have run into.
Please see the analysis in
https://lore.kernel.org/linux-hams/CAEoi9W4FGoEv+2FUKs7zc=3DXoLuwhhLY8f8t_x=
Q6MgTJyzQPxXA@mail.gmail.com/#R

    There, I traced the issue far enough to see that it comes from
`sbk->dev` being NULL on these connections. I haven't had time to look
further into why that is, or what changed that made that the case. I
now think that this occurs on the _first_ of the two loops I
mentioned, not the second, however.

        - Dan C.

(Aside: I'm pretty sure that `linux-hams@vger.kernel.org` is not a
Debian-specific list.)

