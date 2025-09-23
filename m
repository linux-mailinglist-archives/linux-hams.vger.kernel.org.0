Return-Path: <linux-hams+bounces-639-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D633B94FA5
	for <lists+linux-hams@lfdr.de>; Tue, 23 Sep 2025 10:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72CC71881C1E
	for <lists+linux-hams@lfdr.de>; Tue, 23 Sep 2025 08:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AE53101A3;
	Tue, 23 Sep 2025 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4VNFD/i"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3573AC15
	for <linux-hams@vger.kernel.org>; Tue, 23 Sep 2025 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615890; cv=none; b=MUzyPHujGRk02Sb2DnS3Rrj2DrcHYvFpimVa6vdkoJ1P/NtOhJeJfeU9wHtieF2RzBPzfLiEMwaOf3rBTWZa4vGz2oHzHlKVGxy4twhcKits4BbEpfXXBT5ZhKBF1WaNialVdI/TpNODlmNAOvKF0ZC2N3XoR8/Lw0RJIDjSPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615890; c=relaxed/simple;
	bh=dxCnlkJxXq2EGJPZ1tZ94V08MX2xLllvGQdXxEda/2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLL20GsQv0DrIxaxMseyrPwLAtM5dhTqmvOtVUvP12Nr2nQCeqM+WREW9EjVzLpdRHsfY5viiw6dkxU7uLNP65/eMwOgQWBP8HWh4MK81HLGVHFTHzorrZW5AzTm53rMCAzQ+UPY+5cgkymOkm7eCZ78W6NZlQCZxIGur2Ivp0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4VNFD/i; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso35457525e9.3
        for <linux-hams@vger.kernel.org>; Tue, 23 Sep 2025 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758615886; x=1759220686; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZxNhYZvdVjbbAA7O2nlWpIW8uXfLnzpFm+bfSFng/Xs=;
        b=z4VNFD/iCANumGus/QVtgCGUHwfTIapzG0+MDEMXczLkJbRXhGvfrV+Z5TJQiSosP2
         ohkFe1kqjlIxLfYPI68ZqaDBLO1AU3/U+xySWq33PF912I4w5+2yLPfmg5yxsGnz9/Oz
         +q7S0NTox7WOR7JeUbQxI5TG/iY33j2HfcfjbBShYwLzPOprnvYTO7HcXuvKHFN0oH5D
         7lQYYpzYCgl0fHZpS00MfCCJip9p0wI3ApAFAGZ3FshAMjVyPfeFhGV98xyfQzsinOQz
         pEU4kjmuiJGfIFJlF33pl6kOT22yTVvBpFXKa4pO4DL2RIkz9XKs2CSAcBHXMgS+Rtkn
         8XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758615886; x=1759220686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxNhYZvdVjbbAA7O2nlWpIW8uXfLnzpFm+bfSFng/Xs=;
        b=Ih81cwnbYCROZm6K3JMz/DnDVpV/60o+AZRuKps71zEqL0pZ4ghItFtdwio/wqhVvi
         +5VcmwFHFBCx62/+FvsJxtaVLr+RA8fzfmK8ARrn4gfhL6KUjFeDmC+cn7BQsp9g/1Ww
         lymsPFDErhOxO4vUNbgHsv9FIrSnMi5LhZbaVxqqW++9ZCmHDelAzaHR7QfUyWdg1mcL
         ixHALvqmLzvMzF/+YByiOkhN72039bY5QiFk5F2ZfotFbih/5Pn6i9BkBxXo1mgh7VVA
         d2szt/zZf54M8/6JOYhIgQc1z7ilT+RkO0g7x1dN02vj1/pw4A9dc112BLMnE6GCinSC
         4nng==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3ZFUSayhfczUhv2sr+vT72Tu0/egxzNpC+ho0+2CZMdY8pZLXnHxJiAvfWx7JPnB/0El/A2mE/3t@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2dwH6STB1IgEUQe5Mt1Bm2Dmz3xdBUy+pgnPL4Jm9b5FrcoIe
	fC0Le1LSyjKIzWdWP0K3TPb6xN3gO6CNlraII1Np0DLJYcQ7XrZ4f35aSN4C817Uwyg=
X-Gm-Gg: ASbGnctq+COmuQsCtZETJn/2CmR5h0aK6S3w9OCqRq2RIjtEBeRHcU0+8cZIMLoL8+/
	uRcCqQVuEu/FCWUvIyleU/QqbbXsvnfVgZZSUOA/uU6YXwZYxPCOphO0i3iooU/YKlIfrUIabRD
	KKLnh94fwUGli/M3cNRhC1JQYU1CVQE/GibgWbVw5FuncsYNGFpqj/jLVz6rqJ+KCkzAhckBIWI
	652vgwsNK/rIbVeKOEyr4lt46GOQk40fJ4KtdyOq6W72+7jfzFRXwxYd6e74JcQXri+Bxma74sC
	rqwCoZ3SUOPEO1FhFzlT5K4VdgbpLVDbsye/77SQyS2QCIZzklFfbphKd4WJGgZyv535nxFblbl
	9MYRVMTMneddLABQU4Wv3aE2jkzUzDvUmspr6qXo=
X-Google-Smtp-Source: AGHT+IFU+sjP7a8s/NZmPKRBLF84hn5GUX0iuTuvGDJtszkIku+WbxTqwewJG5TmfqMf4a997/HbmA==
X-Received: by 2002:a05:6000:200e:b0:3ee:b126:6bd with SMTP id ffacd0b85a97d-405cb7bbd33mr1319369f8f.50.1758615886417;
        Tue, 23 Sep 2025 01:24:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee073f3d68sm23104079f8f.10.2025.09.23.01.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:24:45 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:24:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andreas Koensgen <ajk@comnets.uni-bremen.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-hams@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com
Subject: Re: [PATCH net-next] 6pack: drop redundant locking and refcounting
Message-ID: <aNJZSugLwx-ZkbAj@stanley.mountain>
References: <20250923060706.10232-1-dqfext@gmail.com>
 <aNJINihPJop9s7IR@stanley.mountain>
 <CALW65jbwmP+Lms7x2w5BDjFdg_d2ainorAMTWmR_6NJmjV3JmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALW65jbwmP+Lms7x2w5BDjFdg_d2ainorAMTWmR_6NJmjV3JmA@mail.gmail.com>

On Tue, Sep 23, 2025 at 04:10:07PM +0800, Qingfang Deng wrote:
> On Tue, Sep 23, 2025 at 3:11 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > checkpatch says:
> >
> > WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
> >
> > Which is relevant here because Google has apparently deleted their
> > search button and is only displaying the AI button.  "The email address
> > syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com is an automated
> > sender used by ..."  Thanks, AI!  I can still press enter to do a Google
> > search but there are no results with syzbot ID.
> >
> > I can't find a search button on the syzbot website.
> >
> > Ah.  Let's check lore.  Hooray!  How did we ever survive before lore?
> > https://lore.kernel.org/all/000000000000e8231f0601095c8e@google.com/
> >
> > Please add the Closes tag and resend.  Otherwise it looks good.  Thanks!
> 
> checkpatch also says:
> WARNING: The commit message has 'syzkaller', perhaps it also needs a
> 'Fixes:' tag?
> 
> Should I add a Fixes tag, even though this is not a bug in the code?
> 

I don't have strong feelings about this since it doesn't affect real
life users.  Some people would say yes, other people would say no.
Probably you should since it technically is a bug.

regards,
dan carpenter


