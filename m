Return-Path: <linux-hams+bounces-258-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863F8C0451
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 20:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80677B253AF
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 18:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E031312E1E9;
	Wed,  8 May 2024 18:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nrfKQ3+C"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E137E54FAA
	for <linux-hams@vger.kernel.org>; Wed,  8 May 2024 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715192866; cv=none; b=MC5equhFZV1YT6jc67YEY8cP8pT5EBq+XDb9/5L/3Mlo6FnTeJ3HwImOOtBxRYGM1oYprMs92bUqOUTF8y8TgIhyhFLdqrv5Mr3DHRWa6ZhnRA0znrh0/cR9oAspuVTsaQUhF7MDdljbXdCjRqsaJya/8HNv4o3gloKqJTEsvBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715192866; c=relaxed/simple;
	bh=/YdaYCYNW8oH5rrPcrYTGYrn83J684SKHX219loxdcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJjE5WhvxLrslFS9SztBBPDFg2JFfY9r6fDMPNY10VyZ3PmJbT5JxoPHGiDKOayAkwULZISHRDOaNZNO+8YGHR6MU2guxpoihxwR23w+InnzN2DfmHT8sh1LRNrHegqYKWTfu7Ef8sqOGEIn7tYE4kM6bTU/PLTjoQnrB4y2yHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nrfKQ3+C; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59a17fcc6bso9345066b.1
        for <linux-hams@vger.kernel.org>; Wed, 08 May 2024 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715192863; x=1715797663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8hGDhRn0BAu+5l0JGlCJ/eEdpjrX09joyeSpJLmwE/c=;
        b=nrfKQ3+CuXTehAmelEu/Lz62jFl/yUS21FMf8pTO1UpkiPutsBtoaG6hqNkailMAAA
         FCSAmsfUg7j89wkmYlB65wKyz+UYGsg35BIRBzu2h1q9qvaTZtAUkXahkydKjFLCEeOa
         qk9GWvJZq3kxBj+qW+76ePNEzBEwtyhZ3lvarvKsOtv3X2/pXdqgQJvD2UvFjFZTRNbP
         z7bDnY7WtLlZ3k5g/gnJV/xyaf60dX15G3sfh7Cs7jz58z4P5FGMK1EdpVRgXoqcei9z
         Q2+V+W1f022B9cWPebS9+xs2EGIbXROCZr3fCrf3yNmh1GOeH4QkAtSE59C7I1K3h7EZ
         MpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715192863; x=1715797663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hGDhRn0BAu+5l0JGlCJ/eEdpjrX09joyeSpJLmwE/c=;
        b=vUuvUqm/uUjzBqc0IykYJZlzG0kIPf1VmfnoSCkH8j5fP4RrFx7QEYd80ROgCgC7Wx
         NyAbZ1+X9Qd4+sb4VZoe7fjYJpWY5zDKkIOT9CHBNjUMkLU3RUTurOzOMOshn/6CN8yv
         xSJF9Vlli+FxGTfVE2El3i5tADqiXpdb2ojsdnbbjmCBp00cWYSFZ+eGfTDuzKrL7cgH
         EEyQ5uWclhXyqRfWfov8VwxV8OxtGPlZU5zAm7fR4d52zI63ZpVEFErFUPX9p6WsrQe1
         TNI6v4GTsvfQQdr4+XBhWR0Xpjuc9eu20OMvj8QJ5lHzWw8X6uJzwQWYvm/Bftr6p+oU
         TbKg==
X-Forwarded-Encrypted: i=1; AJvYcCX3RJO6ICRSLjIZn0YTCLUSQyFYZt/Dy06qKO44qpzf+dtHQ75359SEg4fnOQAxr28eF70prQ72NxN6nqf4mRJOnFlvOIB80adiXQ==
X-Gm-Message-State: AOJu0YzP9JmqLNZir2AkrWixJDspF06FNqF9Zte79eCRNJhKDgHa9o19
	l8Qvs/Iw+z+VStFTQh5fllpEYkBslhbCVkyKLHiNhDhFT6+0V+kE3zZ0NvZXmzA=
X-Google-Smtp-Source: AGHT+IEKr86BFAscKF5JhqwgbQI+Eea8pH2c1MqBSZqIR0iYBHNd/tVDhAYLtj13i0m3Xw3ZYIv93Q==
X-Received: by 2002:a50:9509:0:b0:572:5f8c:42 with SMTP id 4fb4d7f45d1cf-5731d922ebbmr2287153a12.0.1715192863164;
        Wed, 08 May 2024 11:27:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ee53-20020a056402293500b0056fede24155sm7865290edb.89.2024.05.08.11.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 11:27:42 -0700 (PDT)
Date: Wed, 8 May 2024 21:27:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: duoming@zju.edu.cn
Cc: Lars Kellogg-Stedman <lars@oddbit.com>, linux-hams@vger.kernel.org,
	jreuter@yaina.de
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <889c7742-58c9-4ec0-91e9-af171af66eef@moroto.mountain>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>
 <ekgwuycs3hioz6vve57e6z7igovpls6s644rvdxpxqqr7v7is6@u5lqegkuwcex>
 <1e14f4f1-29dd-4fe5-8010-de7df0866e93@moroto.mountain>
 <movur4qy7wwavdyw2ugwfsz6kvshrqlvx32ym3fyx5gg66llge@citxuw5ztgwc>
 <eb5oil2exor2bq5n3pn62575phxjdex6wdjwwjxjd3pd4je55o@4k4iu2xobel5>
 <79dc1067-76dc-43b2-9413-7754f96fe08e@moroto.mountain>
 <5f92dba3.4404.18f524bb7a6.Coremail.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f92dba3.4404.18f524bb7a6.Coremail.duoming@zju.edu.cn>

On Tue, May 07, 2024 at 05:04:05PM +0800, duoming@zju.edu.cn wrote:
> On Tue, 7 May 2024 11:08:14 +0300 Dan Carpenter wrote:
> > I have reviewed this code some more.  My theory is:
> > 
> > ax25_dev_device_up() <- sets refcount to 1
> > ax25_dev_device_down() <- set refcount to 0 and frees it
> > 
> > If the refcount is not 1 at ax25_dev_device_down() then something is
> > screwed up.  So why do we even need more refcounting than that?  But
> > apparently we do.  I don't really understand networking that well so
> > maybe we can have lingering connections after the device is down.
> 
> We do need more reference count. Because there is a race condition 
> between ax25_bind() and the cleanup routine.
> 
> The cleanup routine is consisted of three parts: ax25_kill_by_device(),
> ax25_rt_device_down() and ax25_dev_device_down(). The ax25_kill_by_device()
> is used to cleanup the connections and the ax25_dev_device_down() is used
> to cleanup the device. If we call ax25_bind() and ax25_connect() between
> the window of ax25_kill_by_device() and ax25_dev_device_down(), the ax25_dev
> is freed in ax25_dev_device_down(). When we call ax25_release() to release
> the connections, the UAF bugs will happen. 

If that's the case, couldn't we do something much simpler where we set a
"no_more_binds = true;" in ax25_kill_by_device() and refuse to bind if
we've started that process?  Or we could take the ax25_dev's off the
ax25_dev_list and put it onto a ax25_dev_list_killed list.  The the
ax25_dev_list_killed would only be used in ax25_dev_device_down().

(I'm just throwing out ideas).

regards,
dan carpenter


