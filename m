Return-Path: <linux-hams+bounces-661-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D96DBF1600
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 14:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD7214F40E7
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 12:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352B731280D;
	Mon, 20 Oct 2025 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnrN3EMb"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192442F9DBE
	for <linux-hams@vger.kernel.org>; Mon, 20 Oct 2025 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965061; cv=none; b=U4M+kTGdKiwdHp+nvTEEoA7nQOkrs6wfxQ7etr3RU5rus5Nw6tREC/R2aTaR/apH0BbHqqPkm0lfOOUliZTMfs45J0CKvHHk/Kq/zl1608RcjQXl21rJ5ZQFNHB4Iq80SSkKBf6zsToq06DuwGSg5DnVvtppf/A5HsXlmLbuFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965061; c=relaxed/simple;
	bh=7sUddBToXRDuVpOAdbh5+EOipFsXxszIriq7XYYoywE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3OB6ojDUPLajREjE5DbrLT4+ho9zT2PMgIBQIFu4BSxOgQyz5k8qVbK/ewbghGhTbpYYe5VesFoE/j1D/IBF3UR5QrEON2m8yAOZ+c/OlG/YWB8dlGlGNHfb4MNqT9t8ciS1Oz0pZ8+e9KGN/qD9jHPWpqoLmmhifYCYYX0FRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fnrN3EMb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so23332955e9.0
        for <linux-hams@vger.kernel.org>; Mon, 20 Oct 2025 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760965058; x=1761569858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXAZo9QKBPHm6dHDU8Xx+AOp+3XH61eqHfx+Vq3xM9I=;
        b=fnrN3EMb2lDaS/rRAMvI/yge+4d8oOuzal1q+ZhATLzbDHuKSQdimSiTIMhuchctkW
         HHtj/eMESZtru312iCNA/aAGmHIR+4fAOkmOkjNzw5BB0Q3plAEnkueGBigUGAynE/Iu
         yisJ40wKDDsKf6jSnxdacvamnCKKf8W656mx+JAgOFWI2S9+O6A2moRd9T0z3KqvEDEl
         BizIyViy42SqZ3EAnWZR7LAp7vaW6g5bX2sJ+B2uUScAgBlbOSq5NRAJMzyOmyat2oad
         bzJ/KWYNaKCy7/3ijNQ/UosAEmQoIC5OIoYta/URzPW7c0SwVTd8AXxfLlZaSZhc43qt
         P40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760965058; x=1761569858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXAZo9QKBPHm6dHDU8Xx+AOp+3XH61eqHfx+Vq3xM9I=;
        b=X5lEB9rqLBxyJRgwO4Btbb1ROqOkP9GXTNrL2uMfFkKPfcMxfRra8huj6kGvYx86J0
         ZRkKHYs/CrC+w514VlNcYACvezaEaZCE4J0gUssNbu6I/3LTuohQkiauQZ6RNwQizLha
         RYA4pBdAkqOs5gGfCNCAALNRLOO+oKACrapEWT9W5YGAbNBX9LQ9cE33WDPvitjccwYv
         z7ndxIia/F1TX/YsclzKLm/4IRD6BVO1JEV46Y/WwZKM30xqnazDWX0Y8P/pzw3ZngJO
         9Rq5ps/1a5XrXq47J+iRtKzWNFoAZ8BqzSjKT6EN2BS7kvXVLVOrNPqqObDhOKLoB9R3
         OWdA==
X-Forwarded-Encrypted: i=1; AJvYcCXStp/lhD8EJ8aZ6M7jaxaKQi3FL5Zqy4eeUJf6acgmgtlBwUh2jLswVKnHZ81KvvASpRy4FMm/LUbm@vger.kernel.org
X-Gm-Message-State: AOJu0Yza65VJiXhkNfI2dmmd+z+SR1FJgbzg76ot299iZZ5yr59MgoTQ
	QgLsfOFgJY7H9WLXLmK1/yUZdStM1XdprWB3udyRqTwtreQbTbbn1EXvu2TGoJs62O0=
X-Gm-Gg: ASbGnct5xWrDDVJY9+U8UCh9MZ4AuVeIsgZV5raOmTgIlAS2WurMav2NPnbIHf2yCXU
	fRa3Hbo0UwNy60zijOIijI35uMaNZWr0zAjeaqWW0HWXVJm+TZQJR03AV519yj/L+lO9KFaWeeq
	NFubCViGF/9dRuzs49f+H+c3tNltKZRbRPhMuSA6ZRAuUDWAL8LgdXFoSnOfy6j70KJZ+A2rjOf
	f5ZtBQnO4TzmNPXcsH9sGIBkeaDFUl1Vkx3s27ZVVFrcWjUI356sOkwrHpV94TuZ1kWbU6nPksh
	V+VvFXufJm4MSRKHS/9l7ytWHNdtOPSR2tnzWwY8rsnvA6HcVxSKzyghzLPtedjUJm+ssUD+Dzv
	bF6HrYvKN9JIveFg9JFvNwmvmHvUDTuXDXvFax2Hzt5B1ccPb28oFNvgVedQbR5/OVSo/TyheE+
	uJZ1Wj36wbjMnvLfIWSELy2cg1iA==
X-Google-Smtp-Source: AGHT+IHM395rDiD5CS+0467HtGNOVSysUdUFMEFD/wDZ4ikUr6eXNC1u5lSYEQ5rloxVyaeKMi9hbA==
X-Received: by 2002:a05:600c:5287:b0:471:7a:7922 with SMTP id 5b1f17b1804b1-47117874a26mr111763615e9.6.1760965058269;
        Mon, 20 Oct 2025 05:57:38 -0700 (PDT)
Received: from localhost ([41.210.143.179])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5a0e9csm15431843f8f.5.2025.10.20.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 05:57:37 -0700 (PDT)
Date: Mon, 20 Oct 2025 15:57:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
	kuba@kernel.org, linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com,
	syzbot+2860e75836a08b172755@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH V2] netrom: Prevent race conditions between multiple add
 route
Message-ID: <aPYxvdLFjjduK28o@stanley.mountain>
References: <aPYKgFTIroUhJAJA@stanley.mountain>
 <20251020110244.3200311-1-lizhi.xu@windriver.com>
 <aPYqRJXGhCNws4d3@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPYqRJXGhCNws4d3@stanley.mountain>

On Mon, Oct 20, 2025 at 03:25:40PM +0300, Dan Carpenter wrote:
> netrom/nr_route.c
>    214          nr_node_lock(nr_node);

I guess nr_node is different for each thread?

>    215  
>    216          if (quality != 0)
>    217                  strscpy(nr_node->mnemonic, mnemonic);
>    218  
>    219          for (found = 0, i = 0; i < nr_node->count; i++) {
>    220                  if (nr_node->routes[i].neighbour == nr_neigh) {
>    221                          nr_node->routes[i].quality   = quality;
>    222                          nr_node->routes[i].obs_count = obs_count;
>    223                          found = 1;
>    224                          break;
>    225                  }
>    226          }
>    227  
>    228          if (!found) {
>    229                  /* We have space at the bottom, slot it in */
>    230                  if (nr_node->count < 3) {
>    231                          nr_node->routes[2] = nr_node->routes[1];
>    232                          nr_node->routes[1] = nr_node->routes[0];
>    233  
>    234                          nr_node->routes[0].quality   = quality;
>    235                          nr_node->routes[0].obs_count = obs_count;
>    236                          nr_node->routes[0].neighbour = nr_neigh;
>    237  
>    238                          nr_node->which++;
>    239                          nr_node->count++;
>    240                          nr_neigh_hold(nr_neigh);
>    241                          nr_neigh->count++;
>    242                  } else {
>    243                          /* It must be better than the worst */
>    244                          if (quality > nr_node->routes[2].quality) {
>    245                                  nr_node->routes[2].neighbour->count--;
>    246                                  nr_neigh_put(nr_node->routes[2].neighbour);
>    247  
>    248                                  if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
>    249                                          nr_remove_neigh(nr_node->routes[2].neighbour);

Does neighbour->count means how many nr_node pointers have it in ->routes[]?
I wish this code had comments.
KTDOO: add comments explaining all the counters in netrom/nr_route.c

>    250  
>    251                                  nr_node->routes[2].quality   = quality;
>    252                                  nr_node->routes[2].obs_count = obs_count;
>    253                                  nr_node->routes[2].neighbour = nr_neigh;
>    254  
>    255                                  nr_neigh_hold(nr_neigh);
>    256                                  nr_neigh->count++;

Could we just add some locking to this if statement only?  I had thought
that nr_node_lock() serialized it but now I think maybe not?  Or maybe we
could increment the counters before assigning it?

			nr_neigh->count++;
			nr_neigh_hold(nr_neigh);
			nr_node->routes[2].neighbour = nr_neigh;

I'm not an expert in concerency.  Does calling nr_neigh_hold() mean th
that the nr_neigh->count++ will happen before the assignment?


>    257                          }
>    258                  }
>    259          }

regards,
dan carpenter

