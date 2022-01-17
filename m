Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0DB4909CA
	for <lists+linux-hams@lfdr.de>; Mon, 17 Jan 2022 14:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiAQNvg (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 17 Jan 2022 08:51:36 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40520 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234809AbiAQNvf (ORCPT
        <rfc822;linux-hams@vger.kernel.org>);
        Mon, 17 Jan 2022 08:51:35 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H9T69b018170;
        Mon, 17 Jan 2022 13:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=2pFlVIYH/bPVlmHR6HMIOhb7ebkCeRaAaPg1GGq5Dw8=;
 b=FjBsyIOTDL5yuZGFwLPVhwn6AXiD33tCpbFMURd55Wn9/zy/G42o60GKZS1jyjx+8Fr9
 F0ojtSY6LTydrZ7k9COCMdfrDaRzpPj0CFJzQ1X45mZ0eb3S26Tzhge6R3pWj3GPwFGf
 yenaOzXi8XGBXhVNHcb4+Alap5E3yZgVwvQ+LcyrDQ8/gQjw/WNWrNH0dOyAg8OaMxnJ
 YIhD/cfJNxKJrbEtYc0yQju+30PgC5sooYmdHfskLU+DkhP+tMBadASUw+pAIojaNQQN
 TAv2JnAmryH/Bq4vvmiTiknRnopbgmBkW+cpt7q+yIm6jnbdHrJWcS9mqVSvlYHmZ6Lc QA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dkmv23f0j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 Jan 2022 13:51:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20HDjwH3099092;
        Mon, 17 Jan 2022 13:51:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
        by userp3020.oracle.com with ESMTP id 3dkqqksbka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 Jan 2022 13:51:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EguPZibM3WjhOdU77Kh+KKi2NCiOPvWxtTU9izUHe237JXZRiEXHqx08WCnVIEC3tkVcdB4CFfJeIsGCo0hj0HHJpm7fxREUz7/FMV2hX+wNKIvMO2dkkhbgGWCHC+Y8cOVM9AxHSWG0fJJ0LNEQrESnuuC8lOlH1juZueD+YekBwO0GAggG12k4QRfgj0Tfxy8bERKPvo1OISGYVZpxsft1nJboL2MtZyPB2V/vg48FJY6KiWKrGV/CEU1QuC67ETVBClZF6PdJfQ++Egg95f2RnDIfxh53X3CcWMWiIt+36xTE3SEm8KTR1f0eQc449SISw8CtpWHJRCe/4Tswuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pFlVIYH/bPVlmHR6HMIOhb7ebkCeRaAaPg1GGq5Dw8=;
 b=AuODnBiYRkwFu50BtQfBNmMK6/x94nSnTi6FRiu12Yn1v6kI3TUqrXD9X36Ffzy1nIoZQDEdlkOHMBbtTX+5pSwoZnvx62GSA6uaDb09VTAsgT09X+GV9p85NxyEImJ7Pe7m+eYpflhFDt2KzW71YdVfIYmGruKPt/9ernA+V8aNLvqamQv/iqq+ANhtzrzpneR3slqEOJZM73ljFGNzLwBqfhTPQWtRuMDIYP+Zaa1kLSwzQ+DX2Y8/CMMTQnGl3yAJsM7pg0S2BuldRgUB2J9HqenU+WQDDRkJFG1fSH/qJnOkSEGiFU2Vl7yAeQX/qbNcJfyuYe8aFKMlxsPGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pFlVIYH/bPVlmHR6HMIOhb7ebkCeRaAaPg1GGq5Dw8=;
 b=cGZ4jxAyW1TTBW1bKjDKOz316RzCKDXWIWmcocfW+HSFng8SrKNSofMaKm+XaLhrxE/0z54ixF06RhPSlfmmhHoI1ZCkH0mqt/3R1sacD2MQbS8kEnYb+Z6Vglakq5XiXBjgtEbXmBufDc3qDZAVFt2Q6kbQDHwLziJ232bkwzQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN7PR10MB2483.namprd10.prod.outlook.com
 (2603:10b6:406:cd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 13:51:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%5]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 13:51:26 +0000
Date:   Mon, 17 Jan 2022 16:51:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Roland Schwarz <roland.schwarz@blackspace.at>
Cc:     linux-hams@vger.kernel.org
Subject: Re: SIOCGIFCONF and AF_AX25
Message-ID: <20220117135106.GG1951@kadam>
References: <bdf30a4d-4ffa-9228-8cfd-74c52f8bdb40@blackspace.at>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdf30a4d-4ffa-9228-8cfd-74c52f8bdb40@blackspace.at>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0010.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::15)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3365396-e4c7-4c33-1cea-08d9d9c074ae
X-MS-TrafficTypeDiagnostic: BN7PR10MB2483:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB24836834C9DCA69D52EA4D5F8E579@BN7PR10MB2483.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzvOhwOwSMk4n/WRsUGr73Na+BDPb88JnCSMrLNNmL3DvG7asD8dFeULE/KMjHCjq0aZg4KHFvTWVeZpSbjsr26MgFzmlSbu/Z3lmjvBDTHSsSW9PbtPYQLHfgvCS9MOEOATvBr8Xpsa+iGn+QSaWKwxI/KbtUNNQQH+Tbvkc3oNkdjqPcQpvDLZqzImJCS5iVHrl69BthJoyfRsIA01901qKGlZunLjkRtXWSFIPed6j+Z9PQ1/iJhPfDmLXtw38sPptV3Pc2hDqLKYhPj9Qm4IfV6ZTbpeoT9TxNkPTzTJTNNqW0xbd73qqO23CDeTE7hmo44hPei2ze8H10Ylc9TWKRFvnIxMY8udS1brp1FF98Vk8MRRRgVA1Iwcz+fXdiNbLH7Sj3aTuQUFQAB7lGQKfltWIuL7iixaly9sYUOFubJNtvMidH5MAyZNNS5ZPjYzNKXvzY4fUtbxTzRaPURjRwokKCRqZ07yoki5wqJDSrdAerVVPM1swaI7Ky6GcKjxzNlYiBY7buo73eTOQsT6RstIhffK4Qr8OIYn3GPM02w0Ylj6PKjtRt5XA9H8Cr38G4Q8Tq08SeLu+4pMjNAf1bnQcyDzS1eLiqBUj7FVY2/nehBUmFQfIyrU0e3hS678oV85nFshsgzotwR18NF6CT8hsILSA5H+4K2ERcT60yfIHLmPgN3imH8VkSNJbzcqWKHiQ2VPCN19elG16g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(5660300002)(26005)(186003)(33656002)(86362001)(6916009)(66476007)(66556008)(44832011)(8676002)(52116002)(6506007)(66946007)(6666004)(7116003)(8936002)(6486002)(316002)(4744005)(6512007)(9686003)(83380400001)(2906002)(38350700002)(38100700002)(508600001)(4326008)(1076003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VHwOJ2vL7fsWQlhXPXeWNYQ/i87s5AyvSUoy87UxLrO7ww/MsjxX0Yu5cKuS?=
 =?us-ascii?Q?gN1wiSn76wezJlu3HTrRVTpS8hVgkxvAew/1jakE2fBdAVFkQkjDKcuivm+Q?=
 =?us-ascii?Q?KqC7Mv53ngbDFupsx38/dpKgBNbscAP5wee1hvsAv6EJTj18H8xpE5/8zs7R?=
 =?us-ascii?Q?q6cEodJd+4GmbacfWsuvA16fL2MZGNwrBQkUcXWe2O0M7EqxmkOF/8Sy8rvd?=
 =?us-ascii?Q?guspJDj2NtBBfXF+zjB6+79uMc34ehkw+11M8Wf70pxcUXgkHjh2P/Tkw8Aj?=
 =?us-ascii?Q?x3EaFeLLV41yfkU/at7FYvXU7RKk58OKAGeMUDtLBuQxKTHkhT25VNVaFY0b?=
 =?us-ascii?Q?EH1X+KtPX7lOqQCbs25Mg5aLhA/fevs/RpaWuS5lqOrlqHtYAJ1BOkicfj9N?=
 =?us-ascii?Q?Nmjtq4QUUPj0kKxoQab1htDZdC/Th7ZXIl4x5hsgwC2wP/KdGk9bI9wVeDYj?=
 =?us-ascii?Q?2CvpDHf9fLxYyiIRYHEfGiIYC1PNP7PDcmE8b/rCYqLn7wlx/FyyxSp35ORn?=
 =?us-ascii?Q?HgTBKRWi79VK4bQ2pJSeqI1WIbldrJmn7n7PjJ8txGv+qWzCz5BbTMtFgN29?=
 =?us-ascii?Q?IkmVSOlUh3gl9VpkziWaTRuY1rX/8ZnHXdBXbBAsC49nfJGerzq4ETyAGMYa?=
 =?us-ascii?Q?RGcjv7gTzi+asxU8ZuUku59JbtvQepWKYrNBENq/EsqXyD/kIYqqpZA8BcUO?=
 =?us-ascii?Q?go/rVT3iy/Arr7B47D5XWSJcdF63VJbVoZSBQFwY9VcNzqGQ4GM77cA3+wVv?=
 =?us-ascii?Q?DKNge1uv9EOuSuYDApVtLv6rNFi9d7W+Y/ghAGrFE+vSuSY357Dzi6FwEXbE?=
 =?us-ascii?Q?PRsabDiwh9TbRPjqktLHh3afbp+99IreONyFp7S8MGFiOKOcH7b+B86JlAZh?=
 =?us-ascii?Q?e6jT8QX+y8ibz9Sk+aXQktnJn73fBH0hsh1rZQ9v+J+EjD3bXEk1P770qPvM?=
 =?us-ascii?Q?qbypfNZG6sclEoaGb6/xNhNC69HttAgzpM0tOV2LBGMSYvv7akG7Q/fnkEJ2?=
 =?us-ascii?Q?czfUfraSo9POoyIw78Erm82DFPa5v5x6YjtulXlpwKdEJlgnWOd68vT1q0oN?=
 =?us-ascii?Q?x/fudABxUoql7ZAz0TlHZpRTYEEEBpf22F31mM4ymda1N2M+nlDU4TRWYzQi?=
 =?us-ascii?Q?ou+lusoKMSmjQAeWryUsWFgjcnKfGp9T2/W5PXlKowSG2h3udLdtNRcN35KZ?=
 =?us-ascii?Q?KajVfoZpTK9r9K1iseIdM9r3PURSbye4DR/Rm0zTH8OVAJoTVJI0T5jcJKYh?=
 =?us-ascii?Q?Fktn1LS/hz+pOy5s94wzJ/WC5LrRoqUT76GyOSzFU2efOxn9xSxipz1CxGl+?=
 =?us-ascii?Q?F8pW9jsbi/57fnBfmNz5AUqyOWsY02aMz+O41Qluo2SO5cBNUAw3wm00ID3d?=
 =?us-ascii?Q?zuG3vkN7tSG2Z2viP9lmTNF7SVTIzEMmmt2rkHJfehCAB2WKhxP87r9LrsNh?=
 =?us-ascii?Q?SvSUEUEeFtqeVMlnRi8Egoc6+EMrpevVkI9iwjAzeNmotTV586HqZALB8nrC?=
 =?us-ascii?Q?qeeQMByM0icy9ke3Z9I2x1K+USU+Dgg31IAjLxprDt2p6eNXIiVc8SVld2t7?=
 =?us-ascii?Q?DhCKUT/DzgtLEE8duHX1d3zz4IlWWm+jkTuoKMGEjdn7u0b+k+B0pgEwyvnX?=
 =?us-ascii?Q?w8hv4lJ0AL7g7qMqoXBlGXFcjxFwvudKH05zKaAMGkYhfvVslFZR3CJSXdtu?=
 =?us-ascii?Q?WQBLfQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3365396-e4c7-4c33-1cea-08d9d9c074ae
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 13:51:26.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Shm2iM9gtgshOWu52qB46fwDiAcM24IaVXwX1OMtoN4C5PUUMdQAJaWJBK5C7Nlg5Eo2n9vw0Abk3wuU7LNtOIZzb4oHveUcWHzLKAu7iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2483
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10229 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=778 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170088
X-Proofpoint-GUID: 2OvT7po6iwvWX0PfKfMyf6MmNeEr9w2g
X-Proofpoint-ORIG-GUID: 2OvT7po6iwvWX0PfKfMyf6MmNeEr9w2g
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Sun, Jan 16, 2022 at 05:54:53PM +0100, Roland Schwarz wrote:
> Using ioctl SIOCGIFCONF one was able to list all interfaces, including
> AF_AX25.
> 
> This seems to be not be the case any more. I discovered it by trying to find
> out why N1UROs axdigi stopped working.
> 
> Is this a bug, or is there some other means how the interfaces can be
> enumerated?

In the kernel, the rule is "you're not allowed to break userspace".
What that means is that you can change the User facing API so long as
people don't notice and/or complain.  Since you are complaining that
means it is a bug.

Can you use git bisect to find out which patch broke this?

regards,
dan carpenter

