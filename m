Return-Path: <linux-hams+bounces-687-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E62C05A6D
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 12:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CC683B0794
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 10:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084BE30DD34;
	Fri, 24 Oct 2025 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HtNoeQp9"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0927AC5C
	for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302724; cv=none; b=Yo6jrs3VeDk5EpflwziDeaTb8kZv5NTZQn5xh7+wwlFFId2++5AIG9T3zElZFZhn21HYzXhVIZ9WuNVFDe0mNR6rVeSV0fiKr2sXrKxeJLNBkWxfAKyxN6LQyQ50GnbL+k8pMQSkG3gVE0rkbaCgor8bsiqGMMfZ0Fea0SaoCYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302724; c=relaxed/simple;
	bh=zitpUfd02mHfmWmKbxxXVMFAcuXxYP9GCRpf0oeD/9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHl76Gfyt4vnCbGOGNZ0sP3UdMjwlYlD+L3iFaOj6piSf3YFSYtgPV9nM56AlFEedbZsp72HuDhSAdYTodjNOuqpfk7FMUEixUTJ64nD1o2GnpbXri8t5y+O9i+N7nxoExJ6samqLJh0XIpzjG3NcJ7o8cp5LqR711954Jv105U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HtNoeQp9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so1383203f8f.0
        for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 03:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761302721; x=1761907521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0LzYC4CXNtIhbU33+vNcLU3UwFYwR0NDqLzt3aZXlS8=;
        b=HtNoeQp9JLCTH6rHZfTLnO3p7RnUjvCDk6KwZQYZ4/QbVbWV6WlMXpvXCiEAOsRVbm
         LlXw8hekf3XHIYP2b//FxrTwO5g1Xu8g7v49t10Uzut4M2WCL3Q8TZgdH3X8n39wisQd
         3Au6JfXCk2+cbtBaSYAo54+ujmQn3bCjyWEGNFXbRQcbZ0Afunq9mhN0FZBSc65DmtCV
         IQbbk4ptLbpZroXzLhxN/vDCWGnClKNef1kj5GXR2X58DbbwzWfeAH8QWIa+re86tdfS
         q8a1CknnjTyvy4pJGqRkZFdxx5yK1Vyiam7K5k27AzbBaIusDRHwmPUKQf/N/HHjPpZa
         bybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302721; x=1761907521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LzYC4CXNtIhbU33+vNcLU3UwFYwR0NDqLzt3aZXlS8=;
        b=F78NzwqflhPLdkkEcyxl5X4Sov76oTXPEYjuDXVB71mKdZu7kgwxsb9dwW52cPiifY
         ingrSapZCMoNPeED0S+yDBumLwF6VW87+Ivcphy+7eWEmJAB+2LyXUHgfQ7IPFUN96Cl
         Oiry5Gqq/7hkKcbi9Q1O/KkgcDBOEYVn/iYrgHo1f7O46OWPnwElE8Tciu3rBzOYbmnQ
         gP7fQQUPLH79UmU1BBhqbAowQnIFsFZhVJg63wsb6p/6ntanUgMPPp+pxpcapVu4G6Sn
         Ejn3c4PbHNHOoKRUCQM2gKPh4JC1b1CwUnC3EfO/AnLbE3mwu5Mi1xRNY50ChrZu9vdF
         6HlA==
X-Forwarded-Encrypted: i=1; AJvYcCVTdrIn+bX0M4F4hOHkUXpHT2kByshFGaDfqGh0Sl+vtHOSxa3CK69kFeYnvZ/yN1X9yFFnNi2iqKLZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7v7wWLGa+bQEaPeEiHNqHXIHV3PLeE6mvowd9YJLBs4Xx/lcw
	YQz79oOsuddNInDaxoxb9DAvZvNyNzpPieUag66UUEnXzd+/eM4eCROTJkSlmKV6JXLoTzCX3fX
	/bjmi
X-Gm-Gg: ASbGnctKaE/6+CH5dYOLOOCyRsv/P7Nb8J49dXlFXIOZlmhx5aCh8s5x4dFlh1W3JRV
	tAtJBBovB3MVEkETx4m2p6NlncXGId/PZuo0Dc4U1P/D2fAIPMPDPHXrbtY//vJxcaHaD7jsaPc
	RgpY9TkWocWGIwV7Gxfq9QKDeRgKgJ/31bkelgh9aoP3TO6Jl+TanltkKcgmFKnKLsmdrAS47g2
	vnZyz8SMvLykgZje6ujB5Ie0ncD62uxzEV/xYH4uL2knF3xE198ilGchL/R5dpyVemN/B9A08El
	e/4b/LbZil0WgNLMCFhhG0MEjzR0LWzaYa72atVzGOqTiiChACCwU7Qtqk3kUAP8n3Xpd3aXpZ2
	mVGu7EeFhUAhOtM5Y03YVw3C0nygOhpRBrMpPlP+mI2u/DuDdmchmlbfm+Xk+eNAH6k+IzmiRuU
	jaIUVGE/wz5C/77Ydz
X-Google-Smtp-Source: AGHT+IFndIZtTS7LJDDfqCt6ZeNmFhEZyimvvM4KVVCj0BAZcLMsAD53m+FlpSvkb1XScbIdB5nUsw==
X-Received: by 2002:a05:6000:2888:b0:3ec:dd12:54d3 with SMTP id ffacd0b85a97d-42704d9396fmr20083040f8f.35.1761302721251;
        Fri, 24 Oct 2025 03:45:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429897e75a0sm8916219f8f.5.2025.10.24.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:45:20 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:45:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Lizhi Xu <lizhi.xu@windriver.com>, davem@davemloft.net,
	edumazet@google.com, horms@kernel.org, kuba@kernel.org,
	linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	syzbot+2860e75836a08b172755@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH V3] netrom: Prevent race conditions between neighbor
 operations
Message-ID: <aPtYvPq12Txu9JCG@stanley.mountain>
References: <aPcp_xemzpDuw-MW@stanley.mountain>
 <20251021083505.3049794-1-lizhi.xu@windriver.com>
 <7232849d-cf15-47e1-9ffb-ed0216358be8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7232849d-cf15-47e1-9ffb-ed0216358be8@redhat.com>

On Thu, Oct 23, 2025 at 01:44:18PM +0200, Paolo Abeni wrote:
> Why reordering the statements as:
> 
> 	if (nr_node->routes[2].neighbour->count == 0 &&
> !nr_node->routes[2].neighbour->locked)
> 		nr_remove_neigh(nr_node->routes[2].neighbour);
> 	nr_neigh_put(nr_node->routes[2].neighbour);
> 
> is not enough?

There are so many unfortunate things like this:

net/netrom/nr_route.c
   243                          /* It must be better than the worst */
   244                          if (quality > nr_node->routes[2].quality) {
   245                                  nr_node->routes[2].neighbour->count--;

++/-- are not atomic.

   246                                  nr_neigh_put(nr_node->routes[2].neighbour);
   247  
   248                                  if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
   249                                          nr_remove_neigh(nr_node->routes[2].neighbour);
   250  
   251                                  nr_node->routes[2].quality   = quality;
   252                                  nr_node->routes[2].obs_count = obs_count;
   253                                  nr_node->routes[2].neighbour = nr_neigh;

This line should come after the next two lines.

   254  
   255                                  nr_neigh_hold(nr_neigh);
   256                                  nr_neigh->count++;
   257                          }

regards,
dan carpenter

