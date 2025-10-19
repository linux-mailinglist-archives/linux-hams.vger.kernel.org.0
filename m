Return-Path: <linux-hams+bounces-654-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A659BEDE59
	for <lists+linux-hams@lfdr.de>; Sun, 19 Oct 2025 07:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDCBD4E4A39
	for <lists+linux-hams@lfdr.de>; Sun, 19 Oct 2025 05:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AD7217723;
	Sun, 19 Oct 2025 05:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="aSnfnSwi"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058813DDAE;
	Sun, 19 Oct 2025 05:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760850622; cv=none; b=LWVW6oiA08aWOu/fsyyY2SRqcgvNtqFV3cKieTVdgOykH8pRlEeXoAiPkyJVlFhiT4ZlPg0UbmZAWQHo5aS8NiJKfr1vV2XFqZ/RxTN3NSlOPzLD6f+kiblHyXrfrIkEi1GYS3tdCrHA0XY6Bw2Bee2HgOsVuv69kN69Or9KelQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760850622; c=relaxed/simple;
	bh=G2CTs3vnPjMMrWN2EU6z72rKoP+4d1zTIybdU9qs5oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHRdHo3q29VQ6YxxLyM3PPUFdBirhmZAJYAVgCt1THgLbZui9zfxfC41pGplsjaS6vUk0ipZLpW7kWQBly3L6f3xl8pKSKlG9/8wqzkqj37AEkb0uO1wuPAFsq0ihZ83lauDBQ9KZwbpVVbxixSoFHQj9fTb9Ped7cD90slGKvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=aSnfnSwi; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cq67j6YxZz9t8P;
	Sun, 19 Oct 2025 07:10:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1760850610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6L/GjYHsdmqPyxMtu5TIFeq3jQLCMFJdsIm1DALtdo=;
	b=aSnfnSwiYRxngwU9yuRRBX/mIg6yETDyjmRFGz0igpN0v/ZsybfD0k84RzI854euWL3EG6
	JnqD/hPgntNHm9Q/f2JIjGVRhomg9/zeOvtCsvYhX3YbarMsbjOtxuUinotZg9BEsXzGl4
	0KArWRvr8m669/JDyak/0jZ/fHkasLbX73VUYSEhy8rMkwNl7mbo6G5iCZYTgzJVsojG+z
	mNyN1KVBBCc+NZCNHK3mTPCxhV0thaTg3Q0qq08HAGVik8bGtosrx1bZekNZxEU3asLu0Y
	SbadlpVejhaA/WI0w5CcnVVKFZtQhCuL+fjYyc/L9ckZZHMMMBCURRjzExIYLA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=listout@listout.xyz
Date: Sun, 19 Oct 2025 10:40:03 +0530
From: Brahmajit Das <listout@listout.xyz>
To: syzbot <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in nr_add_node
Message-ID: <b5ontczz4n4gthaaeg6kfav3yaf25u4eax3uo46r44rcwap5hd@fpxvlsznasjp>
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
X-Rspamd-Queue-Id: 4cq67j6YxZz9t8P

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

#syz test linux-next

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

