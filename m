Return-Path: <linux-hams+bounces-642-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78AB9D8A8
	for <lists+linux-hams@lfdr.de>; Thu, 25 Sep 2025 08:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 613F07A5C31
	for <lists+linux-hams@lfdr.de>; Thu, 25 Sep 2025 06:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438C52E8DEA;
	Thu, 25 Sep 2025 06:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qqkzfmjy"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332822E8B7F
	for <linux-hams@vger.kernel.org>; Thu, 25 Sep 2025 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758780726; cv=none; b=ZoHanfX6ojKuBaNdbCvCQ/ys+Z9kBypw0GopJlT6SUllOc0ZLby+ADCvIRBEjW1b8N7aSJ9MWFxYcYBOqhZZQfAoyb26Mt7HHBUT9HGH9bqdP40VFu0xM8OMPYbMTkwJXD38Hg4o6dQsZZ4JpXF92GnD37fTWxkkduTKbK9gUNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758780726; c=relaxed/simple;
	bh=uSFb8MHXwLqA9OKwUwZ9qPfEDx9KKhVW9XfP9kuC53s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr3gX7H5pDgSZpYOxVr94+NzNlSU5mEtAeUK7PSiC6A14w8sMIGQNCMVLwDJHfrfULj2T+21VqImbrybPjaG1/uUnRb0P3hBZUu9onu4XCTjdD+8EKEkaCcTbCRfOGbsQZtyXGw9kNIk+m+nIBm5u1DYpENeeR4J046L8IDBHcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qqkzfmjy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso573185f8f.1
        for <linux-hams@vger.kernel.org>; Wed, 24 Sep 2025 23:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758780722; x=1759385522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yEYWGfF11/g3FTMFlorTwEZrbGBIs3tO9z9pPNiHJAo=;
        b=qqkzfmjyigSpLUoNqAMuAQPl/zPXizRaJfpLiXhw2cfQSwVL8u7D95BnPvpPfPoA04
         c7DPuIq+tHha0AqLofEqBwuLohznbyQTmFnioXKf18DW04Tma9rsEaqu67ZxtHuW1YTh
         SEK+jdgVOgwOdcUUudwlrEk0K6tqdtiSgdFO3IR8N+KoEe/C8V9Nque9V3Jv/Xb3yNeB
         Gro94cqz5bWoY5+kR2qM1bVW6F41cM5/NlgqWbNlrN4E0uQ9Hy4BWBktjrMiCXWr82iB
         iIg3aGdJ586DTiy+EhmAXH+NVFYsSsAhMFOZPsE1NTTdlMOOZvEVlsgRFd82pyXpAxlP
         qQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758780722; x=1759385522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEYWGfF11/g3FTMFlorTwEZrbGBIs3tO9z9pPNiHJAo=;
        b=Qei5MObOx97u48kqDg2u1lziIdbVAscrxpoB21IZpiY6xgd2fGtgWEzAzP15na0b3X
         ohuh4HMh2+IYUlFVChdqY9jDsP/OBFPD3n7Huu5n7gxwLxgbqC7HHsrzNOY1RR7OcgTn
         rYdDsyouzJXhP1W9Ah8/BokNMFogbLeRJCjQpXfhG6J+3ExxuLTQMp8dz/YovFx5E1cd
         w3SFLUXFeUe5u8klDBC+Tx9HwsdGptnvB8ls7PM1IVXlLEBJD5TNGmxV2jnREge0NVrC
         cVNkJY3Ynw5wIvKjwhiO0TMBBNN3/xxBLR7fgEOVNNBr8nH45R4fdSPNsdGqfAhJYxpm
         PExw==
X-Forwarded-Encrypted: i=1; AJvYcCWTtk5LM+tZizH7nIpe2yO+D2YyyNX6K1nLQnOHmdLYOFJro9xaLurj3hmCIa0IqXPCeSuTeQ2VtKzp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7zTLF4Kw7mp+gzxTwom26iFH1abR1dj2KrCk2jaIQxgHkVQKJ
	6Lu3R0lypeypuBEqSwv3R9kSYcz30kHnynrlAKCW4OuShGWcpVcIcmAg990V/vossMQ=
X-Gm-Gg: ASbGncsr3uhh7ImWs/Ehs67JsgvhrkUMSGmCQSoCNK98jA9aa4AdG4eViQpxKPY5I1k
	PKneR63VnZx2JGHWJnXprXdfsqPRUGLaDzVl1Rkgw38/7f8TNc9t7i/zAt+mX9vRazAe+H0QZWu
	/TTj/NuJ0MZmL/J/LMqu+BIJmpguNjqWwexHwv7KqcWkQq7DoMqUFtYPgBxKYmcb7bJA9g4sLcM
	Kh/xrjOS/L403G0DOngp8EvhWr2AG4Fh69DFxXCWjWrQO+7WpFAUnRIXXKOkyHUxRo3gR3j+Hoc
	NxgvXR5DSefeCx6zIWKl0Nqw101EjEeSJ5Pi+Ujlav1DIUFxn8FoAhxPxfTcEmgihWfAzkSrWxO
	iEYU6d48NMZzUG7x8bi8QFU/Msus=
X-Google-Smtp-Source: AGHT+IFRkpqclsNYUNbGMkAuZhXHS3Qv2yCkSEuPjzYXQeiL3SAyG+ATQky02YBh1lI/bsu4q3uPPA==
X-Received: by 2002:a05:6000:2381:b0:3e5:47a9:1c7a with SMTP id ffacd0b85a97d-40e4a52475bmr1878562f8f.62.1758780722328;
        Wed, 24 Sep 2025 23:12:02 -0700 (PDT)
Received: from localhost ([41.210.143.179])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fc5602f15sm1453105f8f.39.2025.09.24.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:12:02 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:11:57 +0300
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
Subject: Re: [PATCH net-next v2] 6pack: drop redundant locking and refcounting
Message-ID: <aNTdLU7amoq0bCnS@stanley.mountain>
References: <20250925051059.26876-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925051059.26876-1-dqfext@gmail.com>

On Thu, Sep 25, 2025 at 01:10:59PM +0800, Qingfang Deng wrote:
> The TTY layer already serializes line discipline operations with
> tty->ldisc_sem, so the extra disc_data_lock and refcnt in 6pack
> are unnecessary.
> 
> Removing them simplifies the code and also resolves a lockdep warning
> reported by syzbot. The warning did not indicate a real deadlock, since
> the write-side lock was only taken in process context with hardirqs
> disabled.
> 
> Reported-by: syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/68c858b0.050a0220.3c6139.0d1c.GAE@google.com/
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v2: add Closes tag
>  - https://lore.kernel.org/netdev/20250923060706.10232-1-dqfext@gmail.com/
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


