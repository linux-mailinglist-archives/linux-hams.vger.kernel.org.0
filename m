Return-Path: <linux-hams+bounces-666-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB186BF2D64
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 19:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F5B34235A6
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 17:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70E13328F7;
	Mon, 20 Oct 2025 17:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckMa2meL"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7DE332EC7
	for <linux-hams@vger.kernel.org>; Mon, 20 Oct 2025 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983172; cv=none; b=pljUuBPN0crIonpzbMvNYyGYyxu26entf6q00CcA8TIpnxFsWs6g3+bjo06jcuziBQ/YpVim94YDdndX1RVjzELUvUNxI0EecLQflWbgv+BJnxx4glTgzAZ4clY2JVQPgaBZqxPT1wQh5zxLFZHKO+1vQykDi/gDItf/hurjJ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983172; c=relaxed/simple;
	bh=KSaItg7owfwMA4E/6gJC21JmHwkSPxOVuYXpwaVH8eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdqHinJsUeZsuQeeG2wLR79L0vwlSk84zCwg4fiV4Ib3L0IHsqzUADuM/Uyg4wHwHpGQynOsmNbHzf4rNaJFv4CxeyPZQRslFDEK9zR1ojJjm7yjLU397GQrhzVjENqtPp7knaR9c4gACzaEpJLFgvVzZggBqYqCLJWL4UqwGH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckMa2meL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42557c5cedcso2576054f8f.0
        for <linux-hams@vger.kernel.org>; Mon, 20 Oct 2025 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760983169; x=1761587969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BBIpzP5plYQbXfXPYKWyaixauHg0jqN/NWqmZVZnNC0=;
        b=ckMa2meL3YPvWDcGwBK+YxZErpGCddB46OFWhK2kz//Y7OXWaoplOQkNAUnmuUlwhT
         UwUO6qTztXkgLnBUOXTeLpklIcjZRjsDO3IEU+AFS+JJqIA+a7HDyMCYG9HvBLEydabR
         /4o4ZqrEgoLWcIok+8h01A1f9lIWHwlSzU3eTBwV+uSlRlLscuKyMxK5QJ0ybL50ZE1+
         +gOWFTSqXucUWRMvQP8qZKVsNowus5gAKTCoJlW/pXj56ZH3kR4aqo9AaAS6HdWjr3DJ
         TOwLL3ppprrSfziX5fJ85idP8N87tMXbhB9xh/CYvHlmiLKf7uFZ8bD4plCSecztaNnJ
         zCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983169; x=1761587969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBIpzP5plYQbXfXPYKWyaixauHg0jqN/NWqmZVZnNC0=;
        b=QgWLI0EwnC+WchM3uwPDMQnvlbRNRbY4DWdvvH6IK/XTmOyKdLqRbG/m+65g2KC31C
         NvCYX7FEPOJVH8UUOd7PkADlMinSWnQVSCTqO/dcmqNutfy3dypDxW5Z7xSojpLZIn4C
         KuOOUOa8ooVhvf3XFEaNJH96FMju8X8b3yVPCAEq/LxZACrWNJuFzmBscJgH9Yhgq0mb
         ti87gz2n+YmvfJfyKMT0peJN4snxKv8ypcOkDUZ6lKYIkLXyflQK3yZotje/SMyk4YEK
         n6DOa+0tEmcycslOx1xXBp5bHJiXLKVi+gOj+TdZWw7eDgp0NTlQ9UoU2cYRCvAl2/gN
         lPcg==
X-Forwarded-Encrypted: i=1; AJvYcCVwKqaB1GP7nNm2FLG8FOohBuyRCyBMG73nAR0n/xcRBZw0mZ7e+rBEQ9GSntuWB5+YtXwpOaR33Q1i@vger.kernel.org
X-Gm-Message-State: AOJu0YzUv1OC3e4+RZjWfhvoo5RRzw1M2+U8mlvOnOtM3xXukVhxo0cR
	7R0vp91JqDIC/fbSUiQxMkhYQK0ws+UGEnatCARJrzd+igxndrxxgvgGHn0wVOH+34w=
X-Gm-Gg: ASbGncu1LAPdMVEqnI6laos7qJ0z88+9wzcWd1k1dpNaFmnP7t1rtTgvQSavO2j4Wx9
	7k07/aIPrKjXNoxJbn2sACLKZzEKkhiccd9PgcXlnbBSNxHECsxWUKb0LsqmtQi0JSSBbkJg/QL
	92GjYzk6thAwuNhe0y+mHOuhI7zmC83Sq2KPwsyemWpX45P0wQbO1mr53/HkTO6zL5CL3O+4DIH
	X2B0ZGcmtj/tKA/tF+TFkxMETQNnlkCmfMIf3pejRce/duG44bbLgKVorBTYVOdkFKX2GZ3fT+5
	GAR4E6JZpqkLOwKleQNqWzCBuqWCgcS1ISQOb+nmzcpyrIvWPaQ5qfW77feLUgA4kmXFmc9YY7G
	SGplG1w4A4R014wSrCBbY1RGrJY8K5WY93chhSlgg0NCqFwiS3K8kqRe89cGdYVgc1RBZvSn0kO
	h/+ab4l+VE/Pd+5wk=
X-Google-Smtp-Source: AGHT+IEve3rptaTxAGdVVvZ3C2zYTFALcxP2rlbTlJDOAnuR0ODFvI8Ya+F1oDNmVuli022ySOULYw==
X-Received: by 2002:a05:6000:2881:b0:427:1ba4:de9e with SMTP id ffacd0b85a97d-4271ba4dfdemr7326245f8f.63.1760983168883;
        Mon, 20 Oct 2025 10:59:28 -0700 (PDT)
Received: from localhost ([41.210.143.179])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ce06bsm16113493f8f.45.2025.10.20.10.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:59:28 -0700 (PDT)
Date: Mon, 20 Oct 2025 20:59:24 +0300
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
Message-ID: <aPZ4fLKBiCCIGr9e@stanley.mountain>
References: <20251020133456.3564833-1-lizhi.xu@windriver.com>
 <20251020134912.3593047-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020134912.3593047-1-lizhi.xu@windriver.com>

On Mon, Oct 20, 2025 at 09:49:12PM +0800, Lizhi Xu wrote:
> On Mon, 20 Oct 2025 21:34:56 +0800, Lizhi Xu wrote:
> > > Task0					Task1						Task2
> > > =====					=====						=====
> > > [97] nr_add_node()
> > > [113] nr_neigh_get_dev()		[97] nr_add_node()
> > > 					[214] nr_node_lock()
> > > 					[245] nr_node->routes[2].neighbour->count--
> > > 					[246] nr_neigh_put(nr_node->routes[2].neighbour);
> > > 					[248] nr_remove_neigh(nr_node->routes[2].neighbour)
> > > 					[283] nr_node_unlock()
> > > [214] nr_node_lock()
> > > [253] nr_node->routes[2].neighbour = nr_neigh
> > > [254] nr_neigh_hold(nr_neigh);							[97] nr_add_node()
> > > 											[XXX] nr_neigh_put()
> > >                                                                                         ^^^^^^^^^^^^^^^^^^^^
> > > 
> > > These charts are supposed to be chronological so [XXX] is wrong because the
> > > use after free happens on line [248].  Do we really need three threads to
> > > make this race work?
> > The UAF problem occurs in Task2. Task1 sets the refcount of nr_neigh to 1,
> > then Task0 adds it to routes[2]. Task2 releases routes[2].neighbour after
> > executing [XXX]nr_neigh_put().
> Execution Order:
> 1 -> Task0
> [113] nr_neigh_get_dev() // After execution, the refcount value is 3
> 
> 2 -> Task1
> [246] nr_neigh_put(nr_node->routes[2].neighbour);   // After execution, the refcount value is 2
> [248] nr_remove_neigh(nr_node->routes[2].neighbour) // After execution, the refcount value is 1
> 
> 3 -> Task0
> [253] nr_node->routes[2].neighbour = nr_neigh       // nr_neigh's refcount value is 1 and add it to routes[2]
> 
> 4 -> Task2
> [XXX] nr_neigh_put(nr_node->routes[2].neighbour)    // After execution, neighhour is freed
> if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)  // Uaf occurs this line when accessing neighbour->count

Let's step back a bit and look at the bigger picture design.  (Which is
completely undocumented so we're just guessing).

When we put nr_neigh into nr_node->routes[] we bump the nr_neigh_hold()
reference count and nr_neigh->count++, then when we remove it from
->routes[] we drop the reference and do nr_neigh->count--.

If it's the last reference (and we are not holding ->locked) then we
remove it from the &nr_neigh_list and drop the reference count again and
free it.  So we drop the reference count twice.  This is a complicated
design with three variables: nr_neigh_hold(), nr_neigh->count and
->locked.  Why can it not just be one counter nr_neigh_hold().  So
instead of setting locked = true we would just take an extra reference?
The nr_neigh->count++ would be replaced with nr_neigh_hold() as well.

Because that's fundamentally the problem, right?  We call
nr_neigh_get_dev() so we think we're holding a reference and we're
safe, but we don't realize that calling neighbour->count-- can
result in dropping two references.

regards,
dan carpenter


