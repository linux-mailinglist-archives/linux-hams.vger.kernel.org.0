Return-Path: <linux-hams+bounces-241-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE58BDCED
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 10:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 655B91C2210D
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 08:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7033E13C83E;
	Tue,  7 May 2024 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SDqLOHt7"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD8D13C667
	for <linux-hams@vger.kernel.org>; Tue,  7 May 2024 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715069302; cv=none; b=c0WTgmbShx2+uKzUvlszZYivFx81j8j3NgP0K5apXmY7w5gTXKekpgAz4T27s8ZuJ55flZRs7agVtawkwowkN3QYGIt55fmqdVPNKq6KdbIxXcB/WXTLCEyXrP1A1sCaHLoN/42tPEFVHfOsJ696VHVvkJp7q61T7CMDeqSN4Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715069302; c=relaxed/simple;
	bh=Ddn1VNGItzdsWA45trh+gGxmlymXdQHn0cHiYXpmuHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1hKhB3Psoc8HpWwX/om/a2fDunfSUdbsWiuAJgqH9CqWBmLD+FnXmNbAAD+wTjgZlvoIGwqh8ubqi8/9dmqij/79T+IEgMqhmmgBFcTlErs7l1MlmDP3FEvfqxcMvAimmiZXouaywVE9FTGgP22QSIiY2Xx6D8eFUfYxsyX/N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SDqLOHt7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34f52fc2191so800322f8f.1
        for <linux-hams@vger.kernel.org>; Tue, 07 May 2024 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715069299; x=1715674099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JwnUMMgXN/Wsuo8wQ8xw0lvYZHuA8pjKO6osAN4WAm0=;
        b=SDqLOHt7dCI45kvQwLXxgzToIVid6VAE1pqeNt8x+7FGAlmmAWEaUzacNTopxvPAcY
         h2dOhjsLRLmA6XhcFedZyojW6rrjUK+JJz2mk+3o79DAWqk7LoSloZIACUzCW90d1x+7
         I74Bzl8ampQJPQJFQ1RIdp7bysYry8qBRLucsvQNNL5T3YBzHLOmm6MCOaSCI8+e7+C6
         gQn0taRvk8JlPQUPrpuNSTkHB7bQ+VyegxvadaK44pS3shU5U9zEvztid6sHfipmLG/M
         ooBFQqe+aejF6a70Vn59/ObFW/y72XwC3s4NRA5futZg9STSrOyKoLQeTr8o7oyZ4Ucp
         ZpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715069299; x=1715674099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwnUMMgXN/Wsuo8wQ8xw0lvYZHuA8pjKO6osAN4WAm0=;
        b=l0uIa0ReAbKjIgeQNukvNyAAEhVsztFM34OXRjWMuvKv9uX8aHQ6fF3+Lsf8Yw9O6x
         MHHWJp3aX/xSJZ/Ov1Ys5JHJyo8u4wXZx89rp2yCTrrIiPjOWC5248e6nheBwXcp1Wg7
         nqEdvF/JyguQH6uOktHxEkXPrlrky2QDNQmQIZHJbk/Ab02ViaLZ2JOZJF44fX/FJS+U
         wx/7bkWLqhifZxwDV6i0mWbISJZeI35+Q6r9MeEuBG2MoBKCbZR31L3LixibDOO0pKAs
         tONYgDC11fn1Vhz37Bz7d5h1t5NxsKwIBqcTZ/mk87E053xBWoR3LGKH5ArVRz2kb3S/
         g/3A==
X-Forwarded-Encrypted: i=1; AJvYcCWjF4rhYPA9bicl1Ejdsh9s4aAmLDuuSwz8Md9vh5EEm7+xRLtJ1ZpPfNa/U8WOpLABgC4uX3uqpgYDhGAaH6SsKtg5ulAESaI2Kg==
X-Gm-Message-State: AOJu0Yzxu9XxlmxhGTh8nnnYHBYQa8f/n5ltTx13n64d5/13WsRY/6Il
	gpYH967n8V1uOTM9kDTEt/MkF8MYDl0wvSubVMn4SFTgxx38x4LJXUNR6sJjuQA=
X-Google-Smtp-Source: AGHT+IHqmQLgl9Xz8cz4mPbBXMEtaAgjCTg++laQLsGNn99J2GLAx77yo3TSr95zHIwcTpNcgqKpPQ==
X-Received: by 2002:adf:f606:0:b0:34d:414:5f99 with SMTP id t6-20020adff606000000b0034d04145f99mr7323220wrp.25.1715069298429;
        Tue, 07 May 2024 01:08:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e30-20020a5d595e000000b0034e8784473dsm9418578wri.41.2024.05.07.01.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 01:08:18 -0700 (PDT)
Date: Tue, 7 May 2024 11:08:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, jreuter@yaina.de
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <79dc1067-76dc-43b2-9413-7754f96fe08e@moroto.mountain>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>
 <ekgwuycs3hioz6vve57e6z7igovpls6s644rvdxpxqqr7v7is6@u5lqegkuwcex>
 <1e14f4f1-29dd-4fe5-8010-de7df0866e93@moroto.mountain>
 <movur4qy7wwavdyw2ugwfsz6kvshrqlvx32ym3fyx5gg66llge@citxuw5ztgwc>
 <eb5oil2exor2bq5n3pn62575phxjdex6wdjwwjxjd3pd4je55o@4k4iu2xobel5>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb5oil2exor2bq5n3pn62575phxjdex6wdjwwjxjd3pd4je55o@4k4iu2xobel5>

On Mon, May 06, 2024 at 11:18:06PM -0400, Lars Kellogg-Stedman wrote:
> On Sat, May 04, 2024 at 06:16:14PM GMT, Lars Kellogg-Stedman wrote:
> > My original patch corrected this by adding the call to netdev_hold()
> > right next to the ax25_cb_add() in ax25_rcv(), which solves this
> > problem. If it seems weird to have this login in ax25_rcv, we could move
> > it to ax25_accept, right around line 1430 [3]; that would look
> > something like:
> 
> The same patch applies cleanly against the Raspberry Pi 6.6.30 kernel,
> and clears up the frequeny crashes I was experiencing in that
> environment as well.

I have reviewed this code some more.  My theory is:

ax25_dev_device_up() <- sets refcount to 1
ax25_dev_device_down() <- set refcount to 0 and frees it

If the refcount is not 1 at ax25_dev_device_down() then something is
screwed up.  So why do we even need more refcounting than that?  But
apparently we do.  I don't really understand networking that well so
maybe we can have lingering connections after the device is down.

So the next rule is if we set ax25->ax25_dev from NULL to non-NULL then
bump the refcount and decrement it if we set it back to NULL or we free
ax25. Right now that's happening in ax25_bind() and ax25_release().  And
also in ax25_kill_by_device() but not consistently.

But it needs to happen *everywhere* we set ax25->ax25_dev and we need to
decrement it when ax25 is freed in ax25_cb_put().  My patch is similar
to yours in that every ax25_rcv() will now bump the reference through
calling ax25_fillin_cb() or ax25_make_new().  The send path also bumps
the reference.

There are a few questions I don't know how to answer.  I added two
-EBUSY paths to this patch.  I'm not sure if this is correct.
Second, I don't understand the netdev_put(ax25_dev->dev, &s->dev_tracker);
stuff.  Maybe that should be done in ax25_dev_hold/put().

This patch might not work because of the netdev_hold/put() thing...

I used the Smatch cross function database to show where ax25->ax25_dev
is set to NULL/non-NULL.

$ smdb.py where ax25_cb ax25_dev | grep -v "min-max"
net/ax25/ax25_route.c          | ax25_rt_autobind               | (struct ax25_cb)->ax25_dev | 0-u64max
net/ax25/af_ax25.c             | ax25_kill_by_device            | (struct ax25_cb)->ax25_dev | 0-u64max
net/ax25/af_ax25.c             | ax25_fillin_cb                 | (struct ax25_cb)->ax25_dev | 0-u64max
net/ax25/af_ax25.c             | ax25_setsockopt                | (struct ax25_cb)->ax25_dev | 0-u64max
net/ax25/af_ax25.c             | ax25_make_new                  | (struct ax25_cb)->ax25_dev | 0-u64max
net/ax25/af_ax25.c             | ax25_bind                      | (struct ax25_cb)->ax25_dev | 4096-ptr_max
net/ax25/ax25_in.c             | ax25_rcv                       | (struct ax25_cb)->ax25_dev | 0-u64max
net/ax25/ax25_out.c            | ax25_send_frame                | (struct ax25_cb)->ax25_dev | 0-u64max

regards,
dan carpenter

diff --git a/include/net/ax25.h b/include/net/ax25.h
index eb9cee8252c8..2cc94352b13d 100644
--- a/include/net/ax25.h
+++ b/include/net/ax25.h
@@ -275,25 +275,30 @@ static inline struct ax25_cb *sk_to_ax25(const struct sock *sk)
 #define ax25_cb_hold(__ax25) \
 	refcount_inc(&((__ax25)->refcount))
 
-static __inline__ void ax25_cb_put(ax25_cb *ax25)
+static inline ax25_dev *ax25_dev_hold(ax25_dev *ax25_dev)
 {
-	if (refcount_dec_and_test(&ax25->refcount)) {
-		kfree(ax25->digipeat);
-		kfree(ax25);
-	}
+	if (ax25_dev)
+		refcount_inc(&ax25_dev->refcount);
+	return ax25_dev;
 }
 
-static inline void ax25_dev_hold(ax25_dev *ax25_dev)
+static inline void ax25_dev_put(ax25_dev *ax25_dev)
 {
-	refcount_inc(&ax25_dev->refcount);
+	if (ax25_dev && refcount_dec_and_test(&ax25_dev->refcount)) {
+		kfree(ax25_dev);
+	}
 }
 
-static inline void ax25_dev_put(ax25_dev *ax25_dev)
+static __inline__ void ax25_cb_put(ax25_cb *ax25)
 {
-	if (refcount_dec_and_test(&ax25_dev->refcount)) {
-		kfree(ax25_dev);
+	if (refcount_dec_and_test(&ax25->refcount)) {
+		if (ax25->ax25_dev)
+			ax25_dev_put(ax25->ax25_dev);
+		kfree(ax25->digipeat);
+		kfree(ax25);
 	}
 }
+
 static inline __be16 ax25_type_trans(struct sk_buff *skb, struct net_device *dev)
 {
 	skb->dev      = dev;
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 9169efb2f43a..4d1ab296d52c 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -92,6 +92,7 @@ static void ax25_kill_by_device(struct net_device *dev)
 				spin_unlock_bh(&ax25_list_lock);
 				ax25_disconnect(s, ENETUNREACH);
 				s->ax25_dev = NULL;
+				ax25_dev_put(ax25_dev);
 				ax25_cb_del(s);
 				spin_lock_bh(&ax25_list_lock);
 				goto again;
@@ -101,11 +102,8 @@ static void ax25_kill_by_device(struct net_device *dev)
 			lock_sock(sk);
 			ax25_disconnect(s, ENETUNREACH);
 			s->ax25_dev = NULL;
-			if (sk->sk_socket) {
-				netdev_put(ax25_dev->dev,
-					   &s->dev_tracker);
-				ax25_dev_put(ax25_dev);
-			}
+			netdev_put(ax25_dev->dev, &s->dev_tracker);
+			ax25_dev_put(ax25_dev);
 			ax25_cb_del(s);
 			release_sock(sk);
 			spin_lock_bh(&ax25_list_lock);
@@ -496,6 +494,7 @@ void ax25_fillin_cb(ax25_cb *ax25, ax25_dev *ax25_dev)
 	ax25->ax25_dev = ax25_dev;
 
 	if (ax25->ax25_dev != NULL) {
+		ax25_dev_hold(ax25->ax25_dev);
 		ax25_fillin_cb_from_dev(ax25, ax25_dev);
 		return;
 	}
@@ -685,6 +684,11 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 			break;
 		}
 
+		if (ax25->ax25_dev) {
+			rtnl_unlock();
+			res = -EBUSY;
+			break;
+		}
 		ax25->ax25_dev = ax25_dev_ax25dev(dev);
 		if (!ax25->ax25_dev) {
 			rtnl_unlock();
@@ -961,7 +965,7 @@ struct sock *ax25_make_new(struct sock *osk, struct ax25_dev *ax25_dev)
 	ax25->paclen  = oax25->paclen;
 	ax25->window  = oax25->window;
 
-	ax25->ax25_dev    = ax25_dev;
+	ax25->ax25_dev    = ax25_dev_hold(ax25_dev);
 	ax25->source_addr = oax25->source_addr;
 
 	if (oax25->digipeat != NULL) {
@@ -995,6 +999,11 @@ static int ax25_release(struct socket *sock)
 	sock_orphan(sk);
 	ax25 = sk_to_ax25(sk);
 	ax25_dev = ax25->ax25_dev;
+	/*
+	 * The ax25_destroy_socket() function decrements the reference but we
+	 * need to keep a reference until the end of the function.
+	 */
+	ax25_dev_hold(ax25_dev);
 
 	if (sk->sk_type == SOCK_SEQPACKET) {
 		switch (ax25->state) {
@@ -1147,6 +1156,12 @@ static int ax25_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 
 	if (ax25_dev) {
 		ax25_fillin_cb(ax25, ax25_dev);
+		/*
+		 * both ax25_addr_ax25dev() and ax25_fillin_cb() take a
+		 * reference but we only want to take one reference so drop
+		 * the extra reference.
+		 */
+		ax25_dev_put(ax25_dev);
 		netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
 	}
 
diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
index b7c4d656a94b..d7f6d9f4f20c 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -406,6 +406,10 @@ int ax25_rt_autobind(ax25_cb *ax25, ax25_address *addr)
 		ax25_route_lock_unuse();
 		return -EHOSTUNREACH;
 	}
+	if (ax25->ax25_dev) {
+		err = -EBUSY;
+		goto put;
+	}
 	if ((ax25->ax25_dev = ax25_dev_ax25dev(ax25_rt->dev)) == NULL) {
 		err = -EHOSTUNREACH;
 		goto put;

