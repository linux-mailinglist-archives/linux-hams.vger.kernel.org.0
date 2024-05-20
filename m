Return-Path: <linux-hams+bounces-275-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C28C9810
	for <lists+linux-hams@lfdr.de>; Mon, 20 May 2024 04:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 011102814B3
	for <lists+linux-hams@lfdr.de>; Mon, 20 May 2024 02:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B79AB666;
	Mon, 20 May 2024 02:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLy9t3gj"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE8079DC
	for <linux-hams@vger.kernel.org>; Mon, 20 May 2024 02:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716173756; cv=none; b=lIJADdYDU9AmE3tOL7EYvgwk37UodfoEqmgGKGIUU1I/nyzYyt49NEuYTalfkK4a7cP/qevjIBBxoEdWG6YCe1zcggfL3ePmvtcXW9zE1D8Mdd/3wwTVXkSqEofMJgHf6Nc1n2mcgL7hmxiPDN7E6YUGMeNyK/hNgHa5h8r6nhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716173756; c=relaxed/simple;
	bh=oawViGYk4fImLEIgSKwWEoRHdZw2LPFRsIlrIfRjnZM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bf+IEMcD5EIb7CY77qo+YQcwXJYCGO81v7yHJNFIbxLpRQ1kAEKgimC5eGiKYOGIHISrqW/QcgrBTHpr0Ed4sljNRS7o3g/5HckykLE2V+kpk4ZM6vEL7Iyha5WACZWMcu1N/8Oh5BVni8f+ONUVEp9oOWEdhcQOsEKROhTgNNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLy9t3gj; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ddda842c399so1914813276.3
        for <linux-hams@vger.kernel.org>; Sun, 19 May 2024 19:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716173753; x=1716778553; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OLA+u0YM5bfi6oEvVORLAnJDd1CeVxZBF3jIXCet4cg=;
        b=JLy9t3gjRmXtALD2C8eD2B9GqBdKcDtjXPQ2+YRzRSO23Op8CkWZNMUmKNvIESwZ4D
         Gy2ltMrqZjgrOKnWRDcsuwgTuuC6CdhQKwxwrGdp0DsNla/uFiDwB7CZE9pBqtbgwDoU
         mib6SLmL+UJOR2PZwo2beNE053NlbyO+W/5bBcAE/MzhoK5e8xmHfZAPfVE9aOKcdlFC
         6U5MSCFkIFt+k4deUjVG71YI62miSiot6H24FK8MJZvpAUskcpiyS1br2dCZfh+4U87/
         1/4Y43oxP+xcZeR3av96a5DvZFpQ/fdvHRnyq7vo97XkYxV8RLV4fwQvzzrpOG+eD5ck
         okQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716173753; x=1716778553;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLA+u0YM5bfi6oEvVORLAnJDd1CeVxZBF3jIXCet4cg=;
        b=g4YdIT8KCwbjRqGiXK0qWnh10sC3GvD0IqFZdG/3n4JUzSoLsJKzfH6p0W2nU5jjff
         ELLJuYNTxjIAmcYSv6/Y+3JNFIzXey2xbAfF9Y96ucy6yvmVkJ61pBhCP6xnz6YisSiz
         u+0LiSBfskXpKmpAyHtGM7KxzJlylQqTMX90yw24Pw+DPOjStPw6/PAlCymdsoqEDxso
         v/qxSol31LJ8o6wvhhOPj0HiCPwWLaTiNfh8rwq/YTeYbXoN6b41I4GPc70BzMgxOYC0
         tRKw7LkSF0jv0+Va7iZ/9UyoLVjs2s5Uf/wqbC1Qnkdde2Yhyjfv3XqP6nWwT5EL3SeD
         6Qxw==
X-Gm-Message-State: AOJu0YwGIe6nIeoCWjCNF5BJV8ZJ5DEd3EKJ76mtgRMMUKCS7CnvGbuJ
	i8HMG92TT+zkrljn4/37+phIJ2iz8/PR5+bfuZzdYSy1eUgmqpkgo79RAzRzusnSgXm7E3chkb1
	/jvzKxfuAWCSBc5JeOVWp6Caa+r6TCv0i51k=
X-Google-Smtp-Source: AGHT+IE3j57m4MdrRPejXkMm/7WU+53FGNKFtXNZcI4O4Kfg4IxAPo+WefJk49DyzyEP/6qMJwAwxaYaYOOHsidO5bQ=
X-Received: by 2002:a25:ec03:0:b0:de5:9eb4:1ec1 with SMTP id
 3f1490d57ef6-dee4f4d9c2emr33743027276.48.1716173753488; Sun, 19 May 2024
 19:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chris Maness <christopher.maness@gmail.com>
Date: Sun, 19 May 2024 19:55:42 -0700
Message-ID: <CANnsUMEmypU9W8_BrEdbh+ATwFfu4K_2PNA3+rYj4LrRce2E0A@mail.gmail.com>
Subject: Kernel 6.9.1 AX.25 Crash
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since you guys have been working on this, I have started playing
around with slackware-current to check on your progress.  I setup
LinFBB with one pseudo tty  port generated with ax25ipd.  It does
release the socket after connection, and worked for a couple of hours.
However, it crashed hard with no terminal dump when I was forwarding
some bulls over AX.25 over UDP to the ax25ipd.  This does involve the
AX.25 stack as FBB needs an ax0 port.

If anyone is interested in reproducing, I can give you the details on
how I triggered it.

-Chris KQ6UP

-- 
Thanks,
Chris Maness

