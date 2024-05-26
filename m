Return-Path: <linux-hams+bounces-327-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75AE8CF47C
	for <lists+linux-hams@lfdr.de>; Sun, 26 May 2024 16:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82C2B281366
	for <lists+linux-hams@lfdr.de>; Sun, 26 May 2024 14:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30D515E97;
	Sun, 26 May 2024 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2gM/X6L"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5156FDDCB
	for <linux-hams@vger.kernel.org>; Sun, 26 May 2024 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716732790; cv=none; b=kM6YJ9JgmMXLxaua9yIQrEMZNbYjpvPvCtIwOuvi55YVNjc0IWAx3TVSbCWejvMXHBcOMPl+smh9EmFnvPNmI1hxIYon86/4APewu07J0WfN1UzUNu4ln7tmaC5rwUuDZ/EIJi+VB0wqRoKRINuLvjdEYquP+SUF7qTgUrVL6RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716732790; c=relaxed/simple;
	bh=PODYDsH2NXER0Q4hZ3ZFoJVUUcVj60xaK41NYs+GxYM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=m2RYHCubvfreHCAFEcCNf/A4oA739pzpVyWPyiDkahefg4JxSuqmR2AcrVWWgAmOWM5XHutJft7gXZoP3d46wA8vqIZLXbfG+49T1FEkT/aKUJPi4x4FJ2B/6RzWDLzUCk/UsgjWhSPjtdrEx0AKI1zfB1upF2z9VIAySkOfUOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2gM/X6L; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-df4eb08fd9eso4396717276.2
        for <linux-hams@vger.kernel.org>; Sun, 26 May 2024 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716732788; x=1717337588; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AxXjWUwAQvANStsNyghXv4Sh4gsHriyeBoX+9KNiuuw=;
        b=H2gM/X6LlSRungiXTafu6pOVjyNDapo5QqbfaTD5EjV47dSqMwnazNWz92GNInx4Jd
         XHUfVZggC75B8+yIp8IY/QIYk+KqUFV6waRjFzflqFoWoSBIMBnAePJzokaWxQbpx2QS
         bF1t96nUk7qeo1epemVpK3oNYWkjsmHMcClWiNQYGM2Qzwh5KikZBbLSOaMmuphnjkby
         93xGHSWhWt6uXVG6sNJyyLDGC/2w2fRU5h1rnxcNRu7YR7+ZONlhiL00AGwCPuHiwgF4
         yLo0nJUbEm5iJcEwvlDCv1Nvrce/Li1Acd9K+4wRQEgNaJge65TZ0PqLs3PyBLMkHG23
         HoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716732788; x=1717337588;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxXjWUwAQvANStsNyghXv4Sh4gsHriyeBoX+9KNiuuw=;
        b=FiydTodxh4ttf5XD1Tuu+dWMZh/Xfzvw4LRbjR5mQLrJES70O3yB0n55VaNQBL1xWi
         cNLNKls+Xh1g/J/KDg5SCr5hxIBhwFQ6sGRjPBT+L9gfSis0XqHy8a+XrnT99BuYJUsM
         bnJCTPnaXayoOvbi9iAAZFhVzEDxfpqJaLxB9sbQRhl8+iQ03xHgOA5Aif+7ixH22a+S
         oC1msjjNcIWnyeMos7htdmm8OOyuYjQGVo2ATP3IBWbcI/yJauKd5KsuBKb82U8dyitJ
         EM/HcTaKm2+UPEAQ/FpeyUy351PQiktIBA+7RIXfcemteNDFeX0JOK8VVx/0J5Rx+EeG
         eO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMrpSWyhc0A1wVyv6LDntHV2MP4rc69hno1IwJRRErz6DKPGB2LQB74qiZQKm6NNPQNBlcUat2lNQJcmsYx22kUM0LYD6Hi/ZuXw==
X-Gm-Message-State: AOJu0YyrDZqx3jh/Df07EJW+TPL6YyDP7MBdb7nEL3BPM+wiutbGTDjY
	ePLbJQHMmO6WUgyG13QeQfDnqINodslaS4+gDI2aorKn3opw+4bm6s+MaSvrY+zKLQI7Ih4kkM+
	BBLJGNbYASaULZ8CgtwOg7NLJPoU=
X-Google-Smtp-Source: AGHT+IF7E2lhKth6jJ44jsp5d16UH2Yct1btLsC3N9phDvMj2RzD1XEyTyFn9oEBpBrrxxf5TpG5Ns8GUCWhgbh6IQc=
X-Received: by 2002:a25:2f52:0:b0:df4:4571:d5ee with SMTP id
 3f1490d57ef6-df772201798mr6198565276.56.1716732788117; Sun, 26 May 2024
 07:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chris Maness <christopher.maness@gmail.com>
Date: Sun, 26 May 2024 07:12:57 -0700
Message-ID: <CANnsUMGJvG6Cs57_ar-iixCpyRKq_ScMZFNaq-SpdHX53ou6fQ@mail.gmail.com>
Subject: Surprise, Surprise! Updated kernel on Slack15 works (5.15.145)
To: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org, Duoming Zhou <duoming@zju.edu.cn>, 
	Lars Kellogg-Stedman <lars@oddbit.com>, Dan Cross <crossd@gmail.com>
Content-Type: text/plain; charset="UTF-8"

5.15.145 in current security updated slack 15 (just updated no
patches) works with incoming and outgoing connections.  Coming up on
24hrs with LinFBB taking an evening's worth of bulletins being
delivered over AX.25.  I can also simply shut it down with no issues.
I think using LinFBB is a good way to test, if you have another BBS to
forward Bulletins.  I am not sure if all the folks here working on the
kernel are hams tho.  You can still set up a BBS so long as it is not
forwarding over a radio I don't see an issue.  Also, if anyone that is
working on the kernel needs help with setting up a test scenario, I
would be happy to help setup something that will test it rigorously.
LinFBB can be configured into a file server to request files sent over
compressed as 7plus binaries.  Those
would all go through the stack.

This has to run a week to REALLY tell if it is stable.  I have had
some systems that would
run for a few days then hang.  But I am at nearly 24 hours and that is
a good sign because the last 5.15.145 would crash after a couple of
minutes.

Here is my startup:


#!/bin/sh
#
/usr/local/sbin/kissattach /dev/ttyS0 vhf
#
/usr/local/sbin/kissparms -p vhf -c 1 -t 250 -s 100 -r 63 -f n
#
/usr/local/sbin/ax25ipd
#
sleep 3
#
/usr/local/sbin/kissattach /dev/ttyq0 axudp
#
sleep 3
#
/sbin/modprobe netrom
#
sleep 3
#
/usr/local/sbin/nrattach netrom
#
/usr/local/sbin/nrattach netbbs
#
sleep 3
#
/usr/local/sbin/netromd -i -t 15
#
sleep 3
#
/usr/local/sbin/ax25d
#
/usr/local/sbin/fbb

-KQ6UP

-- 
Thanks,
Chris Maness

