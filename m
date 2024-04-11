Return-Path: <linux-hams+bounces-96-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C5F8A0670
	for <lists+linux-hams@lfdr.de>; Thu, 11 Apr 2024 05:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979221F25DE5
	for <lists+linux-hams@lfdr.de>; Thu, 11 Apr 2024 03:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135E513B28D;
	Thu, 11 Apr 2024 03:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="bf9q/Rss"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp65.ord1d.emailsrvr.com (smtp65.ord1d.emailsrvr.com [184.106.54.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EEA12D75B
	for <linux-hams@vger.kernel.org>; Thu, 11 Apr 2024 03:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804508; cv=none; b=jxiloPgYhSCxEJT7F1pVBLWjsoDb3y/q00UkMv4YfDWqALETj8Y8uICB+W9LBwVI0LslrqEdn7KiQsztrGdwkZtdDMfiuvR+B2o//feUyMxuXvO8uDi6yC5oeaDBYmn84fRj9i+DUIQ7UjOuyXfFELNtkhlmwoIRYSciPJsL1eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804508; c=relaxed/simple;
	bh=4sDnauAO9e00neF7yHgcAMXedYjpr4oNTEpgSPpADpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Scy0IhioXMZy+PgZiITo83AI+BWXcT6aHpd+b49CnTyiiERrzPZ3Op1t/xWGJ6Q18exWtvkW4eohQ6IC/esVElL4t2z8tayRIbaOIJMihAQluqfweDAa2ZUeYD7M3vOlVvl0l0b59yeJT4cek30RvEgbXsOG261U0XcnOtnWZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=bf9q/Rss; arc=none smtp.client-ip=184.106.54.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1712803373;
	bh=4sDnauAO9e00neF7yHgcAMXedYjpr4oNTEpgSPpADpg=;
	h=From:Date:Subject:To:From;
	b=bf9q/RssRdV0996mLoU75kWK+fiLUxO9W8vZo5ErKOKcv8uhBxT+XJsgHUts1HKjB
	 nHjjdPVDRBIxkXAu7xjt6b38eUixdVSK7xgIvKlZQEZZIs4qH1FVxh3bygJT05hO1V
	 z1iRgMCD2bAwrTZvEicyQZs3ypswW/WltXjO2v7w=
X-Auth-ID: lars@oddbit.com
Received: by smtp17.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id C8C56201F7
	for <linux-hams@vger.kernel.org>; Wed, 10 Apr 2024 22:42:53 -0400 (EDT)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ecf1d22d78so1166520b3a.0
        for <linux-hams@vger.kernel.org>; Wed, 10 Apr 2024 19:42:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCB9fgDeORd+nafMrT+AADPwJem3XcNxYrDuffS5hjVpoTfyNlrkdajklxN6xe0hvfIowHYgE7as3/B825v9AOLUygHBB4DS7k3w==
X-Gm-Message-State: AOJu0YyI/xSsB1lDB97Ac7ua8n/ZJtuNbJerOpRgPvIGInhpYK5NCPip
	uhKWHggkSxplwFTSC/+wj9yd2X7PvHGpTw7hLBu2pphc+H1rayklwwBNHEg/9nVwFMUDhJiUuOv
	FXnRWetvwNv6v7rJ5pBVY/kK8+3k=
X-Google-Smtp-Source: AGHT+IGzrbOfMadvKbQURiMc9pUFxbr2XDke0zI5/fkoZYAbLtYv1r0okjvrSDgT0pzmNSzVN577Q0b3zH8SkkcE1sY=
X-Received: by 2002:a05:6a20:9188:b0:1a7:737b:234c with SMTP id
 v8-20020a056a20918800b001a7737b234cmr5064199pzd.3.1712803373356; Wed, 10 Apr
 2024 19:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
 <8dcbb033-f4b9-4a3d-9bd5-dc5301bfe51a@moroto.mountain>
In-Reply-To: <8dcbb033-f4b9-4a3d-9bd5-dc5301bfe51a@moroto.mountain>
From: Lars Kellogg-Stedman <lars@oddbit.com>
Date: Wed, 10 Apr 2024 22:42:42 -0400
X-Gmail-Original-Message-ID: <CA+Q+rdweaS6BiZen02o8eSQnBTyo6h35QxexNQC4rKk=H4LrCw@mail.gmail.com>
Message-ID: <CA+Q+rdweaS6BiZen02o8eSQnBTyo6h35QxexNQC4rKk=H4LrCw@mail.gmail.com>
Subject: Re: unregister_netdevice: waiting for ax0 to become free
To: Dan Carpenter <dan.carpenter@linaro.org>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Classification-ID: 9c9855e6-7474-4c38-8b28-1a169cab276d-1-1

On Wed, Apr 10, 2024 at 8:01=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> You say that this isn't a new problem...  Why would it not be a new
> problem?

I know that the same behavior reproduces with the Fedora 39 stock
kernel (6.5.6 +
patches, released 10/2023, predating fd819ad3ecf6 by several months).
I've also seen the same thing on Raspbian kernels dating back
before that.

> Could you try reverting commit fd819ad3ecf6 ("ax25: fix
> use-after-free bugs caused by ax25_ds_del_timer") and see if that fixes
> the problem?
>
> Just do: `git show fd819ad3ecf6 | patch -p1 -R` and rebuild.

The behavior is identical with that patch removed.

> Could you provide the whole dmesg?

Sure. Included below:

[   43.941039] ------------[ cut here ]------------er root...
[   43.941327] refcount_t: underflow; use-after-free.
[   43.941654] WARNING: CPU: 0 PID: 992 at lib/refcount.c:28
refcount_warn_saturate+0xbe/0x110
[   43.942186] Modules linked in: mkiss rfkill binfmt_misc vfat fat
intel_rapl_msr intel_rapl_common intel_uncore_frequency_common
intel_pmc_core snd_hda_codec_generic intel_vsec pmt_telemetry
pmt_class snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi kvm_intel
snd_hda_codec snd_hda_core kvm snd_hwdep snd_pcm iTCO_wdt
intel_pmc_bxt iTCO_vendor_support irqbypass rapl pktcdvd snd_timer
i2c_i801 snd i2c_smbus pcspkr lpc_ich soundcore virtio_net
net_failover virtio_balloon failover virtio_gpu virtio_dma_buf joydev
netrom ax25 ip6_tables ip_tables fuse loop zram crct10dif_pclmul
crc32_pclmul crc32c_intel polyval_clmulni polyval_generic
ghash_clmulni_intel sha512_ssse3 sha256_ssse3 virtio_console
sha1_ssse3 virtio_blk serio_raw qemu_fw_cfg
[   43.946568] CPU: 0 PID: 992 Comm: ax25ipd Not tainted
6.8.4-200.fc39.x86_64 #1
[   43.947132] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS 1.16.3-1.fc39 04/01/2014
[   43.947692] RIP: 0010:refcount_warn_saturate+0xbe/0x110
[   43.948031] Code: 01 01 e8 95 43 8e ff 0f 0b c3 cc cc cc cc 80 3d
6b 4e ea 01 00 75 85 48 c7 c7 00 8a b7 98 c6 05 5b 4e ea 01 01 e8 72
43 8e ff <0f> 0b c3 cc cc cc cc 80 3d 49 4e ea 01 00 0f 85 5e ff ff ff
48 c7
[   43.949211] RSP: 0018:ffffa714c24a3b28 EFLAGS: 00010286

[   43.949563] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00027
[   43.950163] RDX: ffff90817bc218c8 RSI: 0000000000000001 RDI: ffff90817bc=
218c0
[   43.950165] RBP: ffff908113a18000 R08: 0000000000000000 R09: ffffa714c24=
a39b8
[   43.950166] R10: ffffa714c24a39b0 R11: 0000000000000003 R12: ffff9081062=
70e40
[   43.950167] R13: ffffa714c24a3b98 R14: 00000000ffffffe5 R15: 00000000000=
00000
[   43.950168] FS:  0000000000000000(0000) GS:ffff90817bc00000(0000)
knlGS:0000000000000000
[   43.950169] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.950170] CR2: 00007f3f99972080 CR3: 00000001068ca005 CR4: 00000000007=
70ef0
[   43.950173] PKRU: 55555554
[   43.950174] Call Trace:
[   43.950176]  <TASK>
[   43.950176]  ? refcount_warn_saturate+0xbe/0x110
[   43.950180]  ? __warn+0x81/0x130
[   43.950184]  ? refcount_warn_saturate+0xbe/0x110
[   43.950186]  ? report_bug+0x171/0x1a0
[   43.950189]  ? prb_read_valid+0x1b/0x30
[   43.950191]  ? handle_bug+0x3c/0x80
[   43.950194]  ? exc_invalid_op+0x17/0x70
[   43.950196]  ? asm_exc_invalid_op+0x1a/0x20
[   43.950199]  ? refcount_warn_saturate+0xbe/0x110
[   43.950201]  ? refcount_warn_saturate+0xbe/0x110
[   43.950203]  ax25_device_event+0x1b1/0x240 [ax25]
[   43.950213]  notifier_call_chain+0x5a/0xd0
[   43.950217]  dev_close_many+0x11e/0x180
[   43.950221]  unregister_netdevice_many_notify+0x199/0x880
[   43.950224]  unregister_netdevice_queue+0xf7/0x140
[   43.950226]  unregister_netdev+0x1c/0x30
[   43.950230]  mkiss_close+0x76/0xb0 [mkiss]
[   43.950234]  tty_ldisc_hangup+0xfd/0x230
[   43.950238]  __tty_hangup.part.0+0x1f3/0x370
[   43.950240]  tty_release+0xee/0x600
[   43.950242]  __fput+0x97/0x2c0
[   43.950245]  task_work_run+0x5a/0x90
[   43.950248]  do_exit+0x360/0xaf0
[   43.950250]  ? __handle_mm_fault+0xb2c/0xe50
[   43.950254]  do_group_exit+0x31/0x80
[   43.950257]  __x64_sys_exit_group+0x18/0x20
[   43.950258]  do_syscall_64+0x86/0x170
[   43.950261]  ? __count_memcg_events+0x4d/0xc0
[   43.950263]  ? count_memcg_events.constprop.0+0x1a/0x30
[   43.950265]  ? handle_mm_fault+0xa2/0x360
[   43.950267]  ? do_user_addr_fault+0x304/0x670
[   43.950270]  ? exc_page_fault+0x7f/0x180
[   43.950273]  entry_SYSCALL_64_after_hwframe+0x73/0x7b
[   43.950275] RIP: 0033:0x7f9d1e85091d
[   43.950288] Code: Unable to access opcode bytes at 0x7f9d1e8508f3.
[   43.950289] RSP: 002b:00007ffcee06aff8 EFLAGS: 00000202 ORIG_RAX:
00000000000000e7
[   43.950291] RAX: ffffffffffffffda RBX: 00007f9d1e94cfa8 RCX: 00007f9d1e8=
5091d
[   43.950292] RDX: 00000000000000e7 RSI: ffffffffffffff88 RDI: 00000000000=
00001
[   43.950293] RBP: 00007ffcee06b050 R08: 00007ffcee06af98 R09: 00007ffcee0=
6af1f
[   43.950294] R10: 00007ffcee06ae90 R11: 0000000000000202 R12: 00000000000=
00001
[   43.950294] R13: 0000000000000000 R14: 0000000000000001 R15: 00007f9d1e9=
4cfc0
[   43.950297]  </TASK>
[   43.950297] ---[ end trace 0000000000000000 ]---


--
Lars Kellogg-Stedman <lars@oddbit.com> | larsks@{twitter, irc, github,
...} | N1LKS

