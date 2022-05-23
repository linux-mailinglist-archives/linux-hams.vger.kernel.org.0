Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88A83531490
	for <lists+linux-hams@lfdr.de>; Mon, 23 May 2022 18:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236593AbiEWNwx (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 23 May 2022 09:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236402AbiEWNws (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 23 May 2022 09:52:48 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E809456753
        for <linux-hams@vger.kernel.org>; Mon, 23 May 2022 06:52:46 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NCDJ64022829;
        Mon, 23 May 2022 13:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=XU6EWtQvx4X2CHADKoH5Cv47UCW1J3WsLcmQ2JXKfjU=;
 b=SZ1xjSlQhBmlLppTldDeI67hA+O7HWNVayUTul8FdyDKNhA/GAYcO3rvChGud5RzkMky
 wi1W2T3EB0F8+C9GE1PNw3RbDOFWEIVzDZiaWGkyqm62t/kV2KrQLV2XM1uYt7eV9gE/
 1SeccaA0lDpZ3T5cjIGErC77b/Ku+bzGOEkwFlrZ+FCy+KZdeC575Crrg2VChssZn2wC
 ey1YlmdKexIfHucrRaSYNPAF0yR0y9Guji0ONumhQCUrA9w/+l0/WfyCVP6GZJAIRBU+
 jD8NwzThoXlwGSrQUU2Xg9uW7f+g2TZiHonSZwCkNwH5A0hwQSU5IheLs9KugftYOKaZ 9Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6rmtubqf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 May 2022 13:52:36 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24NDjJ3X029184;
        Mon, 23 May 2022 13:52:35 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g6ph1g5k8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 May 2022 13:52:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTGoB1E4lRyl1m/6RQPyjG+7SuhLdgbzRnqaQJPq4c+RVHrXNbNnMEDikiXdV0SCkhn0G06bL14BQm25DDteRi4p86e1CgtyPiMnxQOecZsEhLL1mAvxdKjSBzB3kuxhTnwx7dj3hIEuvoeVhXR9oeQNbrOhbaLcEDCwnNIVfQGdZWXMOqkNFuVa5zsb9aewpZaRuYo34Yl6QPKwyLPlhd4BxjZFK6YPoc6qivIRIDuKPEwsOiFlxpgvoMn8C2ObPlOsSVYDx5W2VZzzKABNPrdkXxIvqJvjqSt7HN9tCfbKvlWzO2vZNSssoAUtu8ovL+vvhCO9BQH0EM1w6tWvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU6EWtQvx4X2CHADKoH5Cv47UCW1J3WsLcmQ2JXKfjU=;
 b=EFqF+pJJo14aG1e2qhFva4DCPF6c9NgC7jJVbNawUfa22x3S4T71hIiFbRA/FWvnMsmyKxseZe17EKvTyuDlpyaooNOY1LcDROGHRbeXLNjLckyXc3inIPd7SPWeBBiLH5VRzV0DN5fTxBTQA6SOkyveXB/ZO7d818ITpZCpbNQ/C3CWjtGsd6V8EyUf+j7353+MKphsPvYBgOVdZdWhgDxWEr4l5ONohe/NncNNoydoI94UMSlQ7QH7wHawFRbHV4lf//1JI7kMLYmd+2weHix0cG8iLLYZGbNZtEKlLGfnE5fXSQjf7g6qPWhsJfalnmx6rgJ0v1JbSJuWiqQFFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU6EWtQvx4X2CHADKoH5Cv47UCW1J3WsLcmQ2JXKfjU=;
 b=i9O65XcBrIPNHnSb2UGs0bhZdro4nbj7I4Wc/183WvkuBRglOLzTckGOcv4a4CElPqUM8r/IxoE3RQ1p2NDM9uWM9WjS/L1S/ilSA80abCO5KaRP/inL1tSSYeZwLLDvq6zstNyybPatf9x4E4jge9I6KFeIIQ13ag37VAiLDyM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2063.namprd10.prod.outlook.com
 (2603:10b6:301:34::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 13:52:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 13:52:33 +0000
Date:   Mon, 23 May 2022 16:52:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Thomas Osterried <thomas@osterried.de>
Cc:     linux-hams@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>,
        "David S. Miller" <davem@davemloft.net>,
        Paolo Abeni <pabeni@redhat.com>
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Message-ID: <20220523135214.GE4009@kadam>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0019.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::31)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e1696af-3f9e-44fe-5eb6-08da3cc37c50
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2063:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB206328807131599EFFBD927D8ED49@MWHPR1001MB2063.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +VLj7Dt21xeahkm464eJxZe7mbcjoqd1jQSXu/JrIxj14eG8+nBD7/0IH62Fze5i5xd+nfIerJo8YaPsyD1Yc0i9tTi3b5bMKdJMG4AxtHsDUBW4K9URi7AoZJEoC5SHQNxxmlYXJLRW+gDfGbhrC0VALnmdxUIOoNg92P+M1cV3zJBz04EilUPl/Xadiznu3tpPwje+7YN2rp6Aue1EAA02Z/TM2Yn0f6BZPXoyq++g0eVTg6e6d1ItVynKhXnbMEwFFKnl81KX8y4rZfS1BBD5U4Uz2IWwnuMhYOzZ6vr1G9VrzepzJBavny6VSHSBOjcOqs7mPNuUj6Agebn/bT9+ZtgCFuGIBLiLiOJXBFLnOIiLKtKRu53YRvWylAIMd7uDfYrvea8w5zvJ+gW1X3GKv3hpgqeADPmjKtgbGadRWepaNsNyjACkKkjqCcHbOXdJS/BLBeHxaw3TsH6AHg8VKW84DFr+tvRNpgAN4NiRmPZRZYSIP+V5CLDsh6Rx8UP7P4lvve8PrKQIApE5Gx9EtG2sDgavlL41fv6GT156Y69SYSLSyoe4DZRzef0DCr48+EGDMUqDu+pNQEM4Iwt1UAZzGFeKPnKfsaYpmmKdBU7OhZwOvudfVG8fRfwM8P+3i3+1JO7FZrO8YVKKHwLr3Htj3BoEmBBWSnDSbuqObMmrgMqszvCpAH1165RMAWJNzHVy6vJPTUJ+iC7cZQabj5Qiv7oUx1y7MFH+1bVjYmIb+WW9xKv9my/nqO0o/hBuFvmiGABZpPmGWifmA2HamiCS4zybKBYj7KmA2/ictI3CSE9FQ5QMvMjGetzmk6KDgITxLmtEpM8UYpAQUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(83380400001)(44832011)(508600001)(2906002)(86362001)(6486002)(966005)(186003)(26005)(6512007)(52116002)(1076003)(33716001)(38350700002)(38100700002)(66946007)(66476007)(66556008)(4326008)(8676002)(6506007)(33656002)(8936002)(5660300002)(316002)(54906003)(6916009)(9686003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RBTNPXR6eP988YClaSdNF3YrGkYUkQ2JU+CtSFxz/jjVeeeeWW7zjFg0U6I4?=
 =?us-ascii?Q?6LH30yEORiWv3Z8viNrwk9mJ2BfpzYWvIOeE+EvO6MLXiC8gnZVRyEyXUBq8?=
 =?us-ascii?Q?TJo2noxjLt4P6x6QlGzP6gDdX4CM1g8Ls/XEpOEi3h3HS3VvgjBDS2JGchfc?=
 =?us-ascii?Q?UyoX+4iFe/WUbO9nvIHtcPqPtJDvXTVNmg4PnqflTZ9oD4XEjtijtEhiyl67?=
 =?us-ascii?Q?1vMayJ0NZN39Ng2bQPqs0QUuNCRxPnLIesxnDucsSojdY7XivQ40hT9Ux8Y0?=
 =?us-ascii?Q?hVIDpgaN3CqS7DEDnaG4F9Gm2+u/SgnSUkYC5rpGB5ojLINBFjS2wgAg2m0O?=
 =?us-ascii?Q?5jTjXFDZoC+V/wToVXv8z9ObCEOmfE+gjlNhvQiYwTVQY8m2UU09kyZ4NZwx?=
 =?us-ascii?Q?wcH/2esyydAfeZpjgy3o3TuVD9v9aKx1znGoET0pbkz1WTxGsrpkH0J7pqlC?=
 =?us-ascii?Q?MFQZig3Gjz5Qwma6lEn9XFhJmavx4JlhquoQjnQAfgCTPt5ZpMC0gWpz1x42?=
 =?us-ascii?Q?/ebLH8Mo8pKOuAjB180xaT+yHll8OOJ9BWfk5nI8JDwie236Q45ddTiRhw2c?=
 =?us-ascii?Q?ig87KsqQGd1NRf++U9E/kD97ocmZj+clE11uwmatw/YKlcTAR5NDIdiXEe9c?=
 =?us-ascii?Q?foIDZ6vCdurHbL/AybxHhMxjYOe7isCwN+zTHkVAMuIcyLopYoYMLivhyUPz?=
 =?us-ascii?Q?wqBvNj4lyvBdXMqwRENGZzBaJESF0QqTVSscRGzDFqCS0t13JbkC/rKHIYas?=
 =?us-ascii?Q?Qa+ByhPNk50KYz8+mB8M+Zlm7Jv72vRRnxInFgJmLRMW1qStoR7csHlJX2hk?=
 =?us-ascii?Q?CWmw+qvfKydGWyoz5YanaaQNBGKxsqO31JpA5ALFdikCqrTJDIVefolzXnKG?=
 =?us-ascii?Q?ADu3YJBZXbguVW+Ak9+gH8rzfgzgrPF76Pfs55iWNuAr3ys3zasPquDrudJe?=
 =?us-ascii?Q?JbBz48wwnC9XZ1Muo9vDT8p2nv98aztOtyh7nqwvJKoAO2X7RsiyZ/kknV2s?=
 =?us-ascii?Q?h/idYLXumWjWmfK6T5InU2huZaduhEMuzJgK3xYQXO6Gcj8hrM7tquA9yq+2?=
 =?us-ascii?Q?huVcHTp+0lSi9t3mc1IKoRaY6bPn8fnuVOxRNnIX4PPjmJ8Da48J8AW+ygZV?=
 =?us-ascii?Q?kbiz1Y+5ORYq9HgeNrCIdVbZ2Ib3ijULro3PVwkA8PJZ1/KHmDjEDzm/AK80?=
 =?us-ascii?Q?q/YXjyVx8ojM6zDk5jJov5L4jHpR0QqEPKfXR+Wle/plW+RZ7nSEFJ2Q8H49?=
 =?us-ascii?Q?RuJXXbzrnYJtn2jAHXbmqXp+NnPfE5AtMUiaWZp5f/CoNjb7dSqwzZXsrwVt?=
 =?us-ascii?Q?2nraL7pPWh2nhaIjgRZf+zvrZT7WbCh9tvU+RUtLDHvJ1Tc25Q0qCIhzjozh?=
 =?us-ascii?Q?wTt48hjY7Ke6d3HR3GEaXyDMQrLPKVMktgQkDIJrq45sVgyPGBaJu2/7pxWF?=
 =?us-ascii?Q?h8t+hHrdaH1N+0MMBOXGgqQLPmvZr5XsUKHvwZoNESbiGcDcjB9Sf6wEzMiN?=
 =?us-ascii?Q?y6JUQ8d4E/IB+5HKLjJmIfPixgOaeNtopO28WwMTIue/xaPh80BfKuY3jbjc?=
 =?us-ascii?Q?Xg6MK0qSECHDxMlspCMKP7w4bIGMiOAiSjYjRv+c0/jwc8YQ/FlHiyBAV7Co?=
 =?us-ascii?Q?oXBypPUJSdSOuRtXpKsbbd3p1IqLaR8+mwWFQEolUc7UA7An6Zg5mnLVRMMQ?=
 =?us-ascii?Q?Ud7WkoVyVhqYtHxDz2VZr5RSjiIcBJLgH5nb4DCIvim1dzY+pieAeuF32XKP?=
 =?us-ascii?Q?SixgXrWsmvdhqXj4ALfYlamDR6aiy5k=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1696af-3f9e-44fe-5eb6-08da3cc37c50
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 13:52:33.4527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnY1puX66AHE/BN8URVYxWKZQKlQT3+n92HtatKeZ8I0H18TReKDO2ePUHuabhUKXZ6hCIsF0NaKv/ZAP1HcKUlTRaKCP6qrXvkeaiGhtpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2063
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-23_06:2022-05-23,2022-05-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205230077
X-Proofpoint-GUID: VLGA2tVc56hXcR03SJEFAykiYntgbVlf
X-Proofpoint-ORIG-GUID: VLGA2tVc56hXcR03SJEFAykiYntgbVlf
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Mon, May 23, 2022 at 07:46:57AM +0200, Thomas Osterried wrote:
> 
> Regression due to patch 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0 "ax25: Fix UAF bugs in ax25 timers",
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25/af_ax25.c?id=82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
> and discussion about necessarity of
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25/ax25_subr.c?id=fc6d01ff9ef03b66d4a3a23b46fc3c3d8cf92009
> (because it addresses the same problem).
> 
> 
> Due to patch 82e31755e55fbcea6a9dfaae5fe4860ade17cbc, any ax25 session is cleaned up anymore on disconnect.
> -> netstat --ax25 shows the ex-connected session it in state "LISTEN". Makes ax25 unusable in a production environment.
> => Regression.

Please line wrap your emails at 75 characters.

I tried to apply your patch but the format is wrong...  :/

Hopefully Duoming will read this message but the sad truth is that no
one likes to read RFC patches so you'd be better off sending this as
a real patch instead.

regards,
dan carpenter

