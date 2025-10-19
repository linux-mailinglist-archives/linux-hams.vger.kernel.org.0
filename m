Return-Path: <linux-hams+bounces-652-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A97BBEDE41
	for <lists+linux-hams@lfdr.de>; Sun, 19 Oct 2025 07:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB7243E267D
	for <lists+linux-hams@lfdr.de>; Sun, 19 Oct 2025 05:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049551D5170;
	Sun, 19 Oct 2025 05:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="mj89XPIy"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252B6354AEE;
	Sun, 19 Oct 2025 05:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760850197; cv=none; b=kRbajK33kVmV3E+kLFJm+PWjZA65FxdxaNtIvsSTy728/XVF9WvWm4iDdi/on8pPZx7alRrxFXYNDvDPypiqUIuaDU+14hQl9ZPGcmRMKQxcP8ZIj72JoyS2URhGbK1q1BS4Tg9Z/2gojJdtj6LYePAsZwmp/pNgne55xY/+AQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760850197; c=relaxed/simple;
	bh=KQl6LradGBXGbK046vAJzFCnddfIB6HOF7gtZt0jLQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4kCO8/sMOPdk0m7L9/AcJs+xm0AF8BWuhtqdlLk4TOzIYLPDZRBCyOcC2wjxNaO+JeXB1Az+knr9MP4o7EABCA9UcsNkvYHQrBbuPzALNtJ5sCCZmpt8UcD2i3uQi7pJZKzIYhagP8udKp5svQ16GohIvJW5t2KaACGc+nihsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=mj89XPIy; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cq5zY33yLz9snK;
	Sun, 19 Oct 2025 07:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1760850185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2Na2KMQAfCj8URLGNpNctjPu8017zoVfObesr/qRFk=;
	b=mj89XPIyj4LdNdsvlKxEWIrtwnr3TY+SxI7osVnl77Mb3WS5nAQvmCpoMHaW2rH4te809y
	XpQNbdbDS7BIudSYT2nazdQRtzGJxzstOs7ePX+vRPh/o5b1mlAZCUsiac5I5KnTmHq2Er
	ba/Xq9LLnIRRPMlV+QNEEVWQms5Hn+KQqcYJqoxi3sllC6kDRc/vPCzp992qYlx+9P9cEs
	VDT9q+zxhmLMg0Id+fKNEJJ5eNVUUEgkXqGvfg9hQUj9jbwCcMrY0cXiOLjC5XAgqd0VYx
	oWnOooNBcNzfAA8BOgzwAlOo1/NQgZwVf69Uuy/VKZ7C17XLW0jFwXqA7vYEQA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=listout@listout.xyz
Date: Sun, 19 Oct 2025 10:32:54 +0530
From: Brahmajit Das <listout@listout.xyz>
To: syzbot <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in nr_add_node
Message-ID: <u5ck7lywwa3aa54w2wnfftzqfch3pr6eguayue5ljvsneefd5x@swt7jxbxaeur>
References: <68d56f4d.050a0220.25d7ab.0047.GAE@google.com>
 <68f3fa8a.050a0220.91a22.0433.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68f3fa8a.050a0220.91a22.0433.GAE@google.com>
X-Rspamd-Queue-Id: 4cq5zY33yLz9snK

On 18.10.2025 13:37, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    f406055cb18c Merge tag 'arm64-fixes' of git://git.kernel.o..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11cf767c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
> dashboard link: https://syzkaller.appspot.com/bug?extid=2860e75836a08b172755
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=155f1de2580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b6b52f980000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-f406055c.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a4db2a99bfb1/vmlinux-f406055c.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/91d1ca420bac/bzImage-f406055c.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+2860e75836a08b172755@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248
> Read of size 4 at addr ffff888054b8cc30 by task syz.3.7839/22393
> 

#syz test

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..5fa7d9febbbb 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -245,7 +245,9 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 				nr_node->routes[2].neighbour->count--;
 				nr_neigh_put(nr_node->routes[2].neighbour);
 
-				if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
+				if (nr_node->routes[2].neighbour &&
+				    nr_node->routes[2].neighbour->count == 0 &&
+				    !nr_node->routes[2].neighbour->locked)
 					nr_remove_neigh(nr_node->routes[2].neighbour);
 
 				nr_node->routes[2].quality   = quality;

-- 
Regards,
listout

