Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AA04772A9
	for <lists+linux-hams@lfdr.de>; Thu, 16 Dec 2021 14:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhLPNGQ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 16 Dec 2021 08:06:16 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42918 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234626AbhLPNGP (ORCPT
        <rfc822;linux-hams@vger.kernel.org>);
        Thu, 16 Dec 2021 08:06:15 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGCE7Ze004312;
        Thu, 16 Dec 2021 13:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=4eW4zllmH57Q4b5k9WLykTxxet/J9cCKbfaJH3KASZU=;
 b=iM5BcOfEVTH+TmtShty/IdgAbrAaS+yMVmc6AgEwSQtsSPm7hKv7DbOVos5jLdMYjrr0
 9BnLpZxl8U1NagOuX5ApVWoLFL3+rPAsMBCW5KBZhxwdF1ZxN5RbCRMbcRUZU9gA/jn4
 TmfSE+1E63dqI6hE0RGLBnmWimVQ/NUjekV2Ha2H6Q4JJPHdek3JTPReXdwcXlwUtldN
 GjwT7+fM8WzYID6+jYnSuw5ditS419Lc+wmSeNlYv2qgxW2iCaGH6DqhdiSUsABOHiQi
 dPlWWo6Yl6DOR/jZm02oX9rRGN+fGaZftN9h4BnWrdKyOJzbOeK3AUieL7US7KB3Q5x6 uA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cykm5aqsw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Dec 2021 13:06:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BGD6ArB188848;
        Thu, 16 Dec 2021 13:06:11 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        by aserp3030.oracle.com with ESMTP id 3cyju9ukb0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Dec 2021 13:06:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE3J76z7lnIvWigIHNZiUrsQ95Kvsaab36W4lqOeMYD1QYWRhitTw3pKU0mdYEZDjM89RCDZ1YSETm/Mc51SjDvP0eN+WcVolRO5R9Z3AmZXDX5qbEZYUe7xaJPPPOqLvImjr8cmpImxdCEkk2LNMny7vbmyQywHhVqAXYJ6LTVaBtq4J3yOaqjyvvW2bZwXJiP88zxOGx3PvdoEN4BDX79N5J87xBqXZuoIu8lOwOeoEupSeHvzrlOI3yb1Phf9KBbIbrA/XHPAmCa3WUDa6DjPz70D48wIa02S0zZ2vpTmUD5XTLhRaf9w2ABqKyVmhqQsVYxjo67eeOl5d1FrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eW4zllmH57Q4b5k9WLykTxxet/J9cCKbfaJH3KASZU=;
 b=Xpgoft/K+PNOBxkBonlNqo3ukNNGXuyXssvF7zTDngVDkAPqirjAVZz6nswF5WX+iWKu+BQOVhUoImfaHHijf7y0kM9CZYiDi4io1sQv1swJ7JZum8BFlc2szlB3ZTCoeZHoVCW8xRh5IEHcS4whVn25Khp0bQM+rFRuBuFljby84ktQS5PtbSS9kJgej6Kiwra+W9C3F1s8a9PzqEOTAoA9EInAcR4Ytg2zfZFySOo7dfdruj/qJ2NaDlIGa8trWdHl7PxQN5TOlXa8CRzvc7zJuDPmt7AvlCqhsC9+IFJ/SkyE4XUEIHCJIs8hxWrfNFsxijlTIvEUUAaj6lKQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eW4zllmH57Q4b5k9WLykTxxet/J9cCKbfaJH3KASZU=;
 b=bd2x/s4hMFpV09s//7cPhilUWA7G3QyjFbCRAE2eNAzI7q0Z4ka7jf4G82JgEixj1T+FZn2WyVACMQl846ORS4cMQlIPeSMw+VZvafpVEv/C/me2egy8IV/Y9UTARMsGNY/QUWujwSY1aE886JcN9oAiAmQYprOrPzNSJrgbOLw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2127.namprd10.prod.outlook.com
 (2603:10b6:301:33::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 13:06:07 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 13:06:07 +0000
Date:   Thu, 16 Dec 2021 16:05:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hch@lst.de
Cc:     linux-hams@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [bug report] net: pass a sockptr_t into ->setsockopt
Message-ID: <20211216130556.GA11248@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0073.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4609b8c4-d7f5-47ad-29ee-08d9c094d2af
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2127:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2127038B3D8D912011DA21828E779@MWHPR1001MB2127.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yjCcwYn0PdULq0+uFeObGZoUkyMqZCS9fEWjw0kcGKKm8RDYicGaJp8BPNOPVRAXUG59cRdrautLU8xEn0I2ATGNbrz0msm+Fhw6QcjWKivogpH2oWljAFe7N7TYg21y00fsnos65XxQWDeYITcowd/HvzlpR+0DMz9Lb214qnEHjwnnThK5As6BNRnhgIIz9kyQ9IaHBbYsjhP91sc7B6XcBZZ286/+1r5K8RUbc8EoJiOADX4XXE7j04P9PMzZNONLII3PWs2ixgHS/w+yLWPP99TOYoPfvCK+0aQ7C+wtx/rMlbB6pPjDdciBKyklMQ5WFR7zSe7jRN+t5CyxSxIoFSTYMpzAw6qHCxcWB/VoWHP88wvGT1pYolSu2oncW7BnuztVfZvyFRG/IZ/sAj0u5UIQTIvzyeBxwAd2OZhs2KpTTfdg2fFGy9mXXZgvcfpVPPVnjRWyHjlgk8vLny1RFyAQE0LNSRrYhidemlNbgWaZIhkFAoZiYqFD6b8U86TJMjp0zXHMSae03Z5I3U7m5Dfdz7CcvqPUpmfEGzDL6JfGWBQaguDv1hXo3LGQmfR+rxMx0zRtArcOb7IIp5h6+Jg5RiCp4YYLgd7omao3mmCUUiENMSxWlmCD6C8v+8Fn0qUqHPtft7PkmkeqTKhSo6XQ1C/+1boDFgK22cIWtmc3oJcRoAyKvx2zfZKpRaVjn1vM5uezYWnnw6bxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(44832011)(38350700002)(9686003)(33656002)(6486002)(66556008)(8676002)(316002)(6512007)(186003)(26005)(8936002)(66476007)(33716001)(2906002)(508600001)(83380400001)(38100700002)(66946007)(6916009)(6666004)(52116002)(5660300002)(1076003)(6506007)(86362001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MKRnld6Kzlb9zJL+AmaZAHvIcr9G8BxGRR/Jz5F6Q4MCdyvG1RAw6twcvw0V?=
 =?us-ascii?Q?W38mYqs1LjnSo5S5hyAfg0Rqs1xqnlMoAztc4a5s+yyoU2yxghrYdfEGezwP?=
 =?us-ascii?Q?GG0bBNCRqV7Z8HTLYuw/H5QsWkOjAZgbHPgevde9YCDKIX0uC4CHf/8UvL/B?=
 =?us-ascii?Q?+PW2uGqJHTT8mzp7GlstGGZOjZL0VtG49UqYSJC/02emHtO+9vmSmsUcCkD5?=
 =?us-ascii?Q?q64VtjfOMasRnyjoY6bVcYaBtTkDq5nK45MrgwzMKKzlDLgytMGfOXtVg8J1?=
 =?us-ascii?Q?Hb0JMZbrJmtv2mGve8SxKZ2QZ9S6SVF2xQXdC40UHuSWIN56czQgiPNxB04x?=
 =?us-ascii?Q?yE26Zvoq36IdtWctB9e8kv/gQvYux7I+oj60G7ggpK/qBX+NVLbVWAn9SRKB?=
 =?us-ascii?Q?7Q9GQE2ZbbXtStkFaj2NHn6/34iWSnz8cUrVUHIGpl5n0FWS7vef6k0dDYZ4?=
 =?us-ascii?Q?FvX4KaFQCnBg+VEI3hMyp6cf42z98KiLP8x0NPczVYt4DXR19BdTVE6D8inc?=
 =?us-ascii?Q?nI5GZ5K7mGAxg65zluo0WrqJdUyNkXVgJiXUbT5lf6rQo2YMO/tSiOugRNfu?=
 =?us-ascii?Q?NcGpHlfNnIAKmarqIaAxEXww1WRY2SOBSifQxdR29hlW/e/W4AWon59T+s81?=
 =?us-ascii?Q?aarUYMMQEbluCz4GaCDxVcSIk2/QWjKbDSfHMyItg7c3Yn6SRgCuDpwjkz+I?=
 =?us-ascii?Q?CBF6PZcElo/JoS7t0/rCCNlNWpAY/XAFw3E3jXHREyTAyOJIxS/0r8zJ8/AK?=
 =?us-ascii?Q?Cc3bjd0/d3n57ut7PnGvIm5a7/KsZMGOKT9i8wKVLpVhRgcbXNsgMunven9f?=
 =?us-ascii?Q?j9Bt53WKMYr7/+ytEU7gfOjgNwkmSjSwpQauEctlingX5WFduvL2oTd5xgqs?=
 =?us-ascii?Q?/5Rdf0dSX4N9pvS5HavE2AAig1pABuEBCLVbwnkm/ZJKpaGvPGMGddOWpdFY?=
 =?us-ascii?Q?7skC8Iy6uJmzy6r1m/f1i63UcUdwB135RCS4htkotX5d5lWYRzpVDR9ZHERM?=
 =?us-ascii?Q?GkRQOQYp/DUOiWP18LKHdavDwlJiK5Z7kEOU5E1Ad5fVf/MyyCnd5aK7TECy?=
 =?us-ascii?Q?+83B8KnMwsEB7p+fEEaHQRnMSYCUVM1ytjSkJKfQl8pxxnFO1UMjGLc03FEb?=
 =?us-ascii?Q?E/MIGYTbsgChoCsgkFldqX0dK7O0BdR9bkeul3fuubQN4rQFD10rdwNUgpXm?=
 =?us-ascii?Q?LE30MSOOyoNegBB70EE7IpPD7D6RNk4632YdtMGdM7gNik+urT08PnsQch5k?=
 =?us-ascii?Q?a9I4jW/ANiLg8xDqQSP/WKy/XxOv+qT/FsPw7MPX1NZa4jLr9AqgPVqZhw8J?=
 =?us-ascii?Q?O7RGndbhHecvN4sL6w1OP2SvnyPpXjUIJsYs4sPpvFb4vskZvy0bPZOnmliA?=
 =?us-ascii?Q?rxqSTpUVYyQirD+So1B2hf7nno9KzokdtCbeSmwVRiA3bBPdHCYdDs2aEDMN?=
 =?us-ascii?Q?hS1qdm7qv8DVis41kBJLaJp5lptS+y2zCu7PrMv69AiQdQ31A+ZB2V0Xaojx?=
 =?us-ascii?Q?BW34pbnudkHftnC+1Y6SZIF3vO++m6eqibTGEayl2+CNUbURQh6YimMe5UnT?=
 =?us-ascii?Q?ttHgnbw6C1TZ1i6hrNWMlx8avSfjNRD+sPexmvpd0BSHFMC6IBGYG4YjMWU/?=
 =?us-ascii?Q?ixru9pgjUVsvK9h4zCy3spwMG88baSG4jD9nHw30W7O9wsw2HwTdqz3zjAtm?=
 =?us-ascii?Q?RUn9wJdEe2Rk5OoDNLdkhBpXdGI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4609b8c4-d7f5-47ad-29ee-08d9c094d2af
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 13:06:07.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htzs4XO7iTz4y98lyrMzGsolyZr7qWDGiYCP/KQDyjejGX6Awb0bMs/hdzfKy7zvTZlxCd4ukfl0F20AsQI2HcYLVpLOu3bvdP6r51nwgcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2127
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10199 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=893 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160074
X-Proofpoint-GUID: auVI6lsOnctKgIVnrQtnyDkwIa6VB8By
X-Proofpoint-ORIG-GUID: auVI6lsOnctKgIVnrQtnyDkwIa6VB8By
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello Christoph Hellwig,

The patch a7b75c5a8c41: "net: pass a sockptr_t into ->setsockopt"
from Jul 23, 2020, leads to the following Smatch static checker
warnings:

net/netrom/af_netrom.c:309 nr_setsockopt() warn: not copying enough bytes for '&opt' (8 vs 4 bytes)
net/bluetooth/hci_sock.c:1940 hci_sock_setsockopt() warn: not copying enough bytes for '&opt' (4 vs 2 bytes)
net/bluetooth/l2cap_sock.c:1088 l2cap_sock_setsockopt() warn: not copying enough bytes for '&opt' (4 vs 2 bytes)
net/bluetooth/l2cap_sock.c:1119 l2cap_sock_setsockopt() warn: not copying enough bytes for '&opt' (4 vs 1 bytes)
net/ax25/af_ax25.c:546 ax25_setsockopt() warn: not copying enough bytes for '&opt' (8 vs 4 bytes)

net/netrom/af_netrom.c
    296 static int nr_setsockopt(struct socket *sock, int level, int optname,
    297                 sockptr_t optval, unsigned int optlen)
    298 {
    299         struct sock *sk = sock->sk;
    300         struct nr_sock *nr = nr_sk(sk);
    301         unsigned long opt;
                ^^^^^^^^^^^^^^^^^^

    302 
    303         if (level != SOL_NETROM)
    304                 return -ENOPROTOOPT;
    305 
    306         if (optlen < sizeof(unsigned int))
    307                 return -EINVAL;
    308 
--> 309         if (copy_from_sockptr(&opt, optval, sizeof(unsigned int)))

Originally this was if (get_user(opt, (unsigned int __user *)optval))
which is weird but actually works.  Now the last two bytes are
uninitialized.

    310                 return -EFAULT;
    311 
    312         switch (optname) {
    313         case NETROM_T1:
    314                 if (opt < 1 || opt > ULONG_MAX / HZ)
    315                         return -EINVAL;
    316                 nr->t1 = opt * HZ;
    317                 return 0;

regards,
dan carpenter
