Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 288C26BBA30
	for <lists+linux-hams@lfdr.de>; Wed, 15 Mar 2023 17:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjCOQuz (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 15 Mar 2023 12:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbjCOQuy (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 15 Mar 2023 12:50:54 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D86A5D7
        for <linux-hams@vger.kernel.org>; Wed, 15 Mar 2023 09:50:52 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5416b0ab0ecso250447997b3.6
        for <linux-hams@vger.kernel.org>; Wed, 15 Mar 2023 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678899051;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoXhq8GT0Z7S+0nYPHo2hu7FEao+rkXIsLYsER9uNZg=;
        b=jFvbmNY76QI5h6NfFAx+kVGU/IBoKIIiGSB2LfCSJ59sIvi/Y9IYxh7oQiZUT70fCS
         S2aH1QRlT4vuLz2Oz1bMsiAAxS6BMql5t0oIB2sqIbgZto/+oqRk6Sz56cDzgOl1+gv2
         mJsBnpXLe2GMsWSk5qUtnfFBCjAuS1kXKggzYHYu/DmC/JyGw1OcSk3iMhkqrSb2Wkot
         wsI1lulXVXROhzbn++Z3BRpd1D5OzQkJo5Ca1jv0n+vg6gAfwbkIY+34MZI6Z3Nt0S3W
         DZHfRJYayexRUfOtuJsoO9HBjg8kmjgJIkJzG4wUNKSS5S7QIVuseB959LUDRfaz5BGF
         kvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678899051;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoXhq8GT0Z7S+0nYPHo2hu7FEao+rkXIsLYsER9uNZg=;
        b=ppeSawumYawkwKGvn5Xq09VFaQJNiwabuV3hNrkbh2MRczM7BEg5g71snTyeW3IgBW
         Xej5l/8NECiuPa+YSPWpAUO8AuGPQ3JhpCICCXlFfJ4do2nOE557/F4qOjAwnb2KOxv4
         KwbIyCwq6wiR8FvKrGLnpqPD2FvwG9mR+o2dOnGyslRCnEJZd82lUB6CnDNUIWuuDurW
         POCB4sO31qyovUEz3jSsiXkLD+nBI6q6rYhnr2LY16rdymrrBvA2MU13JcD96wu4RZj1
         L8kEGN2g0i/lDyazF9wQ2opQjzPjilteliO8OYSNxHmMA8aOGLoaSqi53VxD1tQPK1lY
         /S/w==
X-Gm-Message-State: AO0yUKUrSAP98DpJyharlWxm9zr3d+5oz6/3gXhB7puiFe63mlmg6PVt
        O4w6TnksylqCyI9NHFpHhGtlN5XxTLTcKNEm3Gv0VxaiB3o=
X-Google-Smtp-Source: AK7set9nR4XJ9VSYBnHgETc//sFeae+F/NlUcYYj/DRKwG33ThoeNVTc+4Okg6wkcyDxgvLkCNd1RMfNHQ5tAzBs8vg=
X-Received: by 2002:a81:a7c2:0:b0:541:a0ab:bd28 with SMTP id
 e185-20020a81a7c2000000b00541a0abbd28mr355674ywh.4.1678899050907; Wed, 15 Mar
 2023 09:50:50 -0700 (PDT)
MIME-Version: 1.0
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Wed, 15 Mar 2023 09:50:39 -0700
Message-ID: <CANnsUMEG936taQ0jVUzs4FCbAOjYFKqJ=qgHkP3OJPACoYHwXA@mail.gmail.com>
Subject: KERNEL BUG LIKELY: Kernel Panic! MKISS related
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

I noticed this on two systems except I did not get the kernel dump
readout as X was running.   I thought it may have had to do with
VirtualBox, but then I am getting similar behavior on a real install.
I was lucky that I did not have X running and have nice output that I
OCR'd from a photo of the screen.

How to reproduce this:

Setup 3 pseudo tty's for loopback to FBB BBS
kissnetd -p 3 &
kissattach /dev/pts/1
kissparms -c 1 -p lb0
kissattach /dev/pts/2
kissparms -c 1 -p lb1
fbb configured with a real radio on /dev/ttyS0 for port 1
and the lb0 AX.25 kernel interface for port 2.

I leave the third pseudo tty for connecting JNOS to FBB over this
"loopback" net.

If I try to pass bulls (or if I remember correctly even connect from
JNOS) it locks cold.

Last night (where this screen shot kernel panic came from) was an
actual radio port where I was pushing bulls to a newly installed
instance of FBB on Arch Linux with the latest kernel 6.2.5.  I have
not had issues in slackware (and I was also running the latest stable
kernel as I am too lazy to keep patching the LTS kernel, but I have
not played as much there.  I think I may install slack on this box too
and see if I can get it to dump like this.  If you want the photo,
just email me directly as it looks like the OCR is not that good, but
I do not know how photos will go over here.

Here is the screen dump:

11 fm KOolIP: 1 to NoTJ-1 ctI DISC: 1100216.0098271 BUG: kernel MULL

[106216.0109741 #PF supervisor read access in kernel mode

1106216.0121001 APE: error codetox0000)

not present page

[106216.0132301 PCD 0 P4D 0

[106216.0143551 Dops: 0000 [#11 PREEMPT SMP PTI

[106216.0151781 CPU: 0 PID: 39178 Comm: xibbd Tainted: G

DE

6.2.5-arch1-1 #1 Fel?0e9497e04500

[106216.0166331 Hardware name: Dell Inc. Optifiex 790/ONKUGV, BIOS A17
03/14/2013

[106216.0177931 RIP: 0010 :ax25_addr_ax25dev+0x44/0xb0 [ax251

[106216.0189621 Code: c1 53 ed 9 b3 61 P9 48 86 14 40 16 01 00 48 85
db 74 41 41 bc 01 00 00 00 eb 08 48 Bb 16

0 03 00 00 eB do fb M Tr 85 co 75 e1 48 Ba bb 90 00 00=C2=B0

[106216.0214491 RSP: 0018: Frffa52b0107bdeB EFLAGS: 00010286

[106216.022714] RAX: 0000000000000000 RBX: FIff9457c84126c0 RCX:
0000000000000000

[106216.023976] RDX: 0000000000000001 RSI: ffffffffc1541100 RDI:
ffffa5260107be68

[106216.025229] RBP: ffFfa52b0107be68 ROB: 0000000000000009 R09:
0000000000000000

[106216.0264951 R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000001

[106216.0277661 R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000

[106216.029015] FS:

00007/7421a26740 (0000) GS:ffff9458a9c00000 (0000) knIGS: 0000000000000000

[106216.0302591 CS:

0010 DS: 0000 ES: 0000 CRO: 0000000080050033

[106216.031589] CR2: 0000000000000340 CR3: 000000008c804005 CR4:
0000000000060650

[106216.0330441 Call Trace:

[106216.0337581 <TASK>

[106216.0344601 ax25_bind+0x1e2/0x210 [ax25
0149579197c9004716ce47844d0cb0c56b9a4c841

[106216.0351811

_sys_bind+Oxe8/OxfO

[106216.0358931

_x64_sus_bind+0x18/0=C3=9720

[106216.0365951

[106216.037296]

do_suscal1_64+0x5f/0=C3=9790

? syscall_exit_to_user_mode+0x1b/0=C3=9740

[106216.038000]

? do_syscal1_64+0x6b/0x90 [106216.0386931
entry_SYSCALL_64_after_huframe+0x72/0xdc

[106216.039390] RIP: 0033:0x717421b3791b

[106216.0400931 Code: c3 66 0f 1 44 00 00 48 86 15 51 e4 0c 00 f7 d8
64 89 02 b8 ff fr if ff eb be of 11 44 00 00. 13 of 1e fa b8 31 00 00
00 of 05 <48> 34 01 1

0 ff ff 73 01 c3 48 86 0d 25 e4 0c 00 f7 d8 64 89 01 48

[106216.041578] RSP: 0026:00007ffd15dab688 EFLAGS: 00000206 ORIG RAX:
0000000000000031

[106216.0423321 RAX: fffffffffffffrda RBX: 00007ffd15dabac2 RCX: 000077421b=
37916

[106216.043092] RDX: 0000000000000048 RSI: 00007ffd15dab700 RDI:
0000000000000009

[106216.043853] RBP: 0000563ef2403900 ROB: 0000000000000004 R09:
00000000ffffffff

[106216.0446231 R10: 00007rd15dab6c0 R11: 0000000000000206 R12: 00000000000=
00009

[106216.045395] R13: 0000000000000048 R14: 0000563ef2403c00 R15:
0000000000000010

[106216.0461671

</TASK>

[106216.0469201 Modules linked in: mkiss ax25 crc16 cp210x tun rperdma
rdma_cm iw_cm ib_cm ib_core ufat fat intel_rap _msr intel_rapl common
=C3=9786_pkg_temp_therma I intel powerc lamp coretemp kum_ intel kum
(rqbupass cret10dif pcimul cre32 pcimul polyual cimulni poluual
generic grizimul ghash cimulni intel crypta sha512 53s e3 snd Ida
_codec_hdmi snd hda_codec_-realtek snd _hda_codec generic rapl ledtrig
_audio mousedev snd hda_intel intel _cstate at24 snd_intel_dspefg
snd_intel_sdu acp i snd_hda_codec snd_hda_core snd_hudep snd_pem
mei_pxp 12c_1801 intel_uncore mei_hdep snd_timer iTCO_wt snd dedbas
intel_pc_bxt iTCO_uendor_support mei wat cf gBO211 rikill soundcore
pespr 12c _smblis mei me mel lpe_ich mac hid e1000e nfsd auth epcyss
nfs acl lockd grace sunrpe uboxnetfit (OF) Uboxmetadp(OF) uboxdru(OF=C2=BB
dm _mod loop fuse bpf_preload ip_tables x tables btrfs blakeZb
_generic xor raid_pq liberc32c usbhid cre32c _generic 1915 drm_buddy
intel_gtt crc32c_intel drm_di splay_helper sr_mod cdrom cec ttm video
uni

[106216.0526781 CRZ: 0000000000000340

[106216.053515] ---[ end trace 0000000000000000 1-

[106216.0543461 RIP: 0010 :ax25_ addr_ax25deu+0x44/Oxb0 Lax25]

[106216.055173] Code: c1 53 8 9 63 61 9 48 86 1d 40 16 01 00 48 85 ab
74 4f 41 bc 01 00 00 00 eb 0B 48 8b 16 48 85 b 74 31 48 86 43 08 48.
89 ef <48> 86 60

0 03 00 00 e8 do fb fr ff 85 cO 75 e1 48 8d bb 90 00 00

[106216.056921] RSP: 0018:ffffa52b0107bded EFLAGS: 00010286

1106216.0578041 RAX: 0000000000000000 RBX: fFff9457c84126c0 RCX:
0000000000000000

[106216.058688] RDX: 0000000000000001 RSI: ffffffffc1541100 RDI: ffffa52010=
7be68

[106216.059577] RBP: ffffa52b0107be68 ROB: 0000000000000009 R09:
0000000000000000

[106216.060473] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000001

[106216.0613741 R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000

[106216.0622811 FS*

0000757421a26740 (0000) GS:ffFf9458a9c00000(0000) knIGS:0000000000000000

[106216.063200] C8:

0010 DS: 0000 ES: 0000 CRO: 0000000080050033

[106216.0641291 CR2: 0000000000000340 CR3: 000000008c804005 CR4: 0000000000=
06060

[106216.0650721 Kernel panic - not syncing: Fatal exception in interrupt

[106216.0662201 Kernel Offset: 0x38e00000 from Oxffffffff81000000
(relocation range: Oxfffffff80000000-oxfrrrrrrrrrrrrr)

[106216.0672191

---[ end Kernel panic

- not syncing: Fatal exception in interrupt ]-.

Regards,
Chris KQ6UP


--=20
Thanks,
Chris Maness
