Return-Path: <linux-hams+bounces-316-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0E68CCC5A
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 08:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF5531C22077
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 06:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D4113C3FD;
	Thu, 23 May 2024 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="drlSlu+y"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28992D05E;
	Thu, 23 May 2024 06:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716446258; cv=fail; b=loHDJhmOkG0svQzycXdFw0bVEj8+/7UIueytfI74Hy93V6JAAXGzGI58jCvY6I3un9EoQblLpw5ABKYTBHnIiMgXzH3+Ebzfl/WpOM31/FehTYjvZHmRPFt36RBGEaBrHzbWwJdalBIUJn2/wV2G4Pkof+LnudCig2sKfhvDvt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716446258; c=relaxed/simple;
	bh=WQddJZDCaSxbeJc7RMWwUExlyKWnkjCgl1pQIm5l+CQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BTLAxZClnKEPlVCvAVpLfwmmfrirfebh6RlUEjlhxCMnmjjR5VUAIsC19iqIzmOz2FJX+41r0TCGhsyWYm37WcpAtLTiCV/b+PuhxutbforawCerpQkcZcAIeH538LSaJPT4BiPsFr0VChpEDDJZT/24zDpmQLZRyHIBzeArtCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=drlSlu+y; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N4lqQ0004160;
	Wed, 22 May 2024 23:37:35 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3y9y3108xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnwQm/uXSUwXpbGQ5L2/qCxmpSeoGFerQgB8i7IjYKQp2Pwoclirv32zyq+ruqcZCK4qSJmiUoQkj4G9FOBhYv4N1ghe/Pv6QlxebWFuNw4pcX7QYBCCIdlL/FDzQ+HCEGgrFCBrxZ5SySMfXg5BA0ouPHGMK/4maOkL1YYvnHSqvbvEJhlKDHEmXups2PYfYEz/HYCcYpGIJbONOd/9sZ6o19eHrcPaTUCAVi1cP2B8QzKaUc+RX/Xn96LJ1+5RH+f+Elhm+/p38yWCAaX5LkXo6ht3pT4nuGcwKPrBKkdAkQ75O1urVdMca7yJgf8SySwobn8Omqpk5mNKATq9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q80lDeyZ8xU782XnEH5fl8+LCzvloXuZ5py+JlssOww=;
 b=V7WzTm5aOrcWRDRbR0R5smn/Ip/DtQuiDJg1fKdGxQYiHGE/P2SCvwrG4SOHVk7qKr3zaU9dPcAoZjVAvMEjy/fjLZVKuFPX7Fl1VdgP2VdwoXos8h/3pE3Wogi+5K1fnEEHuvqR1sM5B4uex1J7gbcSpCcKxuXGEfrLbjFx5BspZ34AptadXh9Vnrpa4d7C3aKFO8rfpEtUqqGWNbBkExdJsNKir2rjn25iIKA7zmdLLS/eifbzHW56q6uHYkHdEnxXJvKsTTWyFbt0aGwuieuKkCD1hgLZO1V6EoH/PjS2uD88KCqaiwxXG+CEXtd+oT8T2TZ7lTroB7PqAxJWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q80lDeyZ8xU782XnEH5fl8+LCzvloXuZ5py+JlssOww=;
 b=drlSlu+ymrHeGx38fA4DoTWP5cucJuL+BfjhMXAeD8Kv3o2LS0HJFQ1oF32mu1v1Zye/+a7YDsKy2sAUOVWhw79C+bO0cTSsOAlMAOWpUj4dgGpXj7HKegxs0EQqn+4+tT8bIjJDLyTWlR/alQ6Cv1YguXHzHD3NzU2tz+q9Hhk=
Received: from SJ2PR18MB5635.namprd18.prod.outlook.com (2603:10b6:a03:55a::21)
 by DS0PR18MB5321.namprd18.prod.outlook.com (2603:10b6:8:114::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 23 May
 2024 06:37:33 +0000
Received: from SJ2PR18MB5635.namprd18.prod.outlook.com
 ([fe80::efe5:32a7:11a8:840d]) by SJ2PR18MB5635.namprd18.prod.outlook.com
 ([fe80::efe5:32a7:11a8:840d%7]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 06:37:33 +0000
From: Naveen Mamindlapalli <naveenm@marvell.com>
To: Lars Kellogg-Stedman <lars@oddbit.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>
Subject: RE: Re: [PATCH v2] ax25: Fix refcount imbalance on inbound
 connections
Thread-Topic: Re: [PATCH v2] ax25: Fix refcount imbalance on inbound
 connections
Thread-Index: AQHarNuxiySfKK9pZE+yNkZRE1L9yg==
Date: Thu, 23 May 2024 06:37:33 +0000
Message-ID: 
 <SJ2PR18MB56353DBBA807AE7F40F5206DA2F42@SJ2PR18MB5635.namprd18.prod.outlook.com>
References: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
 <SJ2PR18MB5635B7ADC7339BEDB79B183DA2EA2@SJ2PR18MB5635.namprd18.prod.outlook.com>
 <5hsingm5tdmbdnbvx2yksu2n2edqprpm6mgzodjcq4wgwksxbo@vcnxk3luaqw7>
In-Reply-To: <5hsingm5tdmbdnbvx2yksu2n2edqprpm6mgzodjcq4wgwksxbo@vcnxk3luaqw7>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR18MB5635:EE_|DS0PR18MB5321:EE_
x-ms-office365-filtering-correlation-id: 5af53512-8ba3-417b-ec5c-08dc7af2d3b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?iw6zpQF2nfQFhnxfutSn6LWhr5Nb4OfwMDoXhwxSDm+dM7pE/XucQ/saQCwr?=
 =?us-ascii?Q?z3jQ4Tnf4+tDFsbWNGFgDs5l7940jPyj1OHtsTFg6/8HVnTK9RQqOt5MCbju?=
 =?us-ascii?Q?39rEbCDv8QFl32SoMN4J59gJ65PkTjxGjP6V2od78b/BBuuxjLPq6Hfcx6ey?=
 =?us-ascii?Q?y01SPW8/JeHyMnhxrA4K6gAvQPYqFmajGjHhOLsmTiQT5MgMBcKoIp4AMJ00?=
 =?us-ascii?Q?GIeHRo5Wd/SJDLMmjnt9P6+2uNX5AyEyq5HcetS7d8L2QTwlNE0Pfe9V4e/U?=
 =?us-ascii?Q?tiGWZ4nl0SvKANkJetQ3Y8tpiHqvuvkTlwDSPHkCw9u+DHDqithOaWVtf0cK?=
 =?us-ascii?Q?ytF6ddON/kS4QW5AUscsIDD5ofJRGskTnoKcen+FJJmEUKocrGdAQuBNl0vo?=
 =?us-ascii?Q?vuskLQCyVfMBZakZU1hMjpXe4WatDTM6GgH2YMbWbZtULNQNM7IU3g0Qh3u8?=
 =?us-ascii?Q?cHHw0WFMLBa+20IvrO/AyN1NVpYHCBT3GfCGbyufvyn8HCebW/+FOrtXqBia?=
 =?us-ascii?Q?Jv3OwlcLheKECMmMUVRQipb/NIaK3E0w1hmeiP7AWMrD8KvLSS+dJP3gtfYr?=
 =?us-ascii?Q?0XkhaLjEGKiegAoGjBuA9Ro/k/nASng8ObR8zTmWN+WY3otgkjwc3VtcKJoC?=
 =?us-ascii?Q?sXmW2e7+QIgyVhilaEcWT7wgUS5NfHZX+SpsFa1OCDiXxizlMLa5uu3hD0MM?=
 =?us-ascii?Q?Jbnx+P80qHMdgaCeH387QXSgrG/VQLD17H6fqy9gHQqiUDGmLxj3mV5wK2yY?=
 =?us-ascii?Q?rboXMzCKffnp/dwfGIWjlShiEd/Oj4B3ddlRG8iV+NBAU+E4eW9KkpzDk9vA?=
 =?us-ascii?Q?Z4Yi1DqMbx4XIJRZP3YlJAAP8zGamfvLyo4RJ3spnWQ0h+CvYw/RslTif9K9?=
 =?us-ascii?Q?zoQQ+rzbC3/bf5h3zcQBWiwJcwTJYbotHTUhznPSRgKW+f8971jghRFkwcoF?=
 =?us-ascii?Q?uGJEKiy1WXh1FyG7uxgvMxxV8xS5+nMayVTOwkdunpIYgNXgSRGzmb2EJGPi?=
 =?us-ascii?Q?e8c0uBpJdUKUZlipWXNUyr02e41Fii85NQXNmIG5ydNUN2nGKVNTd+TKnWVu?=
 =?us-ascii?Q?2pdUw2CK+Ggm1ATYmkS6h8wWCxebcEa4Upp+1opZONUknePJveLm57OTRnzz?=
 =?us-ascii?Q?ykhGEr1maupo87xuA3KQFNIP1a5ouusJbVFzPnYr0TvNdPh5MweGtUo4dZ/s?=
 =?us-ascii?Q?FHJAosyT7QFSMdWuDG6GvYUp4dZKPErhQYbXBeukjJEzrubhtaV73NN2LgMu?=
 =?us-ascii?Q?WnDlYU5hjWchiKfHO5Bf+vr1FEqVL3dGQgnCgPxlLA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR18MB5635.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OtqWDLHvmOeu6WinQWw38WJsmlMYPpFWhHkFU8Wkx/cPa78ce9emG6Uof9h2?=
 =?us-ascii?Q?secIdO/UHMm+d4NPKw24BuZwm6ENCYfNEGuayzBBJsPpHeVMity4wEs+DSHw?=
 =?us-ascii?Q?tGbj6kD+Eo5WIoqrS/VewCwiTjo40sXOxd7JxG0KQHT50YrODl3bs6qWKZJ4?=
 =?us-ascii?Q?jBlynJ1To+6Ud4Q+Sx19hwg8ovCqBeS3EcVQ9zyhrL2zYG71eVw/3DShu5oi?=
 =?us-ascii?Q?0V14dDCYYhj35x6eUabYhoIjTotFj1+SjfM/GPgSZu6EkOdDp8acJr8JPPlS?=
 =?us-ascii?Q?kXuJ4MiupRJJpyhlz0oFmPR4DIVqrE9w8cAsfuNBAH/FN1kuRzaz0zeN2tJw?=
 =?us-ascii?Q?UIrGcNuZ59pjFShEwhpgKm+OhatN0Igvrj4nbcm2EjYQScWTL13sIFzERoXP?=
 =?us-ascii?Q?IKySXXFoQf6+kIVbDiRg5xjtvYCIuThGkUNVnaf4DTg+pUUVLYk/elBvgw4V?=
 =?us-ascii?Q?05rRUUgNPMw+/caBYWqwevg9A+ZKMWhDeyCMa+Au29DO53FCl++QC1v7/XvU?=
 =?us-ascii?Q?kOvv/8mn8wepVophwy2zjfir5yKFR7Ki7CsoFHaWk6w2ZqZJhCKcVCXUrlPP?=
 =?us-ascii?Q?pD2opyUM8EmKHNoKBDjaF2WmJqqvSBILwj1TIZ+LVuT62kE9YDQfrem7UT96?=
 =?us-ascii?Q?0JZIfb4StBWv+WPMgvlPBzpuOVPbrLu928kPWw5iyGwW66bViXD/56Rl/AEX?=
 =?us-ascii?Q?1/kwSyeM4DlkEOvzbN//rSNEqlbyBvH8WX3ldYp9kpYs8+aOpQoQPJ3VxmVq?=
 =?us-ascii?Q?r6QrIzaUCI2jDJFXXRlDJRm1y6SsheH2bGx0wF1uDeV7xnN0YDQYsNbGQJVo?=
 =?us-ascii?Q?6pGbEl5RPcOVOiB40uoiQ+LCtslvJQbj8xL9lDMm9/n+w2XM0QKuaKGBR9xX?=
 =?us-ascii?Q?FdlcRYCoQ2meSWTRIvdsoi+3Xna9tRFW8p7Ol/ljThnSI7EsSoIp6LbhZHjo?=
 =?us-ascii?Q?zHCfzkq7vZvjdIi56cuOkudsj9ZEunJhzAf+dBmL7g5i1vKEB3m8CTLN23xE?=
 =?us-ascii?Q?rSATIG10nB1nzLKAGqfr4psLvkvHHkdDwrRCsxNFpCtXxHLl12DQ2nQnTqCJ?=
 =?us-ascii?Q?hZ07FcnHDr/nePUDqoBbSlbOezXc0cIOjm9sCOn6wsAvqtd1qu22onMWeMqP?=
 =?us-ascii?Q?BLM+q6Byxj4RlI5QQv0fPHaKIhzuSeQkrEwm5IyKVtowjHRrxmYgsm1BBDEZ?=
 =?us-ascii?Q?I78B5HyH99Qd6MPZyHlK9WxPM1ZeYbMP5I+KqdNfCl7pWWxxCVfYRyIpYWHC?=
 =?us-ascii?Q?Bphl2noCz1cSKIGWXDOhauewBC2CbzAPsFylO6TZUkr3R/QOIMrB4x9TgZi7?=
 =?us-ascii?Q?KvYezNTXfkibDaWgB5MpYCAoCUqlBKXXhwEkQj033arVMm23MnARL0a1er5w?=
 =?us-ascii?Q?l1onAdTAsqgDgbVwvjAkr0Y0jg+AAzLgxbqJZE9Q6n78RwDowU2Wx6pMpOWz?=
 =?us-ascii?Q?IZFrfN4rnKj1p8ziEXHnCbVxYqaHq7XrHqEs8GWbLIEvJSV36cDqKcragozJ?=
 =?us-ascii?Q?kNKKU2qgrwFXItFcPtW7/T+dogO8WPDhpbRzu/gsIDCIjJHeHnreShaVWML1?=
 =?us-ascii?Q?8GXSsSUtDGMj0pRWZtNfTOKeHGxgdfn6R8kqzRMN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR18MB5635.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af53512-8ba3-417b-ec5c-08dc7af2d3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 06:37:33.1827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vwpzcNVe63D/ffabvkHVK0T631maRK88kJifwN8ouG2t242n1TXrPOjCWP+7i4z7laPmH9g14fhvjvcl2OWY5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR18MB5321
X-Proofpoint-GUID: CJdiefFpDjG28jEMg_HFLDZOUAnFYFIo
X-Proofpoint-ORIG-GUID: CJdiefFpDjG28jEMg_HFLDZOUAnFYFIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_03,2024-05-22_01,2024-05-17_01


> -----Original Message-----
> From: Lars Kellogg-Stedman <lars@oddbit.com>
> Sent: Tuesday, May 21, 2024 11:27 PM
> To: Naveen Mamindlapalli <naveenm@marvell.com>
> Cc: netdev@vger.kernel.org; linux-hams@vger.kernel.org
> Subject: Re: [PATCH v2] ax25: Fix refcount imbalance on inbound
> connections
>=20
> On Tue, May 21, 2024 at 05:21:40PM GMT, Naveen Mamindlapalli wrote:
> > > socket *newsock,
> > >  	DEFINE_WAIT(wait);
> > >  	struct sock *sk;
> > >  	int err =3D 0;
> > > +	ax25_cb *ax25;
> > > +	ax25_dev *ax25_dev;
> >
> > nit: Please follow reverse Christmas tree.
>=20
> That is a new phrase for me; I had to look it up. Do you mean this:
>=20
>         DEFINE_WAIT(wait);
>         struct sock *sk;
>         int err =3D 0;
> +	      ax25_dev *ax25_dev;
> +	      ax25_cb *ax25;
>=20
> Or should I apply this to the entire block of variable declarations, like=
 this:
>=20
>         struct sk_buff *skb;
>         struct sock *newsk;
> +       ax25_dev *ax25_dev;
>         DEFINE_WAIT(wait);
>         struct sock *sk;
> +       ax25_cb *ax25;
>         int err =3D 0;

Yes, apply reverse xmas tree order to entire block.

Thanks,
Naveen

>=20
> Thanks,
>=20
> --
> Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-
> 3A__blog.oddbit.com_&d=3DDwIBAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DTwreqwV6
> mQ8K9wIpqwFO8yjikO_w1jUOe2MzChg4Rmg&m=3DFtlS2pOuM2TyZSjXUe6s5L7w
> o2YtvcK9Ep3HQRqf8dMeSy9VLui3rMQDUcVMFLcK&s=3D0fvO6BKSQQg3niGImy4
> VLvjVZ0kOAeAjIB2WwdZNYRs&e=3D                 | N1LKS

