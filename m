Return-Path: <linux-hams+bounces-18-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D01CC8113CB
	for <lists+linux-hams@lfdr.de>; Wed, 13 Dec 2023 14:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6EF31C211BB
	for <lists+linux-hams@lfdr.de>; Wed, 13 Dec 2023 13:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE15E2E417;
	Wed, 13 Dec 2023 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+MmOZGG"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FA3422E;
	Wed, 13 Dec 2023 05:55:33 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cda22140f2so6319131b3a.1;
        Wed, 13 Dec 2023 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702475733; x=1703080533; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W7WpxBijV+JkZ1NlphOuxpKX2h88C7if/CiV5XZIsvY=;
        b=l+MmOZGG/BQ8uaSbms2E543U7DKQygNDAzERgGRUprotK2u2fCH9E6dQycvcgMqOcn
         1zAhkzMtPFsk/lZbwWmuvi735ejhonXg8d0wD/zrOWO25qK8Ty1LsHEsbbt/taQR+c0D
         hkEdOrs/jWLfm3r+8+qEarPGlILUXf0GrLTxnKBjRHC0ZBWMYmvNZ7w1BxnS3gPVIMWP
         VkyHZWF264v7wkMdDOiI3kGPdztYgkzulsG9mHB9lDWqzKtLkix7ClCy+Hs2svEJHjaw
         b/3BZx8ovAJPlgy9oJIMQtC5WVASGzdGIpokDK0eQJvUyL6rn+JubS8t8qags/EtaRjt
         0aFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702475733; x=1703080533;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7WpxBijV+JkZ1NlphOuxpKX2h88C7if/CiV5XZIsvY=;
        b=igS1W4g1AFO4PtNpZbUkAnIErf+MI2UOHlg1I66D9S8L7qO1c10CQsqz7miKsOgQmA
         +pJArYQcknYNPPAA+EUJzAmcSgFQR3JaKM+R916+4+WNdtWMq57kq7Y5VQE8ULYcMwEn
         pcF8MMru++F2iQI/4/xC8UbjbEpjU8Kqj64DzDJ5L5NyHp12S9xKUQYZKp8e3oD5wVAd
         cQqlZ2PeTZ5qci63m15e3XQmg/hWSPfQ3kgZQqdngPN29PTG3zGb5FEzs1x/62uPSjkk
         ZePz8HG+dZgWugOe5P7s0/Is6f8fmKokpZCSSpj10Ayei/yPmETwyvx80+rnb9mPrT50
         r8HQ==
X-Gm-Message-State: AOJu0Yz0LslNaXA10rbbqEzsJ58gl8npk1MxPN3djnET+c0Ae0jOTrwM
	6ftbzbiM7aO+weQlqUJCmvdtcSebxY0634ugE5y+IpY/DvaTg6Qu
X-Google-Smtp-Source: AGHT+IHJmm/wA73PBeY///rp6lVKZJpgbfPPVH4sxVOEruTzJGMbFM48kbVVJ2bpQyQRLyXuUaffqoddIfdOQiqhH+k=
X-Received: by 2002:aa7:8684:0:b0:6ce:725f:7da9 with SMTP id
 d4-20020aa78684000000b006ce725f7da9mr7922383pfo.59.1702475732209; Wed, 13 Dec
 2023 05:55:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: xingwei lee <xrivendell7@gmail.com>
Date: Wed, 13 Dec 2023 21:55:20 +0800
Message-ID: <CABOYnLwk89274HXJBb8HM1MA=qegmEcSoZRztqDFGJH2jeXsPA@mail.gmail.com>
Subject: Re: [syzbot] general protection fault in rose_transmit_link (3)
To: syzbot+677921bcd8c3a67a3df3@syzkaller.appspotmail.com
Cc: davem@davemloft.net, Eric Dumazet <edumazet@google.com>, kuba@kernel.org, 
	linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello, I reproduced this bug with repro.c and repro.txt and I comfired
it can crash the lastest net tree.
Kernel commit: lastest net tree: 2513974cc3e120bd26ecf43bcc1c40ac32669226
Kernel config: https://syzkaller.appspot.com/bug?extid=1ff3c7cbee8362ec70a1

The lastest net tree crashes like:
[  128.751216][ T8539] BUG: kernel NULL pointer dereference, address:
0000000000000032
[  128.755489][ T8539] #PF: supervisor read access in kernel mode
[  128.757142][ T8539] #PF: error_code(0x0000) - not-present page
[  128.759659][ T8539] PGD 0 P4D 0
[  128.761249][ T8539] Oops: 0000 [#1] PREEMPT SMP
[  128.762760][ T8539] CPU: 0 PID: 8539 Comm: 475 Not tainted
6.7.0-rc4-00167-g2513974cc3e1 #3
[  128.765541][ T8539] Hardware name: QEMU Standard PC (i440FX + PIIX,
1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  128.769715][ T8539] RIP: 0010:rose_transmit_link+0x1c/0x270
[  128.770949][ T8539] Code: 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00
66 0f 1f 00 55 48 89 e5 41 57 41 56 41 55 41 54 49 89 fc 53 48 89 f3
e8 54 dd 02 fd <44> 0f b6 6b 32 31 ff 44 89 ee e8 c5 d5 02 fd 45 84 ed
0f 85 54 01
[  128.774889][ T8539] RSP: 0018:ffff88814acefb58 EFLAGS: 00010293
[  128.776362][ T8539] RAX: 0000000000000000 RBX: 0000000000000000
RCX: 0000000000000001
[  128.778283][ T8539] RDX: ffff8881461b9880 RSI: ffffffff842d7d3c
RDI: ffff888108137240
[  128.779845][ T8539] RBP: ffff88814acefb80 R08: ffff88823bb7a9f0
R09: ffffffff8127db1a
[  128.781626][ T8539] R10: 0000000000000013 R11: ffffffff8490295b
R12: ffff888108137240
[  128.783195][ T8539] R13: ffff888108838800 R14: ffff888105babb1a
R15: 0000000000000013
[  128.784699][ T8539] FS:  0000000000000000(0000)
GS:ffff88813bc00000(0000) knlGS:0000000000000000
[  128.786293][ T8539] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  128.787549][ T8539] CR2: 0000000000000032 CR3: 0000000005c5c000
CR4: 0000000000350ef0
[  128.789421][ T8539] DR0: 0000000000000000 DR1: 0000000000000000
DR2: 0000000000000000
[  128.790976][ T8539] DR3: 0000000000000000 DR6: 00000000fffe0ff0
DR7: 0000000000000400
[  128.792457][ T8539] Call Trace:
[  128.793092][ T8539]  <TASK>
[  128.793673][ T8539]  ? show_regs+0x9c/0xb0
[  128.794417][ T8539]  ? __die+0x31/0x80
[  128.795130][ T8539]  ? page_fault_oops+0x247/0x5c0
[  128.795975][ T8539]  ? exit_to_user_mode_prepare+0xda/0x150
[  128.796968][ T8539]  ? ___slab_alloc+0x864/0x900
[  128.797834][ T8539]  ? get_signal+0xeef/0x1010
[  128.798628][ T8539]  ? arch_do_signal_or_restart+0x26/0x470
[  128.799664][ T8539]  ? do_user_addr_fault+0x502/0xb10
[  128.800580][ T8539]  ? kmalloc_reserve+0xe4/0x180
[  128.801439][ T8539]  ? exc_page_fault+0x62/0xc0
[  128.802237][ T8539]  ? asm_exc_page_fault+0x2b/0x30
[  128.803166][ T8539]  ? do_syscall_64+0x4b/0x110
[  128.803929][ T8539]  ? exit_to_user_mode_prepare+0xda/0x150
[  128.804896][ T8539]  ? rose_transmit_link+0x1c/0x270
[  128.805720][ T8539]  ? rose_transmit_link+0x1c/0x270
[  128.806537][ T8539]  ? rose_transmit_link+0x1c/0x270
[  128.807277][ T8539]  rose_write_internal+0x136/0x810
[  128.808008][ T8539]  ? timer_delete+0x5d/0x70
[  128.808760][ T8539]  ? __slab_free+0x1ed/0x3d0
[  128.809632][ T8539]  ? __sanitizer_cov_trace_const_cmp4+0x1a/0x20
[  128.810673][ T8539]  ? sk_stop_timer+0x34/0x80
[  128.811594][ T8539]  rose_release+0x241/0x300
[  128.812426][ T8539]  __sock_release+0x4c/0xf0
[  128.813210][ T8539]  ? __sock_release+0xf0/0xf0
[  128.814147][ T8539]  sock_close+0x1d/0x30
[  128.814867][ T8539]  __fput+0x112/0x500
[  128.815536][ T8539]  ____fput+0x19/0x20
[  128.816298][ T8539]  task_work_run+0x97/0xf0
[  128.817122][ T8539]  do_exit+0x4cf/0x1180
[  128.817949][ T8539]  ? __futex_wake_mark+0x70/0x70
[  128.819090][ T8539]  do_group_exit+0x55/0xe0
[  128.820034][ T8539]  get_signal+0xeef/0x1010
[  128.820853][ T8539]  ? futex_wait+0x95/0x100
[  128.821780][ T8539]  arch_do_signal_or_restart+0x26/0x470
[  128.822776][ T8539]  ? do_futex+0xd5/0x2d0
[  128.823543][ T8539]  ? __x64_sys_futex+0xb4/0x2a0
[  128.824383][ T8539]  exit_to_user_mode_prepare+0xda/0x150
[  128.825288][ T8539]  syscall_exit_to_user_mode+0x25/0x50
[  128.826191][ T8539]  do_syscall_64+0x4b/0x110
[  128.826967][ T8539]  entry_SYSCALL_64_after_hwframe+0x63/0x6b


=* repro.c =*
#define _GNU_SOURCE

#include <arpa/inet.h>
#include <endian.h>
#include <errno.h>
#include <fcntl.h>
#include <linux/capability.h>
#include <linux/futex.h>
#include <linux/genetlink.h>
#include <linux/if_addr.h>
#include <linux/if_ether.h>
#include <linux/if_link.h>
#include <linux/if_tun.h>
#include <linux/in6.h>
#include <linux/ip.h>
#include <linux/neighbour.h>
#include <linux/net.h>
#include <linux/netlink.h>
#include <linux/rtnetlink.h>
#include <linux/tcp.h>
#include <linux/veth.h>
#include <net/if.h>
#include <net/if_arp.h>
#include <netinet/in.h>
#include <pthread.h>
#include <sched.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mount.h>
#include <sys/prctl.h>
#include <sys/resource.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

static unsigned long long procid;

static void sleep_ms(uint64_t ms) { usleep(ms * 1000); }

static uint64_t current_time_ms(void) {
 struct timespec ts;
 if (clock_gettime(CLOCK_MONOTONIC, &ts)) exit(1);
 return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec / 1000000;
}

static void thread_start(void* (*fn)(void*), void* arg) {
 pthread_t th;
 pthread_attr_t attr;
 pthread_attr_init(&attr);
 pthread_attr_setstacksize(&attr, 128 << 10);
 int i = 0;
 for (; i < 100; i++) {
   if (pthread_create(&th, &attr, fn, arg) == 0) {
     pthread_attr_destroy(&attr);
     return;
   }
   if (errno == EAGAIN) {
     usleep(50);
     continue;
   }
   break;
 }
 exit(1);
}

typedef struct {
 int state;
} event_t;

static void event_init(event_t* ev) { ev->state = 0; }

static void event_reset(event_t* ev) { ev->state = 0; }

static void event_set(event_t* ev) {
 if (ev->state) exit(1);
 __atomic_store_n(&ev->state, 1, __ATOMIC_RELEASE);
 syscall(SYS_futex, &ev->state, FUTEX_WAKE | FUTEX_PRIVATE_FLAG, 1000000);
}

static void event_wait(event_t* ev) {
 while (!__atomic_load_n(&ev->state, __ATOMIC_ACQUIRE))
   syscall(SYS_futex, &ev->state, FUTEX_WAIT | FUTEX_PRIVATE_FLAG, 0, 0);
}

static int event_isset(event_t* ev) {
 return __atomic_load_n(&ev->state, __ATOMIC_ACQUIRE);
}

static int event_timedwait(event_t* ev, uint64_t timeout) {
 uint64_t start = current_time_ms();
 uint64_t now = start;
 for (;;) {
   uint64_t remain = timeout - (now - start);
   struct timespec ts;
   ts.tv_sec = remain / 1000;
   ts.tv_nsec = (remain % 1000) * 1000 * 1000;
   syscall(SYS_futex, &ev->state, FUTEX_WAIT | FUTEX_PRIVATE_FLAG, 0, &ts);
   if (__atomic_load_n(&ev->state, __ATOMIC_ACQUIRE)) return 1;
   now = current_time_ms();
   if (now - start > timeout) return 0;
 }
}

static bool write_file(const char* file, const char* what, ...) {
 char buf[1024];
 va_list args;
 va_start(args, what);
 vsnprintf(buf, sizeof(buf), what, args);
 va_end(args);
 buf[sizeof(buf) - 1] = 0;
 int len = strlen(buf);
 int fd = open(file, O_WRONLY | O_CLOEXEC);
 if (fd == -1) return false;
 if (write(fd, buf, len) != len) {
   int err = errno;
   close(fd);
   errno = err;
   return false;
 }
 close(fd);
 return true;
}

struct nlmsg {
 char* pos;
 int nesting;
 struct nlattr* nested[8];
 char buf[4096];
};

static void netlink_init(struct nlmsg* nlmsg, int typ, int flags,
                        const void* data, int size) {
 memset(nlmsg, 0, sizeof(*nlmsg));
 struct nlmsghdr* hdr = (struct nlmsghdr*)nlmsg->buf;
 hdr->nlmsg_type = typ;
 hdr->nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK | flags;
 memcpy(hdr + 1, data, size);
 nlmsg->pos = (char*)(hdr + 1) + NLMSG_ALIGN(size);
}

static void netlink_attr(struct nlmsg* nlmsg, int typ, const void* data,
                        int size) {
 struct nlattr* attr = (struct nlattr*)nlmsg->pos;
 attr->nla_len = sizeof(*attr) + size;
 attr->nla_type = typ;
 if (size > 0) memcpy(attr + 1, data, size);
 nlmsg->pos += NLMSG_ALIGN(attr->nla_len);
}

static void netlink_nest(struct nlmsg* nlmsg, int typ) {
 struct nlattr* attr = (struct nlattr*)nlmsg->pos;
 attr->nla_type = typ;
 nlmsg->pos += sizeof(*attr);
 nlmsg->nested[nlmsg->nesting++] = attr;
}

static void netlink_done(struct nlmsg* nlmsg) {
 struct nlattr* attr = nlmsg->nested[--nlmsg->nesting];
 attr->nla_len = nlmsg->pos - (char*)attr;
}

static int netlink_send_ext(struct nlmsg* nlmsg, int sock, uint16_t reply_type,
                           int* reply_len, bool dofail) {
 if (nlmsg->pos > nlmsg->buf + sizeof(nlmsg->buf) || nlmsg->nesting) exit(1);
 struct nlmsghdr* hdr = (struct nlmsghdr*)nlmsg->buf;
 hdr->nlmsg_len = nlmsg->pos - nlmsg->buf;
 struct sockaddr_nl addr;
 memset(&addr, 0, sizeof(addr));
 addr.nl_family = AF_NETLINK;
 ssize_t n = sendto(sock, nlmsg->buf, hdr->nlmsg_len, 0,
                    (struct sockaddr*)&addr, sizeof(addr));
 if (n != (ssize_t)hdr->nlmsg_len) {
   if (dofail) exit(1);
   return -1;
 }
 n = recv(sock, nlmsg->buf, sizeof(nlmsg->buf), 0);
 if (reply_len) *reply_len = 0;
 if (n < 0) {
   if (dofail) exit(1);
   return -1;
 }
 if (n < (ssize_t)sizeof(struct nlmsghdr)) {
   errno = EINVAL;
   if (dofail) exit(1);
   return -1;
 }
 if (hdr->nlmsg_type == NLMSG_DONE) return 0;
 if (reply_len && hdr->nlmsg_type == reply_type) {
   *reply_len = n;
   return 0;
 }
 if (n < (ssize_t)(sizeof(struct nlmsghdr) + sizeof(struct nlmsgerr))) {
   errno = EINVAL;
   if (dofail) exit(1);
   return -1;
 }
 if (hdr->nlmsg_type != NLMSG_ERROR) {
   errno = EINVAL;
   if (dofail) exit(1);
   return -1;
 }
 errno = -((struct nlmsgerr*)(hdr + 1))->error;
 return -errno;
}

static int netlink_send(struct nlmsg* nlmsg, int sock) {
 return netlink_send_ext(nlmsg, sock, 0, NULL, true);
}

static int netlink_query_family_id(struct nlmsg* nlmsg, int sock,
                                  const char* family_name, bool dofail) {
 struct genlmsghdr genlhdr;
 memset(&genlhdr, 0, sizeof(genlhdr));
 genlhdr.cmd = CTRL_CMD_GETFAMILY;
 netlink_init(nlmsg, GENL_ID_CTRL, 0, &genlhdr, sizeof(genlhdr));
 netlink_attr(nlmsg, CTRL_ATTR_FAMILY_NAME, family_name,
              strnlen(family_name, GENL_NAMSIZ - 1) + 1);
 int n = 0;
 int err = netlink_send_ext(nlmsg, sock, GENL_ID_CTRL, &n, dofail);
 if (err < 0) {
   return -1;
 }
 uint16_t id = 0;
 struct nlattr* attr = (struct nlattr*)(nlmsg->buf + NLMSG_HDRLEN +
                                        NLMSG_ALIGN(sizeof(genlhdr)));
 for (; (char*)attr < nlmsg->buf + n;
      attr = (struct nlattr*)((char*)attr + NLMSG_ALIGN(attr->nla_len))) {
   if (attr->nla_type == CTRL_ATTR_FAMILY_ID) {
     id = *(uint16_t*)(attr + 1);
     break;
   }
 }
 if (!id) {
   errno = EINVAL;
   return -1;
 }
 recv(sock, nlmsg->buf, sizeof(nlmsg->buf), 0);
 return id;
}

static int netlink_next_msg(struct nlmsg* nlmsg, unsigned int offset,
                           unsigned int total_len) {
 struct nlmsghdr* hdr = (struct nlmsghdr*)(nlmsg->buf + offset);
 if (offset == total_len || offset + hdr->nlmsg_len > total_len) return -1;
 return hdr->nlmsg_len;
}

static void netlink_add_device_impl(struct nlmsg* nlmsg, const char* type,
                                   const char* name, bool up) {
 struct ifinfomsg hdr;
 memset(&hdr, 0, sizeof(hdr));
 if (up) hdr.ifi_flags = hdr.ifi_change = IFF_UP;
 netlink_init(nlmsg, RTM_NEWLINK, NLM_F_EXCL | NLM_F_CREATE, &hdr,
              sizeof(hdr));
 if (name) netlink_attr(nlmsg, IFLA_IFNAME, name, strlen(name));
 netlink_nest(nlmsg, IFLA_LINKINFO);
 netlink_attr(nlmsg, IFLA_INFO_KIND, type, strlen(type));
}

static void netlink_add_device(struct nlmsg* nlmsg, int sock, const char* type,
                              const char* name) {
 netlink_add_device_impl(nlmsg, type, name, false);
 netlink_done(nlmsg);
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

static void netlink_add_veth(struct nlmsg* nlmsg, int sock, const char* name,
                            const char* peer) {
 netlink_add_device_impl(nlmsg, "veth", name, false);
 netlink_nest(nlmsg, IFLA_INFO_DATA);
 netlink_nest(nlmsg, VETH_INFO_PEER);
 nlmsg->pos += sizeof(struct ifinfomsg);
 netlink_attr(nlmsg, IFLA_IFNAME, peer, strlen(peer));
 netlink_done(nlmsg);
 netlink_done(nlmsg);
 netlink_done(nlmsg);
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

static void netlink_add_xfrm(struct nlmsg* nlmsg, int sock, const char* name) {
 netlink_add_device_impl(nlmsg, "xfrm", name, true);
 netlink_nest(nlmsg, IFLA_INFO_DATA);
 int if_id = 1;
 netlink_attr(nlmsg, 2, &if_id, sizeof(if_id));
 netlink_done(nlmsg);
 netlink_done(nlmsg);
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

static void netlink_add_hsr(struct nlmsg* nlmsg, int sock, const char* name,
                           const char* slave1, const char* slave2) {
 netlink_add_device_impl(nlmsg, "hsr", name, false);
 netlink_nest(nlmsg, IFLA_INFO_DATA);
 int ifindex1 = if_nametoindex(slave1);
 netlink_attr(nlmsg, IFLA_HSR_SLAVE1, &ifindex1, sizeof(ifindex1));
 int ifindex2 = if_nametoindex(slave2);
 netlink_attr(nlmsg, IFLA_HSR_SLAVE2, &ifindex2, sizeof(ifindex2));
 netlink_done(nlmsg);
 netlink_done(nlmsg);
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

static void netlink_add_linked(struct nlmsg* nlmsg, int sock, const char* type,
                              const char* name, const char* link) {
 netlink_add_device_impl(nlmsg, type, name, false);
 netlink_done(nlmsg);
 int ifindex = if_nametoindex(link);
 netlink_attr(nlmsg, IFLA_LINK, &ifindex, sizeof(ifindex));
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

static void netlink_add_vlan(struct nlmsg* nlmsg, int sock, const char* name,
                            const char* link, uint16_t id, uint16_t proto) {
 netlink_add_device_impl(nlmsg, "vlan", name, false);
 netlink_nest(nlmsg, IFLA_INFO_DATA);
 netlink_attr(nlmsg, IFLA_VLAN_ID, &id, sizeof(id));
 netlink_attr(nlmsg, IFLA_VLAN_PROTOCOL, &proto, sizeof(proto));
 netlink_done(nlmsg);
 netlink_done(nlmsg);
 int ifindex = if_nametoindex(link);
 netlink_attr(nlmsg, IFLA_LINK, &ifindex, sizeof(ifindex));
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

static void netlink_add_macvlan(struct nlmsg* nlmsg, int sock, const char* name,
                               const char* link) {
 netlink_add_device_impl(nlmsg, "macvlan", name, false);
 netlink_nest(nlmsg, IFLA_INFO_DATA);
 uint32_t mode = MACVLAN_MODE_BRIDGE;
 netlink_attr(nlmsg, IFLA_MACVLAN_MODE, &mode, sizeof(mode));
 netlink_done(nlmsg);
 netlink_done(nlmsg);
 int ifindex = if_nametoindex(link);
 netlink_attr(nlmsg, IFLA_LINK, &ifindex, sizeof(ifindex));
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

static void netlink_add_geneve(struct nlmsg* nlmsg, int sock, const char* name,
                              uint32_t vni, struct in_addr* addr4,
                              struct in6_addr* addr6) {
 netlink_add_device_impl(nlmsg, "geneve", name, false);
 netlink_nest(nlmsg, IFLA_INFO_DATA);
 netlink_attr(nlmsg, IFLA_GENEVE_ID, &vni, sizeof(vni));
 if (addr4) netlink_attr(nlmsg, IFLA_GENEVE_REMOTE, addr4, sizeof(*addr4));
 if (addr6) netlink_attr(nlmsg, IFLA_GENEVE_REMOTE6, addr6, sizeof(*addr6));
 netlink_done(nlmsg);
 netlink_done(nlmsg);
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

#define IFLA_IPVLAN_FLAGS 2
#define IPVLAN_MODE_L3S 2
#undef IPVLAN_F_VEPA
#define IPVLAN_F_VEPA 2

static void netlink_add_ipvlan(struct nlmsg* nlmsg, int sock, const char* name,
                              const char* link, uint16_t mode,
                              uint16_t flags) {
 netlink_add_device_impl(nlmsg, "ipvlan", name, false);
 netlink_nest(nlmsg, IFLA_INFO_DATA);
 netlink_attr(nlmsg, IFLA_IPVLAN_MODE, &mode, sizeof(mode));
 netlink_attr(nlmsg, IFLA_IPVLAN_FLAGS, &flags, sizeof(flags));
 netlink_done(nlmsg);
 netlink_done(nlmsg);
 int ifindex = if_nametoindex(link);
 netlink_attr(nlmsg, IFLA_LINK, &ifindex, sizeof(ifindex));
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

static void netlink_device_change(struct nlmsg* nlmsg, int sock,
                                 const char* name, bool up, const char* master,
                                 const void* mac, int macsize,
                                 const char* new_name) {
 struct ifinfomsg hdr;
 memset(&hdr, 0, sizeof(hdr));
 if (up) hdr.ifi_flags = hdr.ifi_change = IFF_UP;
 hdr.ifi_index = if_nametoindex(name);
 netlink_init(nlmsg, RTM_NEWLINK, 0, &hdr, sizeof(hdr));
 if (new_name) netlink_attr(nlmsg, IFLA_IFNAME, new_name, strlen(new_name));
 if (master) {
   int ifindex = if_nametoindex(master);
   netlink_attr(nlmsg, IFLA_MASTER, &ifindex, sizeof(ifindex));
 }
 if (macsize) netlink_attr(nlmsg, IFLA_ADDRESS, mac, macsize);
 int err = netlink_send(nlmsg, sock);
 if (err < 0) {
 }
}

static int netlink_add_addr(struct nlmsg* nlmsg, int sock, const char* dev,
                           const void* addr, int addrsize) {
 struct ifaddrmsg hdr;
 memset(&hdr, 0, sizeof(hdr));
 hdr.ifa_family = addrsize == 4 ? AF_INET : AF_INET6;
 hdr.ifa_prefixlen = addrsize == 4 ? 24 : 120;
 hdr.ifa_scope = RT_SCOPE_UNIVERSE;
 hdr.ifa_index = if_nametoindex(dev);
 netlink_init(nlmsg, RTM_NEWADDR, NLM_F_CREATE | NLM_F_REPLACE, &hdr,
              sizeof(hdr));
 netlink_attr(nlmsg, IFA_LOCAL, addr, addrsize);
 netlink_attr(nlmsg, IFA_ADDRESS, addr, addrsize);
 return netlink_send(nlmsg, sock);
}

static void netlink_add_addr4(struct nlmsg* nlmsg, int sock, const char* dev,
                             const char* addr) {
 struct in_addr in_addr;
 inet_pton(AF_INET, addr, &in_addr);
 int err = netlink_add_addr(nlmsg, sock, dev, &in_addr, sizeof(in_addr));
 if (err < 0) {
 }
}

static void netlink_add_addr6(struct nlmsg* nlmsg, int sock, const char* dev,
                             const char* addr) {
 struct in6_addr in6_addr;
 inet_pton(AF_INET6, addr, &in6_addr);
 int err = netlink_add_addr(nlmsg, sock, dev, &in6_addr, sizeof(in6_addr));
 if (err < 0) {
 }
}

static struct nlmsg nlmsg;

const int kInitNetNsFd = 201;

#define DEVLINK_FAMILY_NAME "devlink"

#define DEVLINK_CMD_PORT_GET 5
#define DEVLINK_ATTR_BUS_NAME 1
#define DEVLINK_ATTR_DEV_NAME 2
#define DEVLINK_ATTR_NETDEV_NAME 7

static struct nlmsg nlmsg2;

static void initialize_devlink_ports(const char* bus_name, const char* dev_name,
                                    const char* netdev_prefix) {
 struct genlmsghdr genlhdr;
 int len, total_len, id, err, offset;
 uint16_t netdev_index;
 int sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
 if (sock == -1) exit(1);
 int rtsock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
 if (rtsock == -1) exit(1);
 id = netlink_query_family_id(&nlmsg, sock, DEVLINK_FAMILY_NAME, true);
 if (id == -1) goto error;
 memset(&genlhdr, 0, sizeof(genlhdr));
 genlhdr.cmd = DEVLINK_CMD_PORT_GET;
 netlink_init(&nlmsg, id, NLM_F_DUMP, &genlhdr, sizeof(genlhdr));
 netlink_attr(&nlmsg, DEVLINK_ATTR_BUS_NAME, bus_name, strlen(bus_name) + 1);
 netlink_attr(&nlmsg, DEVLINK_ATTR_DEV_NAME, dev_name, strlen(dev_name) + 1);
 err = netlink_send_ext(&nlmsg, sock, id, &total_len, true);
 if (err < 0) {
   goto error;
 }
 offset = 0;
 netdev_index = 0;
 while ((len = netlink_next_msg(&nlmsg, offset, total_len)) != -1) {
   struct nlattr* attr = (struct nlattr*)(nlmsg.buf + offset + NLMSG_HDRLEN +
                                          NLMSG_ALIGN(sizeof(genlhdr)));
   for (; (char*)attr < nlmsg.buf + offset + len;
        attr = (struct nlattr*)((char*)attr + NLMSG_ALIGN(attr->nla_len))) {
     if (attr->nla_type == DEVLINK_ATTR_NETDEV_NAME) {
       char* port_name;
       char netdev_name[IFNAMSIZ];
       port_name = (char*)(attr + 1);
       snprintf(netdev_name, sizeof(netdev_name), "%s%d", netdev_prefix,
                netdev_index);
       netlink_device_change(&nlmsg2, rtsock, port_name, true, 0, 0, 0,
                             netdev_name);
       break;
     }
   }
   offset += len;
   netdev_index++;
 }
error:
 close(rtsock);
 close(sock);
}

#define DEV_IPV4 "172.20.20.%d"
#define DEV_IPV6 "fe80::%02x"
#define DEV_MAC 0x00aaaaaaaaaa

static void netdevsim_add(unsigned int addr, unsigned int port_count) {
 write_file("/sys/bus/netdevsim/del_device", "%u", addr);
 if (write_file("/sys/bus/netdevsim/new_device", "%u %u", addr, port_count)) {
   char buf[32];
   snprintf(buf, sizeof(buf), "netdevsim%d", addr);
   initialize_devlink_ports("netdevsim", buf, "netdevsim");
 }
}

#define WG_GENL_NAME "wireguard"
enum wg_cmd {
 WG_CMD_GET_DEVICE,
 WG_CMD_SET_DEVICE,
};
enum wgdevice_attribute {
 WGDEVICE_A_UNSPEC,
 WGDEVICE_A_IFINDEX,
 WGDEVICE_A_IFNAME,
 WGDEVICE_A_PRIVATE_KEY,
 WGDEVICE_A_PUBLIC_KEY,
 WGDEVICE_A_FLAGS,
 WGDEVICE_A_LISTEN_PORT,
 WGDEVICE_A_FWMARK,
 WGDEVICE_A_PEERS,
};
enum wgpeer_attribute {
 WGPEER_A_UNSPEC,
 WGPEER_A_PUBLIC_KEY,
 WGPEER_A_PRESHARED_KEY,
 WGPEER_A_FLAGS,
 WGPEER_A_ENDPOINT,
 WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL,
 WGPEER_A_LAST_HANDSHAKE_TIME,
 WGPEER_A_RX_BYTES,
 WGPEER_A_TX_BYTES,
 WGPEER_A_ALLOWEDIPS,
 WGPEER_A_PROTOCOL_VERSION,
};
enum wgallowedip_attribute {
 WGALLOWEDIP_A_UNSPEC,
 WGALLOWEDIP_A_FAMILY,
 WGALLOWEDIP_A_IPADDR,
 WGALLOWEDIP_A_CIDR_MASK,
};

static void netlink_wireguard_setup(void) {
 const char ifname_a[] = "wg0";
 const char ifname_b[] = "wg1";
 const char ifname_c[] = "wg2";
 const char private_a[] =
     "\xa0\x5c\xa8\x4f\x6c\x9c\x8e\x38\x53\xe2\xfd\x7a\x70\xae\x0f\xb2\x0f\xa1"
     "\x52\x60\x0c\xb0\x08\x45\x17\x4f\x08\x07\x6f\x8d\x78\x43";
 const char private_b[] =
     "\xb0\x80\x73\xe8\xd4\x4e\x91\xe3\xda\x92\x2c\x22\x43\x82\x44\xbb\x88\x5c"
     "\x69\xe2\x69\xc8\xe9\xd8\x35\xb1\x14\x29\x3a\x4d\xdc\x6e";
 const char private_c[] =
     "\xa0\xcb\x87\x9a\x47\xf5\xbc\x64\x4c\x0e\x69\x3f\xa6\xd0\x31\xc7\x4a\x15"
     "\x53\xb6\xe9\x01\xb9\xff\x2f\x51\x8c\x78\x04\x2f\xb5\x42";
 const char public_a[] =
     "\x97\x5c\x9d\x81\xc9\x83\xc8\x20\x9e\xe7\x81\x25\x4b\x89\x9f\x8e\xd9\x25"
     "\xae\x9f\x09\x23\xc2\x3c\x62\xf5\x3c\x57\xcd\xbf\x69\x1c";
 const char public_b[] =
     "\xd1\x73\x28\x99\xf6\x11\xcd\x89\x94\x03\x4d\x7f\x41\x3d\xc9\x57\x63\x0e"
     "\x54\x93\xc2\x85\xac\xa4\x00\x65\xcb\x63\x11\xbe\x69\x6b";
 const char public_c[] =
     "\xf4\x4d\xa3\x67\xa8\x8e\xe6\x56\x4f\x02\x02\x11\x45\x67\x27\x08\x2f\x5c"
     "\xeb\xee\x8b\x1b\xf5\xeb\x73\x37\x34\x1b\x45\x9b\x39\x22";
 const uint16_t listen_a = 20001;
 const uint16_t listen_b = 20002;
 const uint16_t listen_c = 20003;
 const uint16_t af_inet = AF_INET;
 const uint16_t af_inet6 = AF_INET6;
 const struct sockaddr_in endpoint_b_v4 = {
     .sin_family = AF_INET,
     .sin_port = htons(listen_b),
     .sin_addr = {htonl(INADDR_LOOPBACK)}};
 const struct sockaddr_in endpoint_c_v4 = {
     .sin_family = AF_INET,
     .sin_port = htons(listen_c),
     .sin_addr = {htonl(INADDR_LOOPBACK)}};
 struct sockaddr_in6 endpoint_a_v6 = {.sin6_family = AF_INET6,
                                      .sin6_port = htons(listen_a)};
 endpoint_a_v6.sin6_addr = in6addr_loopback;
 struct sockaddr_in6 endpoint_c_v6 = {.sin6_family = AF_INET6,
                                      .sin6_port = htons(listen_c)};
 endpoint_c_v6.sin6_addr = in6addr_loopback;
 const struct in_addr first_half_v4 = {0};
 const struct in_addr second_half_v4 = {(uint32_t)htonl(128 << 24)};
 const struct in6_addr first_half_v6 = {{{0}}};
 const struct in6_addr second_half_v6 = {{{0x80}}};
 const uint8_t half_cidr = 1;
 const uint16_t persistent_keepalives[] = {1, 3, 7, 9, 14, 19};
 struct genlmsghdr genlhdr = {.cmd = WG_CMD_SET_DEVICE, .version = 1};
 int sock;
 int id, err;
 sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
 if (sock == -1) {
   return;
 }
 id = netlink_query_family_id(&nlmsg, sock, WG_GENL_NAME, true);
 if (id == -1) goto error;
 netlink_init(&nlmsg, id, 0, &genlhdr, sizeof(genlhdr));
 netlink_attr(&nlmsg, WGDEVICE_A_IFNAME, ifname_a, strlen(ifname_a) + 1);
 netlink_attr(&nlmsg, WGDEVICE_A_PRIVATE_KEY, private_a, 32);
 netlink_attr(&nlmsg, WGDEVICE_A_LISTEN_PORT, &listen_a, 2);
 netlink_nest(&nlmsg, NLA_F_NESTED | WGDEVICE_A_PEERS);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGPEER_A_PUBLIC_KEY, public_b, 32);
 netlink_attr(&nlmsg, WGPEER_A_ENDPOINT, &endpoint_b_v4,
              sizeof(endpoint_b_v4));
 netlink_attr(&nlmsg, WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL,
              &persistent_keepalives[0], 2);
 netlink_nest(&nlmsg, NLA_F_NESTED | WGPEER_A_ALLOWEDIPS);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &first_half_v4,
              sizeof(first_half_v4));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet6, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &first_half_v6,
              sizeof(first_half_v6));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGPEER_A_PUBLIC_KEY, public_c, 32);
 netlink_attr(&nlmsg, WGPEER_A_ENDPOINT, &endpoint_c_v6,
              sizeof(endpoint_c_v6));
 netlink_attr(&nlmsg, WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL,
              &persistent_keepalives[1], 2);
 netlink_nest(&nlmsg, NLA_F_NESTED | WGPEER_A_ALLOWEDIPS);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &second_half_v4,
              sizeof(second_half_v4));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet6, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &second_half_v6,
              sizeof(second_half_v6));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 err = netlink_send(&nlmsg, sock);
 if (err < 0) {
 }
 netlink_init(&nlmsg, id, 0, &genlhdr, sizeof(genlhdr));
 netlink_attr(&nlmsg, WGDEVICE_A_IFNAME, ifname_b, strlen(ifname_b) + 1);
 netlink_attr(&nlmsg, WGDEVICE_A_PRIVATE_KEY, private_b, 32);
 netlink_attr(&nlmsg, WGDEVICE_A_LISTEN_PORT, &listen_b, 2);
 netlink_nest(&nlmsg, NLA_F_NESTED | WGDEVICE_A_PEERS);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGPEER_A_PUBLIC_KEY, public_a, 32);
 netlink_attr(&nlmsg, WGPEER_A_ENDPOINT, &endpoint_a_v6,
              sizeof(endpoint_a_v6));
 netlink_attr(&nlmsg, WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL,
              &persistent_keepalives[2], 2);
 netlink_nest(&nlmsg, NLA_F_NESTED | WGPEER_A_ALLOWEDIPS);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &first_half_v4,
              sizeof(first_half_v4));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet6, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &first_half_v6,
              sizeof(first_half_v6));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGPEER_A_PUBLIC_KEY, public_c, 32);
 netlink_attr(&nlmsg, WGPEER_A_ENDPOINT, &endpoint_c_v4,
              sizeof(endpoint_c_v4));
 netlink_attr(&nlmsg, WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL,
              &persistent_keepalives[3], 2);
 netlink_nest(&nlmsg, NLA_F_NESTED | WGPEER_A_ALLOWEDIPS);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &second_half_v4,
              sizeof(second_half_v4));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet6, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &second_half_v6,
              sizeof(second_half_v6));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 err = netlink_send(&nlmsg, sock);
 if (err < 0) {
 }
 netlink_init(&nlmsg, id, 0, &genlhdr, sizeof(genlhdr));
 netlink_attr(&nlmsg, WGDEVICE_A_IFNAME, ifname_c, strlen(ifname_c) + 1);
 netlink_attr(&nlmsg, WGDEVICE_A_PRIVATE_KEY, private_c, 32);
 netlink_attr(&nlmsg, WGDEVICE_A_LISTEN_PORT, &listen_c, 2);
 netlink_nest(&nlmsg, NLA_F_NESTED | WGDEVICE_A_PEERS);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGPEER_A_PUBLIC_KEY, public_a, 32);
 netlink_attr(&nlmsg, WGPEER_A_ENDPOINT, &endpoint_a_v6,
              sizeof(endpoint_a_v6));
 netlink_attr(&nlmsg, WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL,
              &persistent_keepalives[4], 2);
 netlink_nest(&nlmsg, NLA_F_NESTED | WGPEER_A_ALLOWEDIPS);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &first_half_v4,
              sizeof(first_half_v4));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet6, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &first_half_v6,
              sizeof(first_half_v6));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGPEER_A_PUBLIC_KEY, public_b, 32);
 netlink_attr(&nlmsg, WGPEER_A_ENDPOINT, &endpoint_b_v4,
              sizeof(endpoint_b_v4));
 netlink_attr(&nlmsg, WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL,
              &persistent_keepalives[5], 2);
 netlink_nest(&nlmsg, NLA_F_NESTED | WGPEER_A_ALLOWEDIPS);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &second_half_v4,
              sizeof(second_half_v4));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_nest(&nlmsg, NLA_F_NESTED | 0);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_FAMILY, &af_inet6, 2);
 netlink_attr(&nlmsg, WGALLOWEDIP_A_IPADDR, &second_half_v6,
              sizeof(second_half_v6));
 netlink_attr(&nlmsg, WGALLOWEDIP_A_CIDR_MASK, &half_cidr, 1);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 netlink_done(&nlmsg);
 err = netlink_send(&nlmsg, sock);
 if (err < 0) {
 }

error:
 close(sock);
}

static void initialize_netdevices(void) {
 char netdevsim[16];
 sprintf(netdevsim, "netdevsim%d", (int)procid);
 struct {
   const char* type;
   const char* dev;
 } devtypes[] = {
     {"ip6gretap", "ip6gretap0"}, {"bridge", "bridge0"}, {"vcan", "vcan0"},
     {"bond", "bond0"},           {"team", "team0"},     {"dummy", "dummy0"},
     {"nlmon", "nlmon0"},         {"caif", "caif0"},     {"batadv", "batadv0"},
     {"vxcan", "vxcan1"},         {"veth", 0},           {"wireguard", "wg0"},
     {"wireguard", "wg1"},        {"wireguard", "wg2"},
 };
 const char* devmasters[] = {"bridge", "bond", "team", "batadv"};
 struct {
   const char* name;
   int macsize;
   bool noipv6;
 } devices[] = {
     {"lo", ETH_ALEN},
     {"sit0", 0},
     {"bridge0", ETH_ALEN},
     {"vcan0", 0, true},
     {"tunl0", 0},
     {"gre0", 0},
     {"gretap0", ETH_ALEN},
     {"ip_vti0", 0},
     {"ip6_vti0", 0},
     {"ip6tnl0", 0},
     {"ip6gre0", 0},
     {"ip6gretap0", ETH_ALEN},
     {"erspan0", ETH_ALEN},
     {"bond0", ETH_ALEN},
     {"veth0", ETH_ALEN},
     {"veth1", ETH_ALEN},
     {"team0", ETH_ALEN},
     {"veth0_to_bridge", ETH_ALEN},
     {"veth1_to_bridge", ETH_ALEN},
     {"veth0_to_bond", ETH_ALEN},
     {"veth1_to_bond", ETH_ALEN},
     {"veth0_to_team", ETH_ALEN},
     {"veth1_to_team", ETH_ALEN},
     {"veth0_to_hsr", ETH_ALEN},
     {"veth1_to_hsr", ETH_ALEN},
     {"hsr0", 0},
     {"dummy0", ETH_ALEN},
     {"nlmon0", 0},
     {"vxcan0", 0, true},
     {"vxcan1", 0, true},
     {"caif0", ETH_ALEN},
     {"batadv0", ETH_ALEN},
     {netdevsim, ETH_ALEN},
     {"xfrm0", ETH_ALEN},
     {"veth0_virt_wifi", ETH_ALEN},
     {"veth1_virt_wifi", ETH_ALEN},
     {"virt_wifi0", ETH_ALEN},
     {"veth0_vlan", ETH_ALEN},
     {"veth1_vlan", ETH_ALEN},
     {"vlan0", ETH_ALEN},
     {"vlan1", ETH_ALEN},
     {"macvlan0", ETH_ALEN},
     {"macvlan1", ETH_ALEN},
     {"ipvlan0", ETH_ALEN},
     {"ipvlan1", ETH_ALEN},
     {"veth0_macvtap", ETH_ALEN},
     {"veth1_macvtap", ETH_ALEN},
     {"macvtap0", ETH_ALEN},
     {"macsec0", ETH_ALEN},
     {"veth0_to_batadv", ETH_ALEN},
     {"veth1_to_batadv", ETH_ALEN},
     {"batadv_slave_0", ETH_ALEN},
     {"batadv_slave_1", ETH_ALEN},
     {"geneve0", ETH_ALEN},
     {"geneve1", ETH_ALEN},
     {"wg0", 0},
     {"wg1", 0},
     {"wg2", 0},
 };
 int sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
 if (sock == -1) exit(1);
 unsigned i;
 for (i = 0; i < sizeof(devtypes) / sizeof(devtypes[0]); i++)
   netlink_add_device(&nlmsg, sock, devtypes[i].type, devtypes[i].dev);
 for (i = 0; i < sizeof(devmasters) / (sizeof(devmasters[0])); i++) {
   char master[32], slave0[32], veth0[32], slave1[32], veth1[32];
   sprintf(slave0, "%s_slave_0", devmasters[i]);
   sprintf(veth0, "veth0_to_%s", devmasters[i]);
   netlink_add_veth(&nlmsg, sock, slave0, veth0);
   sprintf(slave1, "%s_slave_1", devmasters[i]);
   sprintf(veth1, "veth1_to_%s", devmasters[i]);
   netlink_add_veth(&nlmsg, sock, slave1, veth1);
   sprintf(master, "%s0", devmasters[i]);
   netlink_device_change(&nlmsg, sock, slave0, false, master, 0, 0, NULL);
   netlink_device_change(&nlmsg, sock, slave1, false, master, 0, 0, NULL);
 }
 netlink_add_xfrm(&nlmsg, sock, "xfrm0");
 netlink_device_change(&nlmsg, sock, "bridge_slave_0", true, 0, 0, 0, NULL);
 netlink_device_change(&nlmsg, sock, "bridge_slave_1", true, 0, 0, 0, NULL);
 netlink_add_veth(&nlmsg, sock, "hsr_slave_0", "veth0_to_hsr");
 netlink_add_veth(&nlmsg, sock, "hsr_slave_1", "veth1_to_hsr");
 netlink_add_hsr(&nlmsg, sock, "hsr0", "hsr_slave_0", "hsr_slave_1");
 netlink_device_change(&nlmsg, sock, "hsr_slave_0", true, 0, 0, 0, NULL);
 netlink_device_change(&nlmsg, sock, "hsr_slave_1", true, 0, 0, 0, NULL);
 netlink_add_veth(&nlmsg, sock, "veth0_virt_wifi", "veth1_virt_wifi");
 netlink_add_linked(&nlmsg, sock, "virt_wifi", "virt_wifi0",
                    "veth1_virt_wifi");
 netlink_add_veth(&nlmsg, sock, "veth0_vlan", "veth1_vlan");
 netlink_add_vlan(&nlmsg, sock, "vlan0", "veth0_vlan", 0, htons(ETH_P_8021Q));
 netlink_add_vlan(&nlmsg, sock, "vlan1", "veth0_vlan", 1, htons(ETH_P_8021AD));
 netlink_add_macvlan(&nlmsg, sock, "macvlan0", "veth1_vlan");
 netlink_add_macvlan(&nlmsg, sock, "macvlan1", "veth1_vlan");
 netlink_add_ipvlan(&nlmsg, sock, "ipvlan0", "veth0_vlan", IPVLAN_MODE_L2, 0);
 netlink_add_ipvlan(&nlmsg, sock, "ipvlan1", "veth0_vlan", IPVLAN_MODE_L3S,
                    IPVLAN_F_VEPA);
 netlink_add_veth(&nlmsg, sock, "veth0_macvtap", "veth1_macvtap");
 netlink_add_linked(&nlmsg, sock, "macvtap", "macvtap0", "veth0_macvtap");
 netlink_add_linked(&nlmsg, sock, "macsec", "macsec0", "veth1_macvtap");
 char addr[32];
 sprintf(addr, DEV_IPV4, 14 + 10);
 struct in_addr geneve_addr4;
 if (inet_pton(AF_INET, addr, &geneve_addr4) <= 0) exit(1);
 struct in6_addr geneve_addr6;
 if (inet_pton(AF_INET6, "fc00::01", &geneve_addr6) <= 0) exit(1);
 netlink_add_geneve(&nlmsg, sock, "geneve0", 0, &geneve_addr4, 0);
 netlink_add_geneve(&nlmsg, sock, "geneve1", 1, 0, &geneve_addr6);
 netdevsim_add((int)procid, 4);
 netlink_wireguard_setup();
 for (i = 0; i < sizeof(devices) / (sizeof(devices[0])); i++) {
   char addr[32];
   sprintf(addr, DEV_IPV4, i + 10);
   netlink_add_addr4(&nlmsg, sock, devices[i].name, addr);
   if (!devices[i].noipv6) {
     sprintf(addr, DEV_IPV6, i + 10);
     netlink_add_addr6(&nlmsg, sock, devices[i].name, addr);
   }
   uint64_t macaddr = DEV_MAC + ((i + 10ull) << 40);
   netlink_device_change(&nlmsg, sock, devices[i].name, true, 0, &macaddr,
                         devices[i].macsize, NULL);
 }
 close(sock);
}
static void initialize_netdevices_init(void) {
 int sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
 if (sock == -1) exit(1);
 struct {
   const char* type;
   int macsize;
   bool noipv6;
   bool noup;
 } devtypes[] = {
     {"nr", 7, true},
     {"rose", 5, true, true},
 };
 unsigned i;
 for (i = 0; i < sizeof(devtypes) / sizeof(devtypes[0]); i++) {
   char dev[32], addr[32];
   sprintf(dev, "%s%d", devtypes[i].type, (int)procid);
   sprintf(addr, "172.30.%d.%d", i, (int)procid + 1);
   netlink_add_addr4(&nlmsg, sock, dev, addr);
   if (!devtypes[i].noipv6) {
     sprintf(addr, "fe88::%02x:%02x", i, (int)procid + 1);
     netlink_add_addr6(&nlmsg, sock, dev, addr);
   }
   int macsize = devtypes[i].macsize;
   uint64_t macaddr = 0xbbbbbb +
                      ((unsigned long long)i << (8 * (macsize - 2))) +
                      (procid << (8 * (macsize - 1)));
   netlink_device_change(&nlmsg, sock, dev, !devtypes[i].noup, 0, &macaddr,
                         macsize, NULL);
 }
 close(sock);
}

static long syz_init_net_socket(volatile long domain, volatile long type,
                               volatile long proto) {
 int netns = open("/proc/self/ns/net", O_RDONLY);
 if (netns == -1) return netns;
 if (setns(kInitNetNsFd, 0)) return -1;
 int sock = syscall(__NR_socket, domain, type, proto);
 int err = errno;
 if (setns(netns, 0)) exit(1);
 close(netns);
 errno = err;
 return sock;
}

static void setup_common() {
 if (mount(0, "/sys/fs/fuse/connections", "fusectl", 0, 0)) {
 }
}

static void setup_binderfs() {
 if (mkdir("/dev/binderfs", 0777)) {
 }
 if (mount("binder", "/dev/binderfs", "binder", 0, NULL)) {
 }
 if (symlink("/dev/binderfs", "./binderfs")) {
 }
}

static void loop();

static void sandbox_common() {
 prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
 setsid();
 int netns = open("/proc/self/ns/net", O_RDONLY);
 if (netns == -1) exit(1);
 if (dup2(netns, kInitNetNsFd) < 0) exit(1);
 close(netns);
 struct rlimit rlim;
 rlim.rlim_cur = rlim.rlim_max = (200 << 20);
 setrlimit(RLIMIT_AS, &rlim);
 rlim.rlim_cur = rlim.rlim_max = 32 << 20;
 setrlimit(RLIMIT_MEMLOCK, &rlim);
 rlim.rlim_cur = rlim.rlim_max = 136 << 20;
 setrlimit(RLIMIT_FSIZE, &rlim);
 rlim.rlim_cur = rlim.rlim_max = 1 << 20;
 setrlimit(RLIMIT_STACK, &rlim);
 rlim.rlim_cur = rlim.rlim_max = 128 << 20;
 setrlimit(RLIMIT_CORE, &rlim);
 rlim.rlim_cur = rlim.rlim_max = 256;
 setrlimit(RLIMIT_NOFILE, &rlim);
 if (unshare(CLONE_NEWNS)) {
 }
 if (mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL)) {
 }
 if (unshare(CLONE_NEWIPC)) {
 }
 if (unshare(0x02000000)) {
 }
 if (unshare(CLONE_NEWUTS)) {
 }
 if (unshare(CLONE_SYSVSEM)) {
 }
 typedef struct {
   const char* name;
   const char* value;
 } sysctl_t;
 static const sysctl_t sysctls[] = {
     {"/proc/sys/kernel/shmmax", "16777216"},
     {"/proc/sys/kernel/shmall", "536870912"},
     {"/proc/sys/kernel/shmmni", "1024"},
     {"/proc/sys/kernel/msgmax", "8192"},
     {"/proc/sys/kernel/msgmni", "1024"},
     {"/proc/sys/kernel/msgmnb", "1024"},
     {"/proc/sys/kernel/sem", "1024 1048576 500 1024"},
 };
 unsigned i;
 for (i = 0; i < sizeof(sysctls) / sizeof(sysctls[0]); i++)
   write_file(sysctls[i].name, sysctls[i].value);
}

static int wait_for_loop(int pid) {
 if (pid < 0) exit(1);
 int status = 0;
 while (waitpid(-1, &status, __WALL) != pid) {
 }
 return WEXITSTATUS(status);
}

static void drop_caps(void) {
 struct __user_cap_header_struct cap_hdr = {};
 struct __user_cap_data_struct cap_data[2] = {};
 cap_hdr.version = _LINUX_CAPABILITY_VERSION_3;
 cap_hdr.pid = getpid();
 if (syscall(SYS_capget, &cap_hdr, &cap_data)) exit(1);
 const int drop = (1 << CAP_SYS_PTRACE) | (1 << CAP_SYS_NICE);
 cap_data[0].effective &= ~drop;
 cap_data[0].permitted &= ~drop;
 cap_data[0].inheritable &= ~drop;
 if (syscall(SYS_capset, &cap_hdr, &cap_data)) exit(1);
}

static int do_sandbox_none(void) {
 if (unshare(CLONE_NEWPID)) {
 }
 int pid = fork();
 if (pid != 0) return wait_for_loop(pid);
 setup_common();
 sandbox_common();
 drop_caps();
 initialize_netdevices_init();
 if (unshare(CLONE_NEWNET)) {
 }
 write_file("/proc/sys/net/ipv4/ping_group_range", "0 65535");
 initialize_netdevices();
 setup_binderfs();
 loop();
 exit(1);
}

struct thread_t {
 int created, call;
 event_t ready, done;
};

static struct thread_t threads[16];
static void execute_call(int call);
static int running;

static void* thr(void* arg) {
 struct thread_t* th = (struct thread_t*)arg;
 for (;;) {
   event_wait(&th->ready);
   event_reset(&th->ready);
   execute_call(th->call);
   __atomic_fetch_sub(&running, 1, __ATOMIC_RELAXED);
   event_set(&th->done);
 }
 return 0;
}

static void loop(void) {
 int i, call, thread;
 for (call = 0; call < 6; call++) {
   for (thread = 0; thread < (int)(sizeof(threads) / sizeof(threads[0]));
        thread++) {
     struct thread_t* th = &threads[thread];
     if (!th->created) {
       th->created = 1;
       event_init(&th->ready);
       event_init(&th->done);
       event_set(&th->done);
       thread_start(thr, th);
     }
     if (!event_isset(&th->done)) continue;
     event_reset(&th->done);
     th->call = call;
     __atomic_fetch_add(&running, 1, __ATOMIC_RELAXED);
     event_set(&th->ready);
     event_timedwait(&th->done, 50);
     break;
   }
 }
 for (i = 0; i < 100 && __atomic_load_n(&running, __ATOMIC_RELAXED); i++)
   sleep_ms(1);
}

uint64_t r[2] = {0xffffffffffffffff, 0xffffffffffffffff};

void execute_call(int call) {
 intptr_t res = 0;
 switch (call) {
   case 0:
     res = -1;
     res = syz_init_net_socket(/*fam=*/0x1f, /*type=*/5, /*proto=*/2);
     if (res != -1) r[0] = res;
     break;
   case 1:
     memcpy((void*)0x20000180,
            "rose0\000\000\000\000\000\000\000\000\000\000\000", 16);
     *(uint16_t*)0x20000190 = 0x201;
     syscall(__NR_ioctl, /*fd=*/r[0], /*cmd=*/0x8914, /*arg=*/0x20000180ul);
     break;
   case 2:
     res = -1;
     res = syz_init_net_socket(/*domain=*/0xb, /*type=*/5, /*proto=*/0);
     if (res != -1) r[1] = res;
     break;
   case 3:
     *(uint16_t*)0x20000000 = 0xb;
     *(uint8_t*)0x20000002 = 0xbb;
     *(uint8_t*)0x20000003 = 0xbb;
     *(uint8_t*)0x20000004 = 0xbb;
     *(uint8_t*)0x20000005 = 1;
     *(uint8_t*)0x20000006 = 0;
     *(uint8_t*)0x20000007 = 0xbb;
     *(uint8_t*)0x20000008 = 0xbb;
     *(uint8_t*)0x20000009 = 0xbb;
     *(uint8_t*)0x2000000a = 1;
     *(uint8_t*)0x2000000b = 0;
     *(uint32_t*)0x20000010 = 1;
     *(uint8_t*)0x20000014 = 0xbb;
     *(uint8_t*)0x20000015 = 0xbb;
     *(uint8_t*)0x20000016 = 0xbb;
     *(uint8_t*)0x20000017 = 1;
     *(uint8_t*)0x20000018 = 0;
     syscall(__NR_connect, /*fd=*/r[1], /*addr=*/0x20000000ul,
             /*addrlen=*/0x1cul);
     break;
   case 4:
     *(uint16_t*)0x20000040 = 0xb;
     *(uint8_t*)0x20000042 = 0xbb;
     *(uint8_t*)0x20000043 = 0xbb;
     *(uint8_t*)0x20000044 = 0xbb;
     *(uint8_t*)0x20000045 = 1;
     *(uint8_t*)0x20000046 = 0;
     *(uint8_t*)0x20000047 = 0x40;
     *(uint8_t*)0x20000048 = 0x40;
     *(uint8_t*)0x20000049 = 0x40;
     *(uint8_t*)0x2000004a = 0x40;
     *(uint8_t*)0x2000004b = 0x40;
     *(uint8_t*)0x2000004c = 0x40;
     *(uint8_t*)0x2000004d = 0;
     *(uint32_t*)0x20000050 = 1;
     *(uint8_t*)0x20000054 = 0xbb;
     *(uint8_t*)0x20000055 = 0xbb;
     *(uint8_t*)0x20000056 = 0xbb;
     *(uint8_t*)0x20000057 = 1;
     *(uint8_t*)0x20000058 = 0;
     syscall(__NR_connect, /*fd=*/r[1], /*addr=*/0x20000040ul,
             /*addrlen=*/0x1cul);
     break;
   case 5:
     *(uint16_t*)0x200006c0 = 0xb;
     *(uint8_t*)0x200006c2 = 0xcc;
     *(uint8_t*)0x200006c3 = 0xcc;
     *(uint8_t*)0x200006c4 = 0xcc;
     *(uint8_t*)0x200006c5 = 0xcc;
     *(uint8_t*)0x200006c6 = 2;
     *(uint8_t*)0x200006c7 = 0xa2;
     *(uint8_t*)0x200006c8 = 0xa6;
     *(uint8_t*)0x200006c9 = 0xa8;
     *(uint8_t*)0x200006ca = 0x40;
     *(uint8_t*)0x200006cb = 0x40;
     *(uint8_t*)0x200006cc = 0x40;
     *(uint8_t*)0x200006cd = 0;
     *(uint32_t*)0x200006d0 = 1;
     *(uint8_t*)0x200006d4 = 0xbb;
     *(uint8_t*)0x200006d5 = 0xbb;
     *(uint8_t*)0x200006d6 = 0xbb;
     *(uint8_t*)0x200006d7 = 0xbb;
     *(uint8_t*)0x200006d8 = 0xbb;
     *(uint8_t*)0x200006d9 = 0;
     *(uint8_t*)0x200006da = 0;
     syscall(__NR_connect, /*fd=*/r[1], /*addr=*/0x200006c0ul,
             /*addrlen=*/0x1cul);
     break;
 }
}
int main(void) {
 syscall(__NR_mmap, /*addr=*/0x1ffff000ul, /*len=*/0x1000ul, /*prot=*/0ul,
         /*flags=*/0x32ul, /*fd=*/-1, /*offset=*/0ul);
 syscall(__NR_mmap, /*addr=*/0x20000000ul, /*len=*/0x1000000ul, /*prot=*/7ul,
         /*flags=*/0x32ul, /*fd=*/-1, /*offset=*/0ul);
 syscall(__NR_mmap, /*addr=*/0x21000000ul, /*len=*/0x1000ul, /*prot=*/0ul,
         /*flags=*/0x32ul, /*fd=*/-1, /*offset=*/0ul);
 do_sandbox_none();
 return 0;
}

=* repro.tx =*
r0 = syz_init_net_socket$bt_sco(0x1f, 0x5, 0x2)
ioctl$sock_inet_SIOCSIFFLAGS(r0, 0x8914, &(0x7f0000000180)={'rose0\x00', 0x201})
r1 = syz_init_net_socket$rose(0xb, 0x5, 0x0)
connect$rose(r1, &(0x7f0000000000)=@short={0xb, @dev={0xbb, 0xbb,
0xbb, 0x1, 0x0}, @rose={0xbb, 0xbb, 0xbb, 0x1, 0x0}, 0x1, @rose={0xbb,
0xbb, 0xbb, 0x1, 0x0}}, 0x1c)
connect$rose(r1, &(0x7f0000000040)=@short={0xb, @dev, @null, 0x1, @rose}, 0x1c)
connect$rose(r1, &(0x7f00000006c0)=@short={0xb, @remote={0xcc, 0xcc,
0xcc, 0xcc, 0x2}, @bcast, 0x1, @netrom={0xbb, 0xbb, 0xbb, 0xbb, 0xbb,
0x0, 0x0}}, 0x1c)

and also: https://gist.github.com/xrivendell7/75f530b6d4413fbc08d57ee3e40426e2

I hope it helps.
Thanks!
Best regards.
xingwei Lee

