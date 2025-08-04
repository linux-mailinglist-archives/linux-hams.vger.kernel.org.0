Return-Path: <linux-hams+bounces-550-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A2B1A93C
	for <lists+linux-hams@lfdr.de>; Mon,  4 Aug 2025 20:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54A711890821
	for <lists+linux-hams@lfdr.de>; Mon,  4 Aug 2025 18:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41AC721D3CA;
	Mon,  4 Aug 2025 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqipdkEH"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA0EEAB
	for <linux-hams@vger.kernel.org>; Mon,  4 Aug 2025 18:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754332826; cv=none; b=DIdOX88CJPzftDtWBPo0V/mJ9W8xr6RIYV2pqGoX+4es7271YEaGET59CLjuDUInjyMsoJJZ/ah7Ch9N15WUY3XDNirkHcFzkzRj4Y0yAv0pAGOJoS5b0RJSAm8+rHmt5wGY7Sr81wlebQf1Z0kwl4hhAAdqq6t7oUOABMQ6ERE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754332826; c=relaxed/simple;
	bh=ddPnkm7Li5gzUskqFKCtn6vDRKzCEgC3aXXqCJuO68w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gI0zZqTQaKLWrXijO16Scu1P2Xr/jQpbkMXVnKY0lSQH+h7ML4F5LG9FJOH8JC9HpiaDPgNlTKbGtl0iSp7rOh/zhdLopEzd7yzxkZPkBaiyx1Hz//8zOa0bELxzY9SsGzlkWiiECRlnlJ2WHtvTOWZEYuNbm4kOzpv2K1JVk2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqipdkEH; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e8e2a260926so4028453276.1
        for <linux-hams@vger.kernel.org>; Mon, 04 Aug 2025 11:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754332822; x=1754937622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXDya3D5Q0hy3Q0V9VUlCkI9/9CFSd24opBP4BVojeY=;
        b=dqipdkEHAoRMkoaDY85HFOysBXnCfTTRcb+915OuhdSQzrUHpPR/W5t1c+plwUPNJQ
         p7OKj2ekLirMyF5yJEQzMxLcSWGB6s4f/2I78aSfxSBs+dQV0n3SMIfFS8O1kiT5LsqF
         EhWCMzJX7mvGm2CU63ytI5ioOyMWsVTiLcVJpVkjFDF2qkhPdmhMwl/pRAIBwMYFJOLA
         7gmPpAReCKdAQUMwKAcTGpGPamUjOd1aEPeSU/EovR6yxLD9U5PHsySQquvezJF77oZl
         8ADE9NYX6GqVnKigPqbuFEz9w1pLvdwTUgJzFG26ABtCFUxNY+DMOb2Cu3Dxx4onW1xe
         p5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754332822; x=1754937622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXDya3D5Q0hy3Q0V9VUlCkI9/9CFSd24opBP4BVojeY=;
        b=lXX6J1OGP1w6YD4sg4edNiDZcHDaIeFYNGBVYwWWimhl8bNlsbQ+CBHDpAUwTQWVls
         OKT0g4FNIMavm8V+kiW9o4e2Om8ftFTPGXaSp1hfMqiMtiUCNt+/mG8X1TaxWQ2DEKI2
         WFhVLz/9vtD0NNWg6Q+Pr5wX8YYoAWr5XHmyWb0TdstANMskMiGXMHBcC8WmZN85mwWq
         9NgxqnJiXP5z1b+nKoLwt/ZuZcGXyMC25E83XwYB6MQ8IXfVr7b/VgQJHLkn09oIjjHZ
         n2+IM1dyvKL2Dw4aImFRSjheLJ4oWSAXJBPMDphuDJidefrDT/Vh89iqhuvUBGjXPSiw
         rqNA==
X-Gm-Message-State: AOJu0YyeJHaWgk1SqqWXAr3H4vuPLqpcimbNXKjoFABpST3QSlN98Ljv
	DKHq0O9MDwFoGE3ktDLubU5OBklGcy50dyDrymwMKCPf0zmA1QRNgGUttjvFH6YLWnU2NNUvHEH
	rMvRVyyH49nr+WEmZOTlNBQDJGtQ+2r1iO++a
X-Gm-Gg: ASbGncspK8J7GFfVocX6BEWHxz5lZffDP37hAZr5a7xIEX3qpANbhCLjUY6cehmtkAv
	cfxAxCaxTtch7A+HaYBA/OAYPbZLf1L1p/SAtUtrCu4/OO0RrtiR0mdit0kpfiLJj/kXMo/Utd0
	ugqQZlOnwyZi7Y3z7p7ObQCK6j4zAtCCnkYhTimTQoHXWD9WRQFvBQwy84A/K9qOjPI4dzzUDOW
	4N5iGW6HI33P2t5PEudaU1mn+P/cpDOJyyMh1eV
X-Google-Smtp-Source: AGHT+IG/lV3ClBZ6q35MZJfYn6mAzvqEt763Nf0juGYqHybVWtdZj/c+S/lPlwoZHY9VMGiqBRvm2pyHpTz4/lW/ZN0=
X-Received: by 2002:a05:6902:6086:b0:e8f:c81f:85b0 with SMTP id
 3f1490d57ef6-e8fee1e8cd7mr10831571276.43.1754332821887; Mon, 04 Aug 2025
 11:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <018e5e9f979d1c2076b198b1ec970c6b@vanheusden.com>
In-Reply-To: <018e5e9f979d1c2076b198b1ec970c6b@vanheusden.com>
From: Dan Cross <crossd@gmail.com>
Date: Mon, 4 Aug 2025 14:39:45 -0400
X-Gm-Features: Ac12FXwi03QDkolAaiH7sqUNfrizC3l8cZpqlOWJZbBRHN_JJMF2WVI-TU4-_M4
Message-ID: <CAEoi9W4FGoEv+2FUKs7zc=XoLuwhhLY8f8t_xQ6MgTJyzQPxXA@mail.gmail.com>
Subject: Re: ax.25 & linux, 4th send attempt
To: Folkert van Heusden <folkert@vanheusden.com>
Cc: linux-hams@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	m.masimov@mt-integration.ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 3, 2025 at 5:33=E2=80=AFPM Folkert van Heusden
<folkert@vanheusden.com> wrote:
> I'm trying to setup an ax.25 bbs. A few things work like setting up a
> kiss-session, sending beacons and sending ip-over-ax.25 icmp packets.
>
> But as soon as someone tries to axcall to my bbs, the whole system (a
> raspberry pi 5) resets. This is with a remote connection (kiss over
> socat to a location a few km away). But if I on the other hand run
> direwolf and send a few packets, the system reboots as well.
>
> I tried to check the linux-ax25.in-berin.de website (as mentioned in the
> kernel docs), but that website is not responsive.

Unfortunately, this seems like yet another bug that has crept into the
kernel stack; I'm seeing the same on my packet system. I'm using an
x86_64 machine, FWIW.

I managed to capture an "oops" report, with the aim of finding and
fixing the issue, but haven't had cycles yet to actually do much
towards figuring out what's going on. Here, at least, is the oops
report taken from the serial portn:

```
packet login: [   38.251202] BUG: kernel NULL pointer dereference,
address: 0000000000000108
[   38.258197] #PF: supervisor read access in kernel mode
[   38.263370] #PF: error_code(0x0000) - not-present page
[   38.268540] PGD 0 P4D 0
[   38.271116] Oops: Oops: 0000 [#1] SMP NOPTI
[   38.275327] CPU: 6 UID: 0 PID: 113 Comm: kworker/u32:3 Not tainted
6.16.0-rc7-1-mainline #2 PREEMPT(full)
8a58127fc1a49a2614d0100acb708dd853270eb3
[   38.288548] Hardware name: Seco C40/C40, BIOS 1.08 04/23/2020
[   38.294320] Workqueue: events_unbound flush_to_ldisc
[   38.299320] RIP: 0010:packet_rcv_spkt+0x2b/0x1d0
[   38.303976] Code: 0f 1e fa 0f 1f 44 00 00 55 53 48 89 fb 48 83 ec
10 0f b6 87 80 00 00 00 83 e0 07 3c 05 74 14 48 8b 6a 30 48 89 f1 48
8b 45 30 <48> 39 86 08 01 00 00 74 1c ba 02 00 00 00 48 89 de 31 ff e8
4d a6
[   38.322730] RSP: 0018:ffffcc55001c0cd8 EFLAGS: 00010293
[   38.327982] RAX: ffffffffb18ac600 RBX: ffff8c4303173b00 RCX: 00000000000=
00000
[   38.335137] RDX: ffff8c431135d540 RSI: 0000000000000000 RDI: ffff8c43031=
73b00
[   38.342291] RBP: ffff8c431135d000 R08: ffff8c461019ebc0 R09: 00000000000=
000b4
[   38.349444] R10: ffffcc55001c0c10 R11: 0000000000000006 R12: ffffffffb18=
ac658
[   38.356604] R13: 0000000000000200 R14: ffff8c431135d540 R15: ffff8c43075=
ad540
[   38.363758] FS:  0000000000000000(0000) GS:ffff8c465eaa2000(0000)
knlGS:0000000000000000
[   38.371871] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   38.377640] CR2: 0000000000000108 CR3: 0000000105662000 CR4: 00000000003=
506f0
[   38.384799] Call Trace:
[   38.387278]  <IRQ>
[   38.389323]  ? srso_return_thunk+0x5/0x5f
[   38.393370]  ? ax25_kiss_rcv+0x67/0xa0 [ax25
6a367f060f69de19f9d80488b58bee5b32a0dd2f]
[   38.401315]  __netif_receive_skb_core.constprop.0+0x50f/0x11f0
[   38.407194]  ? srso_return_thunk+0x5/0x5f
[   38.411236]  ? effective_cpu_util+0x2f/0x100
[   38.415541]  ? srso_return_thunk+0x5/0x5f
[   38.419587]  ? effective_cpu_util+0x2f/0x100
[   38.423894]  ? srso_return_thunk+0x5/0x5f
[   38.427935]  ? get_nohz_timer_target+0x2f/0x150
[   38.432502]  __netif_receive_skb_one_core+0x39/0xa0
[   38.437413]  process_backlog+0x87/0x130
[   38.441287]  __napi_poll+0x31/0x1e0
[   38.444809]  net_rx_action+0x346/0x3e0
[   38.448608]  handle_softirqs+0xe6/0x2a0
[   38.452480]  ? srso_return_thunk+0x5/0x5f
[   38.456525]  do_softirq.part.0+0x3b/0x60
[   38.460480]  </IRQ>
[   38.462611]  <TASK>
[   38.464743]  __local_bh_enable_ip+0x60/0x70
[   38.468957]  mkiss_receive_buf+0x2ff/0x3a0 [mkiss
94445c653d74b367a27c4a3a584e227cbae90841]
[   38.477332]  tty_ldisc_receive_buf+0x4b/0x60
[   38.481632]  tty_port_default_receive_buf+0x49/0x70
[   38.486545]  flush_to_ldisc+0x95/0x1b0
[   38.490332]  process_one_work+0x193/0x350
[   38.494382]  worker_thread+0x2d7/0x410
[   38.498165]  ? __pfx_worker_thread+0x10/0x10
[   38.502470]  kthread+0xfc/0x240
[   38.505650]  ? __pfx_kthread+0x10/0x10
[   38.509431]  ? __pfx_kthread+0x10/0x10
[   38.513215]  ret_from_fork+0x19a/0x1c0
[   38.517001]  ? __pfx_kthread+0x10/0x10
[   38.520787]  ret_from_fork_asm+0x1a/0x30
[   38.524748]  </TASK>
[   38.526965] Modules linked in: mkiss vfat fat snd_sof_amd_acp70
snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd_rembrandt
snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xtensa_dsp
snd_sof snd_sof_utils snd_pci_ps snd_soc_acpi_amd_match
snd_amd_sdw_acpi soundwire_amd amd_atl intel_rapl_msr
soundwire_generic_allocation intel_rapl_common snd_hda_codec_realtek
soundwire_bus snd_hda_codec_generic snd_soc_sdca
snd_hda_scodec_component snd_hda_codec_hdmi snd_soc_core snd_hda_intel
kvm_amd snd_compress snd_usb_audio snd_intel_dspcfg ac97_bus
snd_intel_sdw_acpi snd_pcm_dmaengine kvm snd_usbmidi_lib
snd_rpl_pci_acp6x snd_hda_codec snd_acp_pci snd_ump snd_amd_acpi_mach
snd_rawmidi snd_hda_core irqbypass snd_acp_legacy_common
polyval_clmulni snd_seq_device snd_hwdep snd_pci_acp6x
ghash_clmulni_intel sha512_ssse3 ee1004 snd_pcm r8169 snd_pci_acp5x
sha1_ssse3 snd_timer snd_rn_pci_acp3x realtek sp5100_tco aesni_intel
snd_acp_config mdio_devres rapl snd_soc_acpi snd libphy i2c_piix4
cdc_acm acpi_cpufreq pcspkr k10temp
[   38.527165]  i2c_smbus mdio_bus i2c_amd_mp2_pci cp210x
snd_pci_acp3x mc ccp soundcore cm32181 industrialio i2c_hid_acpi
cfg80211 mousedev i2c_hid rfkill ip6t_REJECT nf_reject_ipv6 mac_hid
xt_hl ip6t_rt ipt_REJECT nf_reject_ipv4 xt_LOG nf_log_syslog xt_limit
xt_addrtype xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 ip6table_filter ip6_tables iptable_filter netrom ax25
dm_mod loop nfnetlink ip_tables x_tables amdgpu mmc_block rpmb_core
amdxcp i2c_algo_bit drm_ttm_helper ttm drm_exec gpu_sched
drm_suballoc_helper nvme drm_panel_backlight_quirks drm_buddy
sdhci_acpi nvme_core drm_display_helper sdhci nvme_keyring cec
nvme_auth mmc_core video wmi
[   38.675132] CR2: 0000000000000108
[   38.678477] ---[ end trace 0000000000000000 ]---
[   38.683122] RIP: 0010:packet_rcv_spkt+0x2b/0x1d0
[   38.687769] Code: 0f 1e fa 0f 1f 44 00 00 55 53 48 89 fb 48 83 ec
10 0f b6 87 80 00 00 00 83 e0 07 3c 05 74 14 48 8b 6a 30 48 89 f1 48
8b 45 30 <48> 39 86 08 01 00 00 74 1c ba 02 00 00 00 48 89 de 31 ff e8
4d a6
[   38.706521] RSP: 0018:ffffcc55001c0cd8 EFLAGS: 00010293
[   38.711776] RAX: ffffffffb18ac600 RBX: ffff8c4303173b00 RCX: 00000000000=
00000
[   38.718934] RDX: ffff8c431135d540 RSI: 0000000000000000 RDI: ffff8c43031=
73b00
[   38.726085] RBP: ffff8c431135d000 R08: ffff8c461019ebc0 R09: 00000000000=
000b4
[   38.733241] R10: ffffcc55001c0c10 R11: 0000000000000006 R12: ffffffffb18=
ac658
[   38.740391] R13: 0000000000000200 R14: ffff8c431135d540 R15: ffff8c43075=
ad540
[   38.747549] FS:  0000000000000000(0000) GS:ffff8c465eaa2000(0000)
knlGS:0000000000000000
[   38.755656] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   38.761429] CR2: 0000000000000108 CR3: 0000000105662000 CR4: 00000000003=
506f0
[   38.768587] Kernel panic - not syncing: Fatal exception in interrupt
[   38.775412] Kernel Offset: 0x2d400000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[   38.906592] Rebooting in 5 seconds..
kbd_mode: KDSKBMODE: Inappropriate ioctl for device
/dev/nvme0n1p4: recovering journal
/dev/nvme0n1p4: clean, 882675/58368000 files, 25863844/233442481 blocks

Arch Linux 6.16.0-1-mainline (ttyS0)

packet login:
```

This is due to a page fault in kernel mode (note %cr2 is 0x108: that
looks suspiciously like a dereference of a struct field relative to a
nil pointer; exactly what the oops message tells us).  We further see
that the fault occurred at the instruction that is 0x2b bytes into the
function `packet_rcv_spkt`.

Sure enough, if I look up that bit of code in the output of, say,
objdump, I see:

 ```
ffffffff8228c010 <packet_rcv_spkt>:
ffffffff8228c010:       f3 0f 1e fa             endbr64
ffffffff8228c014:       e8 87 bc 08 ff          call
ffffffff81317ca0 <__fentry__>
ffffffff8228c019:       55                      push   %rbp
ffffffff8228c01a:       53                      push   %rbx
ffffffff8228c01b:       48 89 fb                mov    %rdi,%rbx
ffffffff8228c01e:       48 83 ec 10             sub    $0x10,%rsp
ffffffff8228c022:       0f b6 87 80 00 00 00    movzbl 0x80(%rdi),%eax
ffffffff8228c029:       83 e0 07                and    $0x7,%eax
ffffffff8228c02c:       3c 05                   cmp    $0x5,%al
ffffffff8228c02e:       74 14                   je
ffffffff8228c044 <packet_rcv_spkt+0x34>
ffffffff8228c030:       48 8b 6a 30             mov    0x30(%rdx),%rbp
ffffffff8228c034:       48 89 f1                mov    %rsi,%rcx
ffffffff8228c037:       48 8b 45 30             mov    0x30(%rbp),%rax
ffffffff8228c03b:       48 39 86 08 01 00 00    cmp    %rax,0x108(%rsi)
ffffffff8228c042:       74 1c                   je
ffffffff8228c060 <packet_rcv_spkt+0x50>
ffffffff8228c044:       ba 02 00 00 00          mov    $0x2,%edx
ffffffff8228c049:       48 89 de                mov    %rbx,%rsi
ffffffff8228c04c:       31 ff                   xor    %edi,%edi
ffffffff8228c04e:       e8 cd aa de ff          call
ffffffff82076b20 <sk_skb_reason_drop>
ffffffff8228c053:       48 83 c4 10             add    $0x10,%rsp
ffffffff8228c057:       31 c0                   xor    %eax,%eax
ffffffff8228c059:       5b                      pop    %rbx
ffffffff8228c05a:       5d                      pop    %rbp
ffffffff8228c05b:       e9 d0 f7 0b 00          jmp
ffffffff8234b830 <__pi___x86_return_thunk>
ffffffff8228c060:       8b 87 dc 00 00 00       mov    0xdc(%rdi),%eax
```

The numbers on the far left are the virtual addresses for the listed
instructions when the kernel is loaded and running; note that the
function starts at 0xffffffff8228c010; given our offset of 0x2b, we
expect the faulting instruction to be at 0xffffffff8228c010+0x2b =3D
0xffffffff8228c03b, and sure enough, there's a `cmp` there comparing
the value in `%rax` against something in memory that is +0x108 bytes
relative to whatever `%rsi` points to. Recalling that our faulting
address is 0x108, this strongly implies that `%rsi` is 0. But what
does `%rsi` correspond to?  Referring to the x86-64/amd64 processor
supplement for the SVR4 ABI
(https://gitlab.com/x86-psABIs/x86-64-ABI), one sees that first three
arguments to a function are passed in `%rdi`, `%rsi`, and `%rdx`,
respectively. Thus, `%rsi` is the register holding the second argument
to `packet_rcv_spkt`.

Now let's turn our attention to the code in `packet_rcv_spkt` in
`src/linux-mainline/net/packet/af_packet.c`. The start of that
function looks like this:

```
static int packet_rcv_spkt(struct sk_buff *skb, struct net_device *dev,
                           struct packet_type *pt, struct net_device *orig_=
dev)
{
        struct sock *sk;
        struct sockaddr_pkt *spkt;

        /*
         *      When we registered the protocol we saved the socket in the =
data
         *      field for just this event.
         */

        sk =3D pt->af_packet_priv;

        /*
         *      Yank back the headers [hope the device set this
         *      right or kerboom...]
         *
         *      Incoming packets have ll header pulled,
         *      push it back.
         *
         *      For outgoing ones skb->data =3D=3D skb_mac_header(skb)
         *      so that this procedure is noop.
         */

        if (skb->pkt_type =3D=3D PACKET_LOOPBACK)
                goto out;

        if (!net_eq(dev_net(dev), sock_net(sk)))
                goto out;
```

Ok, so note that the second argument to this function is `dev`. Let's
try and break this down and cross-reference reference to the assembly
code from `objdump`:

```
ffffffff8228c010 <packet_rcv_spkt>:
ffffffff8228c010:       f3 0f 1e fa             endbr64
ffffffff8228c014:       e8 87 bc 08 ff          call
ffffffff81317ca0 <__fentry__>
```

The first line just tells us that the function associated with the
symbol `packet_rcv_spkt` starts at 0xffffffff8228c010. The `endbr64`
and `call __fentry__` instructions are not relevant here.

```
ffffffff8228c019:       55                      push   %rbp
```

This is just pushing a copy of the frame pointer onto the stack for
function linkage.

```
ffffffff8228c01a:       53                      push   %rbx
```

This is just saving a copy of `%rbx` on the stack since we're about to
overwrite it, and the ABI says that it's callee-save.

```
ffffffff8228c01b:       48 89 fb                mov    %rdi,%rbx
```
This is making a copy of `%rdi` in `%rbx`.  That is, we're setting
`%rbx` to the pointer to `skb` that was passed as the first argument.
Why? Presumably we're going to clobber `%rdi` with a function call at
some point, so we save a copy of it now.

```
ffffffff8228c01e:       48 83 ec 10             sub    $0x10,%rsp
```

This is allocating a small amount of memory (16 bytes) on the stack.

```
ffffffff8228c022:       0f b6 87 80 00 00 00    movzbl 0x80(%rdi),%eax
```
This is moving a single byte, 128 bytes into the `struct sk_buff`
pointed to by `skb` (first argument, so in `%rdi`) into the
accumulator register, and clearing the other bytes in that register.
`struct sk_buff` is defined in <linux/skbuff.h> and has a bunch of
stuff in it; offset 128 on my system is the byte containing `pkt_type`
(which is actually a 3 bit-wide datum packed into a C bit-field). Note
that the exact contents of that structure vary depending on how the
kernel has been configured; the value on your system may not match the
value on mine.

```
ffffffff8228c029:       83 e0 07                and    $0x7,%eax
```

Here we're masking off the upper bits of the byte we just loaded into
`%eax` and keeping only the lower three bits. Recalling that
`pkt_type` is a 3-bit wide field, this is clearing the other bits
packed into the same byte as `pkt_type`.

```
ffffffff8228c02c:       3c 05                   cmp    $0x5,%al
```

This compares `skb->pkt_type` to 5. Note that `PACKET_LOOPBACK` is
`#define`'d to be 5 in <linux/if_packet.h>.

```
ffffffff8228c02e:       74 14                   je
ffffffff8228c044 <packet_rcv_spkt+0x34>
```

If they are equal, skip over the next few instructions, and execute
the code at 0xffffffff8228c044. Taken together, this and the three
preceding instructions are `if (skb->pkt_type =3D=3D PACKET_LOOPBACK) goto
out;` code sequence.

It's worth looking at the code at the code at the `out:` label (aka,
what we do at 0xffffffff8228c044): that code calls, `kfree_skb(skb)`,
which is defined in `skbuff.h`, and is an inline function that just
calls another inline function (`kfree_skb_reason`) that ultimately
invokes, `sk_skb_reason_drop(NULL, skb, reason);` with `reason` set to
`SKB_DROP_REASON_NOT_SPECIFIED`. `SKB_DROP_REASON_NOT_SPECIFIED` is
part of a C `enum` and has the value 2.

```
ffffffff8228c044:       ba 02 00 00 00          mov    $0x2,%edx
ffffffff8228c049:       48 89 de                mov    %rbx,%rsi
ffffffff8228c04c:       31 ff                   xor    %edi,%edi
ffffffff8228c04e:       e8 cd aa de ff          call
ffffffff82076b20 <sk_skb_reason_drop>
```

So these instructions are just the call to `sb_skb_reason_drop(NULL,
skb, SKB_DROP_REASON_NOT_SPECIFIED)` as inlined above.

```
ffffffff8228c053:       48 83 c4 10             add    $0x10,%rsp
ffffffff8228c057:       31 c0                   xor    %eax,%eax
ffffffff8228c059:       5b                      pop    %rbx
ffffffff8228c05a:       5d                      pop    %rbp
ffffffff8228c05b:       e9 d0 f7 0b 00          jmp
ffffffff8234b830 <__pi___x86_return_thunk>
```

This handful of instructions deallocates the stack space we allocated
earlier, sets the return value of the function (passed in `%rax` to 0,
and restores the values of `%rbx` and the frame pointer that we saved
earlier. The sequence ending in `jmp` is essentially the `return 0;`
at the end of `packet_rcv_spkt` (the exact mechanics of how and why we
do this via the jump to `__pi___x86_return_thunk` are relevant here,
however; see below).

Ok, back to what we had been doing on `packet_rcv_spkt`.

```
ffffffff8228c030:       48 8b 6a 30             mov    0x30(%rdx),%rbp
```

This loads the 64-bit value at memory location +48 bytes relative to
%rdx (the third argument; that is, `pt`) into `%rbp`. `pt` is a
pointer to a `struct packet_type`, which is defined in
<linux/netdevice.h> and the struct member at offset 48 oin my kernel
is the `af_packet_priv` void pointer (again, the exact size of `struct
packet_type` is dependent on how the kernel is configured, though
indirectly, via the `dev_tracker` member; on my system, that's an
empty structure of zero length, but yours may be different).

So this instruction is the `sk =3D pt->af_packet_priv;` line at the
beginning of the function. Note that, in the _code_, this function
comes before checking `pkt_type` against `PACKET_LOOPBACK`, but the
compiler has optimized the object code to re-order it to come after;
presumably because you don't need the value of `sk` if `pkt_type =3D=3D
PACKET_LOOPBACK` is true. Note also that this let us know that
`pt->af_packet_priv` points to a `struct sock`.

```
ffffffff8228c034:       48 89 f1                mov    %rsi,%rcx
```

Here, we're making a copy of the `dev` pointer in `%rcx`.

```
ffffffff8228c037:       48 8b 45 30             mov    0x30(%rbp),%rax
```

This is copying the 64-bit quantity at offset 48 in a `struct sock`
into the accumulator. Looking at the definition of `struct sock` in
<net/sock.h>, we see that the first thing that it contains is a
`struct sock_common`, and counting a bit, the datum at offset 48
relative to that is a `possible_net_t skc_net`. Furthermore, there's a
`#define` tucked inside the definition of `struct sock` that says that
the `sk_net` member of a `struct sock` is really the `skc_net` member
of its `__sk_common` member at the beginning of the struct. In other
words, offset 48 is the `sk_net`. Looking at the definition of the
inline function `sock_net` in `struct sock`, see that this does some
more inlining magic to deal with config specifics and RCU, but
ultimately, in this case returns `sk->sk_net`; this is setting up a
temporary with the result of `sock_net(sk)`.

```
ffffffff8228c03b:       48 39 86 08 01 00 00    cmp    %rax,0x108(%rsi)
```

Two things are happening here. First, the `cmp` is the result of
inlining the call to `net_eq`, which is defined <net/net_namespace.h>,
and just does a pointer comparison on its two arguments (which are
both `const` pointers to `struct net`). The second bit is the
`0x108(%rsi)`, which is the result of inlining the call to
`dev_net(dev)` in the `if (!net_eq(dev_net(dev), sock_net(sk))) goto
out;` code sequence. `dev_net` is defined in <linux/netdevice.h> and
ultimately returns dev->nd_net; sure enough, offset 0x108 of `struct
net_device` on my system (again, this depends on kernel configuration)
is `nd_dev`.

```
ffffffff8228c042:       74 1c                   je
ffffffff8228c060 <packet_rcv_spkt+0x50>
```

If the earlier comparison is equal, skip over the next couple of
instructions. Otherwise, if not equal, fall through to the next
instruction, at 0xffffffff8228c044.  We've already seen that; this is
the code at `out:` described above.

```
ffffffff8228c060:       8b 87 dc 00 00 00       mov    0xdc(%rdi),%eax
...
```

If the comparison was equal, then we continue on here; this
instruction corresponds to some more inlining, but is not terribly
relevant; the point is that the code above does indeed correspond to
`if (!net_eq(dev_net(dev), sock_net(sk))) goto out;` in the source
code.

Back to our panic, this confirms that the panic we see corresponds to
trying to load `nb_net` from a NULL `dev`. One may ask, why bother
going through this exercise? Didn't we already know that? Well, I
think we strongly suspected, but by tracking it to actual source code,
we can make a much stronger statement. (Another legitimate question
is, "couldn't you just give the `-S` option to objdump and skip a lot
of this?" Probably, but it's useful to be able to match compiler
output to source this way, too!).

So that's what's happening: we're trying to dereference a null pointer
in `packet_rcv_spkt`. That NULL pointer is an argument to the function
(the second argument, corresponding to `dev`). That function is
static, so only visible inside of `af_packet.c`; and indeed, it's only
referenced once, when it's assigned to a function pointer member of a
struct, `prot_hook.func` in a `struct packet_sock` in `packet_create`
in `net/packet/af_packet.c`, and only if the socket type is
`SOCK_PACKET`.

So the question then becomes, "why is `dev` NULL?" It would be useful
to look at places where `prot_hook.func` might be called.

Going back to the stack trace from above, we can see the
`ax25_kiss_rcv` is near the top, but it's prefixed with a question
mark ('?'), which suggests that the symbol is "unreliable" in the
trace. The last reliable thing is, `__netif_receive_skb_core`, which
is defined in `net/core/dev.c` and is the last "reliable" symbol in
the trace. And if we look at that offset relative to
`__netif_receive_skb_core`, we see that, with a few rounds of
inlining, this corresponds to a call, via a function pointer called
`func` that could very well end up invoking `packet_rcv_spkt`.  The
code question is,

```

        /* deliver only exact match when indicated */
        if (likely(!deliver_exact)) {
                deliver_ptype_list_skb(skb, &pt_pr/NUev, orig_dev, type,
                                       &ptype_base[ntohs(type) &
                                                   PTYPE_HASH_MASK]);

                /* orig_dev and skb->dev could belong to different netns;
                 * Even in such case we need to traverse only the list
                 * coming from skb->dev, as the ptype owner (packet socket)
                 * will use dev_net(skb->dev) to do namespace filtering.
                 */
                deliver_ptype_list_skb(skb, &pt_prev, orig_dev, type,
                                       &dev_net_rcu(skb->dev)->ptype_specif=
ic);
        }
```

The invocation that's causing the oops is almost certainly the second
of the two. And indeed, that code has been changed recently; `git
blame` suggests it was added by Paolo Abeni (Cc'ed here) in commit
c353e8983e0de on March 20th of this year, about long enough to start
showing up in distributions.

Digging slightly deeper, `deliver_ptype_list_skb` invokes
`deliver_skb`, which does some error checking and then invokes
whatever the `func` member of a `struct packet_type` points it; this
is surely howe we're getting into `packet_rcv_spkt`.  If I add a check
into `deliver_skb` to test whether `dev` is NULL, and avoid calling
`func`, perhaps the oops will go away; dunno, the kernel is still
building. :-)

That's as far as I've gotten, but even if that fixes the page fault,
it is not a great fix overall. The real fix would be to figure out why
`skb->dev` becomes NULL in the code above, and fix that. I do see that
that pointer is set to NULL in `sock_queue_rcv_skb_reason`, which is
called by `sock_queue_rcv_skb`, which is called in `ax25_rcv`, which
is called by `ax25_kiss_rcv`, which we saw in the "unreliable" portion
of the call stack above; perhaps that's a useful direction for someone
to investigate.

        - Dan C.

(Note: I've also Cc'ed Murad Masimov here, simply because Murad has
had some recent commits in the AX.25 code; I'm not suggesting Murad is
responsible for this issue, but may appreciate the situational
awareness.)

