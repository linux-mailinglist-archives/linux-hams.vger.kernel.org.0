Return-Path: <linux-hams+bounces-663-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88220BF18EC
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 15:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC9DC421F89
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 13:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA5C314A78;
	Mon, 20 Oct 2025 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="i7BdrJY3"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D32D2F8BDA;
	Mon, 20 Oct 2025 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967316; cv=none; b=se/lRjELWV5ahIG8yofdjaABwhV2Ihw+wSiA8Idn2wtJFSyAurwtLtBwWbQanH9U2+RViLKVikpfDEXr1DgJ6+WaR9BaxSaRZnFMbbh1olY+gy0ozCe7RED7C/aFv2WWKoMk9Ss2OxOwRv+6blhbEIWrRppM2FdmP6/kouFckJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967316; c=relaxed/simple;
	bh=ucu/MEjAdi6pmWs46yVfUvYL1HyEffGD/qz2i/G6+p8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VYLjsDnK5Amb5lD69l8RRpNkAldD5yW6QxTT2FZ7pIHhr0eSDjDvmxRBGnSl1maVkRLCJFSV80tsprjWe3UfoNdd1M7UnyA2YzLSgtPS8LWeUX0BSj0lO0vRhQgBub2hc+S4oxJjRYKptuKJN5uq5N7bIqFwKHj/FXc4LVBqFoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=i7BdrJY3; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59K5WBcU2112730;
	Mon, 20 Oct 2025 13:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9uGXyVAMB5KWc9aTemb30vveby9Xb/lQVPneonf9zHU=; b=
	i7BdrJY3Wqcb5I9nGgd4vwRYUXnxeHoc8Vd59XYigK+uSywqswaSYq3W4M3SdnK8
	vQILduarUNDavunfI0r6VPyLIWT/ftTAdjKZHzEUcAd5VlyF01PUeG2JYkoCxnpg
	TwQcfk9kgUxmWDSSEW1iKLxXe8RTMPdAE07yCc85WMAHJoZmteufQPbcXbhJykbX
	rIS9r3uQZ1fx/wkEmhttUiTNRpoN2Xg+q4vVYP1ORRqupTiaMgEEeArTeBNMUTbK
	+6xBQjhbp6vTpLyE9KEw5+cmTCv6cpKyo/j7Agj4N4YR/OFcjtp5VSyfjVpOS0wf
	bEF+4m/MDErdss/OH0jZSg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v03y1xhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Oct 2025 13:35:01 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 20 Oct 2025 06:35:00 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 20 Oct 2025 06:34:57 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <dan.carpenter@linaro.org>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH V2] netrom: Prevent race conditions between multiple add route
Date: Mon, 20 Oct 2025 21:34:56 +0800
Message-ID: <20251020133456.3564833-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aPYqRJXGhCNws4d3@stanley.mountain>
References: <aPYqRJXGhCNws4d3@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5Tz-xckAP7A_CoA36wyirgX0sxBDqwpz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDExMiBTYWx0ZWRfX7jYUAPKXAm0J
 H91y8PzqKW+203dY71ZCoI05iNbhhI0yDUcPrc5fxOv4x2C1UDFsZPBNmnB72wEGJifphGCtDJ1
 PoSI3aMbHr62X2iQfTD/OKU8M3+dDi+RiG9et5+wZb5o6plBc3dZB88C7JinXj9EcRUBSlZb92e
 e1II3kXaTf7cMwlaUhucuOrJr+14xwKVl96WAzTgP6QDIo0mG9V+MOS0DhH5RQFMSR788tkMr/M
 ECmEUzShyNEbfmrOtAX0JBwpg59HR7T2Zm/P8HTu7ZSYnaidT1frrRUDvM5n9ejs2EBtU/YepJs
 FxOVMEPnGYmx2yaBQrtFLBMTIxIddPI1Y+gp4xV69+gSFmHLI0QdaJBIrmZz02fVEAi2ziHAaNM
 9qk7mjdycBUj2bWLC7/vL9gIUYldkQ==
X-Proofpoint-ORIG-GUID: 5Tz-xckAP7A_CoA36wyirgX0sxBDqwpz
X-Authority-Analysis: v=2.4 cv=Uolu9uwB c=1 sm=1 tr=0 ts=68f63a85 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=LKzG_j_Es1a0USQ6zj0A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510200112


On Mon, 20 Oct 2025 15:25:40 +0300, Dan Carpenter wrote:
> Task0					Task1						Task2
> =====					=====						=====
> [97] nr_add_node()
> [113] nr_neigh_get_dev()		[97] nr_add_node()
> 					[214] nr_node_lock()
> 					[245] nr_node->routes[2].neighbour->count--
> 					[246] nr_neigh_put(nr_node->routes[2].neighbour);
> 					[248] nr_remove_neigh(nr_node->routes[2].neighbour)
> 					[283] nr_node_unlock()
> [214] nr_node_lock()
> [253] nr_node->routes[2].neighbour = nr_neigh
> [254] nr_neigh_hold(nr_neigh);							[97] nr_add_node()
> 											[XXX] nr_neigh_put()
>                                                                                         ^^^^^^^^^^^^^^^^^^^^
> 
> These charts are supposed to be chronological so [XXX] is wrong because the
> use after free happens on line [248].  Do we really need three threads to
> make this race work?
The UAF problem occurs in Task2. Task1 sets the refcount of nr_neigh to 1,
then Task0 adds it to routes[2]. Task2 releases routes[2].neighbour after
executing [XXX]nr_neigh_put().

BR,
Lizhi

