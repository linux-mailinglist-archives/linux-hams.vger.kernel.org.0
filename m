Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B9D53EACC
	for <lists+linux-hams@lfdr.de>; Mon,  6 Jun 2022 19:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235890AbiFFL4k (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 6 Jun 2022 07:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235884AbiFFL4j (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 6 Jun 2022 07:56:39 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA879876B
        for <linux-hams@vger.kernel.org>; Mon,  6 Jun 2022 04:56:38 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2569GxIE026444;
        Mon, 6 Jun 2022 11:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=P/+L/xiQZxV0HmLySjLpIt1hIIjl5TNuG57e0wYQZQI=;
 b=ql9xXyTfCWpx1TuRIdLbbPQKYKnDfaa7dfR5Wh+OtOLRu8KssfgskzAXVWlqB4ae/cuy
 exUKjZyct7a8xpp9DE5OmxkM2+SKWLmyIvnE9FbHGtGB29jeXHIPa2712e1RLfGuIzGA
 Gv3TFkH7Oiet8kufRDGWn0As4QIgFdckODKMkW2M8HEz+qffxp5TZ91f/Kg/vrHwN6O4
 FwDa0kaI1kPlpa+S1FLDbTZ+Cr2bXeIzcCzzkOSQCLebYPQfvxjdT9FRMjIjE6DK7KjH
 qEk9GQaHRf8NH85IAa4lFHRitZuwT3b+euANdggoqBQ1bbHT2Mhe2LzRYAZUFM3mfnqY 8g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ghahr8t1k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Jun 2022 11:54:31 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 256BkSsd039582;
        Mon, 6 Jun 2022 11:54:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gfwu1d795-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Jun 2022 11:54:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHYhy8Qw7ti6bxG4IPPrlhYx32dbZokZfTA0nbWCqYK419lHwyP53eGsMIffitCTYHez7FhZBDXjWAtPN/RA4iI1r49FiSjYdk003C1QkmcQ7ava/JNeV8law0qr3ZnFnzjFujxji0+yKJyjl+2e8HiH5CNmGT4H9zS3pT5BVQ1ar26av8H/URDI4BmIH8jPB+9i1M/3rm20oI4bFgX8CkTDBAJc5ekGuZU/AQzH9SeMD+haRzGFks9GqiczrA1wElSZrV5SZDPlZun6MYje0CqyTSqvtvArlYj7Z0JNkTcDePKnONx18DTlftza70ub6f/lFlpJd5Ey8ssMemqSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/+L/xiQZxV0HmLySjLpIt1hIIjl5TNuG57e0wYQZQI=;
 b=dalTTu+mDG5jRFYzLvhr/N6d6WKZsmJBQDN+o0CV6Jy4YzvyVTeWD/Do7YZI4LKMX2SIoNmpHTSqZ+zv1KH7hdUtN4tOtqaohSgYBGzn+JrjnCAQf2pxzyDv8852I8SgRzgjLQUsOfoN8Ago1cY3zttjVwOa9BSIRCruVzK/EgD2ubu5piVHX0hkz0A24DOblFfVNZVkQLBMcMUSODC6lIoeKiEmscu9JWpMITk14w9CE8xT60nh+mkstwOQvLCG2IXGZwqEHRnbGsGEWigj4jU2I8ABsdstq2d3KRbh6WHw5tb9Ih/dKdVco3rTAe1CvfDOBCtxKvdr0osyuVKbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/+L/xiQZxV0HmLySjLpIt1hIIjl5TNuG57e0wYQZQI=;
 b=rBjRNz0Y0uHHCeMDUAcCy+Npg7TrpJ+Yn42qrItn+piUt82cHuL2Rh/uJf3okY2xZ4Hel9nWiwxNlLqv1wUAHlvkJoQHXijdznKZREq5qUA9cXTp8kmXuTRlqIJR3BIbQuSITO0dj0HwgcwWX77EIFZzn/QNeS2AuUR3DS+BXUM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB2679.namprd10.prod.outlook.com
 (2603:10b6:a02:b2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 11:54:25 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 11:54:25 +0000
Date:   Mon, 6 Jun 2022 14:54:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Peter Lafreniere <pjlafren@mtu.edu>,
        linux-hams@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org, ralf@linux-mips.org,
        Peter Lafreniere <pjlafren@mtu.edu>
Subject: Re: [PATCH] ax25: use GFP_KERNEL over GFP_ATOMIC where possible
Message-ID: <202206031536.t0bHoh3z-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602112138.8200-1-pjlafren@mtu.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0040.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ebc5ab9-9009-41ba-59b3-08da47b34d94
X-MS-TrafficTypeDiagnostic: BYAPR10MB2679:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB26792106CCB814992848D2D18EA29@BYAPR10MB2679.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lhNO4orGLIYcEYOr4hlvmrGO7m9trS4X1Gzwb3pywCr/Zj0xE12B5SJZQb4ezzlv6oRF8qnoJ+uFdFYmskEwKrl1kitzqWTHEHb0IECFkV+n8b0a43RqUa90lZW8YZQP1ozYL0mySZmYNFf/YLsRsZ/cF1yFDXtqXpYeF1/wbEvEzRSEoC1wV+t8iRFmlc0NO6tdaPWSLR4KMiFlgBlFoo6I3mve3PxMj2h/muSi+zV9CF87aTbA6byiarGw8aIjJeoC5covM70S2+KBf90gVrMLs5w/OnxuMd01SWe8tv3OTwNXwYlHVQZdARr6TWUnw2Yy6IAeGFC1SA+WnMJxRRZsE6i3nKjN5DaSOm3rmHuQQL0jCxezUZef2LcNpNuahIhAdNgTjk9L0EKAnT4fVlGKv0VoEm7sRikfCwPTXVJvyLCqXwPlsgBG4YLeJG6zR8bZNsAUQBayE7A59rWtJSY1m08EwgE2mEzxh6HhAr2OOLU3YE+bZ43fprKEs9uLXdT16lRVm5m1fFGwpZP+rxshFvw196s7qcJudHtH7NTjt+ygVbNIUbGbRn0wao06K9nNuZukFv1pBuWAbXFGe1/mS+6dOCCAzHhjOV4IpQAdA8a+ux+Z4ofjNTyZYm7Np69KsiDXc1MAYIp48Sqx+BOdyk9Ci7ihyWyetgpYr7haTeKKOOHMtAKEnmx3cxnv2fpcEUs9TofB/48zwJOqDFvCqoRTxl8klGqdhL3Kh2X9CyXud19Tw/Wo3ukZINfWPD7UFf9D0p3F9khpG8sGftHIFnsYwWK4v8op10H3fzFd69uwHrtr1C6kprqBjfuo9bD3vfLZts6smbbov8K4Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(4326008)(316002)(36756003)(44832011)(86362001)(2906002)(5660300002)(66946007)(66556008)(8936002)(66476007)(966005)(9686003)(26005)(1076003)(186003)(508600001)(6486002)(6666004)(6512007)(6506007)(52116002)(38100700002)(38350700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AJOuEPgCINNFW9tO4lkTWtFA3wm5xyv9SrRc7enRv02EU6xFQLd/aXw+u9fv?=
 =?us-ascii?Q?jEZfljYDaXNd3O0gxxHnLX363f/9uGpTdQbx0MZTW0FL+POhRKdH0h5bA4m1?=
 =?us-ascii?Q?h1fNGm4qSJ2gHMboM2fsa4vRKJOlzafT2BPXaFnxr1dWZjeZ4jtGNDg+V+Iw?=
 =?us-ascii?Q?BKH3igbJWcfbWWqKke9cspOQf6SsriSMNTUJdubemsRbWaWh0CV6k6JZGIvb?=
 =?us-ascii?Q?cmZOWVKELcMK3eQ+nifzu78UHZbSWI451KTFcCQS7HzuOexo6hhUdTiFSv6x?=
 =?us-ascii?Q?UUP9AoO/R77b+tgUxhKlEn7Q0ChdNvVB1gHLbXF4/G1o9oqkCGUYf1JuWG7g?=
 =?us-ascii?Q?q90fTnqB1uMOWDMm06b0rMon8oNzGqS/ocNUt5EkJP8khQ3qbM7Lzg9cVy+X?=
 =?us-ascii?Q?ZgKL7KWsjS8chQu1Kqnp9aMdEpFCXrKnF65hS00Vk8AWgTHrDkMz5AvuftP9?=
 =?us-ascii?Q?otY3JSZvfqeYPz1LnuXdJyL3BPV4wA8TX2Hj4eROB1ygyNpFJc1PUM44sPB3?=
 =?us-ascii?Q?LNbeOmIgV+svGR9At6BZu5RadvIBCXpkSuzJlbHWd7KgkK21YZqyet/vyGcS?=
 =?us-ascii?Q?GKqjP9zhqX8yQ2p/Rs7zyO/Y0Ehzjdp2i1VeVoYhAZDPORGDBCQl1ZTGJAgR?=
 =?us-ascii?Q?epSBQ5T9N8j3PsRsAPHOdAgxFDsD4fwqTwqpKGThGos4M8xOmS/QIMPaeXW5?=
 =?us-ascii?Q?vk7BcgbAj/nlaSxQVhfCDRkoa27/dyC44a6nPf+aoZ+SICm8lDggOez5z1vh?=
 =?us-ascii?Q?mcv+sh2RppK9bYHh41que9Pk9oO66NUfYyDHeHw5VatKHXRufECmRjtsH6cQ?=
 =?us-ascii?Q?6ZqaCk6qb41KUi3x1SzAnASmvv2qVIN+CvukWnNqLo0fsBpcNQIA2gO/MET4?=
 =?us-ascii?Q?nevSrINP9TCzEC3/tICzubHinh1U4Scv87ufYG//QqVnRH/J0HnF6Hmet7yA?=
 =?us-ascii?Q?EQlPwH1iihoWUiRORMXIav2y0Zgu3ZZr7OZYEoF9hjvQ3JTvAnqgdwCmQO/z?=
 =?us-ascii?Q?m5MN530NM5NwlogoUf2XAvdfOOp5ON7bLtXBigPzLCPbHY5KGxGF1OtD2xh8?=
 =?us-ascii?Q?vpGuBxb2MU9BbSENRC4pjWMYpZ8crZg2EdtV7N1515ehv6Iz1Wz2jGKjbIeU?=
 =?us-ascii?Q?D6dzZHiu0rb26fHoUjRFvGDJLFn/YKhHyEFDjrEXiB4SaTZ121fC07Ja9nDJ?=
 =?us-ascii?Q?X599FhkZfOO99GVbKpmxHcH90xzFAaQ5B9Cx2AbTPjs+UnThzNtE42Q81ppx?=
 =?us-ascii?Q?Nx9c7cqmo7K8TRaXFDj6E9nNK/puXFdXbGElKL//63uAnDNUIEj2hiNUEARb?=
 =?us-ascii?Q?NR/VKOxs74IxQGiCiiuDUClukwWZVV6vQkjDo3Xq8kGmn4asPP9u0xjjXvr3?=
 =?us-ascii?Q?h8Z1LLDOVE8XzraQiSmqU8bZBAFPdqMmbzKYK+AW3gFhqqodBswgpPrjSMfH?=
 =?us-ascii?Q?lrU63jlbh8CY0ajfqLnxFwwm7hANdlIq29y0uNhwXMLM5QsKjGv9CmVVmfJC?=
 =?us-ascii?Q?fDRZaNvaCKc14mNsAb50TbnQ8oGfQzYxKm9P7VJevrReEcpd1j3WWKZiCnXp?=
 =?us-ascii?Q?geJa7/ktby6hIIr/QqttxM6azGYiti9idCcy00pH1rrKvXnnSK65pl/d5K/U?=
 =?us-ascii?Q?6iCV0Sem62YEC26dTkA+BODN104sBJTjZwr+eSlqA58Vpv0wPQvm3bPbFJWy?=
 =?us-ascii?Q?98HjUEkLEWDn5FvQzWgwfNnVW/rnabY+/s7BsNvkA3yqSKocdFZMi1XDGXww?=
 =?us-ascii?Q?UzX8XCFtJmTmyOXtb6wzM1eGpgLhi18=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebc5ab9-9009-41ba-59b3-08da47b34d94
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 11:54:25.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tN7tZiFXO5gMCcuoY0yeQUXWRfzsToOU62rc/jZhLHaDg/r0FZDMK8Dl03cNk7RkhyB9qfJTYuRF8EcRe5Y3o5QX73mmcr8N3q3sccdAxsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2679
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-06_04:2022-06-02,2022-06-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206060054
X-Proofpoint-GUID: iz7xz1Zv3NG-Aa-j9cPq2JGNWtXd4rkl
X-Proofpoint-ORIG-GUID: iz7xz1Zv3NG-Aa-j9cPq2JGNWtXd4rkl
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FAKE_REPLY_C,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

[ Kbuild catches the bug as well - dan.  netdev trimmed from the CC list. ]

Hi Peter,

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Lafreniere/ax25-use-GFP_KERNEL-over-GFP_ATOMIC-where-possible/20220602-192326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git master
config: nios2-randconfig-m031-20220601 (https://download.01.org/0day-ci/archive/20220603/202206031536.t0bHoh3z-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ax25/ax25_route.c:94 ax25_rt_add() warn: sleeping in atomic context

Old smatch warnings:
net/ax25/ax25_route.c:113 ax25_rt_add() warn: sleeping in atomic context

vim +94 net/ax25/ax25_route.c

c9266b99e2def0a Ralf Baechle     2006-12-14   72  static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
^1da177e4c3f415 Linus Torvalds   2005-04-16   73  {
^1da177e4c3f415 Linus Torvalds   2005-04-16   74  	ax25_route *ax25_rt;
^1da177e4c3f415 Linus Torvalds   2005-04-16   75  	ax25_dev *ax25_dev;
^1da177e4c3f415 Linus Torvalds   2005-04-16   76  	int i;
^1da177e4c3f415 Linus Torvalds   2005-04-16   77  
^1da177e4c3f415 Linus Torvalds   2005-04-16   78  	if (route->digi_count > AX25_MAX_DIGIS)
^1da177e4c3f415 Linus Torvalds   2005-04-16   79  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds   2005-04-16   80  
87563a043cef044 Duoming Zhou     2022-02-03   81  	ax25_dev = ax25_addr_ax25dev(&route->port_addr);
87563a043cef044 Duoming Zhou     2022-02-03   82  	if (!ax25_dev)
87563a043cef044 Duoming Zhou     2022-02-03   83  		return -EINVAL;
87563a043cef044 Duoming Zhou     2022-02-03   84  
4de211f1a279275 Jarek Poplawski  2008-02-11   85  	write_lock_bh(&ax25_route_lock);
^1da177e4c3f415 Linus Torvalds   2005-04-16   86  
^1da177e4c3f415 Linus Torvalds   2005-04-16   87  	ax25_rt = ax25_route_list;
^1da177e4c3f415 Linus Torvalds   2005-04-16   88  	while (ax25_rt != NULL) {
^1da177e4c3f415 Linus Torvalds   2005-04-16   89  		if (ax25cmp(&ax25_rt->callsign, &route->dest_addr) == 0 &&
^1da177e4c3f415 Linus Torvalds   2005-04-16   90  			    ax25_rt->dev == ax25_dev->dev) {
^1da177e4c3f415 Linus Torvalds   2005-04-16   91  			kfree(ax25_rt->digipeat);
^1da177e4c3f415 Linus Torvalds   2005-04-16   92  			ax25_rt->digipeat = NULL;
^1da177e4c3f415 Linus Torvalds   2005-04-16   93  			if (route->digi_count != 0) {
10c95f710e8899b Peter Lafreniere 2022-06-02  @94  				if ((ax25_rt->digipeat = kmalloc(sizeof(ax25_digi), GFP_KERNEL)) == NULL) {
4de211f1a279275 Jarek Poplawski  2008-02-11   95  					write_unlock_bh(&ax25_route_lock);
87563a043cef044 Duoming Zhou     2022-02-03   96  					ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16   97  					return -ENOMEM;
^1da177e4c3f415 Linus Torvalds   2005-04-16   98  				}
^1da177e4c3f415 Linus Torvalds   2005-04-16   99  				ax25_rt->digipeat->lastrepeat = -1;
^1da177e4c3f415 Linus Torvalds   2005-04-16  100  				ax25_rt->digipeat->ndigi      = route->digi_count;
^1da177e4c3f415 Linus Torvalds   2005-04-16  101  				for (i = 0; i < route->digi_count; i++) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  102  					ax25_rt->digipeat->repeated[i] = 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  103  					ax25_rt->digipeat->calls[i]    = route->digi_addr[i];
^1da177e4c3f415 Linus Torvalds   2005-04-16  104  				}
^1da177e4c3f415 Linus Torvalds   2005-04-16  105  			}
4de211f1a279275 Jarek Poplawski  2008-02-11  106  			write_unlock_bh(&ax25_route_lock);
87563a043cef044 Duoming Zhou     2022-02-03  107  			ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  108  			return 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  109  		}
^1da177e4c3f415 Linus Torvalds   2005-04-16  110  		ax25_rt = ax25_rt->next;
^1da177e4c3f415 Linus Torvalds   2005-04-16  111  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  112  
10c95f710e8899b Peter Lafreniere 2022-06-02  113  	if ((ax25_rt = kmalloc(sizeof(ax25_route), GFP_KERNEL)) == NULL) {
4de211f1a279275 Jarek Poplawski  2008-02-11  114  		write_unlock_bh(&ax25_route_lock);
87563a043cef044 Duoming Zhou     2022-02-03  115  		ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  116  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds   2005-04-16  117  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  118  
^1da177e4c3f415 Linus Torvalds   2005-04-16  119  	ax25_rt->callsign     = route->dest_addr;
^1da177e4c3f415 Linus Torvalds   2005-04-16  120  	ax25_rt->dev          = ax25_dev->dev;
^1da177e4c3f415 Linus Torvalds   2005-04-16  121  	ax25_rt->digipeat     = NULL;
^1da177e4c3f415 Linus Torvalds   2005-04-16  122  	ax25_rt->ip_mode      = ' ';
^1da177e4c3f415 Linus Torvalds   2005-04-16  123  	if (route->digi_count != 0) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  124  		if ((ax25_rt->digipeat = kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) == NULL) {
4de211f1a279275 Jarek Poplawski  2008-02-11  125  			write_unlock_bh(&ax25_route_lock);
^1da177e4c3f415 Linus Torvalds   2005-04-16  126  			kfree(ax25_rt);
87563a043cef044 Duoming Zhou     2022-02-03  127  			ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  128  			return -ENOMEM;
^1da177e4c3f415 Linus Torvalds   2005-04-16  129  		}
^1da177e4c3f415 Linus Torvalds   2005-04-16  130  		ax25_rt->digipeat->lastrepeat = -1;
^1da177e4c3f415 Linus Torvalds   2005-04-16  131  		ax25_rt->digipeat->ndigi      = route->digi_count;
^1da177e4c3f415 Linus Torvalds   2005-04-16  132  		for (i = 0; i < route->digi_count; i++) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  133  			ax25_rt->digipeat->repeated[i] = 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  134  			ax25_rt->digipeat->calls[i]    = route->digi_addr[i];
^1da177e4c3f415 Linus Torvalds   2005-04-16  135  		}
^1da177e4c3f415 Linus Torvalds   2005-04-16  136  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  137  	ax25_rt->next   = ax25_route_list;
^1da177e4c3f415 Linus Torvalds   2005-04-16  138  	ax25_route_list = ax25_rt;
4de211f1a279275 Jarek Poplawski  2008-02-11  139  	write_unlock_bh(&ax25_route_lock);
87563a043cef044 Duoming Zhou     2022-02-03  140  	ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  141  
^1da177e4c3f415 Linus Torvalds   2005-04-16  142  	return 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  143  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

