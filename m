Return-Path: <linux-hams+bounces-754-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C790BD3953E
	for <lists+linux-hams@lfdr.de>; Sun, 18 Jan 2026 14:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69E61300F9E2
	for <lists+linux-hams@lfdr.de>; Sun, 18 Jan 2026 13:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A382EBDEB;
	Sun, 18 Jan 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in1DnlNT"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253C3283CA3
	for <linux-hams@vger.kernel.org>; Sun, 18 Jan 2026 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768742513; cv=none; b=k6xODLIreB2lW7vmdfK+OBR6VjiOQlZXTr9XUcbZLQW+M/iVHfSqOW7wb7ilTxyEttGQW+OZeMI46gQA44V7XN87Dm3jPKsSRhbNb8nw8rgS5Rb/JIMF9YquLhtQAEVCKly+/jsvr5Bj5OKDjbxez+XgDEjrwgW70/wNoZGcxFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768742513; c=relaxed/simple;
	bh=G7VoZ04tuBvWggvA8HTQ6TA65SL47mNoJkVWqgJnq+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVUcO1KuNEwAjZX7Rvd3gBrw9M9TKz07CDXmXmTk4nJ2XxZGGPXmPB4C8SA1NkeUyolE0AOVxzc2jl5l691CIWHcOcktKu40toK6IxzK9wP7ajVCgVqnCPHt1y9sTVxGWu8+8AJGp0lkPHSz6EXrNmdcuDb2zSSXX/roNEbUACk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=in1DnlNT; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81dbc0a99d2so1735471b3a.1
        for <linux-hams@vger.kernel.org>; Sun, 18 Jan 2026 05:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768742511; x=1769347311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qw9ZASoTlkokvDF3mq4I2MeyWKgBz6aieOIs9LY/qAU=;
        b=in1DnlNTlCjJI6tCnBt1o1fbbCwgDicGK4DOr6lB8MfAVrGU7+4MY8Ajh3mJFrHGmk
         b8kfdgwcv/rc6BXRvgqtOI/zdn7Am8Y/6y/oY9yRes4evHIHdF4ZX+xBEw55/x1725KF
         AZESGnqAlr6IUEdT+6T23z1ypFJTopOOmnORlUCuyrgRZQjxS3S02BeZiOThcotL+AUp
         Xbbaq4YhXn278HPi4rL/mG+8+Lf1ciykzSvZl5rI/AvOu6bWD0jon77QAre5pn6fwEwd
         3EzR3NTUzE2kF36j04SLRrvqaaDk+G6EUBidz+aEyOayamlpakQj/GikEr28WchSe735
         aLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768742511; x=1769347311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qw9ZASoTlkokvDF3mq4I2MeyWKgBz6aieOIs9LY/qAU=;
        b=sfTBWP4nY2DjgpbT0pa2o+U5kQoJQOcDAm06+WIR15YHlmyHwZcaLdr8ak0rf7cQUC
         UD5G9O/cDyAyQENaHhpS0MFpmg7IYOggvcvBkjsa1z1jR+gwsFskXO6nBPGoUR8nWPCo
         YsCnWJOF8ZqAuBivwGSWDTHj42d2rVUF0oK2CsawqB6G400OHUqW/MdT7a13WKvc5KBM
         f2t+6cXGNnfzYhGun3ZbmffE5fnDvuwTooYKEyA322r8mFva9QbAz0XDHrYkGEjgZQuc
         RTuAqB2AEODfVH0cCoWXjC8DcjHNuf8uflUsVhSSbYtX47mfQV0IXqvDrTr5fDw5S2KA
         iDXw==
X-Forwarded-Encrypted: i=1; AJvYcCWrnogPCR+bVMEKeab2td+CylYRKl5irl1Fh3qR+mXqcmORStqokKYD53ReswOy5QjCwWBLkEri+168@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4I+EhogBazuDidHniYoqZMeipRg7OsIW02K3ngEHc6g4op7mO
	eN/R7q1L7n1VgtormS+8FIIDWz0bRwARyQ6nT3WXYdvdYBAZQbYqLj1J
X-Gm-Gg: AY/fxX7r2tFZhakmRSOlj3SZ9/jVvmdL5gDm1nUFKd/3PKQTtSRWmSTkB4rcGqdbIai
	ByOqxv87iAglZxdZipJ6DmulCliuhd8NZHrUGAA1er4NwJPzOulsJOs0ncIszO/atpqKdLZUnPI
	6cTVDqBhcJLcql/DDvHJVRZ+D8GIjr/l4F7PjcEh27o+f+v6bM4/Q/GwqDDSy3GWQZ5iym1enNr
	nGIsqj4ExWzQmlxmoTA23HYbHgd305g84Kx6kYSNkN75Z1hJj+0cbJvViJelk534AYE0Jv4lFhL
	lwG5G6VmJCKmMG1cK6zkSL8Z7l58f1/3G4PpP+xbLbDzfpfdgGbF5Yv5ikTK/fvZ7SP+Czi+WIo
	wtAtHOlevmoi2ij9Es/v3czWY8vZt2t8P0vfA0KqHP3HohoCHptLzWDc8klzRxZAilye6FtjUDM
	/t9ARx5asEtBA=
X-Received: by 2002:a05:6a00:1793:b0:81f:52d9:605 with SMTP id d2e1a72fcca58-81f9f7e5b54mr8588361b3a.6.1768742511381;
        Sun, 18 Jan 2026 05:21:51 -0800 (PST)
Received: from inspiron ([111.125.235.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1277a23sm1143687b3a.32.2026.01.18.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 05:21:51 -0800 (PST)
Date: Sun, 18 Jan 2026 18:51:44 +0530
From: Prithvi <activprithvi@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: syzbot+df52f4216bf7b4d768e7@syzkaller.appspotmail.com,
	davem@davemloft.net, edumazet@google.com, horms@kernel.org,
	pabeni@redhat.com, linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: Testing for netrom: fix KASAN slab-use-after-free in nr_dec_obs()
Message-ID: <20260118132144.6zax7pp6bktafpgz@inspiron>
References: <69694da9.050a0220.58bed.002a.GAE@google.com>
 <20260117065313.32506-1-activprithvi@gmail.com>
 <20260117094745.6fed3c45@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117094745.6fed3c45@kernel.org>

On Sat, Jan 17, 2026 at 09:47:45AM -0800, Jakub Kicinski wrote:
> On Sat, 17 Jan 2026 12:23:13 +0530 Prithvi Tambewagh wrote:
> > #syz test upstream be548645527a131a097fdc884b7fca40c8b86231
> 
> Please do not CC the main mailing list on your testing attempts. 
> Just CC syzbot

Apologies for the inconvinience. I will take care to not repeat it.

