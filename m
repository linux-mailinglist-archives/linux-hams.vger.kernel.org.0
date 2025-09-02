Return-Path: <linux-hams+bounces-616-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB50B40BED
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 19:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4BA4A4E211A
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 17:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC04342C9D;
	Tue,  2 Sep 2025 17:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nSZOe85j"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C9C33E1
	for <linux-hams@vger.kernel.org>; Tue,  2 Sep 2025 17:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756833838; cv=none; b=fZ+/2717YuQOUiKpIenOFEmH8ICaV33DbSSyhb0ePgfLHTN0n8lY315nmWPehqihMK+mjjqM9T3omoiRbxzvZQ5LM20Ds2xwYuFpDmj0MXWBvYAgBwLwE6ndkms9hZrDa6PZIZ5Y7ULn4FUPt14eMa6quau2JGqjkSuoFihwp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756833838; c=relaxed/simple;
	bh=P0LiHimrg1yV1cAlMgWPHzRuAdspQFa+UcbNqFaPoMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pakmJmdL/AMwrG26yQdXHDFnmojRe5GRdxLc+33mmbNyy8FKPX99owZaqQhLpmissUyBNDNaA+0RzkZr3HuPgp2E0s77O4OGBwXCoRxK2Xc5DsKEG0H85YQhYYSvwn9RqCsK12lQRIqL1juREV80Za+4S0tGaqrh9MhVX97grxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nSZOe85j; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b32ce93e30so17752611cf.2
        for <linux-hams@vger.kernel.org>; Tue, 02 Sep 2025 10:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756833835; x=1757438635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5ePRlag4cYa6RqrEYgl70Gbhj4qrdwDMde3iEuWQ/c=;
        b=nSZOe85jLhLL5JGXFeXnux1f9scR5PiJ+cVU2D41npfgGS66O7C0Y6qa7LXK4pfoxN
         k6w+UnJSH5W6EfbtHplw0XpVRdH6xtyF84DJ0qIUCnGV6fh2PEEySN7WRyEc9sgPzr6+
         JEIkTEqhEkY1ewWMXzSGOywpU7El7ROkamqqIfBo1z8jEVqof450D9kL1yBo0qUa6DvG
         /1/BNjjFU/mGpV3g3BcF9JIk+CjaIaJimKUUmP26pg1rKY/boaG6/h+EvEGsxUkoOPnG
         kWWwfM15VUhKQE1JKFt6LJC/FMZd6A2CuqaLmB8uOFdapEtVBk+ADW9Xii7gm0NwQGHk
         W6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756833835; x=1757438635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5ePRlag4cYa6RqrEYgl70Gbhj4qrdwDMde3iEuWQ/c=;
        b=HARTmA4OgwKKEREMMASTWKG6atF9gSW3tCSm8V9lV7GwdmwGaEo/OfawumqoiQ+jTk
         OXVEnVQkhLLFDEWDi2AB04BfdFV6ZHoEl/vuLxa1SanXIyG0Cwr5xf0k4SxXPXwPKmSQ
         gGjeqzA5DOghzDuq0RHwVErKHzfduzeAM8wc1cWK/hYhthRKtDr0BjXXhZzY3wfnuxQJ
         7Ujl0WOTq6s2K7PMvmkggiaXGdA1n0r3Uyy1TSRjIZJgi9H0saInANUDjH01GHXr2qif
         h9do2NkAVJ7X32od/ABEY6nkg9uTSyPELh8W4waMU+4MVZQ9Xr+XKAvUHHJ3SbYAs+k/
         znIA==
X-Forwarded-Encrypted: i=1; AJvYcCXrFYOsMhmxCtdE2HJknLICsqn/k/pR473/tDT8onlUWa5MKO1ogSwjqd+iR/lLuDcWXphKzlakaZgc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4gEu/GY3dZvxiMIEZ7wuCshsI4w6fUyxGLClzV07OJ+zOxKfq
	ASk/mIvEWDn/SfzDxsi15CWDtXKFEPn4jreBM8FptGZRAdL3zr80r7ownViGzAvPld/mgLL/C38
	jPIDGvNpj82Rd0EFNRsOqpetpadJRcSwEkOCdvc2y
X-Gm-Gg: ASbGncsHHGP3mH8USkiNyQo7hBh5qF2TPbvKiBQ2qwRmGzVNupxGrLrQSNJ/m6iWzU3
	DN6ZK17C4CqQGy5FPAgqd/YGyouj2nChpcj0RWGDtkbsCNfP5HcF24JwMcyjW6yZzrcsTuIvpkF
	+WPZVprRPj8BXWaV/8ptgSflfdNKrbXQh88+5Zx16MxQ4BGdO1hYVy2wmsya6RdeJnzx1gzyljC
	9pbOo+/73zT/Q==
X-Google-Smtp-Source: AGHT+IEz3h4YcLoYkpC9BFXm+Rr8ZT3EQuLhDOKnsF7eJUAz6GUn8sK57WY/YOxQy86lq/RGTYEXUu1DAgPhtxIAuKs=
X-Received: by 2002:a05:622a:53ce:b0:4b3:5081:24c8 with SMTP id
 d75a77b69052e-4b3508129c9mr25853511cf.56.1756833835002; Tue, 02 Sep 2025
 10:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250823085857.47674-1-takamitz@amazon.co.jp> <175630620975.735595.12172150017758308565.git-patchwork-notify@kernel.org>
 <58ba5453-52a2-4d26-9a5d-647967c8ede1@free.fr>
In-Reply-To: <58ba5453-52a2-4d26-9a5d-647967c8ede1@free.fr>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Sep 2025 10:23:43 -0700
X-Gm-Features: Ac12FXxTrT6ceV01Zgfz_UDFk2cH5AK-uEhj4rxFJb6XnbCT4WT6UUce8smh4oc
Message-ID: <CANn89iLNc-fsLJvkyvvnsyTsvBQgCqY5sLpRztLkHfjNvXG7KQ@mail.gmail.com>
Subject: Re: [PATCH v2 net 0/3] Introduce refcount_t for reference counting of rose_neigh
To: F6BVP <f6bvp@free.fr>
Cc: Takamitsu Iwai <takamitz@amazon.co.jp>, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, enjuk@amazon.com, mingo@kernel.org, 
	tglx@linutronix.de, hawk@kernel.org, n.zhandarovich@fintech.ru, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 10:19=E2=80=AFAM F6BVP <f6bvp@free.fr> wrote:
>
> Hi,
>
> I am facing an issue while trying to apply refcount rose patchs to
> latest stable release 6.16.4
>
> In rose_in.c the call to sk_filter_trim_cap function is using an extra
> argument that is not declared in 6.16.4  ~/include/linux/filter.h but
> appears in 6.17.0-rc.
>
> As a result I had to apply the following patch in order to be able to
> build kernel 6.16.4 with refcount patches.
>
> Otherwise ROSE module refcount patchs would prevent building rose module
> in stable kernel
>
> Is there any other solution ?
>

Note that these patches have ongoing syzbot reports.

If I was you, I would wait a bit.

ODEBUG: free active (active state 0) object: ffff88804fb25890 object
type: timer_list hint: rose_t0timer_expiry+0x0/0x150
include/linux/skbuff.h:2880
WARNING: CPU: 1 PID: 16472 at lib/debugobjects.c:612
debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Modules linked in:
CPU: 1 UID: 0 PID: 16472 Comm: syz.1.2858 Not tainted syzkaller #0 PREEMPT(=
full)
Hardware name: Google Google Compute Engine/Google Compute Engine,
BIOS Google 07/12/2025
RIP: 0010:debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Code: fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 54 41 56 48 8b 14
dd e0 40 16 8c 4c 89 e6 48 c7 c7 60 35 16 8c e8 0f 46 91 fc 90 <0f> 0b
90 90 58 83 05 86 d0 c2 0b 01 48 83 c4 18 5b 5d 41 5c 41 5d
RSP: 0018:ffffc90000a08a28 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000003 RCX: ffffffff817a3358
RDX: ffff888031ae9e00 RSI: ffffffff817a3365 RDI: 0000000000000001
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8c163c00
R13: ffffffff8bafed40 R14: ffffffff8a7fa2b0 R15: ffffc90000a08b28
FS: 00007f10b4f3c6c0(0000) GS:ffff8881247b9000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c3dff8d CR3: 00000000325a7000 CR4: 0000000000350ef0
Call Trace:
<IRQ>
__debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
debug_check_no_obj_freed+0x4b7/0x600 lib/debugobjects.c:1129
slab_free_hook mm/slub.c:2348 [inline]
slab_free mm/slub.c:4680 [inline]
kfree+0x28f/0x4d0 mm/slub.c:4879
rose_neigh_put include/net/rose.h:166 [inline]
rose_timer_expiry+0x53f/0x630 net/rose/rose_timer.c:183
call_timer_fn+0x19a/0x620 kernel/time/timer.c:1747
expire_timers kernel/time/timer.c:1798 [inline]
__run_timers+0x6ef/0x960 kernel/time/timer.c:2372
__run_timer_base kernel/time/timer.c:2384 [inline]
__run_timer_base kernel/time/timer.c:2376 [inline]
run_timer_base+0x114/0x190 kernel/time/timer.c:2393
run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2403
handle_softirqs+0x219/0x8e0 kernel/softirq.c:579
__do_softirq kernel/softirq.c:613 [inline]
invoke_softirq kernel/softirq.c:453 [inline]
__irq_exit_rcu+0x109/0x170 kernel/softirq.c:680
irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1050
</IRQ>
<TASK>
asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:7=
02
RIP: 0010:lock_is_held_type+0x107/0x150 kernel/locking/lockdep.c:5945
Code: 00 00 b8 ff ff ff ff 65 0f c1 05 dc a0 44 08 83 f8 01 75 2d 9c
58 f6 c4 02 75 43 48 f7 04 24 00 02 00 00 74 01 fb 48 83 c4 08 <44> 89
e8 5b 5d 41 5c 41 5d 41 5e 41 5f e9 f2 2f 7e f5 45 31 ed eb
RSP: 0018:ffffc9000eb1f978 EFLAGS: 00000286
RAX: 0000000000000046 RBX: 1ffff92001d63f38 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff8de299c8 RDI: ffffffff8c163000
RBP: ffffffff8e5c11c0 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888031ae9e00
R13: 0000000000000000 R14: 00000000ffffffff R15: 0000000000000000
lock_is_held include/linux/lockdep.h:249 [inline]
> Regards,
>
> Bernard Pidoux,
> F6BVP
>
>
> Le 27/08/2025 =C3=A0 16:50, patchwork-bot+netdevbpf@kernel.org a =C3=A9cr=
it :
> > Hello:
> >
> > This series was applied to netdev/net.git (main)
> > by Jakub Kicinski <kuba@kernel.org>:
> >
> > On Sat, 23 Aug 2025 17:58:54 +0900 you wrote:
> >> The current implementation of rose_neigh uses 'use' and 'count' field =
of
> >> type unsigned short as a reference count. This approach lacks atomicit=
y,
> >> leading to potential race conditions. As a result, syzbot has reported
> >> slab-use-after-free errors due to unintended removals.
> >>
> >> This series introduces refcount_t for reference counting to ensure
> >> atomicity and prevent race conditions. The patches are structured as
> >> follows:
> >>
> >> [...]
> >
> > Here is the summary with links:
> >    - [v2,net,1/3] net: rose: split remove and free operations in rose_r=
emove_neigh()
> >      https://git.kernel.org/netdev/net/c/dcb34659028f
> >    - [v2,net,2/3] net: rose: convert 'use' field to refcount_t
> >      https://git.kernel.org/netdev/net/c/d860d1faa6b2
> >    - [v2,net,3/3] net: rose: include node references in rose_neigh refc=
ount
> >      https://git.kernel.org/netdev/net/c/da9c9c877597
> >
> > You are awesome, thank you!

