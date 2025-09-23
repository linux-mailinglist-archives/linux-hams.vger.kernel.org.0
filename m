Return-Path: <linux-hams+bounces-637-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E969B94B6E
	for <lists+linux-hams@lfdr.de>; Tue, 23 Sep 2025 09:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2726E190204F
	for <lists+linux-hams@lfdr.de>; Tue, 23 Sep 2025 07:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B67F30FF21;
	Tue, 23 Sep 2025 07:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwi3bGID"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D702E92BC
	for <linux-hams@vger.kernel.org>; Tue, 23 Sep 2025 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758611519; cv=none; b=ew8hopdQ7YvwwVEkRsxRL88LPpG+5SzYGfsWsaXA715WAR34jxX3/nqQy5rA4IZNIVqWKRNMtCbpElf73VOORxVTHE7F7s9/ZHcozyDudROV5NmhYLgorK3Luapjn796D7W9OmGsJ4A2Fh/BXCml/QoMnTw9dhdnuunTw04lil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758611519; c=relaxed/simple;
	bh=7iONL8v6z0oTB+q7lJGr39cvG4XyvJ1rttD84Eu2h2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMyHGDgitWAnM2RJyrUEi+s7EeR96IYl9gWFu+gW1680aoXMHElhqT93MbTYF+V1+UKRN12ShI5HsuXrC5NZrl5/FQXastwV3Ji9K3dIDr+fiuHVIpnGnJNE6NjW432BERwjtAEdBidIEkxYvQ/dFe6g8g2ji1X3kTGWayyPiiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwi3bGID; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46d40c338b8so13290285e9.0
        for <linux-hams@vger.kernel.org>; Tue, 23 Sep 2025 00:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758611515; x=1759216315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kF/vwsek+TX0jz1XNJrsBzbivVnVQSsSlm9v5mtUJOI=;
        b=vwi3bGIDGziXrwFv1nkTIk5cUht1UKp+3UKXSHHPehT0CEmJN3hnho7TKLSDVnPS9u
         rOXHf83ZXVdGswYFCjAgNqrfm1xmB/+UwbqbFtPjMIYFITJ5wtC5IwQmsmvfyfxs3rig
         yRaZ+5HLIeSGHiG1w9j2HQpLqo63qWbsbziPS0QJnmrqLonaEI44bfaug+LbVtPfvzpQ
         W5SQ0+g6e5xrISreJtIQFnOpknmVeQT4Gw2vBc8Bwr95AHDj+8N3868EQ1xi1phgBV5t
         kav50VMNIHh+ixhvu/ny+uivSLC3s3zevng5G4LXjUGYQDCCowZpDtyfTlU/S+sGPAbl
         kgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758611515; x=1759216315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF/vwsek+TX0jz1XNJrsBzbivVnVQSsSlm9v5mtUJOI=;
        b=tfmCOiVzRLhRLjwz/f5hywlHbIHsOlyMbzvU3+9NcqrhWtH7DVqGPNxJiqytEMRGqy
         59a9/dzW8v092WMkQlWUTmudj3RN3ncdv57ar+F/A8FJOwyNy0bS3ZgspF5XSpYJ5a1N
         T/a3QuXnwfq1oOTHPttcJceNWLnYLk1mvRq4+O0jDODMvTuZYUvVjoyRlNfwe7veTKi7
         b1awpjPmmSJNIwZKC3aZhRBOTF4J4tO7LrBMDaN01U/CpG2JSBANR8kJeClUtkRvlTJK
         j5XrhUfvwvuNy0FI+85SvYxJ7C/+Mf7/SXiDBgDGuLAiEZs0WkrtL/bze79YnK0towoi
         IRHw==
X-Forwarded-Encrypted: i=1; AJvYcCUoGKUTB6bM6zYVhiLCWWqBsvK9wmhGmEquAY17/8+oDmoLDzXx2H+if0pap7OQwTuFZIfGKCUl687i@vger.kernel.org
X-Gm-Message-State: AOJu0YwNjals4wcRdEiu/aWnKaS+bCqlXKsuaC+wX9MX5TQQiwcsWr/O
	uJbyhXv8EdgOFgTIU2hrtczsoqR2gcrSFlZLmjf4m/RLeudUsFAyJHaGCyGfn3v46Cw=
X-Gm-Gg: ASbGncs1sNT2q0NFj2G7Jy8qQXJCBKbiDndG6jcIFDwXf2mPZcil9aDeRGvvbZwHx1/
	UJXZkA45AwGhcSGT01yfTSTq1QaxCKNTQ1HQmlAjdl/BhQlYbOKqCjWzEEXm8auzugfBF+YCZxx
	rh+76s3tQyL/DasLP0xw/Bq1GdBwoOmx3nDvikukezdgUxwdUv4zra+XqobNeEhPS0WDV+2sYag
	EkNNS2kNhfDN6WAXm4OE011G+VhRhyXlN5URxVZgzSlte8JuYeuhupRESWywb/nrGrVu4YCjq4c
	yaOU6jJ9PkHScg1ap4FuMc/0rkgjqOnb9+dqkEyQianmUux/CEqKj4dUHRjv5N5+vYJQS9t80qu
	bJWrnL8AllkKQcRHOb33OyJn8ICNj
X-Google-Smtp-Source: AGHT+IETXRK4dmUcU1OY//+IY9VX2wp9AdGkgYqyjEDbbOe16hsBsbPJkcHHfAihkfG9eCqRmXw0Xg==
X-Received: by 2002:a05:600c:3ba9:b0:46e:1f86:aeba with SMTP id 5b1f17b1804b1-46e1f86b296mr11638615e9.17.1758611514684;
        Tue, 23 Sep 2025 00:11:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f527d6cdsm261777615e9.12.2025.09.23.00.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 00:11:53 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:11:50 +0300
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
Message-ID: <aNJINihPJop9s7IR@stanley.mountain>
References: <20250923060706.10232-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923060706.10232-1-dqfext@gmail.com>

On Tue, Sep 23, 2025 at 02:07:06PM +0800, Qingfang Deng wrote:
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
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

checkpatch says:

WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report

Which is relevant here because Google has apparently deleted their
search button and is only displaying the AI button.  "The email address
syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com is an automated
sender used by ..."  Thanks, AI!  I can still press enter to do a Google
search but there are no results with syzbot ID.

I can't find a search button on the syzbot website.

Ah.  Let's check lore.  Hooray!  How did we ever survive before lore?
https://lore.kernel.org/all/000000000000e8231f0601095c8e@google.com/

Please add the Closes tag and resend.  Otherwise it looks good.  Thanks!

This code was copy and pasted from drivers/net/ppp/ppp_synctty.c btw so
that's a similar thing if anyone wants to fix that.

KTODO: remove sp_get/put() from ppp_synctty.c

regards,
dan carpenter



