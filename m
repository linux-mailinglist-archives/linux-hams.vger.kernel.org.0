Return-Path: <linux-hams+bounces-186-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75A8B95DC
	for <lists+linux-hams@lfdr.de>; Thu,  2 May 2024 09:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F54C1C20F43
	for <lists+linux-hams@lfdr.de>; Thu,  2 May 2024 07:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FF44CB35;
	Thu,  2 May 2024 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bB1+ngLp"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92634174C
	for <linux-hams@vger.kernel.org>; Thu,  2 May 2024 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714636611; cv=none; b=EvIIk7u8ZEmGIvqwCHi0wZuzueri6JJDhHg3DIrFWADST453rKBXdFd5mP8k9SoAQUcMpNxUdJimhnykdpsjgRqVnTovBboNM4RP68Nqes/Ac0adev60N6vlC7o/U9NLHJGfTaFvreYx2+SYxfqX/k4gtfhKnSTB+adCvP7t9FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714636611; c=relaxed/simple;
	bh=7yHUReQVpBbuF59WgVxqcgBxLTriwnNY9V4A/86EQqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDqmUH1sewrhcC1ixDjKQnH2hnxubPUvin8zztHySGNfu6XI6oOw2FIQHlE6zMjs9U+4A8DqwubOR53SQTPaOprnSE5nuQAOo9nXNK9EW4zVT8VSDlF6K+DcHVRVYLdjgZyUuIg63f6mUpVv2BO9S2PnU0A+bNUY+gNex12XPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bB1+ngLp; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2dd615b6c44so85241331fa.0
        for <linux-hams@vger.kernel.org>; Thu, 02 May 2024 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714636608; x=1715241408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O2K7W10bUuhGIOY6LbVf5zRLSo3TolQftZm0XAlBBVE=;
        b=bB1+ngLpOKsPIRqtatn9z6eQOKUuH9HVr/KcdiVq2B7vZlxpt4Fqun7SlolesZ8EKm
         B3ca1BFa1E8AWUTzmaIwLdBTAQSXmalLTbq1qUYNxyxiKsDUXLnqHOdYPlgVdujbfRDq
         W/r3F5ryoOUc61zYz8rwGUT78EYJ2PKW0bX5uqWeezqEWxH1BJt7o4ufcFBwXX9VKvne
         9RvVftDfTxt3XmDMrUjh6tyNmeIxD2A6dRtTEVUGpLea1+e2aDpx8ZsbPwSzBVnytqYl
         H4oB0vlrTYgRMaNZIAMogRMPrPd7VOwzMBTEaQG8LUNciIOY+haPxQ//DerOsV47gkbR
         Byag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714636608; x=1715241408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2K7W10bUuhGIOY6LbVf5zRLSo3TolQftZm0XAlBBVE=;
        b=k8HWpKFTyDZvmB2jGSDySeck30EE0m4a3Si/Z/gjSeNFRFkHzl30PuY3/27cMqViWy
         6XFetvUk1lIaBzt+u5t61zuK+PALDd/Yc84i1ZCsMA2KUynK/bfe+KJ4+8R7/OQByhhq
         AxCpitLX8aejmvBlA87RW5fl2FOUBs6OVYL2G/OhcvncRJ1vv1jmaC3PR7JQAT2QN5EB
         1IEbMsWXVaU7bSODOEMxl68EysWK0MQqOH9ppIlMPvSxgJV/fXDxlhTM00KNqCLR3AQT
         IyTLjToKCxkFn0XRpUGebTtzdusn8i1hTqogzdkgXmh+lcHLdfRQnsgPKRZSgJDwfXFk
         MxwQ==
X-Gm-Message-State: AOJu0Yw8X3m2p8INAB3MnhLZa47ef1N+1lcKEnvxmNjyYL/PKDBKxfcd
	1CUxaCPr2AFmqKGn1+LJQNt2vIvATWkv8lM/J8g3Ad2rjju2XYk8nbUGl+Imy2c=
X-Google-Smtp-Source: AGHT+IG4eu72+9YmFm7RNA3TZngr6D6gFdgVwSM5kAeMoCWbd4wSkocjjJm4rpizJdh+aX/XE/7fyA==
X-Received: by 2002:a2e:3201:0:b0:2df:6cb8:c92f with SMTP id y1-20020a2e3201000000b002df6cb8c92fmr2508931ljy.23.1714636607767;
        Thu, 02 May 2024 00:56:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id z11-20020a2e884b000000b002d816c0500asm85707ljj.118.2024.05.02.00.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 00:56:47 -0700 (PDT)
Date: Thu, 2 May 2024 10:56:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: duoming@zju.edu.cn
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, jreuter@yaina.de,
	lars@oddbit.com, Miroslav Skoric <skoric@uns.ac.rs>
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <8767454a-2d5a-4c6d-b887-440047c9bc5b@moroto.mountain>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <7fcfdc9a-e3f3-49a1-9373-39b5ad745799@moroto.mountain>
 <1402dfc8.20a4b.18f37963e87.Coremail.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402dfc8.20a4b.18f37963e87.Coremail.duoming@zju.edu.cn>

On Thu, May 02, 2024 at 12:35:44PM +0800, duoming@zju.edu.cn wrote:
> On Wed, 1 May 2024 20:43:37 +0300 Dan Carpenter wrote:
> > I'm always happy to take credit for stuff but the Reported by should go
> > to Lars and Miroslav.
> > 
> > Reported-by: Lars Kellogg-Stedman <lars@oddbit.com>
> > Reported-by: Miroslav Skoric <skoric@uns.ac.rs>
> 
> This patch is not related with the problem raised by Lars Kellogg-Stedman
> and Miroslav Skoric, it only solves the reference counting leak issues of
> ax25_dev in ax25_addr_ax25dev() and ax25_dev_device_down(). So I think
> there is no need to change the "Reported by" label.
> 

Ah...  I was really hoping it was related to the other bugs.

Okay, what about we separate this into different patches one for each
bug?  The changes to ax25_addr_ax25dev() and ax25_dev_free() are
obvious and could go in as-is but as two separate patches.

The changes to ax25_dev_device_up/down() are more subtle.

The ax25_dev_list stuff is frustrating.  It would be so much easier if
it were a normal list and you could just do:

        /*
         *      Remove any packet forwarding that points to this device.
         */
        list_for_each_entry(s, ax25_dev_list, list) {
                if (s->forward == dev)
                        s->forward = NULL;
        }

        list_for_each_entry(s, ax25_dev_list, list) {
                if (s == ax25_dev) {
                        list_del(s);
                        free_net = true;
                        break;
                }
        }

        spin_unlock_bh(&ax25_dev_lock);
        dev->ax25_ptr = NULL;
        if (free_net)
                netdev_put(dev, &ax25_dev->dev_tracker);
        ax25_dev_put(ax25_dev);
}

Why do we call netdev_put() on that one path?  Btw, here is an untested
conversion to lists...

regards,
dan carpenter

diff --git a/include/net/ax25.h b/include/net/ax25.h
index 0d939e5aee4e..c2a85fd3f5ea 100644
--- a/include/net/ax25.h
+++ b/include/net/ax25.h
@@ -216,7 +216,7 @@ typedef struct {
 struct ctl_table;
 
 typedef struct ax25_dev {
-	struct ax25_dev		*next;
+	struct list_head	list;
 
 	struct net_device	*dev;
 	netdevice_tracker	dev_tracker;
@@ -330,7 +330,6 @@ int ax25_addr_size(const ax25_digi *);
 void ax25_digi_invert(const ax25_digi *, ax25_digi *);
 
 /* ax25_dev.c */
-extern ax25_dev *ax25_dev_list;
 extern spinlock_t ax25_dev_lock;
 
 #if IS_ENABLED(CONFIG_AX25)
diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 282ec581c072..b632af38f1e1 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -22,11 +22,12 @@
 #include <net/sock.h>
 #include <linux/uaccess.h>
 #include <linux/fcntl.h>
+#include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
 
-ax25_dev *ax25_dev_list;
+static struct list_head ax25_dev_list;
 DEFINE_SPINLOCK(ax25_dev_lock);
 
 ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
@@ -34,11 +35,12 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
 	ax25_dev *ax25_dev, *res = NULL;
 
 	spin_lock_bh(&ax25_dev_lock);
-	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
+	list_for_each_entry(ax25_dev, &ax25_dev_list, list) {
 		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
 			res = ax25_dev;
 			ax25_dev_hold(ax25_dev);
 		}
+	}
 	spin_unlock_bh(&ax25_dev_lock);
 
 	return res;
@@ -52,6 +54,10 @@ void ax25_dev_device_up(struct net_device *dev)
 {
 	ax25_dev *ax25_dev;
 
+	// FIXME: do call this in probe or something
+	if (!ax25_dev_list.next)
+		INIT_LIST_HEAD(&ax25_dev_list);
+
 	ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL);
 	if (!ax25_dev) {
 		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
@@ -85,8 +91,7 @@ void ax25_dev_device_up(struct net_device *dev)
 #endif
 
 	spin_lock_bh(&ax25_dev_lock);
-	ax25_dev->next = ax25_dev_list;
-	ax25_dev_list  = ax25_dev;
+	list_add(&ax25_dev->list, &ax25_dev_list);
 	spin_unlock_bh(&ax25_dev_lock);
 	ax25_dev_hold(ax25_dev);
 
@@ -111,23 +116,18 @@ void ax25_dev_device_down(struct net_device *dev)
 	/*
 	 *	Remove any packet forwarding that points to this device.
 	 */
-	for (s = ax25_dev_list; s != NULL; s = s->next)
+	list_for_each_entry(s, &ax25_dev_list, list) {
 		if (s->forward == dev)
 			s->forward = NULL;
-
-	if ((s = ax25_dev_list) == ax25_dev) {
-		ax25_dev_list = s->next;
-		goto unlock_put;
 	}
 
-	while (s != NULL && s->next != NULL) {
-		if (s->next == ax25_dev) {
-			s->next = ax25_dev->next;
+	list_for_each_entry(s, &ax25_dev_list, list) {
+		if (s == ax25_dev) {
+			list_del(&s->list);
 			goto unlock_put;
 		}
-
-		s = s->next;
 	}
+
 	spin_unlock_bh(&ax25_dev_lock);
 	dev->ax25_ptr = NULL;
 	ax25_dev_put(ax25_dev);
@@ -200,16 +200,13 @@ struct net_device *ax25_fwd_dev(struct net_device *dev)
  */
 void __exit ax25_dev_free(void)
 {
-	ax25_dev *s, *ax25_dev;
+	ax25_dev *s, *n;
 
 	spin_lock_bh(&ax25_dev_lock);
-	ax25_dev = ax25_dev_list;
-	while (ax25_dev != NULL) {
-		s        = ax25_dev;
-		netdev_put(ax25_dev->dev, &ax25_dev->dev_tracker);
-		ax25_dev = ax25_dev->next;
+	list_for_each_entry_safe(s, n, &ax25_dev_list, list) {
+		netdev_put(s->dev, &s->dev_tracker);
+		list_del(&s->list);
 		kfree(s);
 	}
-	ax25_dev_list = NULL;
 	spin_unlock_bh(&ax25_dev_lock);
 }



