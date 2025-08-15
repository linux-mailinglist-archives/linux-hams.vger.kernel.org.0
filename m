Return-Path: <linux-hams+bounces-557-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9BB281EA
	for <lists+linux-hams@lfdr.de>; Fri, 15 Aug 2025 16:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6350BA1F51
	for <lists+linux-hams@lfdr.de>; Fri, 15 Aug 2025 14:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3500233159;
	Fri, 15 Aug 2025 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8f2SJbM"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C7225791
	for <linux-hams@vger.kernel.org>; Fri, 15 Aug 2025 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755268334; cv=none; b=NeKuygfWpXxNQuLfIPN+dyezCBU29s7JA1FJ4CsIdQulwBNXSUW0nz/dT/wm0s61WFKixz14WmEWlthgqVacgww1osKbbfU7qusBpY8YgFktkTcBd8oYy+z0g1GxcFE6CHFZzCqFpfmL0WSZbwPHDRjsuma5EAKraK2PDIDFpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755268334; c=relaxed/simple;
	bh=+IjxaBubN6EXaKj6+uryDj8Ai6HBl14BYzJL2OCSXNw=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=JfRp5qN2lLtysJP/ojryRDgTu8aIBcXZVil5Pf8F9MxyrxCIpROO2XZ5IQ/OPYJWq5TfIH68UjFfx4OPasbdNtU1DPQySzMhNKAgJQE6wTANTM6+mTgFIXyPwkn44Bd4G1tnh7wcPNOSIl2bgcj8iInHjA6ETtXooCTrKt5mejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8f2SJbM; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32326e5a623so1829896a91.3
        for <linux-hams@vger.kernel.org>; Fri, 15 Aug 2025 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755268332; x=1755873132; darn=vger.kernel.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+IjxaBubN6EXaKj6+uryDj8Ai6HBl14BYzJL2OCSXNw=;
        b=j8f2SJbMDgN22AX76z48xf7ad4egs49RpfBhe3qHuTVEHdqBFTvCB5bwwr7pl+nFHQ
         83vSXR59MSsMtIiJz3W7r/7WL9yXuAEnQPQolZpMPhPuhczI4ge0J53ej5TKF2ocD2fa
         NM5BIDHWR9fyLrAoW1V4EtP40Lx8HL9CuJurQ5zBuG4HPOuUjgWme9AQSsY8L0+2teys
         GNotpCoZQD9Ukin6QaPK/639Ms8Spb7XdQxF3M+T3+EN9RaC5hVYcv3qqDblS1jAx91V
         T8evZ4VmKtvyCzOjdwOTTi5dcWK0RDJSCmecyTYOp1Mo6163PMKyTNBItar+ZkNeb6n2
         Uidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268332; x=1755873132;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IjxaBubN6EXaKj6+uryDj8Ai6HBl14BYzJL2OCSXNw=;
        b=vtRdNapLcSZTSV2jmoqkjIkWEHJqJCbA7vvQV3vi46lHjMpqAhbYE1piYEYAUa6ExM
         hafnlEbKYNFLimMQfSRGKMpFI8vlBG26Q6i4LnNgd7bwVvPQUrncmBjK647Y5mVXF6so
         JhWgycw+qscb7fYmAGWk4Ii1uIWxgPgha84oB1LGTHV95yaiowUQ/12UnxVDfZ6mtoQB
         yq145fAaN3/lqyYupYZU/foyUkfTaJhOElmyIPbsSfkm3bMoPe1rbxuEZeMkVlI1uQpy
         wzdHHFzcV33TKwAKj+SuUeazREeqJ/LmpdprwdqzatMitqz+sJZCOkGbpFWX+IF0YCEs
         eG7w==
X-Gm-Message-State: AOJu0YxXmmaRIDOkFlTZ70dX2TLu4CFuV0EKlUmUbgMu0UsRBQgqTQEf
	7MxQuFRc6zlzq7TDy5RIBZOmFDu7b8gsAFfb7Xl5im2GBIEbMQDS9vDt6ol7abUQ
X-Gm-Gg: ASbGncuxSHD0fZtFS23e+zRRVMF0x224ieFge6M+W54sjG2slQO4T9QOMGiJCEti3LH
	HRDUYwF3s/JasUqcHAjO87bHpHbaojBrSe/lA1mPT86xW5vo8UYK2uyjeoJzWWO7/3Q/zN0iSLs
	C0Qy1eDViZYnR4ZQU7cGh9xgdIBvt/efnoFpFZy+HVf/wbWzfPApgL0ndaNVTtloWwyq09jgD6G
	jwyopRRGxM53IQHEpoCn0FkmO0KO6+KW2iTHHG+DhEC+sxJlP26jevvLflncFgF+ww2Jce68FkV
	OPiRh17DzSbjON3JBn7AA0bTEv2Xt9keoaExBDiDojFPhhUj0v0R8rjjRWK7oy4YMO0jr21DucS
	U8ADHtY2DN+xjhyhHKfDkb0/KOXdNCkFuGDegRlkXDd1fDqwEZzV+zesBgi/OB5vK
X-Google-Smtp-Source: AGHT+IHWHc85Gn6I7sQEBatEKY+vUmyvX591PM+AeKxHnrTgvS8jSXSjzIuHSUVaFrXjOB1JC1b0bw==
X-Received: by 2002:a17:90b:3e48:b0:321:2b8a:430a with SMTP id 98e67ed59e1d1-32341eef44emr3636903a91.28.1755268332020;
        Fri, 15 Aug 2025 07:32:12 -0700 (PDT)
Received: from smtpclient.apple ([177.189.100.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76df62sm1410329a12.41.2025.08.15.07.32.10
        for <linux-hams@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Aug 2025 07:32:11 -0700 (PDT)
From: Guilherme Novaes Lima <acc.guilhermenl@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Follow-up: Seeking guidance on Rust porting for network driver as a
 learning project
Message-Id: <5EF4DC53-5CFC-4912-AD90-EE86D7F51B30@gmail.com>
Date: Fri, 15 Aug 2025 11:31:58 -0300
To: linux-hams@vger.kernel.org
X-Mailer: Apple Mail (2.3826.600.51.1.1)


Hello,

Apologies for the earlier message being sent in rich text format. I=E2=80=99=
m resending the same message here in plain text to comply with the =
list=E2=80=99s guidelines.

=E2=80=94
Hello everyone,

I=E2=80=99m a computer science student working on a graduation project =
focused on learning more about the Linux kernel and Rust. I understand =
that the kernel maintainers have been cautious about integrating Rust, =
and my intention is not to push for any immediate changes, but rather to =
explore Rust porting as a learning exercise.

Specifically, I=E2=80=99m interested in working with a network driver to =
get hands-on experience. My goal is to comply fully with the =
community=E2=80=99s expectations and guidelines, and to better =
understand the technical and cultural aspects before considering any =
real contributions in the future.

If there are any maintainers or experienced folks willing to offer =
guidance or suggest a suitable driver for this kind of project, I=E2=80=99=
d be very grateful. I=E2=80=99m not asking anyone to do the work, just =
hoping to learn and engage respectfully with the community.

Thanks for your time and any advice you can share.
=E2=80=94

Thanks for your understanding!


