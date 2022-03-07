Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7D64CFCA9
	for <lists+linux-hams@lfdr.de>; Mon,  7 Mar 2022 12:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbiCGLYs (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 7 Mar 2022 06:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242005AbiCGLYh (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 7 Mar 2022 06:24:37 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D8E3EB9E
        for <linux-hams@vger.kernel.org>; Mon,  7 Mar 2022 02:52:56 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2278oCVg009193;
        Mon, 7 Mar 2022 10:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ojj6kRvLIiRoxI+3o9EiIVYdgyRDmuQR6OwytSX5f5g=;
 b=DVpmdElQlTBzFxhSprnnXVyHGdmcqFHECSsNbQvRMcW2APIYBq4hEVYTDQKGp+ROHkrG
 9655aNZ1BdwRQIsAZS7FekqmM3CbL7YY+G3COtIeyTlsra4nl+C0NntwAB389B7n7SYe
 wG8t2ULaGCOeAWGFlToxeYvp7BJrH5Zbvtjy071hYLIJqsKHtiR/jhgUuZVxOBlCm/Dv
 4edVJSfSfGzs48QrekzumPH+cHSCApwbY0HRQiW2i0QdRymydNu4uzNXTis7vjpiUkdg
 1fw3lktvwk3bkju0ugB3zcLHyHcYteXbZU8ji+3aRn+0W7+u/+TgYxNb50cCtbRDJjxI HA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekxf0kfpt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 10:52:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227Ap6AY192343;
        Mon, 7 Mar 2022 10:52:42 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
        by aserp3020.oracle.com with ESMTP id 3ekyp10g7b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 10:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/OWKu58+pAlyoYb9IChhWBLJjHZrCBiQ7B8NHPZVw8D3Cv/+7agQskBz/QDVYpXSZq3J5zWo8I/kegQi13JlUQuedNRVniXq3zLnvNInL1vyARLjj/O3SCSy5NRuUl6jO0dCIA6qK5oSCa36A2b60CpFoaqtaibmz77q2U1DhSbkDBnHs9sRQKWH9/0jqd7MAbJ8R+f67TbPGnO4CoaoqlPVcvJ80LLSEjd+W5NeCJhLEJDjJcAY7zpQTuFH1lfOb7Jw9w1Lkx5fc7CYjGmE1vUxpwyFix/bDiFeeTlYYHzVLu6v2PReuvKYCqeKqYXlIOzusppCP8bBILctYYj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojj6kRvLIiRoxI+3o9EiIVYdgyRDmuQR6OwytSX5f5g=;
 b=Gcaa3sHIKR1m+6dD8Jvw/3lNc1OL8TCjxThcCMd2BEHaWTvvOvLpZCOFFSFa5weI8vd/7L/4jSyf7zyeOc3bmIaPl5JhEisjepsp0PMAk5ibfcckdkcH116C/UL4uIJUxppDywC4trmpdDb2tz/reRA33RKeujBVi3XWzCUvCL/4wbIDnWm5AwSGfDYwrHU6jsu5y15ULqowSEqL+mlQcIoM6J3J0ULR6dDUYmAAUpEO3gDogjJxrj5hhl3twAA/CRbyKtptMOsiq/kCdUZctlNFuzaQF+O9iHSOorkDy+dSmXu8VKanzRvpZ+InPYiUoNDNVNdSyzecC/OYQjtFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojj6kRvLIiRoxI+3o9EiIVYdgyRDmuQR6OwytSX5f5g=;
 b=I05nNv1ICYzHtCDqS9nkrFEXuTK/+misZBSL2sJvZBLj5HpBWXZAEbaeo3Alk2x0O4l1qz9fUOI7xsnAwrWkqArdCaosNL6M9fVk38VZ/ikmVSG5AyCoANX1fnsJ94b5H5dcuve32jqo6NvdDhuy0pzqVjHDXqBytuS/+bKdV7g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR1001MB2210.namprd10.prod.outlook.com
 (2603:10b6:405:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 10:52:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 10:52:39 +0000
Date:   Mon, 7 Mar 2022 13:52:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Thomas Osterried <thomas@osterried.de>
Cc:     Roland Schwarz <roland.schwarz@blackspace.at>,
        linux-hams@vger.kernel.org
Subject: Re: Kernel freeze on killall kissattach
Message-ID: <20220307105225.GB3293@kadam>
References: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
 <YiUE9XaViss5I2HR@x-berg.in-berlin.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiUE9XaViss5I2HR@x-berg.in-berlin.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76b9da55-8d0f-4c2b-4488-08da00289889
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2210:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB221012751262D7759F9CE9678E089@BN6PR1001MB2210.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cm0uodexd29yOr2hPci22mlHyRRyICyHzRu8HVT218b+GZVVmLXkEG4eU8YoYV3JHr9tb4ACvwZAycNC2rK8hUYhGrdDCrHRj7i9VZarT+PnquhRTItLpdAqWGnJmbzUQdTkWYq+1Zh0EGfj0VX05W3/XT6hw6OGM6ZJodDLk4Xl6zfkyDpl5QzMwqXdtztmmMCvLIaXLEWM4up+Px6DpwhlbsRToeyy7V8x+HpiqFGNIBpv9A/Tfo3Is7bxbnkOtltNHXSOJKWMxP7eR+bednV5nm2hWZJgLwGtsnxdeInJXiQ9fxcUtEFVyzaIfzuoTReE+QBzfOvsAkVO9arJeMxXCJ/QCvpoyJ7lAEv+c9yA2fC4SD3hNbSMZQasovpJHASP++rFxYExJrN1GvJ8CJ4xyuj4zFjvNM/RDuHBqxYxMT2oW5YSh6jgrdGdaOsgWT8X/hVwGhdJEbf0cgYG91LInlwROSusnJ6amJpYoMlkHCF1aSOMEpoBNnnBuyRxeRIoRdub9HBoWy43YJHvWzwC+9qhD4XfFPCcLjJSnTl5+U6gyp/Dj6MOMb9Sn7uqEMoBsUF1FGSwQ1f6XZk7vK58A6IA31VBfGtirdNirahcnjJnFERJctzU7hFYLSKb6UZqyMC7Kq0icHBlErkLllufrvR3qyJySzP2TVyMY7ghAYANjeSzYmumhBEw3BonYtqaMtsVt+ZWkrs0ybF09A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(33716001)(26005)(186003)(2906002)(1076003)(44832011)(558084003)(33656002)(316002)(5660300002)(6916009)(6512007)(6486002)(9686003)(8936002)(38350700002)(508600001)(6506007)(86362001)(66946007)(66476007)(52116002)(4326008)(66556008)(8676002)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cmNtoJJdhjEo44sWUEkhwiCDXtSjVcBX2NuMnju6sO55OUnNQTPwrXziYvak?=
 =?us-ascii?Q?weAMpc0hsuvdq0P0WJBQg0zclnR5k+77IxDu1ZTit+NO7aiMJ3k606K/1TcD?=
 =?us-ascii?Q?h/FKbJO1hQ6MuQUROtEC/MiHtRUhnaAF09OroW2ny0IcpovjUEIL95qZ79Il?=
 =?us-ascii?Q?99YdVqcanySERB0NvL0BGu3NwNu4bHxwLQbL45vOEODCR0Om9f9yB02QvdxL?=
 =?us-ascii?Q?QXR0plJN+q3VbDEfGyR//64u65GLyHjO5UjAd4DRP1ZZ5ozKE3rlTyjNXbZx?=
 =?us-ascii?Q?jKvO8rzRL7C7ATUTNT3c1Zrz/CpQAvOln4qC3MQ9jUUqpPbSrOYABl4X8sSf?=
 =?us-ascii?Q?q1lYQjqsKj/zzcjMS9g7SsXb9FNCnxikQ0AV0IoKWIdJQ4eUFoH/85o9KWnF?=
 =?us-ascii?Q?o3+hxLqeEMlvA/v2dHjod4Vw8i+ImsfLibZJpQkvQ6+tUMG9iizbnAMWXPac?=
 =?us-ascii?Q?iFRykEyhdADa01C9RBB5KKqBpDMaTJ3PXjrbm1qTSFIpn5AYXjmZmRapSpUi?=
 =?us-ascii?Q?tJ0TUfhYBJ5HXcKMXEfgsK/iD3K7JFF3oul/owjFL0w64QOADN3oyJ0WuFp3?=
 =?us-ascii?Q?42JnGAvGvhitbKINx14jPyacba/er8Kzp9SHKitiDQCkPNXtqeQlaNA1XrA2?=
 =?us-ascii?Q?2PjPpq1JNlCm0KvjTn1WIKxbYd/pJrqZlq7tSAvgbpUxA3lMD8tzlWNf5GPv?=
 =?us-ascii?Q?ooZTZmiJy/3zewOs7GvdpYAX+YTPfdhG9I/E02Tu2qVlWaK3J3PPjNJQYtHF?=
 =?us-ascii?Q?hiGAEWRbWZm1Cwjvb69WWU5i8wHpta4F+taf+6IL+Ml8fTbv2DlOYPFWFxJM?=
 =?us-ascii?Q?EK8QU+xYJRc99xdiYbw+7LmgpOvwnxZMTfJi1KhKVQqUeniPZwAEOTwS/Szg?=
 =?us-ascii?Q?Jd5LTYqKdeQG7SZSHPZUx8U9Qzs66qn/PVYzL72HLYqPcpPWMr4wwFx66S5+?=
 =?us-ascii?Q?3b0+aaiUt+tkNlHOSzhmmeMwPR330/p2qofFC51GpsB4eCdEK6r5+aF4gBGg?=
 =?us-ascii?Q?i3APKUTjdrDPr4Q7AdrwomytkDrNQAlT5meVX9wnKv7QdsjMAzHCM8nmfVQK?=
 =?us-ascii?Q?/zb1YeTT1wXut0aTJklvtsxeqQpkW7CUxi81Bjh1U6NVaO6/U/qc7gRGAokm?=
 =?us-ascii?Q?6Gs3vuEV8TNPyHOrAjqb+8H7hKSgVUWgPkNpin+iZ0KpP1BlGLya/vBnkw2Z?=
 =?us-ascii?Q?gi9j3qvxmkjl6Xo+cAFrHD+K+YGNo/O58pcyI7beCpxNRSiKud/tgcSAOhUk?=
 =?us-ascii?Q?AaFxjnMg2hKTIN36pWhl1zW8ucZz9akMtHBHm9SPPBWItwhHZ7vLZcGkcXMX?=
 =?us-ascii?Q?qhWbHGjbj2iw7008tT4b82FHtPOR8YQdd6pnmG4OOmw+cL5fls5qepVIQa3Q?=
 =?us-ascii?Q?G2KIea2KNCK7X9kR0eN4+T2E+Z9RXObuxrTfuk6Ut7FGavKH+FkHisx9mpDB?=
 =?us-ascii?Q?lc+H5AXnGwIQMeaavX0zsa5pvgygqp9DAgHgv2S9E1HPZq+N19g1DVWmwBCs?=
 =?us-ascii?Q?72A5+2mmcCrBCIdc0vglfnVeC7rAusjOFeS8H+E+3+pgeTEi4cxthCLxSNPa?=
 =?us-ascii?Q?4NPgRe+He/vFnMiWZKfjZ7mQtzndDJsU1snrPcPIjcV02InJs5+W64Qkh0pV?=
 =?us-ascii?Q?pdBixxZgmcax5vPinRNW2Q1WUu6oumkcoaDonC+Mmti2A/Gx+ePO5Anyx1c6?=
 =?us-ascii?Q?PlitYQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b9da55-8d0f-4c2b-4488-08da00289889
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 10:52:38.9483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrWE2DXNZCcJ4mzhBRtT4AbpnzurbKSzMQ4VUb1BsFDviuqKGIjol+rC5IAkYcFzovLvkNtJfEq16B6tcLbC7EjEk15jl6qBS5gdsw9FuWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2210
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=776 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070062
X-Proofpoint-ORIG-GUID: DbqwrFUoypvSoo_5Kxcex1wW3AmBpj7v
X-Proofpoint-GUID: DbqwrFUoypvSoo_5Kxcex1wW3AmBpj7v
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This email is very useful but none of the correct people are CC'd.  :/
Please resend it with the following people CC list.

Hanjie Wu <nagi@zju.edu.cn>
Lin Ma <linma@zju.edu.cn>
David S. Miller <davem@davemloft.net>
netdev@vger.kernel.org

regards,
dan carpenter

