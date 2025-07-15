Return-Path: <linux-hams+bounces-542-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A04AFB06710
	for <lists+linux-hams@lfdr.de>; Tue, 15 Jul 2025 21:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E4417ACC13
	for <lists+linux-hams@lfdr.de>; Tue, 15 Jul 2025 19:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CC029B8FE;
	Tue, 15 Jul 2025 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alt119.net header.i=@alt119.net header.b="g5WBDJJv"
X-Original-To: linux-hams@vger.kernel.org
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F3419CCF5
	for <linux-hams@vger.kernel.org>; Tue, 15 Jul 2025 19:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752608401; cv=none; b=YSgherVMykbjmmA0iJUInheDzTMvc/EoI2t6qGjAiTdAzUb23YFQNgsb6eIVXnG+Wl3/nm1v1pl8zMlXkcxeojwYGXPOKmdlgoKV+3s+sDLKimHB/2Eq4zMnCj5yhGuox6jtBBsLch7tzQrG3nXgEyiaKBlZu7A4jaRTcF3NxAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752608401; c=relaxed/simple;
	bh=H1qHTL8EhoXckVO146QThrfOTmklZnxYDohAnkcqB30=;
	h=Message-ID:Subject:From:To:Date:MIME-Version:Content-Type; b=uDycR7Q+qglkPNp8zS8iJ/4H2lBKhPI6QTmZ+qfESOSIyDsqAU6zaaOFJ0YSkm/cvIWNqtTn4OOVKGntJEmmH+o2BDDO2fHMX3wK8SyGMrf8Hk/p13BkBIwr0rvfVr/XVvCdbhyMKskjR0RCHi0pCz0x0BAfgFPm+WQXT10hObU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alt119.net; spf=pass smtp.mailfrom=alt119.net; dkim=fail (2048-bit key) header.d=alt119.net header.i=@alt119.net header.b=g5WBDJJv reason="signature verification failed"; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alt119.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alt119.net
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTPS
	id bjKouUgP6AfjwblTquIzmX; Tue, 15 Jul 2025 19:38:22 +0000
Received: from br472.hostgator.com.br ([216.172.172.185])
	by cmsmtp with ESMTPS
	id blTouCNJLRe6ublTpunEhf; Tue, 15 Jul 2025 19:38:21 +0000
Message-ID: blTouCNJLRe6ublTpunEhf@eig-obgw-6005a.ext.cloudfilter.net
X-Authority-Analysis: v=2.4 cv=HeffTTE8 c=1 sm=1 tr=0 ts=6876ae2d
 a=tRrEJjJfWNXmKx/g9s6alg==:117 a=tRrEJjJfWNXmKx/g9s6alg==:17
 a=HpEJnUlJZJkA:10 a=Q9fys5e9bTEA:10 a=Wb1JkmetP80A:10 a=YkX3nuDu_fEA:10
 a=IRdwZIlRtxGmDU--mq0A:9 a=PUjeQqilurYA:10 a=Htg-dMgfE-Gpo_FFWHPr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=alt119.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:To:From
	:Subject:Sender:Reply-To:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sn2kDLnUe6yRQCRasKjKG4ucCTmVkCDdMCMs6OluKlY=; b=g5WBDJJv5mloCag+nXhMcf8FOX
	qjgR1T6xs8ONBQrgew9D5fLkV9pCj9wLPc/T1Rm+zLhboBz8GgSKFb68WtYxL8nD3OjVG8PFdKQJe
	Sg1+Tr3dKKYdGW6LwsbrFDGyjE/OKZaUe9YOdSoa+deMfFgWI0ZMJVxeQRdRyNKKSU4FftDF82xru
	bf5e9lDGBJ9Cgd22FZIsc3pNVZ2It9z8+k8agTV+Qms6+1gZQC+TQrCk9IO9422aHeafve0mM7OWZ
	nwFDGfTm/mS3mCFPlRIXJO/sH3MwWdva/dsg6vD9hobFD2RUYgfia8I9Y4RwTO/tg30XVZ7K2u0yS
	R6crYVUw==;
Received: from [179.133.95.32] (port=52938 helo=MesNews)
	by br472.hostgator.com.br with esmtpa (Exim 4.98.1)
	(envelope-from <pu2luw@alt119.net>)
	id 1ublTn-00000000hcd-2xkR
	for linux-hams@vger.kernel.org;
	Tue, 15 Jul 2025 16:38:20 -0300
Subject: subscribe
From: Internetado <pu2luw@alt119.net>
To: linux-hams@vger.kernel.org
Organization: [fanless][news][peer].ALT119.NET
X-Mailer: MesNews/1.08.06.00-gb
Date: Tue, 15 Jul 2025 16:38:10 -0300
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - br472.hostgator.com.br
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - alt119.net
X-BWhitelist: no
X-Source-IP: 179.133.95.32
X-Source-L: No
X-Exim-ID: 1ublTn-00000000hcd-2xkR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (MesNews) [179.133.95.32]:52938
X-Source-Auth: alt119@alt119.net
X-Email-Count: 1
X-Org: HG=hgshared_br;ORG=latam;
X-Source-Cap: YWx0bmV0O2FsdG5ldDticjQ3Mi5ob3N0Z2F0b3IuY29tLmJy
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOm8BUE9eefLTRqy+A4Wa+HK82FR2yChYxUX3j48ZQuYa1TmA4kBxrmR7HQd3qEnUm3Eh34zl1pRGI9ege+X/IUn3ixJWraxUMQO3rr23x0SOwXwtWoQ
 cV4mCbrtHBq5nSacF6S+jtGjusx4hHudy14kZik6GXEZk5H/iSuLu1Df1rCCSMBRBXjEGLEMnNAAGCKsoPf0fb+cEXQg41kkROg=

-- 

Eduardo.M - Brasil
=================

