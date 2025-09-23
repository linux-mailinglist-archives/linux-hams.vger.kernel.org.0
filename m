Return-Path: <linux-hams+bounces-638-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 161ADB94ED8
	for <lists+linux-hams@lfdr.de>; Tue, 23 Sep 2025 10:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 176CF1889562
	for <lists+linux-hams@lfdr.de>; Tue, 23 Sep 2025 08:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6C83191AF;
	Tue, 23 Sep 2025 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYN81oar"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0211DD877
	for <linux-hams@vger.kernel.org>; Tue, 23 Sep 2025 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615021; cv=none; b=gvu98YCkHwj8gjK6QdPaWJPih85F8Zub+D06gdhxtNCET0pZSMM4Ikg1E4yCYeIysO7eZbEegSs2ZWsDpTFfa0xdU3VjhjE1enlBYRbpGzWYCjXb8dIgXwf7mcuvWYBuOjtUiMIfm6msbkW+ANYUTt5MeO7NeQDsHkOLAxlYEKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615021; c=relaxed/simple;
	bh=gC/ISLcvgB5Jm98EWNWSo1XbAxqmIYCEt3c+pgRRgAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cim/2XtAARcqIsGRM1/Gg1gisrxReyI0dN+fNU/G00WMK+rdYVJwwRfZUfYGk6KA/8AJwihvsRia0wyONcHc7Di5tM3xFzdSE/nSi/0sVPKiE34Cx4DQvIBApG2F2pBjXP164h6gC3smc2Eizix0cSLLL4aS6qGF9pU1uANEt+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYN81oar; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d5fb5e34cso51907047b3.0
        for <linux-hams@vger.kernel.org>; Tue, 23 Sep 2025 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758615019; x=1759219819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68cmCK+lQ0dZ83mmbfpjA/lSPPyrshuXx8pjCum4+fo=;
        b=HYN81oarcXYP2nKg5wRdgi9PVXQM+C7tdma/5dQ8RoKafL5+4shG6zM/m2+JLbtB0o
         Z8VvoOa9Az1i+Cqx25sEJxa9U4/SlEiZzrOiS/iKLuJeCHev7SfJPwz/Fepqv7rRuTbh
         OWwSaUcs6vEdszfVqLnpljv/LU/O/3vCROVeTxo3UKzbITyyNYEK8uOSVDgplrrRWr7F
         R1Amocs2zg2GwNSgAhUbRmZpb1FvhsJ7dFp7NAS616vdZp3iNn1minwmMdX+V8rbUnys
         lJrVSpVgekD49UJqsa1SLSN0UcXlATmFh1fKOxA9A4cGqKsTXEzxSdO4zPdmVVrqXdrY
         CIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758615019; x=1759219819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68cmCK+lQ0dZ83mmbfpjA/lSPPyrshuXx8pjCum4+fo=;
        b=IjzOY+UIOrRP1MzSmaAIQ9BSFzS35oEauXfGwisxWVbxovN/v+QGxf1XS9/kbpG74D
         Xd2MLEjmPKBDvHKmdiZUQ6YmoExcSHuQi+eqWjXxGIPxtY/EtZkuCS+FwGKWwlcWzhmk
         cWb8PhQVJDIiBpP+mwK0dcEbuiJdmek0XFfLGtb6On+/R3lGa+9ew/h0dHuy0+ktfMjY
         4kHJywfo31DsqXMmlOrgxjesV2OgPjcXyEM0So4GwusQ6IcpLWoQsYAeyMTrvibtqN3K
         uybTCysMyeOtqfy0M52gzUVRJ0CUiMaJW7JXCJlY2vbtGhBRufv1z82uAVwmV++h7EeF
         SxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd4vSyyJVfBJvn+zsF11ZOwC8cjOz/ifg/KI1nJT0cPNjhUjnOLLkhA2/TbjYDr6ykr3/GTKMTVA5y@vger.kernel.org
X-Gm-Message-State: AOJu0YxpiKdzR/SG3BDF+ZiDdKqrr5+BEYg6cscw33G/89sWii19fYTe
	op50Cg+vm7S8qw5PmWUN5aOoehEQZc6X85+cydzIET/ANS7i1aeJ7Jmv/nH34Y70QoCiNMsra0J
	BbEsts4SpAm3yDKJ4iJOIa9mx5nhj7YY=
X-Gm-Gg: ASbGncsxe+VZBLuKjs57jqYKVkaje1s6WRCW0Q5+trHt4/wp5QTlzIZctMy06s/+3vx
	cAWONZMfbZbq+6KXtBIqPUsD2I0Fu/39U5O8iotAQevZNqh49mtozXIXaX2X6Gb7/f1zLfbKXKj
	J7NA7N16BAqdDRlO4bH+k4SPunRgoWmOoAvOaVIXa8D8jCKhEUP/TrrkoRkSIgwApmMPTshRXj5
	8gIMULYPHCTEWuqeJlsoEDNMEYdKy5RPdmOiWZWNL2Q/SY=
X-Google-Smtp-Source: AGHT+IEy+xvUqkVBZTsI7rKfFC4qJQsZuCAek2QZZLHNwQb10WCpz153wUiVWQTA1TtHdluPaXcrJXcwNTk+20jLli0=
X-Received: by 2002:a05:690c:868e:20b0:71b:f46e:691 with SMTP id
 00721157ae682-7589155a662mr11239417b3.11.1758615018549; Tue, 23 Sep 2025
 01:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923060706.10232-1-dqfext@gmail.com> <aNJINihPJop9s7IR@stanley.mountain>
In-Reply-To: <aNJINihPJop9s7IR@stanley.mountain>
From: Qingfang Deng <dqfext@gmail.com>
Date: Tue, 23 Sep 2025 16:10:07 +0800
X-Gm-Features: AS18NWC_W7OBcymaO0pGhN8pbXiCoKSVhciGuUrFqWsXt6IDIMeoR1I3bHZLZf4
Message-ID: <CALW65jbwmP+Lms7x2w5BDjFdg_d2ainorAMTWmR_6NJmjV3JmA@mail.gmail.com>
Subject: Re: [PATCH net-next] 6pack: drop redundant locking and refcounting
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andreas Koensgen <ajk@comnets.uni-bremen.de>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 3:11=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> checkpatch says:
>
> WARNING: Reported-by: should be immediately followed by Closes: with a UR=
L to the report
>
> Which is relevant here because Google has apparently deleted their
> search button and is only displaying the AI button.  "The email address
> syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com is an automated
> sender used by ..."  Thanks, AI!  I can still press enter to do a Google
> search but there are no results with syzbot ID.
>
> I can't find a search button on the syzbot website.
>
> Ah.  Let's check lore.  Hooray!  How did we ever survive before lore?
> https://lore.kernel.org/all/000000000000e8231f0601095c8e@google.com/
>
> Please add the Closes tag and resend.  Otherwise it looks good.  Thanks!

checkpatch also says:
WARNING: The commit message has 'syzkaller', perhaps it also needs a
'Fixes:' tag?

Should I add a Fixes tag, even though this is not a bug in the code?

>
> This code was copy and pasted from drivers/net/ppp/ppp_synctty.c btw so
> that's a similar thing if anyone wants to fix that.
>
> KTODO: remove sp_get/put() from ppp_synctty.c
>
> regards,
> dan carpenter
>
>

-- Qingfang

