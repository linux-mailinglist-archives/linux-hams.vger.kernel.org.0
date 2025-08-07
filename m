Return-Path: <linux-hams+bounces-551-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F4B1DC8C
	for <lists+linux-hams@lfdr.de>; Thu,  7 Aug 2025 19:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8E7D16233C
	for <lists+linux-hams@lfdr.de>; Thu,  7 Aug 2025 17:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E39273807;
	Thu,  7 Aug 2025 17:38:07 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from vps001.vanheusden.com (fatelectron.soleus.nu [94.142.246.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A753F273D7B
	for <linux-hams@vger.kernel.org>; Thu,  7 Aug 2025 17:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.246.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754588286; cv=none; b=gdFDNc5DMg2rWfcworenKW6HyuHkfj+DrruUMXWO/jBJ9+mhZgI7k9mrHwfTZU8Hk+NF+8JtRk2Jssd8FI3n4de+8bCKgQVMsDlSgPCjs0g43lHi2Y0C4vH+4mPKf4CXaQ69C30mi10zsVXiPqkuT5oQjHR06g/fZlJKdE7m3PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754588286; c=relaxed/simple;
	bh=EhL7RJxeXd1kA6di7epHfYBaExYCdkAUPtcS5ADgzGQ=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=m4ychFE+yMfL06II0TJ66p5GHZz54tRpwfbywUELBkSYFMFOgWCBEcxsVVQHyaL0oUUuwSmfXK5UgthDx7955+efWgJpS3mVFbQu7jmUOY9PB3pclSOiQBbX/km7HUJ3o4JcOwkIN/NJ4/K+IfJRLIGpcFKZAPmzzVp+3aaCP8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanheusden.com; spf=pass smtp.mailfrom=vanheusden.com; arc=none smtp.client-ip=94.142.246.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanheusden.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vanheusden.com
Received: from webmail.vanheusden.com (unknown [172.29.0.1])
	by vps001.vanheusden.com (Postfix) with ESMTPA id E43BF5005EC
	for <linux-hams@vger.kernel.org>; Thu, 07 Aug 2025 19:37:52 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 07 Aug 2025 19:37:52 +0200
From: Folkert van Heusden <folkert@vanheusden.com>
To: linux-hams@vger.kernel.org
Subject: crash
Message-ID: <7c4ff0c7c6faa8722e858c92f6456dc7@vanheusden.com>
X-Sender: folkert@vanheusden.com
Organization: www.vanheusden.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Ok, I succeed (quite easily) to trigger the crash.

Anything I can do to help resolve this issue?

Aug 07 19:32:05 27mc5 kernel: ------------[ cut here ]------------
Aug 07 19:32:05 27mc5 kernel: netpoll_send_skb_on_dev(): eth0 enabled 
interrupts in poll (macb_start_xmit+0x0/0xbc0)
Aug 07 19:32:05 27mc5 kernel: WARNING: CPU: 2 PID: 3487 at 
net/core/netpoll.c:365 __netpoll_send_skb+0x240/0x258
Aug 07 19:32:05 27mc5 kernel: Modules linked in: snd_seq_dummy 
snd_hrtimer snd_seq mkiss netrom ax25 netconsole rfcomm algif_hash 
algif_skcipher af_alg bnep binfmt_misc spidev brcmfmac_wcc hci_uart 
btbcm bluetooth aes_ce_blk aes_ce_cipher brcmfmac vc4 ghash_ce 
ecdh_generic gf128mul sha2_ce sha256_arm64 sha1_ce sha1_generic brcmutil 
rpi_hevc_dec v4l2_mem2mem snd_soc_hdmi_codec pisp_be ecc cfg80211 libaes 
videobuf2_dma_contig drm_display_helper raspberrypi_hwmon cec 
drm_dma_helper videobuf2_memops snd_soc_core snd_usb_audio rfkill 
snd_hwdep snd_usbmidi_lib spi_bcm2835 snd_rawmidi videobuf2_v4l2 
i2c_brcmstb videodev v3d snd_compress snd_pcm_dmaengine gpio_keys 
videobuf2_common snd_seq_device snd_pcm gpu_sched drm_shmem_helper 
snd_timer pwm_fan drm_kms_helper mc snd rp1_pio rp1_mailbox rp1_adc 
rp1_fw raspberrypi_gpiomem nvmem_rmem sch_fq_codel fuse drm 
drm_panel_orientation_quirks backlight nfnetlink ip_tables x_tables ipv6 
uio_pdrv_genirq uio
Aug 07 19:32:05 27mc5 kernel: CPU: 2 UID: 0 PID: 3487 Comm: 
kworker/u19:0 Not tainted 6.12.34+rpt-rpi-v8 #1  Debian 1:6.12.34-1+rpt1
Aug 07 19:32:05 27mc5 kernel: Hardware name: Raspberry Pi 5 Model B Rev 
1.0 (DT)
Aug 07 19:32:05 27mc5 kernel: Workqueue: events_unbound flush_to_ldisc
Aug 07 19:32:05 27mc5 kernel: pstate: 60400009 (nZCv daif +PAN -UAO -TCO 
-DIT -SSBS BTYPE=--)
Aug 07 19:32:05 27mc5 kernel: pc : __netpoll_send_skb+0x240/0x258
Aug 07 19:32:05 27mc5 kernel: lr : __netpoll_send_skb+0x240/0x258
Aug 07 19:32:05 27mc5 kernel: sp : ffffffc080013540
Aug 07 19:32:05 27mc5 kernel: x29: ffffffc080013540 x28: 
ffffff81c12fa598 x27: ffffffd08db35720
Aug 07 19:32:05 27mc5 kernel: x26: 0000000000000050 x25: 
0000000000000000 x24: ffffff8140c58e00
Aug 07 19:32:05 27mc5 kernel: x23: ffffff81813c7620 x22: 
ffffff81c12fa598 x21: ffffff81813c7600
Aug 07 19:32:05 27mc5 kernel: x20: ffffff8002554000 x19: 
ffffff8141858200 x18: 00000000fffffffd
Aug 07 19:32:05 27mc5 kernel: x17: 2065636e65726566 x16: 
6572656420726574 x15: ffffffc080012e14
Aug 07 19:32:05 27mc5 kernel: x14: 0000000000000001 x13: 
ffffffc100012e0c x12: 6920737470757272
Aug 07 19:32:05 27mc5 kernel: x11: ffffffd08d9054f8 x10: 
0000000000000278 x9 : ffffffd08c51e56c
Aug 07 19:32:05 27mc5 kernel: x8 : 0000000000017fe8 x7 : 
00000000fffff000 x6 : ffffffd08d95d4f8
Aug 07 19:32:05 27mc5 kernel: x5 : ffffff803bbbc3c8 x4 : 
0000000000000000 x3 : ffffffafae3a2000
Aug 07 19:32:05 27mc5 kernel: x2 : 0000000000000000 x1 : 
0000000000000000 x0 : ffffff8002d30000
Aug 07 19:32:05 27mc5 kernel: Call trace:
Aug 07 19:32:05 27mc5 kernel:  __netpoll_send_skb+0x240/0x258
Aug 07 19:32:05 27mc5 kernel:  netpoll_send_udp+0x260/0x410
Aug 07 19:32:05 27mc5 kernel:  write_msg+0x100/0x138 [netconsole]
Aug 07 19:32:05 27mc5 kernel:  console_flush_all+0x2c8/0x450
Aug 07 19:32:05 27mc5 kernel:  console_unlock+0x8c/0x160
Aug 07 19:32:05 27mc5 kernel:  vprintk_emit+0x2e8/0x340
Aug 07 19:32:05 27mc5 kernel:  vprintk_default+0x40/0x58
Aug 07 19:32:05 27mc5 kernel:  vprintk+0x50/0x100
Aug 07 19:32:05 27mc5 kernel:  _printk+0x68/0xa0
Aug 07 19:32:05 27mc5 kernel:  die_kernel_fault+0x4c/0x380
Aug 07 19:32:05 27mc5 kernel:  __do_kernel_fault+0x190/0x198
Aug 07 19:32:05 27mc5 kernel:  do_page_fault+0x228/0x5a0
Aug 07 19:32:05 27mc5 kernel:  do_translation_fault+0xb4/0xe0
Aug 07 19:32:05 27mc5 kernel:  do_mem_abort+0x48/0xa0
Aug 07 19:32:05 27mc5 kernel:  el1_abort+0x40/0x68
Aug 07 19:32:05 27mc5 kernel:  el1h_64_sync_handler+0xa4/0xe8
Aug 07 19:32:05 27mc5 kernel:  el1h_64_sync+0x64/0x68
Aug 07 19:32:05 27mc5 kernel:  
__netif_receive_skb_core.constprop.0+0xbac/0x1078
Aug 07 19:32:05 27mc5 kernel:  __netif_receive_skb_one_core+0x48/0xa0
Aug 07 19:32:05 27mc5 kernel:  __netif_receive_skb+0x20/0x70
Aug 07 19:32:05 27mc5 kernel:  process_backlog+0x8c/0x150
Aug 07 19:32:05 27mc5 kernel:  __napi_poll+0x40/0x208
Aug 07 19:32:05 27mc5 kernel:  net_rx_action+0x324/0x380
Aug 07 19:32:05 27mc5 kernel:  handle_softirqs+0x11c/0x350
Aug 07 19:32:05 27mc5 kernel:  __do_softirq+0x1c/0x28
Aug 07 19:32:05 27mc5 kernel:  ____do_softirq+0x18/0x30
Aug 07 19:32:05 27mc5 kernel:  call_on_irq_stack+0x24/0x58
Aug 07 19:32:05 27mc5 kernel:  do_softirq_own_stack+0x24/0x50
Aug 07 19:32:05 27mc5 kernel:  do_softirq+0x5c/0x80
Aug 07 19:32:05 27mc5 kernel:  __local_bh_enable_ip+0x94/0xb0
Aug 07 19:32:05 27mc5 kernel:  _raw_spin_unlock_bh+0x28/0x40
Aug 07 19:32:05 27mc5 kernel:  mkiss_receive_buf+0x4c8/0x5c8 [mkiss]
Aug 07 19:32:05 27mc5 kernel:  tty_ldisc_receive_buf+0x60/0x80
Aug 07 19:32:05 27mc5 kernel:  tty_port_default_receive_buf+0x4c/0x98
Aug 07 19:32:05 27mc5 kernel:  flush_to_ldisc+0xbc/0x1b0
Aug 07 19:32:05 27mc5 kernel:  process_one_work+0x158/0x3d0
Aug 07 19:32:05 27mc5 kernel:  worker_thread+0x2c4/0x3e8
Aug 07 19:32:05 27mc5 kernel:  kthread+0x118/0x128
Aug 07 19:32:05 27mc5 kernel:  ret_from_fork+0x10/0x20
Aug 07 19:32:05 27mc5 kernel: ---[ end trace 0000000000000000 ]---
Aug 07 19:32:05 27mc5 kernel: Mem abort info:
Aug 07 19:32:05 27mc5 kernel:   ESR = 0x0000000096000007
Aug 07 19:32:05 27mc5 kernel:   EC = 0x25: DABT (current EL), IL = 32 
bits
Aug 07 19:32:05 27mc5 kernel:   SET = 0, FnV = 0
Aug 07 19:32:05 27mc5 kernel:   EA = 0, S1PTW = 0
Aug 07 19:32:05 27mc5 kernel:   FSC = 0x07: level 3 translation fault
Aug 07 19:32:05 27mc5 kernel: Data abort info:
Aug 07 19:32:05 27mc5 kernel:   ISV = 0, ISS = 0x00000007, ISS2 = 
0x00000000
Aug 07 19:32:05 27mc5 kernel:   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
Aug 07 19:32:05 27mc5 kernel:   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 
0
Aug 07 19:32:05 27mc5 kernel: user pgtable: 4k pages, 39-bit VAs, 
pgdp=0000000081c62000
Aug 07 19:32:05 27mc5 kernel: [00000000000000d0] pgd=0800000181627003, 
p4d=0800000181627003, pud=0800000181627003, pmd=08000000c0927003, 
pte=0000000000000000
Aug 07 19:32:05 27mc5 kernel: Internal error: Oops: 0000000096000007 
[#1] PREEMPT SMP
Aug 07 19:32:05 27mc5 kernel: Modules linked in: snd_seq_dummy 
snd_hrtimer snd_seq mkiss netrom ax25 netconsole rfcomm algif_hash 
algif_skcipher af_alg bnep binfmt_misc spidev brcmfmac_wcc hci_uart 
btbcm bluetooth aes_ce_blk aes_ce_cipher brcmfmac vc4 ghash_ce 
ecdh_generic gf128mul sha2_ce sha256_arm64 sha1_ce sha1_generic brcmutil 
rpi_hevc_dec v4l2_mem2mem snd_soc_hdmi_codec pisp_be ecc cfg80211 libaes 
videobuf2_dma_contig drm_display_helper raspberrypi_hwmon cec 
drm_dma_helper videobuf2_memops snd_soc_core snd_usb_audio rfkill 
snd_hwdep snd_usbmidi_lib spi_bcm2835 snd_rawmidi videobuf2_v4l2 
i2c_brcmstb videodev v3d snd_compress snd_pcm_dmaengine gpio_keys 
videobuf2_common snd_seq_device snd_pcm gpu_sched drm_shmem_helper 
snd_timer pwm_fan drm_kms_helper mc snd rp1_pio rp1_mailbox rp1_adc 
rp1_fw raspberrypi_gpiomem nvmem_rmem sch_fq_codel fuse drm 
drm_panel_orientation_quirks backlight nfnetlink ip_tables x_tables ipv6 
uio_pdrv_genirq uio
Aug 07 19:32:06 27mc5 kernel: CPU: 2 UID: 0 PID: 3487 Comm: 
kworker/u19:0 Tainted: G        W          6.12.34+rpt-rpi-v8 #1  Debian 
1:6.12.34-1+rpt1
Aug 07 19:32:06 27mc5 kernel: Tainted: [W]=WARN
Aug 07 19:32:06 27mc5 kernel: Hardware name: Raspberry Pi 5 Model B Rev 
1.0 (DT)
Aug 07 19:32:06 27mc5 kernel: Workqueue: events_unbound flush_to_ldisc
Aug 07 19:32:06 27mc5 kernel: pstate: a0400009 (NzCv daif +PAN -UAO -TCO 
-DIT -SSBS BTYPE=--)
Aug 07 19:32:06 27mc5 kernel: pc : 
__netif_receive_skb_core.constprop.0+0xbac/0x1078
Aug 07 19:32:06 27mc5 kernel: lr : 
__netif_receive_skb_core.constprop.0+0x3d8/0x1078
Aug 07 19:32:06 27mc5 kernel: sp : ffffffc080013be0
Aug 07 19:32:06 27mc5 kernel: x29: ffffffc080013cd0 x28: 
0000000000000200 x27: ffffffd08d8d6000
Aug 07 19:32:06 27mc5 kernel: x26: ffffff81030100d0 x25: 
0000000000000001 x24: 0000000000000000
Aug 07 19:32:06 27mc5 kernel: x23: ffffff81815bbd40 x22: 
ffffff80037a5f00 x21: ffffff8103010000
Aug 07 19:32:06 27mc5 kernel: x20: ffffff8103010098 x19: 
0000000000000001 x18: 0000000000000000
Aug 07 19:32:06 27mc5 kernel: x17: ffffffafae3a2000 x16: 
ffffffd08c5670b8 x15: 0000000001f88000
Aug 07 19:32:06 27mc5 kernel: x14: 0000000000000000 x13: 
0d7472656b6c6f66 x12: 0000000000000000
Aug 07 19:32:06 27mc5 kernel: x11: ffffff800295bc00 x10: 
0000000000000000 x9 : ffffffd054b7cce4
Aug 07 19:32:06 27mc5 kernel: x8 : ffffffc080013b4e x7 : 
0000000000000008 x6 : ffffff818092a6cf
Aug 07 19:32:06 27mc5 kernel: x5 : ffffff803bbbe478 x4 : 
000000002e400002 x3 : ffffff803bbbde68
-- Boot bc94ab5233404429bb82f58840e0d2a6 --


-- 
www.vanheusden.com

