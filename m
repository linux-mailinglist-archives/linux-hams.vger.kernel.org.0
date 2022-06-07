Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6860853F568
	for <lists+linux-hams@lfdr.de>; Tue,  7 Jun 2022 06:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbiFGE7M (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 7 Jun 2022 00:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235842AbiFGE7J (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 7 Jun 2022 00:59:09 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86536A011
        for <linux-hams@vger.kernel.org>; Mon,  6 Jun 2022 21:59:07 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2571xagp002589;
        Tue, 7 Jun 2022 04:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=/CKX54wy41YbY6KOWtKCSBjnGCrwg0sC0UiyRt+dN/M=;
 b=V+qFjMv5JaSPDTOTnQhUQ/UEXs1g5DTVN8Qw7cEtqYa5zl0XI/ycctbtSH1iQRGub3or
 k9PAEub+3wgistdYZcezqkl4jhgwLB9pCRPI5zEiVKsxGJUMpoCxOFyFzgGm1E62Kvuz
 FmitLcQtuVrM0iIqfZRleMCESJUMXpKlIqMbpuXIL5L700zpuPCul1EhQAvx4Rzi72zK
 sOCbGiYwmqsl2sOqmBLKd7p/iqcgGzRLef6Uc35h2M3aT4DKwH5IvOX6ZVuQ1bKG3Gj6
 eLO2ytec4Y+M8oNG6JfGjYmdykFnwEUu4wzPGq8c86ODxmc+nFwiNJ9euMZMQpHrDV01 lg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyekcmqp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jun 2022 04:59:04 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2574t8Lv005459;
        Tue, 7 Jun 2022 04:59:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gfwu9a61v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jun 2022 04:59:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj+KrVlXnk6hkg3wgRrE3OV4LSEcb/Q2hy40eTc3namZ01UTSHvsfRRPdC3zBjPghstAqLD8qWYZJgb74b5pdvyt4zGUX0NS1QXkcFoxA7CS8lVqatTc64IUFga/JFpHMpSB8zNiLAMpBLBBWFc3gi/hcBe+L7sJJ3vUdQQQuWF58ZRDYvY53xpMqV1Ma2zW9EYdl0wJEiY7pyqaDhIgiflPo805ZlgF2qn8qtcfpugAzSm2exX5EAeCD2Q/ng7eq7VN/YJZXKJy+WI38Rh3WV9MRAXbba2VQHjWfzZPsx/fo9pnLpapJEqLXy+8Mr7d6AFCZjtBTonV/cNV2OTEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CKX54wy41YbY6KOWtKCSBjnGCrwg0sC0UiyRt+dN/M=;
 b=N6NSI1Vq7k2v3OyPd/sVd5LTUXTP6AnhMMslWBWiSduQoHXleXQfDkeTaSZ8sFXaUiQ5NS/wJ4/LTDKAP0aIjyWPZurwECPNtYdtstOxIiqb4EhcC4Nkh7tQQURQgQbz9hovp5IPLMnwJVK5X8v8Lvok6CD0NEir7WUuJmgal2dbReL73+0+73Wese4Q4QThKp0PmqlyuvJ0Q3/aG4B8OQMWUEx9Fvqe//gzYySc08b0kUpgS+DLuzgonIegjeBIef8xyFns++h+Es3HMRLMI/B74ckksr9mu9Hl9L3y534CqgVZbONnDGj3u/QkZ3WHeA1jimfUAEjbe9QuhY+1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CKX54wy41YbY6KOWtKCSBjnGCrwg0sC0UiyRt+dN/M=;
 b=ykhTj25kt+F/UtPBYcwAAlhni+u7erho9VRMAKq4KKl/gbABokQ81b2l/GkgmaQoQsLV73nOgU8C2Emag20p0QSACDpUVFrJMc3pTonqLvBGm8iZE5scNPgYPgFhPImofubMQYjcuRSn7+pMsha3IBW9zPaKp2hziFJOiuFi71A=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1530.namprd10.prod.outlook.com
 (2603:10b6:3:14::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 04:59:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 04:59:01 +0000
Date:   Tue, 7 Jun 2022 07:58:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Peter Lafreniere <pjlafren@mtu.edu>
Cc:     linux-hams@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] ax25: use GFP_KERNEL in ax25_dev_device_up()
Message-ID: <20220607045841.GY2146@kadam>
References: <20220606174012.10262-1-pjlafren@mtu.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606174012.10262-1-pjlafren@mtu.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0031.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::7)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 343dee95-6c81-4486-2002-08da48426fec
X-MS-TrafficTypeDiagnostic: DM5PR10MB1530:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB153011F23E5A49F9CEB936658EA59@DM5PR10MB1530.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V4xQa/P4KRiMKG+5OfwBJOe+J9Lu5YIyjC7IowkVsjyKJzX8P7TqfpvYCG42Vru4pttwtB3cVJxW/SpfaxAH/DnQ0V8vZerCt5vCXrUqeXuC0kMYY2Dgy5m+ImEj/1EGx8e0TzdrNqXwjPYiLo/5MKlLFpHyW4MHppkSt2CoV5Y2gT/sGVjPjHfQDLxZ0JW2K9G3PN2LFrLlEFaixNhs8S9xTpMZ7HoNbu9pNW0sFvR+SqVTOV5WokUpej/08097adiLuCjdCRPl4hVyBJbu3xdVXOqf29Eo9rC6ziiGjuLw6ET+U+c1JnVZ8iEwz1oQaDuzma0L8rChBZjXnUSfQp77rZCVfohHoGklsg/XjFAvWjSEqbvoEIfONV83dBdIW7zGX7tuK+FG48Vsg3ixTAsYI4vDJqIPYGYgXTXErN/v7QeCbb7Q97kApy42RjZ5BFlGEkchX1CXUZOXideT807a77HZQ72jFUtbD0RlwUvnbAWIxcmxH7hcglBOxL8LABa7TMFhACprEVU5wNiIFPQMc4+IWJVRWy2gUH2sg3GPKx6jmElIXDzuov62IWTitWVNLIJZ+N6AynxOcr0BQhjOSYsFTD8cK+wOd7Iea72oik28JQwY1P/UjlmIto4Gn921Qr0LP5uJUOEN5zkwWd9DXAWJT6F/Np886/0jdrEgeImtVcdKz/8wU/AKgjTFrTljRESJi8nWXQtbX3w5Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(33716001)(6666004)(316002)(4326008)(8936002)(8676002)(33656002)(52116002)(6486002)(66476007)(2906002)(6916009)(86362001)(66946007)(9686003)(66556008)(83380400001)(6506007)(26005)(6512007)(38350700002)(5660300002)(38100700002)(1076003)(186003)(508600001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RfVIc2570OYrfxFStOWdx0/KI4ZDxCk9q+BZ4MhIL4oEzGsRf8mRa40jJZwu?=
 =?us-ascii?Q?jQVOcZvmLMv5aOCL081aPCqkD0P0/12fjUfDNdrHQ18wIoJLkL80AP8y18Fo?=
 =?us-ascii?Q?YjHRlPY1ZsMV+T+b6qgQxItU/Ht2OmVu+E62vt5b8eh0TPxv5hvCignz6R/Z?=
 =?us-ascii?Q?y08fVBDebmtVU22VgMQ+4fbY9xMvMwg7jrUmz9mNlUctw+VNBgUH5dMuIkxb?=
 =?us-ascii?Q?EYj+68L6Y12Q1TsuQk7zwzk/xP6Pu42ONIX/0snaXdcQR9mgod9Ft6DISLKm?=
 =?us-ascii?Q?+2zvHd2e+Tv6iyz8HsEudS5R84myPONn+2oWtvtjw1QjaI7FmGxEJTQYoRwf?=
 =?us-ascii?Q?d3VUwlGqL4FM/cGku5crnA/OgL3m0eA4D4XoxwU96bbt3gAbxZiIIG6VCIOA?=
 =?us-ascii?Q?zdiSYb3Oc+WeKtH4blhYwxyFghbZGMB9tf3FHUsknb6xffzcFFUh2/Cq4/bW?=
 =?us-ascii?Q?7UncDPLf5Y90OZEGTCH7NRIGWLvl58TlkozjRY3MHBsfqDzILNI0krTz2tfN?=
 =?us-ascii?Q?yakT8Nmp7/Gj4QTC1OaRonl+VWIuRyofg2B+VxbCd6rzULAy8l2x+JBmR8SR?=
 =?us-ascii?Q?WFK0DVu5YTHll4W6RYGetc8ycJtUz8v9vOdL5X30tTcbsXYPlq5eoh/n2mUm?=
 =?us-ascii?Q?DrtyyMK4BRXSJOkuUw5gj0X0Kr5HVlTGLc6tYhXm3Y5OlFY23PtuvXf7amOI?=
 =?us-ascii?Q?fd3WXWERafVatkuKG+HCO/OFJaxlvzz7WsgT9WXhb3c4CVxXLw7+xG5Nob3i?=
 =?us-ascii?Q?aE2QBvh+MrHyNav/7jH9Y4hHeXgaI5p3yMvIdK5vbjsVvTuf6AxBMSOSi3Zo?=
 =?us-ascii?Q?PfHRnN7iBARQmmSJTOzzR2XAImvN9NBVU0+zbI06Et3Ly4ZpGvTt0yeLhl3z?=
 =?us-ascii?Q?upQeD608fj5hf1GM4ugNG4FX/I3+xUaQZDQJ9l9ruvJojpCW16JNjVYlt4R2?=
 =?us-ascii?Q?+dJAt9biaID0bOGqLr2oxrF9OkX2MYjQjyWIYwqVJrJpkrp0Km77WJtetMyy?=
 =?us-ascii?Q?Iaw9fQE3YrDfCfCf+bWZ0T4XiR9e1FYdSWOQFId2nN9hs7xNvsOWyiS+w3VQ?=
 =?us-ascii?Q?Dq3VrDtw28AVb/XBac9LAeHMbJWujvUxPD85iRGXZkyuwCsfJgx8l/m9EwmR?=
 =?us-ascii?Q?2imgwVTJ1fY9l9HUIXkxKUEgJnybf/gsZAWWf+t8WPHczy2xbIPh6ZxljouG?=
 =?us-ascii?Q?vHKSlqxjyH2mbieb9AUHfOTivW0HNl1uqho738ZzdtT6QvoqSF136DRsY9r2?=
 =?us-ascii?Q?55QEcAujl3J5FohGcfNUPxxDCrB/AKNmFRJcfYGxrmQhNi9icKFHAVMsR4Ic?=
 =?us-ascii?Q?oDVQullzgJCqm7IB2OY5Ka9MWLfmNLgIFEkvtXwYiFkP5RvBqwwZYHVsBEnK?=
 =?us-ascii?Q?GsLo0nZHNlric0R+3QWM/OZuYzgj9S7TvjP36qlBM4UPessb3nNn+IjZmdVV?=
 =?us-ascii?Q?pPDWW6D9I/nhvaKF0oNaxzb2LSVkQ/1RzPLdK+VeHyUPD7rHgfotmTXoBF4D?=
 =?us-ascii?Q?riZl2CJNjv8U4qbINrCoqXbO6fPzkWMCP1VDCfXjJ1y9LSTTkzUeYzk0hgmi?=
 =?us-ascii?Q?fB9LK6Eq2kTZXMqGOy63iw/dgEUiSn7B7VitH9WHAXs1XKWj7iLtNapLYg3V?=
 =?us-ascii?Q?jKp0MqoRVHGxtO5jTqfJ29K8as5u0crK2TH8xjEdmXw0IGYqrMcifyRLS231?=
 =?us-ascii?Q?IvhaSGB5X3SarlqcMxgcrGaexzXW/tmAyeKmRoImYGOo2M2arm9S+REAOLDE?=
 =?us-ascii?Q?Iw6KRb+BmIfN3JIEczi1uXElyHoqza0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343dee95-6c81-4486-2002-08da48426fec
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 04:59:01.3508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjRfPnOknrUg+IJFXtpyvn5VffwH9iCNzjXVcpUkMFICJgVTsCYoZTqA0hj67enI1fJxdzV2iux5W+6q6IGORmvYhr35tUkm9UlFUJGsMXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1530
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-07_01:2022-06-02,2022-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206070019
X-Proofpoint-GUID: 9OJyKzEyveYpitfWS9auObotvZUkTG-_
X-Proofpoint-ORIG-GUID: 9OJyKzEyveYpitfWS9auObotvZUkTG-_
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Mon, Jun 06, 2022 at 01:40:12PM -0400, Peter Lafreniere wrote:
> ax25_dev_device_up() is only called during device setup, which is
> done in user context. In addition, ax25_dev_device_up()
> unconditionally calls ax25_register_dev_sysctl(), which already
> allocates with GFP_KERNEL.
> 
> Since it is allowed to sleep in this function, here we change
> ax25_dev_device_up() to use GFP_KERNEL to reduce unnecessary
> out-of-memory errors.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peter Lafreniere <pjlafren@mtu.edu>
> ---

I don't know if you really want to add Reported-by tags.  That stuff is
just in the kbuild-bot template and it's an automated thing.  Some people
add it and some don't.

It doesn't really matter either way.

> v1 -> v2:
>  - Renamed patch from "ax25: use GFP_KERNEL over GFP_ATOMIC where possible"
>    (Is that okay?)

No problem.

>  - Removed invalid changes to ax25_rt_add()
> 
> This isn't related to the patch itself, but thanks are owed to everyone
> who had to handle my mistakes in submitting this patch the first time.
> First the posting during the merge window, which I know better to do,
> then me making the stupidest error of missing a lock directly next to the
> relevant code.

It's all part of learning.  No stress.  There was no danger because we
caught it in review and automatically with static analysis.

regards,
dan carpenter

