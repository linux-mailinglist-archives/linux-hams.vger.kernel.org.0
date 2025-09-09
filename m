Return-Path: <linux-hams+bounces-631-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9326FB50199
	for <lists+linux-hams@lfdr.de>; Tue,  9 Sep 2025 17:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D6B16B890
	for <lists+linux-hams@lfdr.de>; Tue,  9 Sep 2025 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A5D343D6B;
	Tue,  9 Sep 2025 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="qzHM0172"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C185932CF7C;
	Tue,  9 Sep 2025 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757432328; cv=none; b=LDIdSA49uc5daO7ZMsQb+FhRiN3JD05Vu+bbXA67mgL7UhRCV0/N4LcWK+3di0lC+hgNppeYrYSTTmQ1Gr/pKY28AsJKLiT6HY2CebhFa8jtrvz4tFNAxc8wTkcxXRofSvPpJlMkpQ+WEYw2igHuLgUaUimUeD6RSfSpR1WfgmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757432328; c=relaxed/simple;
	bh=RAlsBwrMVc4mr9bqVlEkt0nwdmS1ROjRJD7r8ZvR60I=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:Cc:In-Reply-To; b=tYcaIuYaYerd9eqC5+RQsV4wY+8o3PTjL6GTgQTZvNdgI46523LGZEp3dVPl66Tt3lHiBahUnyHD7ZpRuexjufQT/w00ZwIEvMv24Nf0HxpKTumCByvX7GxKXxPzfo6lOoh6sNvWGvvfBZ1uSnGbEN+1qo4XbXPocI2OwjFCf9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=qzHM0172; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: bernard.pidoux@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id A027519F5C2;
	Tue,  9 Sep 2025 17:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1757432318;
	bh=RAlsBwrMVc4mr9bqVlEkt0nwdmS1ROjRJD7r8ZvR60I=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=qzHM01722BI6JbHeJ1/3Zf5N4UAWNuhgpHNW82P+6yki2Q7qXJmHJwaFDdZwUaJ4O
	 mKfp36cGxv91byJepZYY49w61mtr2s+1mA2sL/bC2J60H9L7bpWuRxogmk9m0cMOPE
	 hqQN71ij4iyuVtjvs4NK27tApaeUto5rHIA5iU1Q7r39ao2pA/lF8P5T3gyTaeBZZN
	 nmea/E2HOnSGjWpYWwKs/yU6gFfbj8IJZcPRS+W0ggqwdcAaDYOpLLQ67kUkSSKNeA
	 REN5Q9KK0XZzD5I+y4l8XxKWlbrKdGMn+X/6Aog+QW1RzRMrnygJyTK6mNqUBqVJ6m
	 d5KneRW1vwhWw==
Content-Type: multipart/mixed; boundary="------------BFkYMDOTwEs82WuKU6RKQpL0"
Message-ID: <e949c529-947f-4206-9b03-bf6d812abbf2@free.fr>
Date: Tue, 9 Sep 2025 17:38:32 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] [AX25] fix lack of /proc/net/ax25 labels header
To: linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>
References: <E3ABD638-BF7B-4837-8534-F73A1BB7CEB3@gmail.com>
Content-Language: en-US
From: Bernard Pidoux <bernard.pidoux@free.fr>
Cc: David Ranch <dranch@trinnet.net>, Lee Woldanski <ve7fet@tparc.org>,
 Eric Dumazet <edumazet@google.com>
In-Reply-To: <E3ABD638-BF7B-4837-8534-F73A1BB7CEB3@gmail.com>

This is a multi-part message in MIME format.
--------------BFkYMDOTwEs82WuKU6RKQpL0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


[PATCH]  [AX25] fix lack of /proc/net/ax25 labels header

/pro/net/ax25 never had a chance to be displayed in easily
understandable format.

First reason was the absence of labels header, second reason was
pourly formated proc/net/ax25 lines.

Actually ax25_info_start() did not return SEQ_START_TOKEN and there was 
no test for displaying header in ax25_info_show().

Another reason for lack of readability was poorly formatted 
/proc/net/ax25 as shown:

00000000fb21b658 ax0 F6BVP-12 * 0 0 0 0 0 10 0 3 0 300 0 0 0 10 5 2 256 
0 0 14949

The proposed patch initializes SEQ_START_TOKEN in ax25_list_start and 
add a test for first time displaying header in ax25_info_show().

In addition this patch provides a better formated display of /proc/net/
ax25 aka /proc/net/nr or /proc/net/rose

magic            dev src_addr  dest_addr digi1     digi2 .. st vs vr va 
    t1     t2      t3     idle    n2   rtt window  paclen Snd-Q Rcv-Q  inode
0000000040471056 ax0 F6BVP-13  F6BVP-9   -         -         3  5  4  5 
   0/03   0/3   189/300   0/0    0/10    1   2      256    *     *     *
000000002f11c115 ax0 F6BVP-13  F6BVP-11  -         -         3  5  4  5 
   0/06   0/3   155/300   0/0    0/10    3   2      256    *     *     *
00000000c534288b ax0 F6BVP-12  *         -         -         0  0  0  0 
   0/10   0/3     0/300   0/0    0/10    5   2      256    0     0     50994


Signed-off-by: Bernard Pidoux <Bernard.pidoux@free.fr>



--------------BFkYMDOTwEs82WuKU6RKQpL0
Content-Type: text/plain; charset=UTF-8; name="af_ax25.patch"
Content-Disposition: attachment; filename="af_ax25.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL25ldC9heDI1L2FmX2F4MjUuYyBiL25ldC9heDI1L2FmX2F4MjUuYw0K
aW5kZXggNmVmOGIyYS4uMWUyZjkyNCAxMDA2NDQNCi0tLSBhL25ldC9heDI1L2FmX2F4MjUu
Yw0KKysrIGIvbmV0L2F4MjUvYWZfYXgyNS5jDQpAQCAtMTkzMyw2ICsxOTMzLDEwIEBAIHN0
YXRpYyB2b2lkICpheDI1X2luZm9fc3RhcnQoc3RydWN0IHNlcV9maWxlICpzZXEsIGxvZmZf
dCAqcG9zKQ0KIAlfX2FjcXVpcmVzKGF4MjVfbGlzdF9sb2NrKQ0KIHsNCiAJc3Bpbl9sb2Nr
X2JoKCZheDI1X2xpc3RfbG9jayk7DQorDQorCWlmICgqcG9zID09IDApDQorCQlyZXR1cm4g
U0VRX1NUQVJUX1RPS0VOOw0KKw0KIAlyZXR1cm4gc2VxX2hsaXN0X3N0YXJ0KCZheDI1X2xp
c3QsICpwb3MpOw0KIH0NCiANCkBAIC0xOTU2LDIzICsxOTYwLDM1IEBAIHN0YXRpYyBpbnQg
YXgyNV9pbmZvX3Nob3coc3RydWN0IHNlcV9maWxlICpzZXEsIHZvaWQgKnYpDQogDQogCS8q
DQogCSAqIE5ldyBmb3JtYXQ6DQotCSAqIG1hZ2ljIGRldiBzcmNfYWRkciBkZXN0X2FkZHIs
ZGlnaTEsZGlnaTIsLi4gc3QgdnMgdnIgdmEgdDEgdDEgdDIgdDIgdDMgdDMgaWRsZSBpZGxl
IG4yIG4yIHJ0dCB3aW5kb3cgcGFjbGVuIFNuZC1RIFJjdi1RIGlub2RlDQorCSAqIG1hZ2lj
IGRldiBzcmNfYWRkciBkZXN0X2FkZHIsZGlnaTEsZGlnaTIsLi4gc3QgdnMgdnIgdmEgdDEv
dDEgdDIvdDIgdDMvdDMgaWRsZS9pZGxlIG4yL24yIHJ0dCB3aW5kb3cgcGFjbGVuIFNuZC1R
IFJjdi1RIGlub2RlDQogCSAqLw0KIA0KLQlzZXFfcHJpbnRmKHNlcSwgIiVwICVzICVzJXMg
IiwNCisJaWYgKHYgPT0gU0VRX1NUQVJUX1RPS0VOKQ0KKwkJc2VxX3ByaW50ZihzZXEsDQor
CQkJICJtYWdpYyAgICAgICAgICAgIGRldiBzcmNfYWRkciAgZGVzdF9hZGRyIGRpZ2kxICAg
ICBcDQorZGlnaTIgLi4gc3QgdnMgdnIgdmEgICAgIHQxICAgICB0MiAgICAgIHQzICAgICBp
ZGxlICAgIG4yICAgcnR0IFwNCit3aW5kb3cgIHBhY2xlbiBTbmQtUSBSY3YtUSAgaW5vZGVc
biIpOw0KKwllbHNlIHsNCisJCXNlcV9wcmludGYoc2VxLCAiJXAgJXMgJS05cyVzIiwNCiAJ
CSAgIGF4MjUsDQogCQkgICBheDI1LT5heDI1X2RldiA9PSBOVUxMPyAiPz8/IiA6IGF4MjUt
PmF4MjVfZGV2LT5kZXYtPm5hbWUsDQogCQkgICBheDJhc2MoYnVmLCAmYXgyNS0+c291cmNl
X2FkZHIpLA0KLQkJICAgYXgyNS0+aWFtZGlnaT8gIioiOiIiKTsNCi0Jc2VxX3ByaW50Zihz
ZXEsICIlcyIsIGF4MmFzYyhidWYsICZheDI1LT5kZXN0X2FkZHIpKTsNCisJCSAgIGF4MjUt
PmlhbWRpZ2k/ICIqIjoiICIpOw0KKwkJc2VxX3ByaW50ZihzZXEsICIlLTlzIiwgYXgyYXNj
KGJ1ZiwgJmF4MjUtPmRlc3RfYWRkcikpOw0KIA0KLQlmb3IgKGs9MDsgKGF4MjUtPmRpZ2lw
ZWF0ICE9IE5VTEwpICYmIChrIDwgYXgyNS0+ZGlnaXBlYXQtPm5kaWdpKTsgaysrKSB7DQot
CQlzZXFfcHJpbnRmKHNlcSwgIiwlcyVzIiwNCi0JCQkgICBheDJhc2MoYnVmLCAmYXgyNS0+
ZGlnaXBlYXQtPmNhbGxzW2tdKSwNCi0JCQkgICBheDI1LT5kaWdpcGVhdC0+cmVwZWF0ZWRb
a10/ICIqIjoiIik7DQotCX0NCisJCWlmIChheDI1LT5kaWdpcGVhdCA9PSBOVUxMKSB7DQor
CQkJc3RyY3B5KGJ1ZiwiLSIpOw0KKwkJCXNlcV9wcmludGYoc2VxLCAiICUtOXMgJS05cyAi
LCBidWYsYnVmKTsNCisJCX0NCisJCWVsc2Ugew0KKwkJCWZvciAoaz0wOyBrIDwgYXgyNS0+
ZGlnaXBlYXQtPm5kaWdpOyBrKyspIHsNCisJCQkJc2VxX3ByaW50ZihzZXEsICIlLTlzJXMi
LA0KKwkJCQlheDJhc2MoYnVmLCAmYXgyNS0+ZGlnaXBlYXQtPmNhbGxzW2tdKSwNCisJCQkJ
YXgyNS0+ZGlnaXBlYXQtPnJlcGVhdGVkW2tdPyAiKiI6IiAiKTsNCisJCQl9DQorCQl9DQog
DQotCXNlcV9wcmludGYoc2VxLCAiICVkICVkICVkICVkICVsdSAlbHUgJWx1ICVsdSAlbHUg
JWx1ICVsdSAlbHUgJWQgJWQgJWx1ICVkICVkIiwNCisJCXNlcV9wcmludGYoc2VxLCAiJWQg
ICVkICAlZCAgJWQgICAlMmx1LyUwMmx1ICAgJWx1LyVsdSAgICUzbHUvJWx1ICAgJWx1LyVs
dSAgICUyZC8lMmQgICUzbHUgJTNkICAgICAgJTNkIiwNCiAJCSAgIGF4MjUtPnN0YXRlLA0K
IAkJICAgYXgyNS0+dnMsIGF4MjUtPnZyLCBheDI1LT52YSwNCiAJCSAgIGF4MjVfZGlzcGxh
eV90aW1lcigmYXgyNS0+dDF0aW1lcikgLyBIWiwgYXgyNS0+dDEgLyBIWiwNCkBAIC0xOTg1
LDEzICsyMDAxLDEzIEBAIHN0YXRpYyBpbnQgYXgyNV9pbmZvX3Nob3coc3RydWN0IHNlcV9m
aWxlICpzZXEsIHZvaWQgKnYpDQogCQkgICBheDI1LT53aW5kb3csDQogCQkgICBheDI1LT5w
YWNsZW4pOw0KIA0KLQlpZiAoYXgyNS0+c2sgIT0gTlVMTCkgew0KLQkJc2VxX3ByaW50Zihz
ZXEsICIgJWQgJWQgJWx1XG4iLA0KKwkJaWYgKGF4MjUtPnNrICE9IE5VTEwpIHsNCisJCQlz
ZXFfcHJpbnRmKHNlcSwgIiAgICAlLTNkICAgJS0zZCAgICVsdVxuIiwNCiAJCQkgICBza193
bWVtX2FsbG9jX2dldChheDI1LT5zayksDQogCQkJICAgc2tfcm1lbV9hbGxvY19nZXQoYXgy
NS0+c2spLA0KIAkJCSAgIHNvY2tfaV9pbm8oYXgyNS0+c2spKTsNCi0JfSBlbHNlIHsNCi0J
CXNlcV9wdXRzKHNlcSwgIiAqICogKlxuIik7DQorCQl9IGVsc2UNCisJCQlzZXFfcHV0cyhz
ZXEsICIgICAgKiAgICAgKiAgICAgKlxuIik7DQogCX0NCiAJcmV0dXJuIDA7DQogfQ0K

--------------BFkYMDOTwEs82WuKU6RKQpL0--

