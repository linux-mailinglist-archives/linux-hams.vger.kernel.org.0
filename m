Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C2F46A4A3
	for <lists+linux-hams@lfdr.de>; Mon,  6 Dec 2021 19:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234180AbhLFSeu (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 6 Dec 2021 13:34:50 -0500
Received: from mail-dm6nam11hn2235.outbound.protection.outlook.com ([52.100.172.235]:51277
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233663AbhLFSet (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Mon, 6 Dec 2021 13:34:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqfW9XLecV29jMVt92Nyy84Gofog6g3bqlQXd/NT5/PV9JUWhfcaHAN6ndDn8jOszteVIUUo9cqqiCDcKVN7xE0OlzJaxoKTYPqyqkBd7BB4ZRx7iUgjKG8TM1fdr4Z1Sk00EaOPCtfJ7HbYb2RmPwmaP9wYQAwxJSBiDQUePqD3I9IueXb7woEOM5IghKqYQdeai68p/M+9tpb5CgqsI3J0Wk1QuMiSowfKZzSmP9aPeeglr4h7Ndo02EHeyom1ivGJq0914ANuqjzcnx+AYSo8Zp5XZwwLz/wocRnv1WHy4kvKa7T10aU9CO1Jt42rdvtxEPvppKxTQOxm4jRQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=VXx/kzawYnLDhE0pUhJvr8t8EOBex4ByuDTtRQXBERKr8earxcYfipouigPkJ4Dq/oJ4S1CRn471li7OkAqgFjWmdrA3hVlCuq7XJ3ukB6RGpHPfajNB3gLs+4Aq1aHePbQ5oClLPDSl3Nr87vt6NBAXtjrDc5Hr1iETGQTk6zNnRT4EIK2MoxRxAPaz7NOX3WsaXBGR6H1yVTkupOG1KXNNyYZJ8AwV3GB2oAUqRGnYzCG4IIiIo+xY+KCw3/iX6ClhfZCgNaF+V0Yc1Jt4bj/JPMIBu0KWPGtx2q2+vCUuCNAW/gGoMgzv0pu7gM6352/liBWXa/H6r+dUpf7ehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=qsnpqtas.com smtp.mailfrom=msn.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=msn.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=pcCp64PiyGMW9ZMU+pCvqXkGHFh42WCa4IBkdjsmwgh/ybqjPnHd808zeLFRhdqkjfP0kE2HByZ3BxJp+Ba1j02o9DXz9TkcQ4rUGlZ54slq/OzHXjCEh2GQopT7y893fGh5FGYnYqzReWPYSYt226A+9SoXAUVSujBTc4kTfTY=
Received: from MWHPR17CA0080.namprd17.prod.outlook.com (2603:10b6:300:c2::18)
 by DM8P220MB0406.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:37::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20; Mon, 6 Dec 2021 18:31:11 +0000
Received: from MW2NAM04FT014.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::27) by MWHPR17CA0080.outlook.office365.com
 (2603:10b6:300:c2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:31:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 MW2NAM04FT014.mail.protection.outlook.com (10.13.31.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:31:11 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 3C9F494AF8;
        Mon,  6 Dec 2021 13:30:31 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:29:49 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <bf44bf91-ab47-403c-a0ba-ef9f965a6965@MW2NAM04FT014.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55734e37-0a00-41cf-d953-08d9b8e69422
X-MS-TrafficTypeDiagnostic: DM8P220MB0406:EE_
X-Microsoft-Antispam-PRVS: <DM8P220MB0406942284D77F185C3E215CEB6D9@DM8P220MB0406.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(7116003)(40460700001)(31696002)(2860700004)(82310400004)(7596003)(7366002)(316002)(786003)(6666004)(70586007)(70206006)(3480700007)(47076005)(6200100001)(356005)(82202003)(31686004)(336012)(35950700001)(956004)(6862004)(5660300002)(83380400001)(508600001)(86362001)(8676002)(8936002)(26005)(9686003)(6266002)(2906002)(7406005)(7416002)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXBDOG05Nk5CMGlZVnlhSU53MDljYWFPeEFYUGQydTN6L1dGdDk4U05oSzl2?=
 =?utf-8?B?T01QbWFpNFRJWGtVTmtmMXZSR0VjdUd3UGlMdWc4aHB3VlZIMnpGY2YzWHNJ?=
 =?utf-8?B?NTVPWFU5SDR2SEFYcjV5WGJRWHArM2Uvc1FBbld3MGpRanBpcHZmS3A4M0dJ?=
 =?utf-8?B?enRzcXlMdnVJRmxvUHd5MTRUWTJsNUY2ck8xQWs3NEZ5aVE5cEROMTY0a0lS?=
 =?utf-8?B?cWJXZUZLQVk1RE9xZ2JYeUhoRyt4M25JWk5LT3lRTFYxSW9CVENpK2RnUzBv?=
 =?utf-8?B?N1dJL2wxYnRKK2VjYUhwSlJ1R1pUK0dXK2Y0b0I4bklhVENSMGMvdEoxaFRS?=
 =?utf-8?B?OFpobDZPWHFiYnFPZUJ4VGF2UXl0M3MrN0xZcFJNWUs4cXJyakNPTEpWQS91?=
 =?utf-8?B?cGVNRDBKUktLUldSQVIwZVdLcFhmamtXZmZqRFlTRHBvNGhIcUo5amxvUFdr?=
 =?utf-8?B?K2lMdEVGOUxVUVhVSVFsSnQyNU8wdzJkTzRKMGNHdTlSZlZTQUcyS282Mm94?=
 =?utf-8?B?SkgwU0VnOXVwMjRMbUp4SzI5TmNjSmJleGkzMHR2RVhWN3RYSmRwRnhwazZ3?=
 =?utf-8?B?VzNaMzc4RUd5SXpyUktXNHh3QVh0RXJyYS9TK1NXMmUvcFlCTkEzdzFFZ3hn?=
 =?utf-8?B?Mzkyb0tlaVFLQXRUVlVrUmJEbmpiaFB2a2Fnb2ZsUmpIY1BreUtaTlZWLzQy?=
 =?utf-8?B?SFUxK1MwZHN0Y3lENE44eThlUnR3SWM0Y1JoVWZYdElLSW9VNDdpQ1NFaFp6?=
 =?utf-8?B?bm5uL3ovcXZYNWd5cjJYaDRibkVRR3V0bEVOK1RTVzV2dUpnVTJNdDJCSERh?=
 =?utf-8?B?UTNKanZjd2JKamp6ODBZZFVNWXZab1lFVFUwdGtjT0hRYUFZMk9jMzNqS3Zr?=
 =?utf-8?B?WWJOVkdsc092KzF5WldCL2RzS0p0VUkyUjZMeWYzZVJiVm1IcnZFaDdsaTY2?=
 =?utf-8?B?ZzJGdWE5RHJiSjh4ai9lN2hDWEZ6cFhxWUVRaUE3Q3VGeWl6L3g4QVQzZDZZ?=
 =?utf-8?B?UnpMVjk1eFg0VVhLWUhJV21uUCt1RXJaS1lzL1pyRXdWNWd5Q3I5ZW85SFhK?=
 =?utf-8?B?bitqeTU2Z0RCUC9EeEd1T2FyMFF1UnJLV2IvL3RmV0M0ZVB0YVl3UGM2cFA5?=
 =?utf-8?B?NTRNelZmZkZxRFJ3QnRhLzhBaWxoYUhtYmFNN1Qxck0vMmY0WEVxNERKVW9T?=
 =?utf-8?B?RUl0Q0dESGlGamQ0ZjBOVjM5blo5dXVJVStielY2OHp3Z1ByZ3d2MS9yOERB?=
 =?utf-8?B?c0w3NmNqdkhZZlBqMlNBNUhGcVN5Mzl6YUNkNWdpeWhZTjdtT204SDF2N0Rh?=
 =?utf-8?B?b0lrT3VlMjErQTBmWXphTDg1SWdNS2c2YzdWU3JUSGZJUngveXk5OWU4UVEy?=
 =?utf-8?B?KzAzSHdsTk05M2xrbUlPc2pIM0NUUHJmQklCQjdDaWV5WktKNWhVNWsxOWZr?=
 =?utf-8?Q?b2zFDls5?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:31:11.5061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55734e37-0a00-41cf-d953-08d9b8e69422
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM04FT014.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P220MB0406
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
