Return-Path: <linux-hams+bounces-208-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D538BAFAF
	for <lists+linux-hams@lfdr.de>; Fri,  3 May 2024 17:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FAC3B21616
	for <lists+linux-hams@lfdr.de>; Fri,  3 May 2024 15:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40A7153BCC;
	Fri,  3 May 2024 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/j/j6+v"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1781F1509AB
	for <linux-hams@vger.kernel.org>; Fri,  3 May 2024 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749802; cv=none; b=R3vAqqc4V3mpK77/1EMAQX+S9qkfuqtPOfYbk3Hs76A8T+tSSXLdyoC7gzF9p4GFh6X8FK0xm56j2H0NTDANFekBmLc2O5dZ/tGVoyi3VaJwBikrKhSSotfESLolHG1EK7kzZ0+kKs5gHNPnCPwwbUs3Mp/axJko9JfRR9vEL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749802; c=relaxed/simple;
	bh=MWE7coWNqMXJleIi3yjk5awPC1JbvNBfC0e959nu6Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F//ec22BJV6c7zWJWRb6w8jx0IwDvClmMHtV54nQ5nlVk1Y+h31POB8VfZ7n24NyeQR4OpRtSMmBn253FkZo2PtsYXdrii2szw4ayQpVG3slu5+3yFmHRRjWSX4d+caXD8+JrWcsxaCanogX4QVrkJdsfUNgiJPEXWwRf7Y0HNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/j/j6+v; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34da84cb755so2495649f8f.2
        for <linux-hams@vger.kernel.org>; Fri, 03 May 2024 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714749799; x=1715354599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wdt2IfwqtFqaZTN79e9iL9j98LJEO7sDYqEbNeYYJaU=;
        b=Y/j/j6+v+RdKlz+2pP3ymSgVEMbJ8j/qzOcA0Qq2cYiciXErsGU/SXG/CckecyQBUu
         7RXrir2aGnW4b+wadjF/S30K0hPBvLdg/MqW9kE3tGydDhz2dPuCia3rNhmdCfFQFl5d
         WsgNFBtL3kZO/rdBy+q3xa2NF9wDQd6oPXB+AOTdL/n/tLr69XL/PIP2wsDSd10ow3K5
         NS5FwZrLxVridIy6/2cF+nWqgj0JHc4xB9QBd+lAkHH7rKKzavPQrFwE2+oJxv9yZEGt
         +fnYU+iQsK5j3VurttRSYvazrqYpZSZ8aC1HnSI2A9I+KWM2DKZcUGkMtCyZlj9gMMQQ
         BQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714749799; x=1715354599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdt2IfwqtFqaZTN79e9iL9j98LJEO7sDYqEbNeYYJaU=;
        b=N/XXvgxg8VGGEuQaZSQQ3iU0CwaRkyL2Y+VZpdLWSOed1eVF0RCEUHxvw8/kslbYND
         3YVLMhk7X1NF7kyqtUDoS1kIye4iFhZmXipnrVVE2oxOTYx/Yf739msqBIer4nPMNjWk
         2t8rQSVZ9AHCGPsyUsNOU8zUwrwOCU1jJqL7+nj7dY/tZ8S/ihUUoAaGPrg7pdGKhxiK
         hkBIRtT4kmHg059sI18xsOM5Cz5FqfFH5lVuJfyMwP9rE+GZP7uiK4tqCv5H8gQZ1/wM
         jeCoX8Z7jW3nKRM/VCCFGdAZCJk5Z4xFEK6UU3j16qLrFqbCYmIuFnZPSjVFm7wZ222G
         RuKw==
X-Forwarded-Encrypted: i=1; AJvYcCXHraB5gZwN96muvHUBU/lBvTy3EGlQZZivh/LWYqt9E3pKb1TqxbbRYcP5zQBuqyOCyoAdJSaxkweqnVI74IuZR3T/F+94WXtfVg==
X-Gm-Message-State: AOJu0YznoUqdWCAxUd0lYystw5vnz2i7kr5kGvKqOh7be3bLkJNP1+Mb
	AR0yCFRpvrCFK/mIY5B8jo3AOgr0AfEASCyWAvlr7WKfOXMLpp9NjS0fNorzbjo=
X-Google-Smtp-Source: AGHT+IF9s4k+fRR7e1yxXvSlCXD3nF/jRBs6Gtlty++TWU+4zWj+bqwN6oJg1Acr4XwoE1SLANszRA==
X-Received: by 2002:a5d:6a8c:0:b0:34c:5af8:e491 with SMTP id s12-20020a5d6a8c000000b0034c5af8e491mr2016677wru.33.1714749799241;
        Fri, 03 May 2024 08:23:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p12-20020adfe60c000000b0034ccd06a6a3sm4011645wrm.18.2024.05.03.08.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:23:18 -0700 (PDT)
Date: Fri, 3 May 2024 18:23:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joel Granados <j.granados@samsung.com>
Cc: Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Ahern <dsahern@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	Remi Denis-Courmont <courmisch@gmail.com>,
	Allison Henderson <allison.henderson@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
	Jan Karcher <jaka@linux.ibm.com>,
	"D. Wythe" <alibuda@linux.alibaba.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, Martin Schiller <ms@dev.tdt.de>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Simon Horman <horms@verge.net.au>, Julian Anastasov <ja@ssi.bg>,
	Joerg Reuter <jreuter@yaina.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dccp@vger.kernel.org,
	linux-wpan@vger.kernel.org, mptcp@lists.linux.dev,
	linux-hams@vger.kernel.org, linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-afs@lists.infradead.org,
	linux-sctp@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	linux-x25@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	lvs-devel@vger.kernel.org
Subject: Re: [PATCH net-next v6 8/8] ax.25: x.25: Remove the now superfluous
 sentinel elements from ctl_table array
Message-ID: <21f76a94-1b35-4cf7-914d-e341848b0b9e@moroto.mountain>
References: <20240501-jag-sysctl_remset_net-v6-0-370b702b6b4a@samsung.com>
 <20240501-jag-sysctl_remset_net-v6-8-370b702b6b4a@samsung.com>
 <CGME20240501131616eucas1p28a33eeb55f6c084a0751e5b7b7d91d78@eucas1p2.samsung.com>
 <ZjJAikcdWzzaIr1s@hog>
 <20240503121811.fsmriwsgugzm2o7i@joelS2.panther.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503121811.fsmriwsgugzm2o7i@joelS2.panther.com>

On Fri, May 03, 2024 at 02:18:11PM +0200, Joel Granados wrote:
> On Wed, May 01, 2024 at 03:15:54PM +0200, Sabrina Dubroca wrote:
> > 2024-05-01, 11:29:32 +0200, Joel Granados via B4 Relay wrote:
> > > From: Joel Granados <j.granados@samsung.com>
> > > diff --git a/net/ax25/ax25_ds_timer.c b/net/ax25/ax25_ds_timer.c
> > > index c4f8adbf8144..c50a58d9e368 100644
> > > --- a/net/ax25/ax25_ds_timer.c
> > > +++ b/net/ax25/ax25_ds_timer.c
> > > @@ -55,6 +55,7 @@ void ax25_ds_set_timer(ax25_dev *ax25_dev)
> > >  	ax25_dev->dama.slave_timeout =
> > >  		msecs_to_jiffies(ax25_dev->values[AX25_VALUES_DS_TIMEOUT]) / 10;
> > >  	mod_timer(&ax25_dev->dama.slave_timer, jiffies + HZ);
> > > +	return;
> > 
> > nit: return not needed here since we're already at the bottom of the
> > function, but probably not worth a repost of the series.
> > 
> Thx. I will not repost, but I have changed them locally so they are
> there in case a V7 is required.
> 

It's a checkpatch.pl -f warning so we probably will want to fix it
eventually.

regards,
dan carpenter


