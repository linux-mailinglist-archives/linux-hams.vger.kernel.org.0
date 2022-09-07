Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570885B09A7
	for <lists+linux-hams@lfdr.de>; Wed,  7 Sep 2022 18:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbiIGQFe (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 7 Sep 2022 12:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiIGQFK (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 7 Sep 2022 12:05:10 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407CD3AE7F
        for <linux-hams@vger.kernel.org>; Wed,  7 Sep 2022 09:03:42 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id b136so1556930yba.2
        for <linux-hams@vger.kernel.org>; Wed, 07 Sep 2022 09:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=yjdUSA4AvxRV6Qw4LrZ7ZPyR1+bO9mlPOgbqMXkfeEg=;
        b=lvuDArzOxtrgsCy46jHznKI0S54/LWalBXnU+OC5aUEKbKZDMmkovCTZuiYWdTUtiX
         xajYlpErbs9f+z92OcHwwyHUut8VFBvWRCQTyxexbNAQIR126NV0em6rodBMCB/dWcta
         bGpHiLeZLCxz0v8BiJk7qwptHhqi2/bxUJPaQAm4yrXlXfVYrrI3k/F0tcowmGoLrbCd
         U3Cj8H6EnBzYRqa5GyeAfw6Uq0SyoZLbgPzOqDVUka31HvecXYVsTGS6fOieo69BY+9i
         VBPmo5mkNO5Q56VV1iXY69ugPpLoE8sAp1DoDYSM/hM6zllkqdwJapDl1NtsFwmhWggR
         GUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yjdUSA4AvxRV6Qw4LrZ7ZPyR1+bO9mlPOgbqMXkfeEg=;
        b=J9RGIh3uPZlxnV+Rkf9aCTIpoEw2UZw79Jr5sTojCDw8onsxYHv/k9Vh/ra8kpY8HS
         LbP/eE9wtCEa3IhPU8GY+YfyliLZDGCvfw4Wl8+CLORGWb64ecou3F2e6JAppBnJCoKU
         tXTJCTUo2KzNXVQoo0Rci2nBZ3Q/xBfFTEK374fWXrWOInOXIVPw23xt8XjTO8NUqqva
         65LJeWMEDacCSJMueQXpdeCezlp9BfWDhifTJZptMZ1RRSTCrkwuMKuqF/bnDCTvl7UD
         sHFkK3n9j32OXpXGmJmo16VqN46jUd4qYq9j7eX2vwGg41zycIHUbXRCLtEH4j3LJFj/
         v5ZA==
X-Gm-Message-State: ACgBeo2W7KqEYEgMldtEqxS2MMok3YFqkEAzarPOjB+2X0zRoNuDVX/V
        hpBt5HwJNFBtcdpIBIGBvoLoeXyvq/jwMYzV264j+g==
X-Google-Smtp-Source: AA6agR6eXGTOSJBSaiSA/lkvk5ZCPnB2R0lYdyE6ns1durzDa9fjCSHkHO5RHf5muPCguC+FDaE4dVoqRnHNhNf2XLA=
X-Received: by 2002:a05:6902:10f:b0:69a:c2c:b81b with SMTP id
 o15-20020a056902010f00b0069a0c2cb81bmr3336181ybh.598.1662566621175; Wed, 07
 Sep 2022 09:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <7645E49A-77B1-4CBB-AAC3-0E911C73984B@osterried.de>
In-Reply-To: <7645E49A-77B1-4CBB-AAC3-0E911C73984B@osterried.de>
From:   Eric Dumazet <edumazet@google.com>
Date:   Wed, 7 Sep 2022 09:03:29 -0700
Message-ID: <CANn89iLYhb+VTgrLUiwoeXwBope2NFVHXgi-WDxkhUtakX2Cdg@mail.gmail.com>
Subject: Re: [AX25 ]refcount issues -> panic
To:     Thomas Osterried <thomas@osterried.de>
Cc:     linux-hams@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Wed, Sep 7, 2022 at 6:50 AM Thomas Osterried <thomas@osterried.de> wrote=
:
>
> Hello,
>
> I tested current torwalds-kernel on a real life system and have the follo=
wing problems.
>
> 1. refcount stuff  (which is quite new)
>
> -> leads to two other issues:
>
> 2. ax25_sendmsg -> skb_push() -> skbuff: skb_under_panic
> 3. ax25_t2timer_expiry() -> ax25_send_control() ->  null pointer deferenc=
e

This has been mentioned already in netdev@ list.

https://lore.kernel.org/netdev/CANn89i+3jZLjy0iYDo78QhQ5STt2X6B2zxX0rY-xOdq=
my9WFSA@mail.gmail.com/t/#mda35217712f434d5abb7697068db1b6498e87e63

Caused by
3c53cd65dece47dd1f9d3a809f32e59d1d87b2b8 rose: check NULL
rose_loopback_neigh->loopback

>
>
> How to reproduce:
> Not sure:
> I tested the stack *before* these patches came in:
>   2022-08-03    Merge git://git.kernel.org/pub/scm/linux/kernel/git/netde=
v/net  Paolo Abeni     1       -2/+2
>     7c6327c77d509e78bff76f2a4551fcfee851682e
>   2022-07-28    ax25: fix incorrect dev_tracker usage   Eric Dumazet    1=
       -2/+2
>     d7c4c9e075f8cc6d88d277bc24e5d99297f03c06
> But my previous test system was just a test-VM. -> Can't really say if th=
e patches above cause the problem.
>
>
> The current panic occures (with current torwalds kernel) on a live system=
 with AX.25 services like BBS, etc.
> -> Much more ongoing on the ax25 stack (that's the reason why I decided t=
o test it on that machine).
>
> I tried to connect the local bbs via a remote digipeater:
> $ call -r -s dl9sau rmnc db0blo-8 db0blo-4
>
> Most of my tries it worked flawlessly. But with the next test, I may have=
 triggered the refcount bug which lead finally into a panic.
> But because it's a live system, the real cause may something other than t=
he connection I did.
>
> The bug is triggered quite often on that system: the machine gets an upti=
me of abt 45min until panic.
>
>
> [ 6513.944470] refcount_t: addition on 0; use-after-free.
> [ 6513.948678] WARNING: CPU: 0 PID: 743 at lib/refcount.c:25 refcount_war=
n_saturate+0x74/0x110
> [ 6513.955396] Modules linked in: netconsole(E) nft_chain_nat(E) xt_nat(E=
) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E=
) nft_compat(E) nf_tables(E) libcrc32c(E) nfnetlink(E) snd_pcm(E) tun(E) mk=
iss(E) snd_timer(E) bpqether(E) ax25(E) snd(E) soundcore(E) pcspkr(E) joyde=
v(E) evdev(E) qxl(E) drm_ttm_helper(E) serio_raw(E) ttm(E) virtio_console(E=
) virtio_balloon(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) hid_generic(E) usbhid(E) hid(E) virtio_blk(E)=
 virtio_net(E) net_failover(E) failover(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ata_piix(E) uhci_hcd(E) ehci_pci(E) ehci_hcd(E) libata(E) virtio_=
pci(E) usbcore(E) usb_common(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) scsi_mod(E) scsi_common(E) i2c_piix4(E) flo=
ppy(E)
> [ 6514.010527] CPU: 0 PID: 743 Comm: tnt Tainted: G            E      6.0=
.0-rc3+ #1
> [ 6514.014841] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 6514.019647] RIP: 0010:refcount_warn_saturate+0x74/0x110
> [ 6514.022659] Code: 01 01 e8 0c 11 45 00 0f 0b c3 cc cc cc cc 80 3d 59 b=
f 10 01 00 75 cb 48 c7 c7 90 57 96 a2 c6 05 49 bf 10 01 01 e8 e9 10 45 00 <=
0f> 0b c3 cc cc cc cc 80 3d 38 bf 10 01 00 75 a8 48 c7 c7 68 57 96
> [ 6514.031959] RSP: 0018:ffffb52b8059fd88 EFLAGS: 00010282
> [ 6514.034627] RAX: 0000000000000000 RBX: ffff994ede7ec600 RCX: 000000000=
0000000
> [ 6514.038153] RDX: 0000000000000202 RSI: ffffffffa294e122 RDI: 00000000f=
fffffff
> [ 6514.041600] RBP: ffffb52b8059fe08 R08: 0000000000000000 R09: 00000000f=
fffefff
> [ 6514.044808] R10: ffffb52b8059fc28 R11: ffffffffa2ccbaa8 R12: ffff994ed=
e7ec600
> [ 6514.048012] R13: 0000000000000001 R14: 0000000000000000 R15: 000000000=
0000000
> [ 6514.051094] FS:  0000000000000000(0000) GS:ffff994edfc00000(0063) knlG=
S:00000000f7d34700
> [ 6514.054564] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 6514.057097] CR2: 00000000082a6d2b CR3: 000000000af74000 CR4: 000000000=
00006f0
> [ 6514.060229] Call Trace:
> [ 6514.061421]  <TASK>
> [ 6514.062523]  ax25_addr_ax25dev+0xac/0xb0 [ax25]
> [ 6514.064580]  ax25_bind+0x1f5/0x220 [ax25]
> [ 6514.066443]  __sys_bind+0xd3/0x100
> [ 6514.068034]  ? __sys_socket+0xc7/0x100
> [ 6514.069761]  __ia32_compat_sys_socketcall+0x280/0x360
> [ 6514.072060]  ? fpregs_assert_state_consistent+0x22/0x50
> [ 6514.074444]  ? exit_to_user_mode_prepare+0x3a/0x150
> [ 6514.076620]  __do_fast_syscall_32+0x6f/0xf0
> [ 6514.078567]  do_fast_syscall_32+0x2f/0x70
> [ 6514.082252]  entry_SYSENTER_compat_after_hwframe+0x70/0x82
> [ 6514.086204] RIP: 0023:0xf7f8f559
> [ 6514.089315] Code: 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 0=
1 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <=
5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> [ 6514.099667] RSP: 002b:00000000ffdd4a50 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000066
> [ 6514.104482] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00000000f=
fdd4a64
> [ 6514.109263] RDX: 0000000000000000 RSI: 00000000ffdd4c84 RDI: 00000000f=
fdd4b42
> [ 6514.114147] RBP: 00000000ffdd4b08 R08: 0000000000000000 R09: 000000000=
0000000
> [ 6514.118857] R10: 0000000000000000 R11: 0000000000000206 R12: 000000000=
0000000
> [ 6514.123640] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 6514.128471]  </TASK>
> [ 6514.131146] ---[ end trace 0000000000000000 ]---
> [ 6514.140692] ------------[ cut here ]------------
> [ 6514.144702] refcount_t: underflow; use-after-free.
> [ 6514.148736] WARNING: CPU: 0 PID: 743 at lib/refcount.c:28 refcount_war=
n_saturate+0xba/0x110
> [ 6514.154187] Modules linked in: netconsole(E) nft_chain_nat(E) xt_nat(E=
) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E=
) nft_compat(E) nf_tables(E) libcrc32c(E) nfnetlink(E) snd_pcm(E) tun(E) mk=
iss(E) snd_timer(E) bpqether(E) ax25(E) snd(E) soundcore(E) pcspkr(E) joyde=
v(E) evdev(E) qxl(E) drm_ttm_helper(E) serio_raw(E) ttm(E) virtio_console(E=
) virtio_balloon(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) hid_generic(E) usbhid(E) hid(E) virtio_blk(E)=
 virtio_net(E) net_failover(E) failover(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ata_piix(E) uhci_hcd(E) ehci_pci(E) ehci_hcd(E) libata(E) virtio_=
pci(E) usbcore(E) usb_common(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) scsi_mod(E) scsi_common(E) i2c_piix4(E) flo=
ppy(E)
> [ 6514.198865] CPU: 0 PID: 743 Comm: tnt Tainted: G        W   E      6.0=
.0-rc3+ #1
> [ 6514.203905] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 6514.208855] RIP: 0010:refcount_warn_saturate+0xba/0x110
> [ 6514.212855] Code: 01 01 e8 c6 10 45 00 0f 0b c3 cc cc cc cc 80 3d 12 b=
f 10 01 00 75 85 48 c7 c7 c0 57 96 a2 c6 05 02 bf 10 01 01 e8 a3 10 45 00 <=
0f> 0b c3 cc cc cc cc 80 3d ed be 10 01 00 0f 85 5e ff ff ff 48 c7
> [ 6514.223607] RSP: 0018:ffffb52b8059fe38 EFLAGS: 00010282
> [ 6514.227551] RAX: 0000000000000000 RBX: ffff994ed38aa700 RCX: 000000000=
0000000
> [ 6514.232245] RDX: 0000000000000001 RSI: ffffffffa294e122 RDI: 00000000f=
fffffff
> [ 6514.236954] RBP: ffff994ecbbab000 R08: 0000000000000000 R09: 00000000f=
fffefff
> [ 6514.241693] R10: ffffb52b8059fcd8 R11: ffffffffa2ccbaa8 R12: ffff994ed=
e7ec600
> [ 6514.246519] R13: ffff994eda710e00 R14: ffff994ecbbab080 R15: 000000000=
0000000
> [ 6514.251272] FS:  0000000000000000(0000) GS:ffff994edfc00000(0063) knlG=
S:00000000f7d34700
> [ 6514.256443] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 6514.260306] CR2: 00000000f6a98bb4 CR3: 000000000af74000 CR4: 000000000=
00006f0
> [ 6514.264990] Call Trace:
> [ 6514.267950]  <TASK>
> [ 6514.270769]  ax25_release+0x327/0x340 [ax25]
> [ 6514.274483]  __sock_release+0x3d/0xb0
> [ 6514.277946]  sock_close+0x11/0x20
> [ 6514.281180]  __fput+0x8c/0x240
> [ 6514.284372]  task_work_run+0x5c/0x90
> [ 6514.287698]  exit_to_user_mode_prepare+0x14d/0x150
> [ 6514.291468]  syscall_exit_to_user_mode+0x22/0x50
> [ 6514.295250]  ? __ia32_sys_close+0xe/0x50
> [ 6514.298795]  __do_fast_syscall_32+0x7c/0xf0
> [ 6514.302403]  do_fast_syscall_32+0x2f/0x70
> [ 6514.305960]  entry_SYSENTER_compat_after_hwframe+0x70/0x82
> [ 6514.310031] RIP: 0023:0xf7f8f559
> [ 6514.313094] Code: 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 0=
1 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <=
5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> [ 6514.323970] RSP: 002b:00000000ffdd4ac0 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000006
> [ 6514.328872] RAX: 0000000000000000 RBX: 000000000000000b RCX: 000000000=
0000000
> [ 6514.333586] RDX: 0000000000000000 RSI: 0000000009681288 RDI: 00000000f=
fdd4b42
> [ 6514.338349] RBP: 00000000ffdd4b08 R08: 0000000000000000 R09: 000000000=
0000000
> [ 6514.342900] R10: 0000000000000000 R11: 0000000000000206 R12: 000000000=
0000000
> [ 6514.347645] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 6514.352379]  </TASK>
> [ 6514.355075] ---[ end trace 0000000000000000 ]---
> [ 6514.364441] ------------[ cut here ]------------
> [ 6514.368107] refcount_t: saturated; leaking memory.
> [ 6514.371603] WARNING: CPU: 0 PID: 743 at lib/refcount.c:22 refcount_war=
n_saturate+0x51/0x110
> [ 6514.376543] Modules linked in: netconsole(E) nft_chain_nat(E) xt_nat(E=
) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E=
) nft_compat(E) nf_tables(E) libcrc32c(E) nfnetlink(E) snd_pcm(E) tun(E) mk=
iss(E) snd_timer(E) bpqether(E) ax25(E) snd(E) soundcore(E) pcspkr(E) joyde=
v(E) evdev(E) qxl(E) drm_ttm_helper(E) serio_raw(E) ttm(E) virtio_console(E=
) virtio_balloon(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) hid_generic(E) usbhid(E) hid(E) virtio_blk(E)=
 virtio_net(E) net_failover(E) failover(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ata_piix(E) uhci_hcd(E) ehci_pci(E) ehci_hcd(E) libata(E) virtio_=
pci(E) usbcore(E) usb_common(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) scsi_mod(E) scsi_common(E) i2c_piix4(E) flo=
ppy(E)
> [ 6514.415634] CPU: 0 PID: 743 Comm: tnt Tainted: G        W   E      6.0=
.0-rc3+ #1
> [ 6514.420013] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 6514.424636] RIP: 0010:refcount_warn_saturate+0x51/0x110
> [ 6514.428206] Code: 84 bc 00 00 00 c3 cc cc cc cc 85 f6 74 46 80 3d 7d b=
f 10 01 00 75 ee 48 c7 c7 68 57 96 a2 c6 05 6d bf 10 01 01 e8 0c 11 45 00 <=
0f> 0b c3 cc cc cc cc 80 3d 59 bf 10 01 00 75 cb 48 c7 c7 90 57 96
> [ 6514.438010] RSP: 0018:ffffb52b8059fd88 EFLAGS: 00010282
> [ 6514.441440] RAX: 0000000000000000 RBX: ffff994ede7ec600 RCX: 000000000=
0000000
> [ 6514.445841] RDX: 0000000000000202 RSI: ffffffffa294e122 RDI: 00000000f=
fffffff
> [ 6514.450129] RBP: ffffb52b8059fe08 R08: 0000000000000000 R09: 00000000f=
fffefff
> [ 6514.454447] R10: ffffb52b8059fc28 R11: ffffffffa2ccbaa8 R12: ffff994ed=
e7ec600
> [ 6514.458727] R13: 0000000000000001 R14: 0000000000000000 R15: 000000000=
0000000
> [ 6514.463051] FS:  0000000000000000(0000) GS:ffff994edfc00000(0063) knlG=
S:00000000f7d34700
> [ 6514.467643] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 6514.471465] CR2: 00000000f68cbe14 CR3: 000000000af74000 CR4: 000000000=
00006f0
> [ 6514.475828] Call Trace:
> [ 6514.478447]  <TASK>
> [ 6514.481030]  ax25_addr_ax25dev+0x7d/0xb0 [ax25]
> [ 6514.484477]  ax25_bind+0x1f5/0x220 [ax25]
> [ 6514.487737]  __sys_bind+0xd3/0x100
> [ 6514.490800]  ? __sys_socket+0xc7/0x100
> [ 6514.493977]  __ia32_compat_sys_socketcall+0x280/0x360
> [ 6514.497644]  ? fpregs_assert_state_consistent+0x22/0x50
> [ 6514.501324]  ? exit_to_user_mode_prepare+0x3a/0x150
> [ 6514.504907]  __do_fast_syscall_32+0x6f/0xf0
> [ 6514.508317]  do_fast_syscall_32+0x2f/0x70
> [ 6514.511594]  entry_SYSENTER_compat_after_hwframe+0x70/0x82
> [ 6514.515402] RIP: 0023:0xf7f8f559
> [ 6514.518354] Code: 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 0=
1 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <=
5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> [ 6514.528420] RSP: 002b:00000000ffdd4a50 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000066
> [ 6514.532922] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00000000f=
fdd4a64
> [ 6514.537301] RDX: 0000000000000000 RSI: 00000000ffdd4c84 RDI: 00000000f=
fdd4b42
> [ 6514.541757] RBP: 00000000ffdd4b08 R08: 0000000000000000 R09: 000000000=
0000000
> [ 6514.545982] R10: 0000000000000000 R11: 0000000000000206 R12: 000000000=
0000000
> [ 6514.550181] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 6514.554481]  </TASK>
> [ 6514.557042] ---[ end trace 0000000000000000 ]---
> [ 6551.619646] skbuff: skb_under_panic: text:ffffffffc0a7523a len:126 put=
:1 head:ffff994ec2c96000 data:ffff994ec2c95fff tail:0x7d end:0xc0 dev:<NULL=
>
> [ 6551.635844] ------------[ cut here ]------------
> [ 6551.642592] kernel BUG at net/core/skbuff.c:116!
> [ 6551.649219] invalid opcode: 0000 [#1] PREEMPT SMP PTI
> [ 6551.655656] CPU: 0 PID: 743 Comm: tnt Tainted: G        W   E      6.0=
.0-rc3+ #1
> [ 6551.663049] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 6551.670287] RIP: 0010:skb_panic+0x48/0x4a
> [ 6551.674764] Code: 4f 70 50 8b 87 c0 00 00 00 50 8b 87 bc 00 00 00 50 f=
f b7 d0 00 00 00 4c 8b 8f c8 00 00 00 48 c7 c7 00 51 9b a2 e8 2c c4 fc ff <=
0f> 0b 48 8b 14 24 48 c7 c1 20 cd 70 a2 e8 a6 ff ff ff 48 8b 14 24
> [ 6551.687662] RSP: 0018:ffffb52b8059fce8 EFLAGS: 00010246
> [ 6551.691789] RAX: 0000000000000086 RBX: 00000000000000f0 RCX: 000000000=
0000000
> [ 6551.696432] RDX: 0000000000000000 RSI: ffffffffa294e122 RDI: 00000000f=
fffffff
> [ 6551.701026] RBP: ffff994ecb5f0c00 R08: 0000000000000000 R09: 00000000f=
fffefff
> [ 6551.705454] R10: ffffb52b8059fb90 R11: ffffffffa2ccbaa8 R12: ffff994ed=
f6a4400
> [ 6551.709706] R13: 000000000000007d R14: ffff994ec61ad9c0 R15: ffff994ed=
a710800
> [ 6551.713949] FS:  0000000000000000(0000) GS:ffff994edfc00000(0063) knlG=
S:00000000f7d34700
> [ 6551.718333] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 6551.722052] CR2: 0000000057e8eafc CR3: 000000000af74000 CR4: 000000000=
00006f0
> [ 6551.726248] Call Trace:
> [ 6551.728835]  <TASK>
> [ 6551.731178]  skb_push.cold+0x10/0x10
> [ 6551.734234]  ax25_sendmsg+0x32a/0x440 [ax25]
> [ 6551.737556]  ? aa_sk_perm+0x3e/0x1e0
> [ 6551.740558]  ? aa_file_perm+0x120/0x4d0
> [ 6551.743472]  ? aa_file_perm+0x120/0x4d0
>  6551.746526]  ? aa_sk_perm+0x3e/0x1e0
> [ 6551.749542]  sock_sendmsg+0x62/0x70
> [ 6551.752341]  sock_write_iter+0x97/0x100
> [ 6551.755434]  vfs_write+0x331/0x3d0
> [ 6551.758297]  ksys_write+0xab/0xe0
> [ 6551.761158]  __do_fast_syscall_32+0x6f/0xf0
> [ 6551.764306]  do_fast_syscall_32+0x2f/0x70
> [ 6551.767461]  entry_SYSENTER_compat_after_hwframe+0x70/0x82
> [ 6551.771125] RIP: 0023:0xf7f8f559
> [ 6551.774017] Code: 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 0=
1 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <=
5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> [ 6551.784184] RSP: 002b:00000000ffdd4d40 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000004
> [ 6551.788395] RAX: ffffffffffffffda RBX: 000000000000000e RCX: 000000000=
9854fe0
> [ 6551.792429] RDX: 000000000000007d RSI: 000000000000007d RDI: 000000000=
0000001
> [ 6551.796464] RBP: 00000000ffdd4de8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 6551.800644] R10: 0000000000000000 R11: 0000000000000206 R12: 000000000=
0000000
> [ 6551.804960] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 6551.809104]  </TASK>
> [ 6551.811480] Modules linked in: netconsole(E) nft_chain_nat(E) xt_nat(E=
) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E=
) nft_compat(E) nf_tables(E) libcrc32c(E) nfnetlink(E) snd_pcm(E) tun(E) mk=
iss(E) snd_timer(E) bpqether(E) ax25(E) snd(E) soundcore(E) pcspkr(E) joyde=
v(E) evdev(E) qxl(E) drm_ttm_helper(E) serio_raw(E) ttm(E) virtio_console(E=
) virtio_balloon(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) hid_generic(E) usbhid(E) hid(E) virtio_blk(E)=
 virtio_net(E) net_failover(E) failover(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ata_piix(E) uhci_hcd(E) ehci_pci(E) ehci_hcd(E) libata(E) virtio_=
pci(E) usbcore(E) usb_common(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) scsi_mod(E) scsi_common(E) i2c_piix4(E) flo=
ppy(E)
> [ 6551.850466] ---[ end trace 0000000000000000 ]---
> [ 6551.854016] RIP: 0010:skb_panic+0x48/0x4a
> [ 6551.857293] Code: 4f 70 50 8b 87 c0 00 00 00 50 8b 87 bc 00 00 00 50 f=
f b7 d0 00 00 00 4c 8b 8f c8 00 00 00 48 c7 c7 00 51 9b a2 e8 2c c4 fc ff <=
0f> 0b 48 8b 14 24 48 c7 c1 20 cd 70 a2 e8 a6 ff ff ff 48 8b 14 24
> [ 6551.867917] RSP: 0018:ffffb52b8059fce8 EFLAGS: 00010246
> [ 6551.871800] RAX: 0000000000000086 RBX: 00000000000000f0 RCX: 000000000=
0000000
> [ 6551.876392] RDX: 0000000000000000 RSI: ffffffffa294e122 RDI: 00000000f=
fffffff
> [ 6551.880997] RBP: ffff994ecb5f0c00 R08: 0000000000000000 R09: 00000000f=
fffefff
> [ 6551.885555] R10: ffffb52b8059fb90 R11: ffffffffa2ccbaa8 R12: ffff994ed=
f6a4400
> [ 6551.890103] R13: 000000000000007d R14: ffff994ec61ad9c0 R15: ffff994ed=
a710800
> [ 6551.894671] FS:  0000000000000000(0000) GS:ffff994edfc00000(0063) knlG=
S:00000000f7d34700
> [ 6551.899697] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 6551.903702] CR2: 0000000057e8eafc CR3: 000000000af74000 CR4: 000000000=
00006f0
> [ 6553.236165] skbuff: skb_under_panic: text:ffffffffc0a7523a len:2 put:1=
 head:ffff994eda710e00 data:ffff994eda710dff tail:0x1 end:0xc0 dev:<NULL>
> [ 6553.251699] ------------[ cut here ]------------
> [ 6553.258548] kernel BUG at net/core/skbuff.c:116!
> [ 6553.265398] invalid opcode: 0000 [#2] PREEMPT SMP PTI
> [ 6553.272372] CPU: 0 PID: 28488 Comm: call Tainted: G      D W   E      =
6.0.0-rc3+ #1
> [ 6553.281474] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 6553.290831] RIP: 0010:skb_panic+0x48/0x4a
> [ 6553.296597] Code: 4f 70 50 8b 87 c0 00 00 00 50 8b 87 bc 00 00 00 50 f=
f b7 d0 00 00 00 4c 8b 8f c8 00 00 00 48 c7 c7 00 51 9b a2 e8 2c c4 fc ff <=
0f> 0b 48 8b 14 24 48 c7 c1 20 cd 70 a2 e8 a6 ff ff ff 48 8b 14 24
> [ 6553.312578] RSP: 0018:ffffb52b8067fce8 EFLAGS: 00010246
> [ 6553.317781] RAX: 0000000000000083 RBX: 00000000000000f0 RCX: 000000000=
0000000
> [ 6553.323673] RDX: 0000000000000000 RSI: ffffffffa294e122 RDI: 00000000f=
fffffff
> [ 6553.329336] RBP: ffff994ecb5f1400 R08: 0000000000000000 R09: 00000000f=
fffefff
> [ 6553.334242] R10: ffffb52b8067fb90 R11: ffffffffa2ccbaa8 R12: ffff994ed=
f6a4100
> [ 6553.339384] R13: 0000000000000001 R14: ffff994ec61ad120 R15: ffff994ed=
a65f000
> [ 6553.344344] FS:  0000000000000000(0000) GS:ffff994edfc00000(0063) knlG=
S:00000000f7c5e700
> [ 6553.349601] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 6553.353873] CR2: 00000000ffc50f58 CR3: 0000000002198000 CR4: 000000000=
00006f0
> [ 6553.358698] Call Trace:
> [ 6553.361668]  <TASK>
> [ 6553.364487]  skb_push.cold+0x10/0x10
> [ 6553.367895]  ax25_sendmsg+0x32a/0x440 [ax25]
> [ 6553.371592]  ? _raw_spin_rq_lock_irqsave+0x30/0x30
> [ 6553.375462]  ? aa_file_perm+0x120/0x4d0
> [ 6553.378976]  ? aa_sk_perm+0x3e/0x1e0
> [ 6553.382380]  sock_sendmsg+0x62/0x70
> [ 6553.385721]  sock_write_iter+0x97/0x100
> [ 6553.389140]  vfs_write+0x331/0x3d0
> [ 6553.392343]  ksys_write+0xab/0xe0
> [ 6553.395455]  __do_fast_syscall_32+0x6f/0xf0
> [ 6553.398860]  do_fast_syscall_32+0x2f/0x70
> [ 6553.402157]  entry_SYSENTER_compat_after_hwframe+0x70/0x82
> [ 6553.405958] RIP: 0023:0xf7ed8559
> [ 6553.408916] Code: 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 0=
1 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <=
5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> [ 6553.419146] RSP: 002b:00000000ff9222e0 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000004
> [ 6553.423760] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000f=
f922ac8
> [ 6553.428205] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 00000000f=
f922ac8
> [ 6553.432541] RBP: 00000000ffffffff R08: 0000000000000000 R09: 000000000=
0000000
> [ 6553.436988] R10: 0000000000000000 R11: 0000000000000206 R12: 000000000=
0000000
> [ 6553.441424] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 6553.445812]  </TASK>
> [ 6553.448290] Modules linked in: netconsole(E) nft_chain_nat(E) xt_nat(E=
) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E=
) nft_compat(E) nf_tables(E) libcrc32c(E) nfnetlink(E) snd_pcm(E) tun(E) mk=
iss(E) snd_timer(E) bpqether(E) ax25(E) snd(E) soundcore(E) pcspkr(E) joyde=
v(E) evdev(E) qxl(E) drm_ttm_helper(E) serio_raw(E) ttm(E) virtio_console(E=
) virtio_balloon(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) hid_generic(E) usbhid(E) hid(E) virtio_blk(E)=
 virtio_net(E) net_failover(E) failover(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ata_piix(E) uhci_hcd(E) ehci_pci(E) ehci_hcd(E) libata(E) virtio_=
pci(E) usbcore(E) usb_common(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) scsi_mod(E) scsi_common(E) i2c_piix4(E) flo=
ppy(E)
>  6553.490487] ---[ end trace 0000000000000000 ]---
> [ 6553.494133] RIP: 0010:skb_panic+0x48/0x4a
> [ 6553.497590] Code: 4f 70 50 8b 87 c0 00 00 00 50 8b 87 bc 00 00 00 50 f=
f b7 d0 00 00 00 4c 8b 8f c8 00 00 00 48 c7 c7 00 51 9b a2 e8 2c c4 fc ff <=
0f> 0b 48 8b 14 24 48 c7 c1 20 cd 70 a2 e8 a6 ff ff ff 48 8b 14 24
> [ 6553.508256] RSP: 0018:ffffb52b8059fce8 EFLAGS: 00010246
> [ 6553.512175] RAX: 0000000000000086 RBX: 00000000000000f0 RCX: 000000000=
0000000
> [ 6553.516791] RDX: 0000000000000000 RSI: ffffffffa294e122 RDI: 00000000f=
fffffff
> [ 6553.521468] RBP: ffff994ecb5f0c00 R08: 0000000000000000 R09: 00000000f=
fffefff
> [ 6553.526069] R10: ffffb52b8059fb90 R11: ffffffffa2ccbaa8 R12: ffff994ed=
f6a4400
> [ 6553.530689] R13: 000000000000007d R14: ffff994ec61ad9c0 R15: ffff994ed=
a710800
> [ 6553.535351] FS:  0000000000000000(0000) GS:ffff994edfc00000(0063) knlG=
S:00000000f7c5e700
> [ 6553.540310] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 6553.544352] CR2: 00000000ffc50f58 CR3: 0000000002198000 CR4: 000000000=
00006f0
> [ 6577.772113] BUG: kernel NULL pointer dereference, address: 00000000000=
000de
> [ 6577.780838] #PF: supervisor read access in kernel mode
> [ 6577.787027] #PF: error_code(0x0000) - not-present page
> [ 6577.793214] PGD 80000000054f2067 P4D 80000000054f2067 PUD 54ee067 PMD =
0
> [ 6577.800461] Oops: 0000 [#3] PREEMPT SMP PTI
> [ 6577.806164] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D W   E     =
 6.0.0-rc3+ #1
> [ 6577.814048] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 6577.822341] RIP: 0010:ax25_send_control+0x2e/0x130 [ax25]
> [ 6577.828725] Code: 00 41 57 41 56 41 89 d6 31 d2 41 55 41 89 cd b9 ff f=
f ff ff 41 54 49 89 fc 55 53 48 8b 47 28 89 f3 be 20 0a 00 00 48 8b 40 08 <=
0f> b7 b8 de 00 00 00 83 c7 02 e8 e3 6c 4c e1 48 85 c0 0f 84 a6 00
> [ 6577.843812] RSP: 0018:ffffb52b80003e88 EFLAGS: 00010246
> [ 6577.848820] RAX: 0000000000000000 RBX: 000000000000002f RCX: 00000000f=
fffffff
> [ 6577.854362] RDX: 0000000000000000 RSI: 0000000000000a20 RDI: ffff994ed=
a6ad800
> [ 6577.859740] RBP: ffff994eda6ad800 R08: ffff994eda6ad800 R09: 000000000=
0000000
> [ 6577.864885] R10: 0000000000000001 R11: 0000000000000041 R12: ffff994ed=
a6ad800
> [ 6577.869823] R13: 0000000000000001 R14: 0000000000000001 R15: ffff994ed=
fc1cc40
> [ 6577.874736] FS:  0000000000000000(0000) GS:ffff994edfc00000(0000) knlG=
S:0000000000000000
> [ 6577.879725] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 6577.883705] CR2: 00000000000000de CR3: 00000000060f4000 CR4: 000000000=
00006f0
> [ 6577.888083] Call Trace:
> [ 6577.890843]  <IRQ>
> [ 6577.893396]  ? ax25_t2timer_expiry+0x40/0x40 [ax25]
> [ 6577.896978]  ? ax25_t2timer_expiry+0x40/0x40 [ax25]
> [ 6577.900547]  ax25_std_t1timer_expiry+0x13e/0x150 [ax25]
> [ 6577.904249]  call_timer_fn+0x26/0x130
> [ 6577.907418]  __run_timers.part.0+0x1d0/0x270
> [ 6577.910786]  ? _raw_spin_lock_irq+0x19/0x40
> [ 6577.914114]  ? __hrtimer_run_queues+0x139/0x2c0
> [ 6577.917449]  ? kvm_clock_get_cycles+0x14/0x30
> [ 6577.920709]  run_timer_softirq+0x31/0x70
> [ 6577.923781]  __do_softirq+0xeb/0x2ec
> [ 6577.926688]  __irq_exit_rcu+0xbf/0x110
> [ 6577.929615]  sysvec_apic_timer_interrupt+0xa2/0xd0
> [ 6577.932856]  </IRQ>
> [ 6577.935129]  <TASK>
> [ 6577.937362]  asm_sysvec_apic_timer_interrupt+0x16/0x20
> [ 6577.940654] RIP: 0010:native_safe_halt+0xb/0x10
> [ 6577.943659] Code: 01 00 3e 80 48 02 20 48 8b 00 a8 08 75 bf e9 7b ff f=
f ff cc cc cc cc cc cc cc cc cc cc cc cc eb 07 0f 00 2d 99 99 48 00 fb f4 <=
c3> cc cc cc cc eb 07 0f 00 2d 89 99 48 00 f4 c3 cc cc cc cc cc 0f
> [ 6577.952850] RSP: 0018:ffffffffa2c03e90 EFLAGS: 00000212
> [ 6577.956170] RAX: ffffffffa217fec0 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 6577.960142] RDX: 4000000000000000 RSI: ffffffffa294e122 RDI: 000000000=
079aaec
> [ 6577.964131] RBP: ffffffffa2c139c0 R08: 0000537794810754 R09: 000000000=
0000000
> [ 6577.968099] R10: 0000000000000001 R11: 0000000000000000 R12: 000000000=
0000000
> [ 6577.972120] R13: 0000000000000000 R14: ffffffffa2c13118 R15: 000000000=
0000000
> [ 6577.976084]  ? __cpuidle_text_start+0x8/0x8
> [ 6577.979024]  default_idle+0xa/0x10
> [ 6577.981668]  default_idle_call+0x36/0xf0
> [ 6577.984487]  do_idle+0x21a/0x2b0
> [ 6577.987065]  cpu_startup_entry+0x19/0x20
> [ 6577.989874]  rest_init+0xcb/0xd0
> [ 6577.992397]  arch_call_rest_init+0xa/0x14
> [ 6577.995200]  start_kernel+0x6db/0x704
> [ 6577.997897]  secondary_startup_64_no_verify+0xce/0xdb
> [ 6578.001006]  </TASK>
> [ 6578.003091] Modules linked in: netconsole(E) nft_chain_nat(E) xt_nat(E=
) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E=
) nft_compat(E) nf_tables(E) libcrc32c(E) nfnetlink(E) snd_pcm(E) tun(E) mk=
iss(E) snd_timer(E) bpqether(E) ax25(E) snd(E) soundcore(E) pcspkr(E) joyde=
v(E) evdev(E) qxl(E) drm_ttm_helper(E) serio_raw(E) ttm(E) virtio_console(E=
) virtio_balloon(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) hid_generic(E) usbhid(E) hid(E) virtio_blk(E)=
 virtio_net(E) net_failover(E) failover(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ata_piix(E) uhci_hcd(E) ehci_pci(E) ehci_hcd(E) libata(E) virtio_=
pci(E) usbcore(E) usb_common(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) scsi_mod(E) scsi_common(E) i2c_piix4(E) flo=
ppy(E)
> [ 6578.040197] CR2: 00000000000000de
> [ 6578.042936] ---[ end trace 0000000000000000 ]---
> [ 6578.046093] RIP: 0010:skb_panic+0x48/0x4a
> [ 6578.048998] Code: 4f 70 50 8b 87 c0 00 00 00 50 8b 87 bc 00 00 00 50 f=
f b7 d0 00 00 00 4c 8b 8f c8 00 00 00 48 c7 c7 00 51 9b a2 e8 2c c4 fc ff <=
0f> 0b 48 8b 14 24 48 c7 c1 20 cd 70 a2 e8 a6 ff ff ff 48 8b 14 24
> [ 6578.058401] RSP: 0018:ffffb52b8059fce8 EFLAGS: 00010246
> [ 6578.061831] RAX: 0000000000000086 RBX: 00000000000000f0 RCX: 000000000=
0000000
> [ 6578.066007] RDX: 0000000000000000 RSI: ffffffffa294e122 RDI: 00000000f=
fffffff
> [ 6578.070162] RBP: ffff994ecb5f0c00 R08: 0000000000000000 R09: 00000000f=
fffefff
>  6578.074306] R10: ffffb52b8059fb90 R11: ffffffffa2ccbaa8 R12: ffff994edf=
6a4400
> [ 6578.078403] R13: 000000000000007d R14: ffff994ec61ad9c0 R15: ffff994ed=
a710800
> [ 6578.082557] FS:  0000000000000000(0000) GS:ffff994edfc00000(0000) knlG=
S:0000000000000000
> [ 6578.087061] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 6578.090773] CR2: 00000000000000de CR3: 00000000060f4000 CR4: 000000000=
00006f0
> [ 6578.094964] Kernel panic - not syncing: Fatal exception in interrupt
> [ 6578.098987] Kernel Offset: 0x20800000 from 0xffffffff81000000 (relocat=
ion range: 0xffffffff80000000-0xffffffffbfffffff)
>
>
> =3D=3D=3D
>
>
>
> After reboot, I did another test:
>
> This time the AX.25 session went (unexpected) into the REJ-phase. With li=
sten -a you saw the polls (but no ack).
> After some minutes waiting, the machine panic'ed again.
> The first phase (refcount stuff) is the same as in the first issue above;=
 but then we see other malfunctions:
> ax25_relase() -> skb_expand_head() -> __dev_queue_xmit() -> netdev_core_p=
ick_tx() -> NULL pointer deference
>
>
>
> [ 5396.470790] refcount_t: underflow; use-after-free.
> [ 5396.474176] WARNING: CPU: 0 PID: 730 at lib/refcount.c:28 refcount_war=
n_saturate+0xba/0x110
> [ 5396.479838] Modules linked in: nft_chain_nat(E) xt_nat(E) nf_nat(E) nf=
_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E) nft_compat(E=
) nf_tables(E) libcrc32c(E) nfnetlink(E) tun(E) mkiss(E) bpqether(E) ax25(E=
) snd_pcm(E) snd_timer(E) qxl(E) joydev(E) drm_ttm_helper(E) evdev(E) snd(E=
) ttm(E) soundcore(E) serio_raw(E) pcspkr(E) virtio_console(E) virtio_ballo=
on(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) netconsole(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) virtio_net(E) net_failover(E) failover(E) vir=
tio_blk(E) hid_generic(E) usbhid(E) hid(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ehci_pci(E) uhci_hcd(E) ata_piix(E) ehci_hcd(E) libata(E) usbcore=
(E) usb_common(E) virtio_pci(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) i2c_piix4(E) scsi_mod(E) scsi_common(E) flo=
ppy(E)
> [ 5396.529470] CPU: 0 PID: 730 Comm: tnt Tainted: G            E      6.0=
.0-rc3+ #1
> [ 5396.533550] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 5396.537821] RIP: 0010:refcount_warn_saturate+0xba/0x110
> [ 5396.540429] Code: 01 01 e8 c6 10 45 00 0f 0b c3 cc cc cc cc 80 3d 12 b=
f 10 01 00 75 85 48 c7 c7 c0 57 16 8b c6 05 02 bf 10 01 01 e8 a3 10 45 00 <=
0f> 0b c3 cc cc cc cc 80 3d ed be 10 01 00 0f 85 5e ff ff ff 48 c7
> [ 5396.548943] RSP: 0018:ffffb5190070be38 EFLAGS: 00010282
> [ 5396.551359] RAX: 0000000000000000 RBX: ffff8eb283012a40 RCX: 000000000=
0000000
> [ 5396.554557] RDX: 0000000000000001 RSI: ffffffff8b14e122 RDI: 00000000f=
fffffff
> [ 5396.557633] RBP: ffff8eb288559400 R08: 0000000000000000 R09: 00000000f=
fffefff
> [ 5396.560606] R10: ffffb5190070bcd8 R11: ffffffff8b4cbaa8 R12: ffff8eb28=
73b10c0
> [ 5396.563529] R13: ffff8eb282362400 R14: ffff8eb288559480 R15: 000000000=
0000000
> [ 5396.566390] FS:  0000000000000000(0000) GS:ffff8eb29fc00000(0063) knlG=
S:00000000f7cbb700
> [ 5396.569483] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 5396.571730] CR2: 0000000008bfc6c0 CR3: 000000000782e000 CR4: 000000000=
00006f0
> [ 5396.574509] Call Trace:
> [ 5396.575473]  <TASK>
> [ 5396.576315]  ax25_release+0x327/0x340 [ax25]
> [ 5396.577977]  __sock_release+0x3d/0xb0
> [ 5396.579397]  sock_close+0x11/0x20
> [ 5396.580674]  __fput+0x8c/0x240
> [ 5396.581900]  task_work_run+0x5c/0x90
> [ 5396.583292]  exit_to_user_mode_prepare+0x14d/0x150
> [ 5396.585124]  syscall_exit_to_user_mode+0x22/0x50
> [ 5396.586878]  ? __ia32_sys_close+0xe/0x50
> [ 5396.588348]  __do_fast_syscall_32+0x7c/0xf0
> [ 5396.589968]  do_fast_syscall_32+0x2f/0x70
> [ 5396.591510]  entry_SYSENTER_compat_after_hwframe+0x70/0x82
> [ 5396.593592] RIP: 0023:0xf7f17559
> [ 5396.594849] Code: 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 0=
1 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <=
5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> [ 5396.603322] RSP: 002b:00000000ffc4aa10 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000006
> [ 5396.607953] RAX: 0000000000000000 RBX: 000000000000000a RCX: 00000000f=
fc4accc
> [ 5396.612436] RDX: 00000000000001b0 RSI: 00000000000011d0 RDI: 000000000=
0000004
> [ 5396.616895] RBP: 00000000ffc4aba8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 5396.621381] R10: 0000000000000000 R11: 0000000000000206 R12: 000000000=
0000000
> [ 5396.625787] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 5396.630206]  </TASK>
> [ 5396.632748] ---[ end trace 0000000000000000 ]---
> [ 5413.601147] ------------[ cut here ]------------
> [ 5413.607243] refcount_t: saturated; leaking memory.
> [ 5413.613364] WARNING: CPU: 0 PID: 19211 at lib/refcount.c:22 refcount_w=
arn_saturate+0x51/0x110
> [ 5413.621656] Modules linked in: nft_chain_nat(E) xt_nat(E) nf_nat(E) nf=
_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E) nft_compat(E=
) nf_tables(E) libcrc32c(E) nfnetlink(E) tun(E) mkiss(E) bpqether(E) ax25(E=
) snd_pcm(E) snd_timer(E) qxl(E) joydev(E) drm_ttm_helper(E) evdev(E) snd(E=
) ttm(E) soundcore(E) serio_raw(E) pcspkr(E) virtio_console(E) virtio_ballo=
on(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) netconsole(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) virtio_net(E) net_failover(E) failover(E) vir=
tio_blk(E) hid_generic(E) usbhid(E) hid(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ehci_pci(E) uhci_hcd(E) ata_piix(E) ehci_hcd(E) libata(E) usbcore=
(E) usb_common(E) virtio_pci(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) i2c_piix4(E) scsi_mod(E) scsi_common(E) flo=
ppy(E)
> [ 5413.678345] CPU: 0 PID: 19211 Comm: beacon Tainted: G        W   E    =
  6.0.0-rc3+ #1
> [ 5413.683288] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 5413.688268] RIP: 0010:refcount_warn_saturate+0x51/0x110
> [ 5413.691994] Code: 84 bc 00 00 00 c3 cc cc cc cc 85 f6 74 46 80 3d 7d b=
f 10 01 00 75 ee 48 c7 c7 68 57 16 8b c6 05 6d bf 10 01 01 e8 0c 11 45 00 <=
0f> 0b c3 cc cc cc cc 80 3d 59 bf 10 01 00 75 cb 48 c7 c7 90 57 16
> [ 5413.701981] RSP: 0018:ffffb51900aafd88 EFLAGS: 00010282
> [ 5413.705610] RAX: 0000000000000000 RBX: ffff8eb2873b10c0 RCX: 000000000=
0000000
> [ 5413.710019] RDX: 0000000000000202 RSI: ffffffff8b14e122 RDI: 00000000f=
fffffff
> [ 5413.714385] RBP: ffffb51900aafe08 R08: 0000000000000000 R09: 00000000f=
fffefff
> [ 5413.718828] R10: ffffb51900aafc28 R11: ffffffff8b4cbaa8 R12: ffff8eb28=
73b10c0
> [ 5413.723186] R13: 0000000000000001 R14: 0000000000000000 R15: 000000000=
0000000
> [ 5413.727510] FS:  0000000000000000(0000) GS:ffff8eb29fc00000(0063) knlG=
S:00000000f7edc440
> [ 5413.732199] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 5413.736080] CR2: 00000000f7d2f0c0 CR3: 000000000362a000 CR4: 000000000=
00006f0
> [ 5413.740468] Call Trace:
> [ 5413.743216]  <TASK>
> [ 5413.745736]  ax25_addr_ax25dev+0x7d/0xb0 [ax25]
> [ 5413.749224]  ax25_bind+0x1f5/0x220 [ax25]
> [ 5413.752516]  __sys_bind+0xd3/0x100
> [ 5413.755615]  ? __sys_socket+0xc7/0x100
> [ 5413.758837]  __ia32_compat_sys_socketcall+0x280/0x360
> [ 5413.762471]  ? fpregs_assert_state_consistent+0x22/0x50
> [ 5413.766196]  ? exit_to_user_mode_prepare+0x3a/0x150
> [ 5413.769730]  __do_fast_syscall_32+0x6f/0xf0
> [ 5413.773108]  do_fast_syscall_32+0x2f/0x70
> [ 5413.776411]  entry_SYSENTER_compat_after_hwframe+0x70/0x82
> [ 5413.780220] RIP: 0023:0xf7ee1559
> [ 5413.783281] Code: 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 0=
1 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <=
5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> [ 5413.793350] RSP: 002b:00000000ffb87120 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000066
> [ 5413.797964] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00000000f=
fb87134
> [ 5413.802392] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 000000005=
7aa4360
> [ 5413.806852] RBP: 00000000ffb87238 R08: 0000000000000000 R09: 000000000=
0000000
> [ 5413.811277] R10: 0000000000000000 R11: 0000000000000206 R12: 000000000=
0000000
> [ 5413.815687] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 5413.820103]  </TASK>
> [ 5413.822762] ---[ end trace 0000000000000000 ]---
> [ 5419.575351] BUG: unable to handle page fault for address: ffff8eb22b05=
5280
> [ 5419.583342] #PF: supervisor write access in kernel mode
> [ 5419.590006] #PF: error_code(0x0002) - not-present page
> [ 5419.596022] PGD 6201067 P4D 6201067 PUD 0
> [ 5419.600949] Oops: 0002 [#1] PREEMPT SMP PTI
> [ 5419.605526] CPU: 0 PID: 730 Comm: tnt Tainted: G        W   E      6.0=
.0-rc3+ #1
> [ 5419.611672] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 5419.617982] RIP: 0010:ax25_release+0xe5/0x340 [ax25]
> [ 5419.622319] Code: e8 80 fc ff ff 4d 85 e4 74 4b 41 80 bc 24 94 00 00 0=
0 00 0f 84 fc 01 00 00 49 8b 44 24 08 48 85 c0 74 0a 48 8b 80 c8 04 00 00 <=
65> ff 08 49 8d bc 24 90 00 00 00 b8 ff ff ff ff 3e 41 0f c1 84 24
> [ 5419.633877] RSP: 0018:ffffb5190070be40 EFLAGS: 00010282
> [ 5419.637877] RAX: ffffffff8b455280 RBX: ffff8eb28820c680 RCX: 000000000=
0000000
> [ 5419.642501] RDX: 0000000000000001 RSI: 0000000000000246 RDI: 00000000f=
fffffff
> [ 5419.646974] RBP: ffff8eb283447000 R08: ffff8eb283447080 R09: ffff8eb28=
820c700
> [ 5419.651421] R10: 0000000000000008 R11: 0000000000000000 R12: ffff8eb28=
73b10c0
> [ 5419.655821] R13: ffff8eb28ac3fc00 R14: ffff8eb283447080 R15: 000000000=
0000000
> [ 5419.660191] FS:  0000000000000000(0000) GS:ffff8eb29fc00000(0063) knlG=
S:00000000f7cbb700
> [ 5419.664925] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 5419.668748] CR2: ffff8eb22b055280 CR3: 000000000782e000 CR4: 000000000=
00006f0
> [ 5419.673112] Call Trace:
> [ 5419.675637]  <TASK>
> [ 5419.678016]  __sock_release+0x3d/0xb0
> [ 5419.681062]  sock_close+0x11/0x20
> [ 5419.683963]  __fput+0x8c/0x240
> [ 5419.686680]  task_work_run+0x5c/0x90
> [ 5419.689564]  exit_to_user_mode_prepare+0x14d/0x150
> [ 5419.693011]  syscall_exit_to_user_mode+0x22/0x50
> [ 5419.696367]  ? __ia32_sys_close+0xe/0x50
> [ 5419.699484]  __do_fast_syscall_32+0x7c/0xf0
> [ 5419.702662]  do_fast_syscall_32+0x2f/0x70
> [ 5419.705767]  entry_SYSENTER_compat_after_hwframe+0x70/0x82
> [ 5419.709452] RIP: 0023:0xf7f17559
> [ 5419.712267] Code: 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 0=
1 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <=
5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> [ 5419.721929] RSP: 002b:00000000ffc4a950 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000006
> [ 5419.726478] RAX: 0000000000000000 RBX: 0000000000000007 RCX: 000000000=
0000000
> [ 5419.730993] RDX: 0000000000000000 RSI: 000000000900c1b0 RDI: 00000000f=
fc4a9d2
> [ 5419.735364] RBP: 00000000ffc4a998 R08: 0000000000000000 R09: 000000000=
0000000
> [ 5419.739309] R10: 0000000000000000 R11: 0000000000000206 R12: 000000000=
0000000
> [ 5419.743236] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 5419.747071]  </TASK>
> [ 5419.749314] Modules linked in: nft_chain_nat(E) xt_nat(E) nf_nat(E) nf=
_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E) nft_compat(E=
) nf_tables(E) libcrc32c(E) nfnetlink(E) tun(E) mkiss(E) bpqether(E) ax25(E=
) snd_pcm(E) snd_timer(E) qxl(E) joydev(E) drm_ttm_helper(E) evdev(E) snd(E=
) ttm(E) soundcore(E) serio_raw(E) pcspkr(E) virtio_console(E) virtio_ballo=
on(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) netconsole(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) virtio_net(E) net_failover(E) failover(E) vir=
tio_blk(E) hid_generic(E) usbhid(E) hid(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ehci_pci(E) uhci_hcd(E) ata_piix(E) ehci_hcd(E) libata(E) usbcore=
(E) usb_common(E) virtio_pci(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) i2c_piix4(E) scsi_mod(E) scsi_common(E) flo=
ppy(E)
> [ 5419.792349] CR2: ffff8eb22b055280
> [ 5419.795476] ---[ end trace 0000000000000000 ]---
> [ 5419.799174] RIP: 0010:ax25_release+0xe5/0x340 [ax25]
> [ 5419.802955] Code: e8 80 fc ff ff 4d 85 e4 74 4b 41 80 bc 24 94 00 00 0=
0 00 0f 84 fc 01 00 00 49 8b 44 24 08 48 85 c0 74 0a 48 8b 80 c8 04 00 00 <=
65> ff 08 49 8d bc 24 90 00 00 00 b8 ff ff ff ff 3e 41 0f c1 84 24
> [ 5419.813787] RSP: 0018:ffffb5190070be40 EFLAGS: 00010282
> [ 5419.817743] RAX: ffffffff8b455280 RBX: ffff8eb28820c680 RCX: 000000000=
0000000
> [ 5419.822442] RDX: 0000000000000001 RSI: 0000000000000246 RDI: 00000000f=
fffffff
> [ 5419.827168] RBP: ffff8eb283447000 R08: ffff8eb283447080 R09: ffff8eb28=
820c700
> [ 5419.831832] R10: 0000000000000008 R11: 0000000000000000 R12: ffff8eb28=
73b10c0
> [ 5419.836484] R13: ffff8eb28ac3fc00 R14: ffff8eb283447080 R15: 000000000=
0000000
> [ 5419.841094] FS:  0000000000000000(0000) GS:ffff8eb29fc00000(0063) knlG=
S:00000000f7cbb700
> [ 5419.846159] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 5419.850307] CR2: ffff8eb22b055280 CR3: 000000000782e000 CR4: 000000000=
00006f0
> [ 5419.870433] BUG: kernel NULL pointer dereference, address: 00000000000=
00030
> [ 5419.875043] #PF: supervisor read access in kernel mode
> [ 5419.878478] #PF: error_code(0x0000) - not-present page
> [ 5419.882214] PGD 8000000008471067 P4D 8000000008471067 PUD 0
> [ 5419.886179] Oops: 0000 [#2] PREEMPT SMP PTI
> [ 5419.889725] CPU: 0 PID: 730 Comm: tnt Tainted: G      D W   E      6.0=
.0-rc3+ #1
> [ 5419.894517] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.14.0-2 04/01/2014
> [ 5419.899818] RIP: 0010:netdev_core_pick_tx+0x45/0xc0
> [ 5419.903596] Code: 00 00 76 10 65 8b 05 e2 b4 8b 75 83 c0 01 89 86 9c 0=
0 00 00 83 bb cc 03 00 00 01 74 57 48 8b 83 d0 00 00 00 48 89 ee 48 89 df <=
48> 8b 40 30 48 85 c0 74 59 e8 1d 72 4a 00 44 0f b7 e0 44 89 e2 44
> [ 5419.914581] RSP: 0018:ffffb5190070bd90 EFLAGS: 00010297
> [ 5419.918611] RAX: 0000000000000000 RBX: ffffffff8bd02fd0 RCX: 000000000=
0000017
> [ 5419.923467] RDX: 0000000000000000 RSI: ffff8eb283eaf500 RDI: ffffffff8=
bd02fd0
> [ 5419.928267] RBP: ffff8eb283eaf500 R08: 0000000077aa2fd5 R09: 000000000=
0000015
> [ 5419.933071] R10: ffff8eb29b95dc00 R11: 0000000000000001 R12: ffffffff8=
bd02fd0
> [ 5419.937862] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8eb28=
b7c6c80
> [ 5419.942671] FS:  0000000000000000(0000) GS:ffff8eb29fc00000(0000) knlG=
S:0000000000000000
> [ 5419.947627] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 5419.951807] CR2: 0000000000000030 CR3: 000000000bc42000 CR4: 000000000=
00006f0
> [ 5419.956614] Call Trace:
> [ 5419.959541]  <TASK>
> [ 5419.962161]  __dev_queue_xmit+0x29b/0xcc0
> [ 5419.965651]  ? skb_expand_head+0xac/0x1b0
> [ 5419.969192]  ax25_release+0x2a6/0x340 [ax25]
> [ 5419.972901]  __sock_release+0x3d/0xb0
> [ 5419.976332]  sock_close+0x11/0x20
> [ 5419.979587]  __fput+0x8c/0x240
> [ 5419.982644]  task_work_run+0x5c/0x90
> [ 5419.985876]  do_exit+0x326/0xaf0
> [ 5419.988865]  ? exit_to_user_mode_prepare+0x14d/0x150
> [ 5419.992547]  make_task_dead+0x51/0x60
> [ 5419.995708]  rewind_stack_and_make_dead+0x17/0x20
> [ 5419.999219] RIP: 0023:0xf7f17559
> [ 5420.002090] Code: Unable to access opcode bytes at RIP 0xf7f1752f.
> [ 5420.006171] RSP: 002b:00000000ffc4a950 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000006
> [ 5420.010705] RAX: 0000000000000000 RBX: 0000000000000007 RCX: 000000000=
0000000
> [ 5420.015181] RDX: 0000000000000000 RSI: 000000000900c1b0 RDI: 00000000f=
fc4a9d2
> [ 5420.019585] RBP: 00000000ffc4a998 R08: 0000000000000000 R09: 000000000=
0000000
> [ 5420.023979] R10: 0000000000000000 R11: 0000000000000206 R12: 000000000=
0000000
> [ 5420.028330] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 5420.032586]  </TASK>
> [ 5420.034989] Modules linked in: nft_chain_nat(E) xt_nat(E) nf_nat(E) nf=
_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_tcpudp(E) nft_compat(E=
) nf_tables(E) libcrc32c(E) nfnetlink(E) tun(E) mkiss(E) bpqether(E) ax25(E=
) snd_pcm(E) snd_timer(E) qxl(E) joydev(E) drm_ttm_helper(E) evdev(E) snd(E=
) ttm(E) soundcore(E) serio_raw(E) pcspkr(E) virtio_console(E) virtio_ballo=
on(E) drm_kms_helper(E) qemu_fw_cfg(E) button(E) netconsole(E) fuse(E) drm(=
E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E=
) crc16(E) mbcache(E) jbd2(E) virtio_net(E) net_failover(E) failover(E) vir=
tio_blk(E) hid_generic(E) usbhid(E) hid(E) crc32c_intel(E) psmouse(E) ata_g=
eneric(E) ehci_pci(E) uhci_hcd(E) ata_piix(E) ehci_hcd(E) libata(E) usbcore=
(E) usb_common(E) virtio_pci(E) virtio_pci_legacy_dev(E) virtio_pci_modern_=
dev(E) virtio(E) virtio_ring(E) i2c_piix4(E) scsi_mod(E) scsi_common(E) flo=
ppy(E)
> [ 5420.077395] CR2: 0000000000000030
> [ 5420.080329] ---[ end trace 0000000000000000 ]---
> [ 5420.083816] RIP: 0010:ax25_release+0xe5/0x340 [ax25]
> [ 5420.087578] Code: e8 80 fc ff ff 4d 85 e4 74 4b 41 80 bc 24 94 00 00 0=
0 00 0f 84 fc 01 00 00 49 8b 44 24 08 48 85 c0 74 0a 48 8b 80 c8 04 00 00 <=
65> ff 08 49 8d bc 24 90 00 00 00 b8 ff ff ff ff 3e 41 0f c1 84 24
> [ 5420.098305] RSP: 0018:ffffb5190070be40 EFLAGS: 00010282
> [ 5420.102142] RAX: ffffffff8b455280 RBX: ffff8eb28820c680 RCX: 000000000=
0000000
> [ 5420.106800] RDX: 0000000000000001 RSI: 0000000000000246 RDI: 00000000f=
fffffff
> [ 5420.111521] RBP: ffff8eb283447000 R08: ffff8eb283447080 R09: ffff8eb28=
820c700
> [ 5420.116143] R10: 0000000000000008 R11: 0000000000000000 R12: ffff8eb28=
73b10c0
> [ 5420.120787] R13: ffff8eb28ac3fc00 R14: ffff8eb283447080 R15: 000000000=
0000000
> [ 5420.125453] FS:  0000000000000000(0000) GS:ffff8eb29fc00000(0000) knlG=
S:0000000000000000
> [ 5420.130457] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 5420.134555] CR2: 0000000000000030 CR3: 000000000bc42000 CR4: 000000000=
00006f0
> [ 5420.139236] Kernel panic - not syncing: Fatal exception in interrupt
> [ 5420.143715] Kernel Offset: 0x9000000 from 0xffffffff81000000 (relocati=
on range: 0xffffffff80000000-0xffffffffbfffffff)
>
>
>
>
