Return-Path: <linux-hams+bounces-653-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A79BEDE50
	for <lists+linux-hams@lfdr.de>; Sun, 19 Oct 2025 07:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54EA3E38D8
	for <lists+linux-hams@lfdr.de>; Sun, 19 Oct 2025 05:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E39B217723;
	Sun, 19 Oct 2025 05:10:15 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6F71EE7B9
	for <linux-hams@vger.kernel.org>; Sun, 19 Oct 2025 05:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760850615; cv=none; b=CJasXEEtIkH7j8KR6ydNsTLkKXWT60JIWV53ldmiVORkQXkozRXeQzWLzDd3XBWMJrjaNBC3mPGJt6IgnUzBgPd+pZdij63JFrYthV4g25eLn7wNArNr67TNuUSaM1m1XfVSnKW2OXorLwyQmEK4JuTWw40dNbVQM00zaEl8bF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760850615; c=relaxed/simple;
	bh=tCqMt7/vf/yrf9YNtSHqglKRCUWS2Cu3wk1rlIEyfhg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=JvH/aKwunloHb2yMa1HAAmmhBaFzXpEOu1ucTPrftrgELhknqnY1j5sucFlXqP+pjC8OzjFYsV/3ov3+DJAzqJYduxqu9+Cgqq2lDwvu+VIuysqQUWfbfXZMwKOnL207t2uvogqwyq6JYfYIqn8JdW/ZwYxgJ5SUTvLsqjEyWMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-927b19c5023so310696839f.1
        for <linux-hams@vger.kernel.org>; Sat, 18 Oct 2025 22:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760850613; x=1761455413;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a63hfl49DfF7mNJ128fbCsNt93BITAECClP1q+V/6cI=;
        b=mYBT87FKOJgvtcGT1fv1VeVCqYiCKp7BI4KdP2q779zGATQ5U1ydj4j890NlLu9gO7
         Smrcdbg55kzezMuZCWVPNy6Zs4iGHYB9qoqEzTnZou1yIq1SOlxnSudYeoQi+dqm9Uo+
         aFwBplEdyM8BJmOAtvnIOpxXJdnT7AWonKejMBM9pJQG7s/VjfjtG9M8HAYyG1Gs3zz2
         663RyXXIbUc8g4r19sro6Xfmz18+LBqPy+tcb3HG+XY98Q4PKVP7m3Jb/JKCiGrleJqF
         LaWqMGAOBd6s11OX6xTRu3ft5tLDTcfFCCWrsXlhKfIiq0AHPo4hqQ9r0n+Kmo+eLNvo
         EdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBiPv+7tnSmRbd4BtuU+EyNXVqHcUTkTY6hHQPrNuJW7ns+V98h2LgNC3yLx/lqVhNNDHB0A2tH+Cl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1tCvXBjA4GAACKRqXjtwgu3Wyzi0MdIj1Wd4OTsPSavjjsLIg
	7WEu1t5g7ccEOYA+EaZ7sHYEuKmTrPakmXGI0P8JqblJFi9ZcD+hng7v3TRSmf6GGH1RB8pyq4a
	svAWQTib0Nxd/eqlAE6OOQxC1bIPV0LeRKGhkuROULamaOhJ/gUvF9FC52/Y=
X-Google-Smtp-Source: AGHT+IEJaULw+WXFDA4gqC5wuVExSj4Wt7KVfriwzo/9lrYIyylU4A1FdxsH2XMSg5Xxz2HM8ohkbsLjvlv8JTTmMac0AAWHGKUD
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:641c:b0:940:d475:315f with SMTP id
 ca18e2360f4ac-940d475355amr126073439f.11.1760850612729; Sat, 18 Oct 2025
 22:10:12 -0700 (PDT)
Date: Sat, 18 Oct 2025 22:10:12 -0700
In-Reply-To: <b5ontczz4n4gthaaeg6kfav3yaf25u4eax3uo46r44rcwap5hd@fpxvlsznasjp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68f472b4.050a0220.1186a4.0526.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in nr_add_node
From: syzbot <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>
To: listout@listout.xyz
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	listout@listout.xyz, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> On 18.10.2025 13:37, syzbot wrote:
>> syzbot has found a reproducer for the following issue on:
>> 
>> HEAD commit:    f406055cb18c Merge tag 'arm64-fixes' of git://git.kernel.o..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=11cf767c580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
>> dashboard link: https://syzkaller.appspot.com/bug?extid=2860e75836a08b172755
>> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=155f1de2580000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b6b52f980000
>> 
>> Downloadable assets:
>> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-f406055c.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/a4db2a99bfb1/vmlinux-f406055c.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/91d1ca420bac/bzImage-f406055c.xz
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+2860e75836a08b172755@syzkaller.appspotmail.com
>> 
>> ==================================================================
>> BUG: KASAN: slab-use-after-free in nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248
>> Read of size 4 at addr ffff888054b8cc30 by task syz.3.7839/22393
>
> #syz test linux-next

want either no args or 2 args (repo, branch), got 1

>
> diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
> index b94cb2ffbaf8..5fa7d9febbbb 100644
> --- a/net/netrom/nr_route.c
> +++ b/net/netrom/nr_route.c
> @@ -245,7 +245,9 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
>  				nr_node->routes[2].neighbour->count--;
>  				nr_neigh_put(nr_node->routes[2].neighbour);
>  
> -				if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
> +				if (nr_node->routes[2].neighbour &&
> +				    nr_node->routes[2].neighbour->count == 0 &&
> +				    !nr_node->routes[2].neighbour->locked)
>  					nr_remove_neigh(nr_node->routes[2].neighbour);
>  
>  				nr_node->routes[2].quality   = quality;
>
> -- 
> Regards,
> listout

