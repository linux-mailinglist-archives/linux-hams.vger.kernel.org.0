Return-Path: <linux-hams+bounces-329-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B778CF6CF
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 01:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C411F21903
	for <lists+linux-hams@lfdr.de>; Sun, 26 May 2024 23:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79E413A26E;
	Sun, 26 May 2024 23:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elite.uk.com header.i=@elite.uk.com header.b="kxB4FHFe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oJCZn5nL"
X-Original-To: linux-hams@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533341854
	for <linux-hams@vger.kernel.org>; Sun, 26 May 2024 23:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716765969; cv=none; b=bgsME44/bcpzUdGUSqbbC7z1UVMIzx5FRga+qbREa6PMYY/kSPmcL9/Qp6E24Gv7B3xss7qYR8rmBUzk9Jhb0CYbhcF+Ck7BPn+NOdO6uhyVdqdXQYzi69QNi1xzMvGQG1UK98QvBR8FJ07dO/VJoQKEQwHV4Fb4OhAB9wamI20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716765969; c=relaxed/simple;
	bh=Vn59AHEfFEhov8YarIBIwiYt52Wr5qKG0UICa5LDgnY=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=u4+N83chK/kKqDIZ4GpwInWQByrRyPhrWzybrub3DQSNivYsaNB4AL+HWbDcRsesOJR511Q15HtubUCbhEKu1FCwEVlGe4uLtBFOAIXXJtadyVzPCwcPgN3AAJ83i2a3aRt7iJuGGHSxR0sHzrXoLmuMnYNqKfyWfK2ILWDdvS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=elite.uk.com; spf=pass smtp.mailfrom=elite.uk.com; dkim=pass (2048-bit key) header.d=elite.uk.com header.i=@elite.uk.com header.b=kxB4FHFe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oJCZn5nL; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=elite.uk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elite.uk.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 5255A1380792
	for <linux-hams@vger.kernel.org>; Sun, 26 May 2024 19:26:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 26 May 2024 19:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elite.uk.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1716765966; x=1716852366; bh=umL+i8VrWB
	CC1PB/oqri357DM+lzu5BjSlJzYVjX/W4=; b=kxB4FHFe0eESP4dFMx/fv7xGvX
	+j+85riF5crkNu3yvnj5uzH51X808MMQ4F12nY2c0577hQpGIQenvdhEK3TS0loK
	mJPNqiDgDk4yB20ZGb33N2t3L/S1l+KW7TcHQrQ8E/NFExokkdWNmD4TPWZp4QC3
	gMVRzKTU50YYAiDmbax38rp56rIVyXFdocYGTAod+sFdjfqBXqiPSCLlc6qZzD22
	ygtJ+UtbZ5nGoMQJW3zPHuXnsERqXSwQQkywmSQRlGbXROS8mGnNWbGoobFD9KN5
	YxP+JIbYZA+SZTn4xhMcXTDqRTWgxKiVNEmR0mYdkiR31/SjTWXnihaswzfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716765966; x=1716852366; bh=umL+i8VrWBCC1PB/oqri357DM+lz
	u5BjSlJzYVjX/W4=; b=oJCZn5nL8JEcYP7D9FUGEqpDhyEjD5EM6HZ4cmo+88Nx
	GjYqSmPwQoMludQtWabSL2WfwaQj+XrDK9iNRkVS/vbjfMpmfCTDtiGl7Zz0GG+V
	PWH1apmwkj00N7vKBitDeTKLs8EKC2QkcP+8RTC+C5HgUSSdcxzTUgrsu5oldsIr
	awvJOs9gT4aCjwBpjCGc2IC465n8JIIU9x6JJYMVpBXSuf+f+aox7gH/PnqpJHAW
	KaRzWfp3omlGa3RrhO1VubRSclUhtqxVw/aRSdYmOMpLtqbqurDXwr2jBtrdJ6Qh
	I3xBdW7eife3vZtqxHFpg7mVbgsX1Mel94g27RpvUg==
X-ME-Sender: <xms:DsVTZh5WChr0k-eQJPRrg2VDDPb1jwr509GJSQ_dCwnWeakgaCKTwA>
    <xme:DsVTZu66Yw-m0gsgYy8s5rRojxpfBYq1U-c2wypgVqWiRgYsfRjdTlPC-kK6pKeh8
    UBlLnnwzPpCVrFqJPg>
X-ME-Received: <xmr:DsVTZofDMNbZieycl6ax_nKZLhV8Auy0SM7z44teHrXjK0rL1_t21h5U6_MLbt8DH5JioYnUg9wIE4gnV0wqiZPJyd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejfedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhtgfgggfukfffvffosehtqhhmtd
    hhtdejnecuhfhrohhmpefoihhkvgcusfhuihhnuceomhhikhgvsegvlhhithgvrdhukhdr
    tghomheqnecuggftrfgrthhtvghrnheptddtjeegveevgfdvkedutdejfeeukeduheeuke
    fgueegfeeltdekgffhheeuueehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhhikhgvsegvlhhithgvrdhukhdrtghomh
X-ME-Proxy: <xmx:DsVTZqL2xZlTesmJ3AqQC0O6BRJjXDlYaGU0FJGf87pXIrBYgOjk5w>
    <xmx:DsVTZlJTe2qReAjt1zIqY-fetoVgb3f4mT8TdyfR_Uy6gbhrX9Ll0g>
    <xmx:DsVTZjzC3I_6lohcLXd3qlYt1TkXStpYJdsnQcY-Cah5oAakhPmJdg>
    <xmx:DsVTZhItbiHbGOhezIRy468JvyDoMIVFeDPjLK2kegVMtwys8L4tuQ>
    <xmx:DsVTZjh0dCXS2EDSUKYwHeWKMG_OF4g0WwXL1vuYQcB-xdFxPKvLb7qc>
Feedback-ID: i55a1499f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-hams@vger.kernel.org>; Sun, 26 May 2024 19:26:05 -0400 (EDT)
From: Mike Quin <mike@elite.uk.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: netrom and kiss port paclen
Message-Id: <F0BD1D3A-5AD1-4CF4-AE71-EBEFE8BE82D7@elite.uk.com>
Date: Mon, 27 May 2024 00:25:53 +0100
To: linux-hams@vger.kernel.org
X-Mailer: Apple Mail (2.3774.600.62)

I=E2=80=99ve been doing some work on a system that acts as a router for =
netrom traffic between two KISS ports.

It works as expected provided the paclen on both ports is set to the =
maximum value of 256.=20

If the paclen on one port is reduced, netrom packets arriving on the =
other port that are larger than paclen-20 aren=E2=80=99t passed through =
and a large number of

kernel: mkiss: ax0: truncating oversized transmit packet!=20

messages are logged.

ax25_output() contains code to fragment packets that are larger than =
paclen, but nr_route_frame() always calls ax25_send_frame() with paclen =
set to 256.

Setting paclen to to 0 in nr_route_frame() activates code in ax25_cb() =
to set paclen to the contents of ax25_dev->values[AX25_VALUES_PACLEN], =
which is initialised via AX25_DEF_PACLEN to 256, and as far as I can =
figure out never changes.=20

With a rough change to set paclen to the device MTU value in ax25_cb, =
large netrom packets get fragmented down to the output device paclen =
size.=20

Another developer I discussed this with suggested that the current =
arrangement may have been arrived at to avoid using fragmentation as it =
wasn=E2=80=99t well understood by other net/rom systems.

Patch for illustration, I don=E2=80=99t think this will be the best way =
to solve this.


diff --git a/net/ax25/ax25_out.c b/net/ax25/ax25_out.c
index 3db76d247..36e0b0f44 100644
--- a/net/ax25/ax25_out.c
+++ b/net/ax25/ax25_out.c
@@ -42,7 +42,13 @@ ax25_cb *ax25_send_frame(struct sk_buff *skb, int =
paclen, const ax25_address *sr
                if ((ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)
                        return NULL;

-               paclen =3D ax25_dev->values[AX25_VALUES_PACLEN];
+                if (ax25_dev->dev->mtu < =
ax25_dev->values[AX25_VALUES_PACLEN]) {
+                       paclen =3D ax25_dev->dev->mtu;
+                       printk(KERN_WARNING "AX.25 mtu %d < dev paclen =
%d, using mtu as paclen\n",
+                               ax25_dev->dev->mtu, =
ax25_dev->values[AX25_VALUES_PACLEN]);
+               } else {
+                       paclen =3D ax25_dev->values[AX25_VALUES_PACLEN];
+               }
        }

        /*
diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index 70480869a..895c2c663 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -824,7 +824,7 @@ int nr_route_frame(struct sk_buff *skb, ax25_cb =
*ax25)
        *dptr =3D AX25_P_NETROM;

        ax25s =3D nr_neigh->ax25;
-       nr_neigh->ax25 =3D ax25_send_frame(skb, 256,
+       nr_neigh->ax25 =3D ax25_send_frame(skb, 0,
                                         (const ax25_address =
*)dev->dev_addr,
                                         &nr_neigh->callsign,
                                         nr_neigh->digipeat, =
nr_neigh->dev);



