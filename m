Return-Path: <linux-hams+bounces-97-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6008A087C
	for <lists+linux-hams@lfdr.de>; Thu, 11 Apr 2024 08:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C6C1F22813
	for <lists+linux-hams@lfdr.de>; Thu, 11 Apr 2024 06:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A474C13CF9F;
	Thu, 11 Apr 2024 06:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQsMAPaY"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F73E13B78E
	for <linux-hams@vger.kernel.org>; Thu, 11 Apr 2024 06:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712817100; cv=none; b=oUOYmKVJSB07SLYynT00rP2bs6oTDlKr02cLeOqNdd+RqFEst3thQqRRp0pcNiWf+4+4Y+7H5g0O0uSmscURG/JMzoQUEg+F2OcZQ1SMtjuIvKGEaYCPk4TRPKY/8maha7TEhdwDhTugv9tuQbYJiQaGSt7VQJc/POj7UTFdKl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712817100; c=relaxed/simple;
	bh=s3C8raci4AVF3uXCB+dYVuxaRj+DC2bCH58uEpdgd7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWDMA90v8Qat3mkVoNSVNSF76UixcqiEcVlt8hR3VYeDMujjRtimRt7bzTNbZRzKehcZmGqezLj3QeiM/bkC37CpewWEPtG788GsPVQOZkYwyHhgSOjw3ZX3fVSG7H2eg1ZVd0MV0K/xKDkXEXYiQpPgBvO8e+/x9TOc2pFccMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQsMAPaY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so917111a12.1
        for <linux-hams@vger.kernel.org>; Wed, 10 Apr 2024 23:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712817097; x=1713421897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=deqzoDDzHr9OMsTauJR8GDqGIt7oB5tbuV/LrNaU7jc=;
        b=AQsMAPaYgKuY1OXgklQfiABnpXNF0bQy+oafflxaI7VuR6jZEs4kYNOCQNxvy0Fk5H
         nJIVBqwhptnzHYZH2E1sQlhCuIyXalDkBdxzFUVhH0DjHNMTk7FARdWVrJY82zoLyDo6
         zuBczNFmb6iKLCKz/+EEeNAWeHjfUhS+Diof4CDyL60JbUmvJ2/19IaTOmxwqYLWowuB
         GT/zJiMq+nDV4bpSNCTEfCLP9AD2FO+Ct8WLMTNr5QL73nqIRnpVK5rYf7Yt6SAc/JDc
         JP/OG5+OtfyIax71MB5Gh1vr33srbeycriZ8tmEtv4sxTreBMBtDcb0OpnZIJ1sNz9Rz
         BndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712817097; x=1713421897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deqzoDDzHr9OMsTauJR8GDqGIt7oB5tbuV/LrNaU7jc=;
        b=mNG+/URtn5/B0wM0nEL3kkIVtX381bpbGnLFTIWXIxbmo7q+cWSJTrl0n5+TabMBIA
         4ru2NXcpEIfQ6gHRS1qyf/eb/X7OHzabYEAxBMYgp+jjUch9CxbeYO6JdbmxH3/ZzIby
         G1+PgJgHvbferNAfoW+ADoNFDQF59yfTeef+eCSWQ5pYemOzpcX307FKpGOUmRRPZQzZ
         7uP1Q2Mup5EmqzPlsUWa8duNaXnkzgzsjybYJ5EmVtctUwvDJxLHO0LqlmGt2jLbuuH9
         P7kKfrONs9kXzIPTngt8DMOMxyorvDS1MdsDLOu0gLr0DIll7xsYsRRqc/BUQMGU+dPa
         KnRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXb5ciN/1221yebk08tCCURBNzCJeOZgMiCTwUdgHeE9rX+FNQj6BwbaQRV8Juy8j+Vb7aKKPodjQwFnXLuC34YUnJ5ALmSeQB6g==
X-Gm-Message-State: AOJu0YxYtOzBq4mYSRjIDPRyQcFv1+xJLZ8bbx2k+SZOmJMGE7X/Pznz
	y5zCIn4cLYu7MYNy8YLJXjGR2D0mXPpUgj8IcYrxKOxEwBP491t+Wz/jBY9dsYI=
X-Google-Smtp-Source: AGHT+IEhKi4YNF46bvG4YA1Eaq+nocFJ2RLqPPyYDE2tmsxqL58Mc+p9cJ2GHoCMxwIeN2nnHSIuBA==
X-Received: by 2002:a17:906:71d7:b0:a47:1f61:4d02 with SMTP id i23-20020a17090671d700b00a471f614d02mr1129073ejk.36.1712817096595;
        Wed, 10 Apr 2024 23:31:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id g8-20020a17090670c800b00a52244ab819sm172481ejk.170.2024.04.10.23.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 23:31:36 -0700 (PDT)
Date: Thu, 11 Apr 2024 09:31:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sam Sun <samsun1006219@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-hams@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
	jreuter@yaina.de, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>, syzkaller-bugs@googlegroups.com,
	xrivendell7@gmail.com
Subject: Re: [Linux kernel bug] WARNING in ax25_dev_device_down
Message-ID: <26760fb7-a2d8-4cb5-9c47-3f91016a9a7a@moroto.mountain>
References: <CAEkJfYNYe5tSMfAn9K_zJ1O_Vu7jxJDZv_uYCgTW=NZiUzcAuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEkJfYNYe5tSMfAn9K_zJ1O_Vu7jxJDZv_uYCgTW=NZiUzcAuw@mail.gmail.com>

On Tue, Apr 09, 2024 at 10:02:49PM +0800, Sam Sun wrote:
> Dear developers and maintainers,
> 
> We encountered a kernel warning in function ax25_dev_device_down
> during testing using our modified syzkaller. It is tested against the
> latest upstream linux (6.9-rc3). C repro and kernel config are
> attached to this email. Kernel log is listed below.
> ```
> WARNING: CPU: 0 PID: 8121 at lib/ref_tracker.c:255
> ref_tracker_free+0x610/0x830 lib/ref_tracker.c:255
> Modules linked in:
> CPU: 0 PID: 8121 Comm: syz-executor329 Not tainted 6.7.0-rc7 #2
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> RIP: 0010:ref_tracker_free+0x610/0x830 lib/ref_tracker.c:255
> Code: 00 00 44 8b 73 18 31 ff 44 89 f6 e8 7a 58 fe fc 45 85 f6 0f 85
> a7 00 00 00 e8 4c 5c fe fc 4c 89 ee 48 89 ef e8 11 0a e5 05 90 <0f> 0b
> 90 41 bd ea ff ff ff e9 51 fd ff ff e8 2d 5c fe fc 4c 8d 75
> RSP: 0018:ffffc900029bf8b8 EFLAGS: 00010286
> RAX: 0000000080000000 RBX: ffff888106185480 RCX: 0000000000000000
> RDX: 0000000000000001 RSI: 0000000000000001 RDI: 0000000000000001
> RBP: ffff8881136c85b8 R08: 0000000000000001 R09: fffffbfff23e8bd1
> R10: 0000000000000001 R11: 0000000000000001 R12: 1ffff92000537f19
> R13: 0000000000000292 R14: 00000000067a01d1 R15: ffff888106185498
> FS:  0000555556e663c0(0000) GS:ffff888063a00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fc148041ba8 CR3: 0000000016374000 CR4: 0000000000750ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  netdev_tracker_free include/linux/netdevice.h:4127 [inline]
>  netdev_put include/linux/netdevice.h:4144 [inline]
>  netdev_put include/linux/netdevice.h:4140 [inline]
>  ax25_dev_device_down+0x2bc/0x420 net/ax25/ax25_dev.c:140
                                                       ^^^^

The locking in ax25_dev_device_down() seems pretty suspect.

It takes:
	ax25_dev = ax25_dev_ax25dev()
then it takes the &ax25_dev_lock, then it drops the lock, then on line
140 mentioned in this stack trace it calls:

	netdev_put(dev, &ax25_dev->dev_tracker);

That can race with ax25_dev_free() which has proper locking.  The
temptation is to do something like this, but I don't know this code well
and can't test it.

regards,
dan carpenter

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 282ec581c072..68c2945d6051 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -97,13 +97,15 @@ void ax25_dev_device_down(struct net_device *dev)
 {
 	ax25_dev *s, *ax25_dev;
 
-	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
+	spin_lock_bh(&ax25_dev_lock);
+
+	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL) {
+		spin_unlock_bh(&ax25_dev_lock);
 		return;
+	}
 
 	ax25_unregister_dev_sysctl(ax25_dev);
 
-	spin_lock_bh(&ax25_dev_lock);
-
 #ifdef CONFIG_AX25_DAMA_SLAVE
 	timer_shutdown_sync(&ax25_dev->dama.slave_timer);
 #endif
@@ -128,17 +130,17 @@ void ax25_dev_device_down(struct net_device *dev)
 
 		s = s->next;
 	}
-	spin_unlock_bh(&ax25_dev_lock);
 	dev->ax25_ptr = NULL;
 	ax25_dev_put(ax25_dev);
+	spin_unlock_bh(&ax25_dev_lock);
 	return;
 
 unlock_put:
-	spin_unlock_bh(&ax25_dev_lock);
 	ax25_dev_put(ax25_dev);
 	dev->ax25_ptr = NULL;
 	netdev_put(dev, &ax25_dev->dev_tracker);
 	ax25_dev_put(ax25_dev);
+	spin_unlock_bh(&ax25_dev_lock);
 }
 
 int ax25_fwd_ioctl(unsigned int cmd, struct ax25_fwd_struct *fwd)

