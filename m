Return-Path: <linux-hams+bounces-98-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5355E8A171E
	for <lists+linux-hams@lfdr.de>; Thu, 11 Apr 2024 16:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0F1B1F21B94
	for <lists+linux-hams@lfdr.de>; Thu, 11 Apr 2024 14:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCDF14E2EA;
	Thu, 11 Apr 2024 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="RZoCFKCs"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp78.iad3b.emailsrvr.com (smtp78.iad3b.emailsrvr.com [146.20.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA6122096
	for <linux-hams@vger.kernel.org>; Thu, 11 Apr 2024 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712845630; cv=none; b=XIxDkQPf9pQ/m+QhQMNR5LfWEmagGkgtsySeWLLxFtNLpUBGiHaMGLn/Bx34LYofu6HL7hI0gSDSHgBmbPCOwxkRcMc3p9UDC89PE9NNSgMVrimXnmJQv5MolFjCV1toEf++0pqk3l27U2Yc6Dz8lMDTkCNPEz2lwe9htuu0XK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712845630; c=relaxed/simple;
	bh=2STnOCkSi/otnxsKcCikq9Eeto0LCdc8TIq50QJMsuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=MkPovaVuiFfiGfMzS8F9equACZ28++44OQkQxRs0nvBqGTxgJC/01EaHRkqqQz5ZrvTvTe/AptZo3ojnIT+PkWb6AgpGWPLAl4Pyopt1vtqmpQb3X2d7W5sTwtJDCUmexuaq/hja6PnXDu1yfbqpiVMc7PhX6yglqjbhXYjpiFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=RZoCFKCs; arc=none smtp.client-ip=146.20.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1712843289;
	bh=2STnOCkSi/otnxsKcCikq9Eeto0LCdc8TIq50QJMsuc=;
	h=From:Date:Subject:To:From;
	b=RZoCFKCss5cg+ENezCEeRhOIhNhCBZTDsenNtoGAWEEuvY9GvTB69H7syynZNs5hq
	 T2f62PYipL1Hpx4iimHXvakmLyD5DmHssvOfI0SImbjY2FthOxA6YCosVm7VHasKsp
	 3Txi25dwoczeeRELJ3uzd0E/qPUP9b6LwZOWFIvI=
X-Auth-ID: lars@oddbit.com
Received: by smtp10.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 351B8E03CE
	for <linux-hams@vger.kernel.org>; Thu, 11 Apr 2024 09:48:09 -0400 (EDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2a2cced7482so2102571a91.0
        for <linux-hams@vger.kernel.org>; Thu, 11 Apr 2024 06:48:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzN6dwvkVoUu7U2bvjtG5YZylxaIJW2IL9yPDzUueM1iipU/jqIzKL2Vzk8hulGeh4vaCf+ENGwR3MZ5aUHs1iYnjz8WmS6EVDzg==
X-Gm-Message-State: AOJu0Yz72jMcfzN4Z+sAilDxmUQWDOcRAIlLlxpevhGrFfuygUNFXMSI
	rcNjo/yfAgJ/p6mZqqrq7x9SIOfWIQt0cS6RuL7rnrkwJEHiTcdLMBbipKZGBhOlCgWXJtVmiIX
	YQpeDqPlIvNqz1+YNiLhMCjWQYkE=
X-Google-Smtp-Source: AGHT+IE0EiUVh6/hOaw5T1fy14EApuhrUdY0OvxhG6RIQf4DGlJOHsDHhuRIV9VowdC5rBZXzb1CrN1PmbuiyaxF5Zc=
X-Received: by 2002:a17:90a:eb14:b0:2a2:afca:c635 with SMTP id
 j20-20020a17090aeb1400b002a2afcac635mr5314892pjz.0.1712843288634; Thu, 11 Apr
 2024 06:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
 <8dcbb033-f4b9-4a3d-9bd5-dc5301bfe51a@moroto.mountain> <CA+Q+rdweaS6BiZen02o8eSQnBTyo6h35QxexNQC4rKk=H4LrCw@mail.gmail.com>
In-Reply-To: <CA+Q+rdweaS6BiZen02o8eSQnBTyo6h35QxexNQC4rKk=H4LrCw@mail.gmail.com>
From: Lars Kellogg-Stedman <lars@oddbit.com>
Date: Thu, 11 Apr 2024 09:47:57 -0400
X-Gmail-Original-Message-ID: <CA+Q+rdzfdD76dqypgP5MsmRJv7RmCuJxAtqXUvrN08MjzRtm6A@mail.gmail.com>
Message-ID: <CA+Q+rdzfdD76dqypgP5MsmRJv7RmCuJxAtqXUvrN08MjzRtm6A@mail.gmail.com>
Subject: Re: unregister_netdevice: waiting for ax0 to become free
To: Dan Carpenter <dan.carpenter@linaro.org>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Classification-ID: 21a4b14b-99f8-461e-8f01-fa41eb2b1152-1-1

It turns out there is also an *earlier* trace that occurs after the
first ax25 connection is closed. The trace does not repeat for
subsequent connections:

[   32.034626] ------------[ cut here ]------------
[   32.035856] refcount_t: decrement hit 0; leaking memory.
[   32.036887] WARNING: CPU: 1 PID: 1014 at lib/refcount.c:31
refcount_warn_saturate+0xff/0x110
[   32.037344] Modules linked in: mkiss rfkill binfmt_misc vfat fat
intel_rapl_msr intel_rapl_common intel_uncore_frequency_common
kvm_intel kvm snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg
snd_intel_sdw_acpi snd_hda_codec snd_hda_core rapl iTCO_wdt snd_hwdep
snd_pcm iTCO_vendor_support snd_timer virtio_gpu snd virtio_net
i2c_i801 pktcdvd net_failover pcspkr i2c_smbus soundcore lpc_ich
virtio_dma_buf virtio_balloon failover drm_shmem_helper joydev netrom
ax25 loop zram zsmalloc crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel sha512_ssse3 sha256_ssse3 virtio_blk sha1_ssse3
virtio_console serio_raw ip6_tables ip_tables fuse qemu_fw_cfg
[   32.040112] CPU: 1 PID: 1014 Comm: axwrapper Not tainted 6.9.0-rc3-radio+ #9
[   32.040506] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS 1.16.3-1.fc39 04/01/2014
[   32.040944] RIP: 0010:refcount_warn_saturate+0xff/0x110
[   32.041203] Code: f0 13 83 82 c6 05 34 08 4e 01 01 e8 fb bd 91 ff
0f 0b c3 cc cc cc cc 48 c7 c7 48 14 83 82 c6 05 18 08 4e 01 01 e8 e1
bd 91 ff <0f> 0b c3 cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 90 90 90
90 90
[   32.042170] RSP: 0018:ffffc9000080bd28 EFLAGS: 00010282
[   32.042474] RAX: 0000000000000000 RBX: ffff88813f48e570 RCX: 0000000000000000
[   32.042853] RDX: ffff88817bd2f1c0 RSI: ffff88817bd21880 RDI: ffff88817bd21880
[   32.043189] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000003
[   32.043635] R10: ffffc9000080bbc8 R11: ffffffff82b3e548 R12: ffff88810e42f900
[   32.043994] R13: ffff88813f11d400 R14: ffff88813f56b880 R15: ffff88813f48e000
[   32.044369] FS:  0000000000000000(0000) GS:ffff88817bd00000(0000)
knlGS:0000000000000000
[   32.044773] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   32.045055] CR2: 00007efc9c3a7680 CR3: 0000000002a22006 CR4: 0000000000770ef0
[   32.045436] PKRU: 55555554
[   32.045577] Call Trace:
[   32.045702]  <TASK>
[   32.045812]  ? __warn+0x80/0x120
[   32.045975]  ? refcount_warn_saturate+0xff/0x110
[   32.046211]  ? report_bug+0x164/0x190
[   32.046416]  ? handle_bug+0x3c/0x80
[   32.046592]  ? exc_invalid_op+0x17/0x70
[   32.046801]  ? asm_exc_invalid_op+0x1a/0x20
[   32.047015]  ? refcount_warn_saturate+0xff/0x110
[   32.047257]  ? refcount_warn_saturate+0xff/0x110
[   32.047570]  ref_tracker_free+0x206/0x210
[   32.047797]  ? lock_timer_base+0x76/0xa0
[   32.048037]  ? _raw_spin_unlock_irqrestore+0xe/0x40
[   32.048372]  ? __mod_timer+0x10d/0x310
[   32.048591]  ax25_release+0xf3/0x360 [ax25]
[   32.048828]  __sock_release+0x3a/0xc0
[   32.049047]  sock_close+0x15/0x20
[   32.049444]  __fput+0x97/0x2c0
[   32.049810]  task_work_run+0x59/0x90
[   32.050314]  do_exit+0x311/0xac0
[   32.050651]  ? irqtime_account_irq+0x45/0xc0
[   32.051050]  do_group_exit+0x30/0x80
[   32.051469]  __x64_sys_exit_group+0x18/0x20
[   32.051875]  do_syscall_64+0x64/0x170
[   32.052271]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   32.052765] RIP: 0033:0x7efc9c2ac91d
[   32.053139] Code: Unable to access opcode bytes at 0x7efc9c2ac8f3.
[   32.053669] RSP: 002b:00007ffdd1d984d8 EFLAGS: 00000202 ORIG_RAX:
00000000000000e7
[   32.054281] RAX: ffffffffffffffda RBX: 00007efc9c3a8fa8 RCX: 00007efc9c2ac91d
[   32.054888] RDX: 00000000000000e7 RSI: ffffffffffffff88 RDI: 0000000000000000
[   32.055470] RBP: 00007ffdd1d98530 R08: 00007ffdd1d98480 R09: 00007ffdd1d9840f
[   32.055957] R10: 00007ffdd1d98390 R11: 0000000000000202 R12: 0000000000000001
[   32.056476] R13: 0000000000000000 R14: 0000000000000000 R15: 00007efc9c3a8fc0
[   32.056978]  </TASK>
[   32.057231] ---[ end trace 0000000000000000 ]---


--
Lars Kellogg-Stedman <lars@oddbit.com> | larsks@{twitter, irc, github,
...} | N1LKS

