Return-Path: <linux-hams+bounces-664-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B5BF1A33
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 15:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5D78423ADD
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 13:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0504B321428;
	Mon, 20 Oct 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="d7WJy0tw"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B5E320CA3;
	Mon, 20 Oct 2025 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760968171; cv=none; b=SH6DCTebaHG0PU8i2CakZjWY6w4OIEhHNxgt5CwHSeR9UeIXuhuBl6GmXsMaOfEAEdDQPXU/GqgKxtTaNKEsMO3h7JZNViDVCLDSWbt/XN9NDxoA5y6MPlObwwTArx/pr+VXT7xPZhXvecH8Hk3bWUywFp7ddm7KBb9HRQz3a44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760968171; c=relaxed/simple;
	bh=WkMLqOwstPD9tXIY7sft1TgQTEA0umE5RoSS7mjxWhg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAaGWpKAOLARMtRKJPhhBH3KfvID3LiMOIhm0wJV+W5srV/OSOIbeUhySlCN+XaWErqveDa49ItzNEGQiaH/wXus4fnLYChse+QBE72bb170oZU6Hxfkd3jxBiWJiWgIVUhD47Iu+nZy0aWs3BongzUpzFcbSipeadhXn4nqyLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=d7WJy0tw; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KAS08m2597786;
	Mon, 20 Oct 2025 13:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=GAiApnCePN3gY4cReH/aSGdisGPxC90q498GRB0bBv4=; b=
	d7WJy0twAlSjFuzpuUQKkoSNSBqqj5GsIr2Rr8baPeWOIOxht9UTFrU1sNBnxpew
	DUdPq8DqOQzgPu/3+z6FxxT9juBPSsRQj8e4O2FzzgP2oJYBCAG6VBtXvXJ036a9
	X1AuTSTlm5wA1RhdxWzwGb3ValNX+mB4D9KSbKDQJBnH+Somm+mizaIzc27mzUY3
	t08Sptq7g8gpu2To5F6X1hMmjdrgdS8yg9hg5W7YsH1R7cuS/heTSddlKICP+5m0
	TDjUOn0+FODrLUN2vpnAKUE/ospTxDI6gShIT2hJlZBBFOi18GufzvasKGpRKvXd
	LmdTBRZN21VsN51mhLtFDA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v03y1xx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Oct 2025 13:49:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 20 Oct 2025 06:49:16 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 20 Oct 2025 06:49:13 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <lizhi.xu@windriver.com>
CC: <dan.carpenter@linaro.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <horms@kernel.org>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <pabeni@redhat.com>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH V2] netrom: Prevent race conditions between multiple add route
Date: Mon, 20 Oct 2025 21:49:12 +0800
Message-ID: <20251020134912.3593047-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020133456.3564833-1-lizhi.xu@windriver.com>
References: <20251020133456.3564833-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: w8xMF_9x59SaIJwTAMVnW1xbKrrdLeig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDExNSBTYWx0ZWRfX/6eiZ9BFhaE3
 i0Yn0J93T5IcP5Xca/NXw3SbjHSHonc8rOEfzcYeTrJhC9ypLLFovNaIYghjxrnELsmW7MAz4Sd
 a1JkR6Lmvn3Klkh3zswUeNGLUAIik1l9N+G1V8oidxOpo3KouE1dBAAMqHS1E0bqwAwadm/m7qX
 gMQj+XPSsNku5VViwHehIrh4hTsOd28mIjiihjPYIRJKmE4+BCP1PT7eOhkmpnFKteD3z/kjdR9
 wJhfifIiq2daD4mMAx+qRE8EIAHcVvjsYOLuV+VoF3PVLevT45SElvNI3/eCvE38RfjvIIDPkP7
 lCkIN3B+ywHIDTK4ksVe4hCjDgRJHScvyp5zGQ7IFJ+UVF9WJPLxl1olyfRXYDdHePo5xRe7btb
 pzfydmzOHUsohhB95g1uDEM1vlZ8eQ==
X-Proofpoint-ORIG-GUID: w8xMF_9x59SaIJwTAMVnW1xbKrrdLeig
X-Authority-Analysis: v=2.4 cv=Uolu9uwB c=1 sm=1 tr=0 ts=68f63ddd cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=FSjqoRavRfmepf25v4oA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510200115

On Mon, 20 Oct 2025 21:34:56 +0800, Lizhi Xu wrote:
> > Task0					Task1						Task2
> > =====					=====						=====
> > [97] nr_add_node()
> > [113] nr_neigh_get_dev()		[97] nr_add_node()
> > 					[214] nr_node_lock()
> > 					[245] nr_node->routes[2].neighbour->count--
> > 					[246] nr_neigh_put(nr_node->routes[2].neighbour);
> > 					[248] nr_remove_neigh(nr_node->routes[2].neighbour)
> > 					[283] nr_node_unlock()
> > [214] nr_node_lock()
> > [253] nr_node->routes[2].neighbour = nr_neigh
> > [254] nr_neigh_hold(nr_neigh);							[97] nr_add_node()
> > 											[XXX] nr_neigh_put()
> >                                                                                         ^^^^^^^^^^^^^^^^^^^^
> > 
> > These charts are supposed to be chronological so [XXX] is wrong because the
> > use after free happens on line [248].  Do we really need three threads to
> > make this race work?
> The UAF problem occurs in Task2. Task1 sets the refcount of nr_neigh to 1,
> then Task0 adds it to routes[2]. Task2 releases routes[2].neighbour after
> executing [XXX]nr_neigh_put().
Execution Order:
1 -> Task0
[113] nr_neigh_get_dev() // After execution, the refcount value is 3

2 -> Task1
[246] nr_neigh_put(nr_node->routes[2].neighbour);   // After execution, the refcount value is 2
[248] nr_remove_neigh(nr_node->routes[2].neighbour) // After execution, the refcount value is 1

3 -> Task0
[253] nr_node->routes[2].neighbour = nr_neigh       // nr_neigh's refcount value is 1 and add it to routes[2]

4 -> Task2
[XXX] nr_neigh_put(nr_node->routes[2].neighbour)    // After execution, neighhour is freed
if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)  // Uaf occurs this line when accessing neighbour->count

BR,
Lizhi

