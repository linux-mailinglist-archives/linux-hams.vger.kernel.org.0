Return-Path: <linux-hams+bounces-347-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 470308D44C2
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 07:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E7BCB21DB4
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 05:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5447143C4C;
	Thu, 30 May 2024 05:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z5ecP7pU"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E79F143878
	for <linux-hams@vger.kernel.org>; Thu, 30 May 2024 05:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717046610; cv=none; b=Q7v7NWLKsYJuxfZ9SBdDxb8aVuc1BQq2tT6GcNlvEnelNMnahnpHJdZkKLYNv19gpAbwEH+ft1jn3iyDoR4QcVsS1T8c3bIb2guKZEaGBe1yoDk67Jwcht2UPzXTFynjuMlqiwbg2H7lvPA5AXRSPjKmjWY+0XRrIfrYbxdXm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717046610; c=relaxed/simple;
	bh=TwgH/gtp7ud9+239CluIrGaOMiwBf3gKb2ExJUd3xZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwPTeZIhHagGmzvgZxErMAHGn9p8um18jo1+feUkneLAt5GpUIpllQLWAsE+0270fR1pK6Ccs+GxnU2eAzegMHds9oCXIZ5XGY02kziSYG5849XQFbwcIlQMUyp2ZRz1zR+HU3qBwlWMjaLTeOplnKP/OwMtGeN4dfS6iLi4sgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z5ecP7pU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a626777f74eso29259666b.3
        for <linux-hams@vger.kernel.org>; Wed, 29 May 2024 22:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717046607; x=1717651407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iZM41/7mDcxSquoq9LoXz/QTVE6+9mFjNqtqD1bGyU=;
        b=z5ecP7pUet8Rr5WmXPgJweB86JyLIUr1s1fduu59LwQ34njQGmHLc902a1FX10vocM
         pHzFe+rITXMnN7CsO1qcn8+5KvPSDUBanGpwEvScTC917icqNJMgC5ToIswNIQgbzd+B
         oQ705lR1d0bXV0fNZ+tgtSvUAGi72DP5UHbQ4hSkByrmGqplXNkEwa2M1KjXI6HsuFJ3
         k6nsfuSmVBzKkm4d/VCv5dFbVzXxnd/SsDMjGfrK8MBFAFyfY4+78YIg10jVJURd6/5u
         6Rfo2tUl9wnoVikfuqbSkJhKXRCtFj8oFWNb8L/9MqAVkHLc4YZkK8JZED6FfuH598IS
         +Nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717046607; x=1717651407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iZM41/7mDcxSquoq9LoXz/QTVE6+9mFjNqtqD1bGyU=;
        b=wt5SnQ9MxqL5EwKO48rb1IYRWFuz1N99QWlC8jyrnVRSqJsTsgbFgogtat0ckq3cWH
         cysSQBQojnN5Sk3HaL2KC6vuUwxsT6XRScxKx1kmPIrJvpgU1AOWXxQ4tXEwLmT1sotx
         IPgUlbenFA/F1M+QSzEgFI7PBQQl9OSNV2Wo2Ub2VJ1vzvFeHj3VJFV+/P53seadtBfQ
         J27cZEvXT6ituAUu2H7bdP7ydGXWO2BJR/TmW1cjJfuWqOarBiONwYLtL9iyzwd6xynd
         gfS8jieTW4D8nbnboLvoS/YwV5xVHmAIIXovUg97Mbzfz4MF4w0ZgtkkUJq2/HF8FpAm
         LY7g==
X-Forwarded-Encrypted: i=1; AJvYcCWiLXnW0Sptfws7zEt8t1HBAe6A4qrsFuVQnQoIndpB1PL+Dwhz9QWiisUFax+Oq5SzhgWAki5Y5yYX1KOy2aLRGi/ro5F3nLCZJQ==
X-Gm-Message-State: AOJu0Yxu7/Zb+cnR+1BWOYQGEYb9U3oVi5wlW4Nr8UaDTvs9AQFbgNCF
	6qqQp7yrI+zAuTmAZcsIa//KecVKYmwP+qGvBew2I40s4xTR6eSCUxh4fTrXWOI=
X-Google-Smtp-Source: AGHT+IGiMaKK5C7BvwqxS4g/xaQp5YmZ3lVzVjOtS7XaVjrsTEqCqQs5N4b7kUks2zW4UQQDfV9kjw==
X-Received: by 2002:a17:906:1319:b0:a5a:5b23:c150 with SMTP id a640c23a62f3a-a65e8e7a77cmr111535866b.41.1717046607193;
        Wed, 29 May 2024 22:23:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc4ff24sm788862066b.130.2024.05.29.22.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 22:23:26 -0700 (PDT)
Date: Thu, 30 May 2024 08:23:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hams@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, jreuter@yaina.de, davem@davemloft.net
Subject: Re: [PATCH net] ax25: Replace kfree() in ax25_dev_free() with
 ax25_dev_put()
Message-ID: <69dee6e9-05c6-4d1e-9c69-a9b60125d7ab@moroto.mountain>
References: <20240530051733.11416-1-duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530051733.11416-1-duoming@zju.edu.cn>

On Thu, May 30, 2024 at 01:17:33PM +0800, Duoming Zhou wrote:
> The object "ax25_dev" is managed by reference counting. Thus it should
> not be directly released by kfree(), replace with ax25_dev_put().
> 
> Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


