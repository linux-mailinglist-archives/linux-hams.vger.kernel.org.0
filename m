Return-Path: <linux-hams+bounces-290-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100C8CB2DD
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 19:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80DEE1F25075
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 17:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA03F14830D;
	Tue, 21 May 2024 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="m/Y3zWWh"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDB217758;
	Tue, 21 May 2024 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716312110; cv=fail; b=dPTEvpypoIO2/mFC/NQpeY0Ud3zkQGec6K4j7vrRatkjAC8igWsCvMxvvDWBaL5L71TvS9PcU46TzIAOHcN7k+YZJUO0/+E1LhBRafJ2cRTxKxwz0FggEz/NuUIuu52rDB6fowDCClEm7tBt/s6XILnBbW8nJSzVadwxYUhy3To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716312110; c=relaxed/simple;
	bh=fenr+niHg90H3BAl+pOQyztGlrYxVIH5HsFBw0m9IHM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NB0xLBe69Iim9EamoE4DepJfLNv5FK8ah91rjhWgh0IDGkUiuHW7aCuxReKBzLDErxdUd8BV5pNYb2RIIKbXCnYyKl712IzDcg8VHXpk1Lly9V9mFAc7iI0OBxerBB2SRHb3ParNshLXhY0ilX/TT16h3AoYPT5WfcM3LPTnDhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=m/Y3zWWh; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LBUWTS001927;
	Tue, 21 May 2024 10:21:46 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3y8tsqh83s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 10:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+J67bmbEQcwhRoHay+xXpNPEjdOAA9d86H+PPYmoAk2GGQ3ZrzL+VYmsm59b/ntXiHYIlYoxLT+bYw3YJWUjosuU+wR7bM4MKDcr2DyJxvCKbE5/3dYnhjAYl9aq0X/txqQ0YhxrWSIPvqHbn53AvAVrCsOKj8wl6Q2r4bdE+hL2mAEe4Den+1Jz8iyK9ff9GkMN9S+Sl5SJr0Ticm9h+lSbEzDD8uo79S84fECUhSs2KIWWF3gPS00Jz8teCXpW75tMeUBW+99UYO9HAc0ZPtFqREOfvBJ0DSu8mXG16Pl9ioxVrH465yHkFmho80bn/MmYuZvtgXV5ZV4kfP8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HHyVghrSpyBFbT4B675xD93O1sKm83qkpSbbGG+Ac0=;
 b=fDb7tV5V4nnzHgHu0Kk6nBb66dbM/89zv2mvRnDfrzJNbzv52RycX90nhy9otfkpls8HsSP9zuFP3lTY3zkWyR8bQTSQJMIlGjxnsp1EAAzMv038DoVE6iibbkAkTqYPvHzQpj4UPpFnZ236AxNhZYkyM4936MuKg4dA8huGgORnTvN8En0mXvRjj17O5b0WA+6vcAsKzXxxCzceMandJ9iMSvXKptNfGA+24RHhko7/lr+X7csGvjmuIdSR/NL0k4UJF7ptypiriryp72o6p4o8XND4MN4qyx9Ezi+VHCa3jFFaYlSI8MwufxIUqNCQtrzPJ5NFxeo3oM51ZxlGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HHyVghrSpyBFbT4B675xD93O1sKm83qkpSbbGG+Ac0=;
 b=m/Y3zWWhfQ6eeayP2YcVh9NIt4N+cpooOpEVEhqYofglrhMxbushvtd8qLdns/q/AkgNWpPln/iYxPIexW8cq4eM2y1BE39maui0iinfnlr327pnkJTzPwGkn12RSQ8txdefFHY9iKG9O9WMBQEovqYiyE4Rf7z8dKqtv6XcSN4=
Received: from SJ2PR18MB5635.namprd18.prod.outlook.com (2603:10b6:a03:55a::21)
 by CH3PR18MB5795.namprd18.prod.outlook.com (2603:10b6:610:1b1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 21 May
 2024 17:21:41 +0000
Received: from SJ2PR18MB5635.namprd18.prod.outlook.com
 ([fe80::efe5:32a7:11a8:840d]) by SJ2PR18MB5635.namprd18.prod.outlook.com
 ([fe80::efe5:32a7:11a8:840d%7]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 17:21:40 +0000
From: Naveen Mamindlapalli <naveenm@marvell.com>
To: Lars Kellogg-Stedman <lars@oddbit.com>,
        "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>,
        "linux-hams@vger.kernel.org"
	<linux-hams@vger.kernel.org>
Subject: RE: [PATCH v2] ax25: Fix refcount imbalance on inbound connections
Thread-Topic: [PATCH v2] ax25: Fix refcount imbalance on inbound connections
Thread-Index: AQHaq6NYOD/IPmwsHkqqLMhwxszd5Q==
Date: Tue, 21 May 2024 17:21:40 +0000
Message-ID: 
 <SJ2PR18MB5635B7ADC7339BEDB79B183DA2EA2@SJ2PR18MB5635.namprd18.prod.outlook.com>
References: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
In-Reply-To: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR18MB5635:EE_|CH3PR18MB5795:EE_
x-ms-office365-filtering-correlation-id: 03812e11-7754-4735-db38-08dc79ba7a96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?C3UxIo2TiqmrOLYbMdK1+c9TuSbGzqGaYUV3iYj2v8TMgLLqVgdlye3BC1lT?=
 =?us-ascii?Q?wEHikIwmMFTMcWF8EK7GJZ5mJGD4Sb3Q8lqzFNVXSqjRmZeJ3hy1pOVNQEhY?=
 =?us-ascii?Q?2yWeiS2vmWbbF77vQ21L6RALKhZOy4BhWAY3GrhjT1eSQCZQ88+uxzJnP9fx?=
 =?us-ascii?Q?FtNo9INTxVuP8nFOTjTuE/RDLjN6V9SwwDquI3SyWObE3tZBYpe8/qdD9h4H?=
 =?us-ascii?Q?oNPr7MtjIFCzr8+9YOHNrlaQBSC+3SJP4Z9S0XGgA3Q6+gVHRD/NuzwfvVLa?=
 =?us-ascii?Q?6rR4p84uPdhgKrle1dZEpFjAb4NHjyxAP5y5i00KbAFw1DFq+E+an5q35yek?=
 =?us-ascii?Q?q9oJYb71fjoRdjZ1/dCiVsjbKMpCbwA2HDpo6DvyvBIXWL1A3WpVd3Xt8zSX?=
 =?us-ascii?Q?DVqvA8qirKcy2wSjZgRrcAoBvBw9RL9x3aBPe4/7AaDrtFvagNfMlS/AEb0k?=
 =?us-ascii?Q?X87z52iFWpnaZ6q8XTI67s+m2fohVoGUnWDqSFlV0j1pqZ+cRxf0rLVColNP?=
 =?us-ascii?Q?+sGS3hhMdu1i06k8npQY0VNVxoUNFQpD0fcttB6Pqeq5lshdGpRJqOiHN4ab?=
 =?us-ascii?Q?6Q/8HEEEQgY3FfOlzq2q5A+kgyZv6AwHsVZQHNEB0FvXftMq2bVwbOD5n4g3?=
 =?us-ascii?Q?laEi33/dtU4CIVvBp6P4waHlSB+YGfw39Xr9yFBLWjsEUBdaV+Q4l41f2kW6?=
 =?us-ascii?Q?cjFqpDxukdaapNPScvwIRT9QENtQP8/tHzOgjAA2+D318wDtLdPORKlJderI?=
 =?us-ascii?Q?YqIpEk1wRMrXYY2HFBRqXTer4mEoonPZCWTvEkFAFcr95Yx3o8jBbTZgUPAC?=
 =?us-ascii?Q?6nwsyvks890qKN6uiKZ0tJrZs7l5UUYr9DNgsVoUCwTQDzel+P3kw139SQ/7?=
 =?us-ascii?Q?B6PFlBTB7D0jqYPAhGTo3+yYVa8sj0PjMinmFw4wpGIaJCb3gxc+tOJruv29?=
 =?us-ascii?Q?TyurEz+c2ZYFD1fkMFqZU7Cv2lZT4D3QDrwVU7QmBy/g4jpCJmhcPq3DYVTI?=
 =?us-ascii?Q?r48/mQOUQyOPa1Tw3dgxBLgaBbme0c+KUZyH/fj+KUrx26XuSsagkqLtQ6Ox?=
 =?us-ascii?Q?dpAviC8OpXPQAhzr8qOK7fbb+HTetzhDkRI4R3w8znX3PSepIQ9jGOzXOVwC?=
 =?us-ascii?Q?DqBZ2MT+vrcCxgAab4XlBWbTl0XOVpQuWong2dFWh9m9tE+AWrl6xWpjLPJE?=
 =?us-ascii?Q?eeBeW7n+cl60B/QjAzkQ4Oqe7T8TvtgKc8DJvK8V5vzDxK0wBHm04iFexZEu?=
 =?us-ascii?Q?XcQtd2MrlYZVk/zM6MtILTYJgeu6yg5is1BUa2oAYw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR18MB5635.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gILjoFLbFEzv/6odurLWhb+AzMT/2/xyQxp5AKuCFURie31yClfzpdJXWRP4?=
 =?us-ascii?Q?/sT3c6iqJWJnCQBkAc3BIJN6QbAzwu5ERDeA7v4iywpvBqmlOtyJ9N45xZRu?=
 =?us-ascii?Q?V5gnJTWhWPSAizFixCrRX684aQRIPj0tEZlBE5PQ1w/Wvi8JakQn5OKi/Ws7?=
 =?us-ascii?Q?nbAdfnBKCuWI1Fa/1jLikTRNYUJMm2dWRWlHuSgNIdApuQhAStz3/X1gbkjf?=
 =?us-ascii?Q?Le2/qqk5J/M0YrmqmpNQCBjRIOzL4fFYH1OA+gI4cC/cwq4hdz5H9VmdRdhY?=
 =?us-ascii?Q?kiT+t9yvJoTVq3PQH30FgMXwlaOXb/E2F2P+Blzyaecj01Ck7LJL+IUoH1iB?=
 =?us-ascii?Q?32PZ7FT6PW6bc8/nlGTnv0kcGWO+TGeA+DkKCEgj2A9qEx5gE5HIBxSvOUuh?=
 =?us-ascii?Q?V4+fzJeH3hh6gRivasX7t/+XkMl/DdVO5tjrwZdgltZqcD5Lvp1mle170Qwu?=
 =?us-ascii?Q?FR4gpdM+3tY3x7tCNd0L7uU+a77T2nXTEglE0yVF0Nx1c/DO+lghWlKrzJge?=
 =?us-ascii?Q?xOxo7557Mgx/aNwCo/2ycHqXpmYBMygIatyjOSRCUye2tr0CWkqIrSvr8oCx?=
 =?us-ascii?Q?Pe8dk0U3509jI10P4Ymqmvm1BoOpHGrP+Ivz/xLkiwbYDAD+yR6dBBvfW54O?=
 =?us-ascii?Q?nY/op+sEhLKRHBiZANvZJVBARXc+wd9UGSpp7yHGWk67M1ZbyjTMyo0iKF5U?=
 =?us-ascii?Q?bUWmOJbNpQVAY5HTvMKz/Pv/V20uuZzmZNtrAKA7bd9t986+bjoEPNHuHxy4?=
 =?us-ascii?Q?2ylGDsn9B77dzvZshgsbqQ+WPOmqntXcffPj+4TPp5MeDFw/XY3XEHkLLZ2O?=
 =?us-ascii?Q?XRuYh2GrtujcN4UI5P2WC1uEaX2xCizxu2Du0TFMbjd9kdeUfGHaQX2dDw1O?=
 =?us-ascii?Q?TMcL7VMhhoRgiLVQU6eDJoZG4A5H98sG1RlpCcyxgxwUkVpZuSKecS9nYQcN?=
 =?us-ascii?Q?ZxibrCjw2l/pDy6mh2o/1c8fw2gpweB7DOCXug7pr2URix3mbDOmA+TvOeLZ?=
 =?us-ascii?Q?NHM4YOP8OBoS+P4FGIfG/cpnt922iZna9zThRV5jm3y2uR/ZzgvVU3FkQvCN?=
 =?us-ascii?Q?gs/s8mhpNtotevD1PaicOYX7phwbdSrDHfzqTKiZ6f89MGvtiJyC0Yf94SU0?=
 =?us-ascii?Q?6D3+RS8Q/+1+NRxcLeoU1XdOPnQldGuFWS86M+Q6n3zfQxQRrurXQt2NMb4u?=
 =?us-ascii?Q?8iRSp2u6OEAZ3xLJC9/tyCM41CNddLYtNt52bDEn29Vpb8xZSCZAIv2CN4fz?=
 =?us-ascii?Q?gfRqtmYcjxCR2rAU46UXKflK+5B+pwaW8+Wz3BJz37kJqWRbjwzNs0o00E8q?=
 =?us-ascii?Q?7XqEbUSIDUEJwfYDzKMltK9XeJTiBAgW8Z1LiJoxbnATnOBasSHkRd63vxKx?=
 =?us-ascii?Q?7IZ0D6PW68cKbyHeogR2DKlRTptL4LD8EsyMCfzu/v87AcbIy67ZgNigiLQ5?=
 =?us-ascii?Q?9OVWuT35yDDU3IAeIoLUOCN+AsYZ1kTjpcaW2lHgJxSVgSqXmeD7Pa3CzXtO?=
 =?us-ascii?Q?tE8BV0H/0wu/R9tsb/3FfJLUFUWYKuVr9DfgrhUCC/cwNBrNgtli+Wtn4qJT?=
 =?us-ascii?Q?U0gdygugfVKzNdlfiPgmsbeMW0jv8FA4CfQDgIm/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 03812e11-7754-4735-db38-08dc79ba7a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 17:21:40.6737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gngmHWb57lf7D+C3wiYPZ9gxkCvA8Ks+4bXUz56HqfPhEU0EkCA1do1Cff+SfiBJcUeF7dWBmXv+ZRV93Nw+rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5795
X-Proofpoint-GUID: tDRS4xxx_3coYiry6-TXnO099Heng8H6
X-Proofpoint-ORIG-GUID: tDRS4xxx_3coYiry6-TXnO099Heng8H6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01


> -----Original Message-----
> From: Lars Kellogg-Stedman <lars@oddbit.com>
> Sent: Tuesday, May 21, 2024 7:19 PM
> To: netdev@vger.kernel.org; linux-hams@vger.kernel.org
> Subject: [PATCH v2] ax25: Fix refcount imbalance on inbound
> connections
>=20
> The first version of this patch was posted only to the linux-hams mailing=
 list. It
> has been difficult to get the patch reviewed, but the patch has now been =
tested
> successfully by three people (that includes
> me) who have all verified that it prevents the crashes that were previous=
ly
> plaguing inbound ax.25 connections.
>=20
> Related discussions:
>=20
> - https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__marc.info_-3Fl-3=
Dlinux-
> 2Dhams-26m-3D171629285223248-26w-
> 3D2&d=3DDwIBAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DTwreqwV6mQ8K9wIpqwFO8y
> jikO_w1jUOe2MzChg4Rmg&m=3DT0z8LSTV_ukO1CjzoYF7lKkzfKSd1iQ3b4biO_v8e
> 0R8Llg9vHP8lSQ3tGo5sXr4&s=3D-
> MpoDvDpxv4ixHLeXbhPn1j9UnlUz6cJ29sdjMqsA6I&e=3D
> - https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__marc.info_-3Fl-3=
Dlinux-
> 2Dhams-26m-3D171270115728031-26w-
> 3D2&d=3DDwIBAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DTwreqwV6mQ8K9wIpqwFO8y
> jikO_w1jUOe2MzChg4Rmg&m=3DT0z8LSTV_ukO1CjzoYF7lKkzfKSd1iQ3b4biO_v8e
> 0R8Llg9vHP8lSQ3tGo5sXr4&s=3D3ZUXfkS5ChKuooKI5BBasvYQeJMH-
> FYqbeskhJKJdOI&e=3D
>=20
> >8------------------------------------------------------8<
>=20
> When releasing a socket in ax25_release(), we call netdev_put() to decrea=
se the
> refcount on the associated ax.25 device. However, the execution path for
> accepting an incoming connection never calls netdev_hold(). This imbalanc=
e
> leads to refcount errors, and ultimately to kernel crashes.
>=20
> A typical call trace for the above situation looks like this:
>=20
>     Call Trace:
>     <TASK>
>     ? show_regs+0x64/0x70
>     ? __warn+0x83/0x120
>     ? refcount_warn_saturate+0xb2/0x100
>     ? report_bug+0x158/0x190
>     ? prb_read_valid+0x20/0x30
>     ? handle_bug+0x3e/0x70
>     ? exc_invalid_op+0x1c/0x70
>     ? asm_exc_invalid_op+0x1f/0x30
>     ? refcount_warn_saturate+0xb2/0x100
>     ? refcount_warn_saturate+0xb2/0x100
>     ax25_release+0x2ad/0x360
>     __sock_release+0x35/0xa0
>     sock_close+0x19/0x20
>     [...]
>=20
> On reboot (or any attempt to remove the interface), the kernel gets stuck=
 in an
> infinite loop:
>=20
>     unregister_netdevice: waiting for ax0 to become free. Usage count =3D=
 0
>=20
> This patch corrects these issues by ensuring that we call netdev_hold() a=
nd
> ax25_dev_hold() for new connections in ax25_accept(), balancing the calls=
 to
> netdev_put() and ax25_dev_put() in ax25_release.
>=20
> Fixes: 7d8a3a477b
> Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
> ---
>  net/ax25/af_ax25.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c index
> 8077cf2ee44..ff921272d40 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -1381,6 +1381,8 @@ static int ax25_accept(struct socket *sock, struct
> socket *newsock,
>  	DEFINE_WAIT(wait);
>  	struct sock *sk;
>  	int err =3D 0;
> +	ax25_cb *ax25;
> +	ax25_dev *ax25_dev;

nit: Please follow reverse Christmas tree.

>=20
>  	if (sock->state !=3D SS_UNCONNECTED)
>  		return -EINVAL;
> @@ -1434,6 +1436,10 @@ static int ax25_accept(struct socket *sock, struct
> socket *newsock,
>  	kfree_skb(skb);
>  	sk_acceptq_removed(sk);
>  	newsock->state =3D SS_CONNECTED;
> +	ax25 =3D sk_to_ax25(newsk);
> +	ax25_dev =3D ax25->ax25_dev;
> +	netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
> +	ax25_dev_hold(ax25_dev);
>=20
>  out:
>  	release_sock(sk);
> --
> 2.45.1
>=20
> --
> Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-
> 3A__blog.oddbit.com_&d=3DDwIBAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DTwreqwV6
> mQ8K9wIpqwFO8yjikO_w1jUOe2MzChg4Rmg&m=3DT0z8LSTV_ukO1CjzoYF7lKkzf
> KSd1iQ3b4biO_v8e0R8Llg9vHP8lSQ3tGo5sXr4&s=3D8ug-soRMsh7y1vLY4tO8OSx-
> bKun8bXlZ7uAPiQnePU&e=3D                 | N1LKS


