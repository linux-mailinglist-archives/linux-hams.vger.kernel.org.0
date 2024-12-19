Return-Path: <linux-hams+bounces-452-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 019BB9F772F
	for <lists+linux-hams@lfdr.de>; Thu, 19 Dec 2024 09:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 410F31658C4
	for <lists+linux-hams@lfdr.de>; Thu, 19 Dec 2024 08:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6086421770C;
	Thu, 19 Dec 2024 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="LW/LzLmi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="R2CPvJoS"
X-Original-To: linux-hams@vger.kernel.org
Received: from send54.i.mail.ru (send54.i.mail.ru [89.221.237.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA002163AC;
	Thu, 19 Dec 2024 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596627; cv=none; b=Oz6tDHfTcYJaHKFjc4f65uCI4tTQHfWQdrKIjo+eH42S0zXGwut6mEnahZ1O9ijG2z0d5JKn8HcQgj4dbfS1UAQgpTEgB3QUaK1NVMNbtr2jGN3q/QGkM3OH3In62PPWHNvt6oUqpYckik/W3hEfhQIVMnqkvlCG94MdZAqEVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596627; c=relaxed/simple;
	bh=3VGSVl26nEWlR3lzt+FH9JTnG2sCDMtP1c7iswswj5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ig+ORhMUOGUvJWBVTcuUiaHWLHu7i66rEyhoPV+7ueytBpDL6eFJn/xtA5nfnG86JVXPz7jPSr/isp8gHcWIesQTSVwgghZxtDja6iGa9AZkMmH91bJGB1+UAMeEjoV+oRoZLowbdunq2k7T7DZKkBzGAXadpNFKx9DZXyq6b1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=LW/LzLmi; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=R2CPvJoS; arc=none smtp.client-ip=89.221.237.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=2jYw54xwlHFpNeiWPxe+Ej9Kfn9KXAuHXEPKfLW0cMI=; t=1734596623; x=1734686623; 
	b=LW/LzLmiBR8Yx+/yJyo0SlIjP+GcFqSzcuQ4ed+sX/NUg8tTMxmWtnNuzSdPE5jOOzQGNo9o4id
	e6jrH9aZu4nZIE7L0940RGP5I5xg7K0P4kQwQi0q81p+BZj3AJPYeHThSbsPkDtj8RaoWFnIo0v+Y
	jV4v9jc75YePV5dKd55cz1Z/ee6JI20rQDAVncPa01psRPFQADEGhsiZHoMtDQNcVf7vpkG1jxhPE
	d1Q3o47SrpUlXg3LTLOPK1dWFxbAMebx5Px5pukiE2/bCgvALhk+wAKrEBE0OcW1nqtb4NIh7QxHl
	oeqOZjxLHsRXBEzOHnpeDYZ1CWY9h9DPgmww==;
Received: from [10.112.192.91] (port=39214 helo=send150.i.mail.ru)
	by exim-fallback-55949dd684-vv8fb with esmtp (envelope-from <rabbelkin@mail.ru>)
	id 1tOBol-00000000X0f-3NPf; Thu, 19 Dec 2024 11:23:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=2jYw54xwlHFpNeiWPxe+Ej9Kfn9KXAuHXEPKfLW0cMI=; t=1734596615; x=1734686615; 
	b=R2CPvJoS50sV5MUmXO38mq0BwxPO0TSu8OBvotvtFzFIcZ0k/4l4HJAQWaew2Y/eceGiyCG4ezc
	G+ulSQ016rTjThJQcTSy/zI5Kt3uretOf6m7MksS/drUshtG5Ht/8pVt9eVgkwWrI136tw1/7Aq6I
	C5B72Co3O3LK00lqytfFDnIvTrAxSqubeITdL6/Y4cO9+z8JKdO95cNeT65fQpbvusZM8gayWTdi3
	Fg85kZ1L5l/blT32BXL4qh2l30p9AyQMPTYwhR9CyqsU1ymxwBJ2q48JRhkLxN5NbiN+MWPfe02zT
	hbc54N3mgLqat0smMlE/5REBMfQ5RfGQT+/A==;
Received: by exim-smtp-cc4f974bf-wv9xh with esmtpa (envelope-from <rabbelkin@mail.ru>)
	id 1tOBoX-000000002ws-2uFb; Thu, 19 Dec 2024 11:23:22 +0300
From: Ilya Shchipletsov <rabbelkin@mail.ru>
To: netdev@vger.kernel.org
Cc: Ilya Shchipletsov <rabbelkin@mail.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Marushkin <hfggklm@gmail.com>
Subject: [PATCH] netrom: check buffer length before accessing it
Date: Thu, 19 Dec 2024 08:23:07 +0000
Message-ID: <20241219082308.3942-1-rabbelkin@mail.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD90D1D1AB545089981B3A6AABDB8AA1442F4CFF06D56E1DA8E182A05F53808504046F51D9B346D19743DE06ABAFEAF670569D7A16E20C39C1319B264EB3DA17CAC2F5D89ECF26BB078
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C8F626AC60F7C593C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE73870E1FF9A049D91EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C900519E39CB47382FEED94E44E0A430BCAC56C02E5AD61F2D21DF9E95F17B0083B26EA987F6312C9ECB1593CA6EC85F86D2CC0D3CB04F14752D2E47CDBA5A96583C09775C1D3CA48CF3B72D73EA5828B68117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE76E0B6B202B8EE8599FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE708E9E5F0E8FE43FBD32BA5DBAC0009BE395957E7521B51C2330BD67F2E7D9AF1090A508E0FED62991661749BA6B977359F81FD64354FB19DCD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BF1175FABE1C0F9B6AAAE862A0553A3920E30A4C9C8E338DAA50D6B5E70F09E5043847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A56E995EDFE71993E65002B1117B3ED696F5D630BD80FD7E68361FAC1196A180DE823CB91A9FED034534781492E4B8EEAD003C2D46C52F18F2C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC98C814B114CD38425778E646DD4CA5282428B99B4804B19A26FF12798C458A00F85117B495E935B24A398DE2C7926EDEE5C9D0377ADBA1A34800EB194F3D3D33518784A353A1C494759C7B6195DDAFE02C26D483E81D6BE52C818B45C5DF227C6320D7D8A56C4C1F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojHq2Ii2MsWRs9ppV23+IYwg==
X-Mailru-Sender: 520A125C2F17F0B129A91D4D2C73336D69FF599F2EC31D793DE06ABAFEAF670569D7A16E20C39C1387BBD21BC54961EB7D4011A27D7B18D45A92E71CC7C3152D768DA86FCF4447625FD6419AF7853D25851DE5097B8401C6C89D8AF824B716EB3E16B1F6FB27E47C394C4C78ECC52E263DDE9B364B0DF289AE208404248635DF
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B45562A35114C4D62A143C92C1EFD0EB2A8C7CFE81B6C0C456049FFFDB7839CE9EFFCB3CFD0F8D0EA39318815A6F197A15A2F3632D60CD09154074CBEEB745B022AFA9486EDD4C44A5
X-7FA49CB5: 0D63561A33F958A52B8A07F18B278F135002B1117B3ED696FC4B0FA8E64B0CBF5F0EC996FCD4845902ED4CEA229C1FA827C277FBC8AE2E8BB6E4CD11D81D7E17
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqeOpLJNHQoBpuf5RTkiCWD
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Syzkaller reports an uninit value read from ax25cmp when sending raw message
through ieee802154 implementation.

=====================================================
BUG: KMSAN: uninit-value in ax25cmp+0x3a5/0x460 net/ax25/ax25_addr.c:119
 ax25cmp+0x3a5/0x460 net/ax25/ax25_addr.c:119
 nr_dev_get+0x20e/0x450 net/netrom/nr_route.c:601
 nr_route_frame+0x1a2/0xfc0 net/netrom/nr_route.c:774
 nr_xmit+0x5a/0x1c0 net/netrom/nr_dev.c:144
 __netdev_start_xmit include/linux/netdevice.h:4940 [inline]
 netdev_start_xmit include/linux/netdevice.h:4954 [inline]
 xmit_one net/core/dev.c:3548 [inline]
 dev_hard_start_xmit+0x247/0xa10 net/core/dev.c:3564
 __dev_queue_xmit+0x33b8/0x5130 net/core/dev.c:4349
 dev_queue_xmit include/linux/netdevice.h:3134 [inline]
 raw_sendmsg+0x654/0xc10 net/ieee802154/socket.c:299
 ieee802154_sock_sendmsg+0x91/0xc0 net/ieee802154/socket.c:96
 sock_sendmsg_nosec net/socket.c:730 [inline]
 __sock_sendmsg net/socket.c:745 [inline]
 ____sys_sendmsg+0x9c2/0xd60 net/socket.c:2584
 ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2638
 __sys_sendmsg net/socket.c:2667 [inline]
 __do_sys_sendmsg net/socket.c:2676 [inline]
 __se_sys_sendmsg net/socket.c:2674 [inline]
 __x64_sys_sendmsg+0x307/0x490 net/socket.c:2674
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x44/0x110 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

Uninit was created at:
 slab_post_alloc_hook+0x129/0xa70 mm/slab.h:768
 slab_alloc_node mm/slub.c:3478 [inline]
 kmem_cache_alloc_node+0x5e9/0xb10 mm/slub.c:3523
 kmalloc_reserve+0x13d/0x4a0 net/core/skbuff.c:560
 __alloc_skb+0x318/0x740 net/core/skbuff.c:651
 alloc_skb include/linux/skbuff.h:1286 [inline]
 alloc_skb_with_frags+0xc8/0xbd0 net/core/skbuff.c:6334
 sock_alloc_send_pskb+0xa80/0xbf0 net/core/sock.c:2780
 sock_alloc_send_skb include/net/sock.h:1884 [inline]
 raw_sendmsg+0x36d/0xc10 net/ieee802154/socket.c:282
 ieee802154_sock_sendmsg+0x91/0xc0 net/ieee802154/socket.c:96
 sock_sendmsg_nosec net/socket.c:730 [inline]
 __sock_sendmsg net/socket.c:745 [inline]
 ____sys_sendmsg+0x9c2/0xd60 net/socket.c:2584
 ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2638
 __sys_sendmsg net/socket.c:2667 [inline]
 __do_sys_sendmsg net/socket.c:2676 [inline]
 __se_sys_sendmsg net/socket.c:2674 [inline]
 __x64_sys_sendmsg+0x307/0x490 net/socket.c:2674
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x44/0x110 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

CPU: 0 PID: 5037 Comm: syz-executor166 Not tainted 6.7.0-rc7-syzkaller-00003-gfbafc3e621c3 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
=====================================================

This issue occurs because the skb buffer is too small, and it's actual
allocation is aligned. This hides an actual issue, which is that nr_route_frame
does not validate the buffer size before using it.

Fix this issue by checking skb->len before accessing any fields in skb->data.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Co-developed-by: Nikita Marushkin <hfggklm@gmail.com>
Signed-off-by: Nikita Marushkin <hfggklm@gmail.com>
Signed-off-by: Ilya Shchipletsov <rabbelkin@mail.ru>
---
 net/netrom/nr_route.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index 2b5e246b8d9a..b94cb2ffbaf8 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -754,6 +754,12 @@ int nr_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 	int ret;
 	struct sk_buff *skbn;
 
+	/*
+	 * Reject malformed packets early. Check that it contains at least 2
+	 * addresses and 1 byte more for Time-To-Live
+	 */
+	if (skb->len < 2 * sizeof(ax25_address) + 1)
+		return 0;
 
 	nr_src  = (ax25_address *)(skb->data + 0);
 	nr_dest = (ax25_address *)(skb->data + 7);
-- 
2.43.0


