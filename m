Return-Path: <linux-hams+bounces-730-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC37CC4911
	for <lists+linux-hams@lfdr.de>; Tue, 16 Dec 2025 18:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DDB63029B7D
	for <lists+linux-hams@lfdr.de>; Tue, 16 Dec 2025 17:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE4F3901FD;
	Tue, 16 Dec 2025 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DE3BNhOc"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10993901F1
	for <linux-hams@vger.kernel.org>; Tue, 16 Dec 2025 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889064; cv=none; b=cbtn8GZGQEHy7xkhIAzMn9UcctJSRfe1YwTzsaFqqCyYvupJvhK1M3vg06dbgU6E/OgCZMZwIKNWnQ78fNCv70zhJSgqeJC0mclQAjGzBa2t9M3OgB6j31Nt4/Q33NIT4OeDjDPkPBwTPvH0lkPmo4c3S1cyuwqTiHM24xnPSTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889064; c=relaxed/simple;
	bh=boIqxM+ov9nSjwgWpy63cnTTzp37ctPMetwDRjr716c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRe9IbXAkHCp4gpWYB3iN3UUNvOHOLVI5N4IPFH7DwVnqPUKF5tw9G4vF+Rz0/Pvavy+l9V9ypKZDx67CBG3hJGpR0pVYVCpQ9WwnO9evjbRqAnbz4RxGk3+YLu8+TnexxBwzCLWDaDEoBcrtrp+6CpDu7ubUlcoziGLnq5kIvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DE3BNhOc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so35354765e9.3
        for <linux-hams@vger.kernel.org>; Tue, 16 Dec 2025 04:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765889060; x=1766493860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/lTD5T6FLVPMFiI1zK6zOO1/qp2X5cLGG7vD5u13cD0=;
        b=DE3BNhOcc+HNQXvq2D9wHK7NIuewOffYSeXDSlTTjBkaAYU97BUwxMG9Bd17Vj04G0
         Udn8He0ZTL2b6WWpup21Pz65uKv9xFnVS7CsZ3CMMxLk4LdE+ORIqEU90QzUCeZoYY3E
         M93a4SOb9XP+Clv4+mIKU4Mp8YVXMRjFWFsAvF6zu11+Ni4hYptYb8CfRJTJBTud4Nwq
         C61+N5a2YmlS6bDZ/Ku2Q5wgp/hTUEegwISlmbTHBHBU5TMM+11ijwfMN4CfjDDiL/MH
         g4UfBRPjvF2wlxN0Xv8vHhKINDlp+zTZpBTb3GZCiCYQBxHLtYr5ITzGE3AKYiitxSzC
         1FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889060; x=1766493860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lTD5T6FLVPMFiI1zK6zOO1/qp2X5cLGG7vD5u13cD0=;
        b=WZKPIRFeAx6kmWrzSHQBlTne4k4kjByxbufZ1DIqy4UudZZAI4lFdDUB5BeX8wMe+7
         SsvaDdXahTPFc1RZYgMUXv71akQsDIL6EbtYGFY7iosDBryH3hpTKBNy1phuOyBPG2YE
         IvTsWUUpfzWpjyRlgA62/kkca1y2mFepxk9KQxTHONa+Cl/JiKqeJGWzyB372CLtIHcu
         QgwbSaVQd7Gl0hE317KntRDCXCyOL/WO02+CxHrCmH3z07mzRfE0hx+JRaxYJOj7wTQo
         afLHoimAwUWVnpvktOdmvfGHc5eqLOKc1sOX3qVOc+w3lWjkD4Odw87R2zvgIix+k+dY
         sfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs2iwgvO+Spg5opNJaNE/jE9nRnSLItuzbjK8rtk0wITGbKwdyJ0FteWk8WF2AX2RDl8Efts3IbzsY@vger.kernel.org
X-Gm-Message-State: AOJu0YxpXwW35G963n38o6LQut2Gab1nb0MmwfWkNrNbXsem2OyFNZSn
	Q2HJzrQMwAQhoy02nW62wD1sMMGwruMp5DQY96DZ6zioQKREfLA3EgpD00rNTlseQ3g=
X-Gm-Gg: AY/fxX4bYCETcvCU2vtUgd8cz9n67vk95raDcRjScR9tTssQrjpHJAHrinFyhKyDkSs
	C1gRPvnWi0A4ewzhF18U60kHUdCaUWpQI6aIjwIA6+J4zdzbFijHaeiH+3YZi8E5SSLZt980Epj
	EaQo9dUDOkdjVfjzu5oe7MQip7whrho0Zsia7gyyfqKOn8tzTJyWdLVxeL/5P8rDB1QKdAMo5pK
	Khh+OsTfQsiSjVrj7SKi9jKG/g5wwsVN13gmOuiEeB/p3Z3TtQWEwMiwix8/g3CxWuyLPPFOLRt
	vjWbtm93lnj0hyfNJR56ncTYmk5Z/5S4MjosjIKsNLHhffjh77Gb3LrFX1yNe+ap1uLmBX/fzBe
	1T5a142JgluMzF3IZRtKenY/N2ksEW0RDGI3AEQs+PwCMYsFqVgG4mPzZdjqOOJ190sFefsY/Q5
	GIBbL6gk3NM2IJNA==
X-Google-Smtp-Source: AGHT+IFW5qDickl4JAEFRsGArKDI6FcAB611ceysvy3jNS62BLSz150yvQDh+EMhh7oPcWPJX+4yHw==
X-Received: by 2002:a05:600c:3acf:b0:477:1bb6:17de with SMTP id 5b1f17b1804b1-47a8f90f96bmr152908605e9.30.1765889060304;
        Tue, 16 Dec 2025 04:44:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd95e0161sm9700215e9.2.2025.12.16.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:44:19 -0800 (PST)
Date: Tue, 16 Dec 2025 13:44:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hams@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] sysctl: Remove unused ctl_table forward declarations
Message-ID: <aUFUIfVvRcYN3_ID@pathway.suse.cz>
References: <20251215-jag-sysctl_fw_decl-v1-1-2a9af78448f8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-jag-sysctl_fw_decl-v1-1-2a9af78448f8@kernel.org>

On Mon 2025-12-15 16:25:19, Joel Granados wrote:
> Remove superfluous forward declarations of ctl_table from header files
> where they are no longer needed. These declarations were left behind
> after sysctl code refactoring and cleanup.
> 
> Signed-off-by: Joel Granados <joel.granados@kernel.org>

For the printk part:

Reviewed-by: Petr Mladek <pmladek@suse.com>

That said, I have found one more declaration in kernel/printk/internal.h.
It is there because of devkmsg_sysctl_set_loglvl() declaration.
But I think that a better solution would be:

diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index dff97321741a..27169fd33231 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -4,9 +4,9 @@
  */
 #include <linux/console.h>
 #include <linux/types.h>
+#include <linux/sysctl.h>
 
 #if defined(CONFIG_PRINTK) && defined(CONFIG_SYSCTL)
-struct ctl_table;
 void __init printk_sysctl_init(void);
 int devkmsg_sysctl_set_loglvl(const struct ctl_table *table, int write,
 			      void *buffer, size_t *lenp, loff_t *ppos);
diff --git a/kernel/printk/sysctl.c b/kernel/printk/sysctl.c
index bb8fecb3fb05..512f0c692d6a 100644
--- a/kernel/printk/sysctl.c
+++ b/kernel/printk/sysctl.c
@@ -3,7 +3,6 @@
  * sysctl.c: General linux system control interface
  */
 
-#include <linux/sysctl.h>
 #include <linux/printk.h>
 #include <linux/capability.h>
 #include <linux/ratelimit.h>

Feel free to add this into v2. Or we could do this in a separate patch.

Best Regards,
Petr

