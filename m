Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFACC4A468C
	for <lists+linux-hams@lfdr.de>; Mon, 31 Jan 2022 13:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241017AbiAaMFZ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 31 Jan 2022 07:05:25 -0500
Received: from shiva-su1.sorbonne-universite.fr ([134.157.0.152]:59634 "EHLO
        shiva-su1.sorbonne-universite.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349744AbiAaMFC (ORCPT
        <rfc822;linux-hams@vger.kernel.org>);
        Mon, 31 Jan 2022 07:05:02 -0500
Received: from narayana.dsi.upmc.fr (narayana.dsi.upmc.fr [134.157.0.214])
        by shiva-su1.sorbonne-universite.fr (Postfix) with ESMTP id B71A74991808;
        Mon, 31 Jan 2022 13:04:59 +0100 (CET)
Received: from [44.168.19.21] (lfbn-idf1-1-460-252.w86-242.abo.wanadoo.fr [86.242.166.252])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pidoux)
        by narayana.dsi.upmc.fr (Postfix) with ESMTPSA id ACE3885DEEA5;
        Mon, 31 Jan 2022 13:04:59 +0100 (CET)
Content-Type: multipart/mixed; boundary="------------6TJtqtZ091Xa4Tzkd7yYMq3V"
Message-ID: <f571bd58-b16d-9e99-1ce0-c98e1f327924@free.fr>
Date:   Mon, 31 Jan 2022 13:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [ROSE] rose socket destination address empty in connect tests
Content-Language: fr
To:     David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org
Cc:     F3KT <f3kt@free.fr>
References: <4B2CD772.1030106@upmc.fr> <4B2D1025.1020106@gmail.com>
 <4B2E6729.1090102@free.fr> <4B507FAA.8010007@free.fr>
 <20100115203654.GA3084@del.dom.local> <4DFA6A59.2000709@free.fr>
 <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
 <2394eae7-dada-f43e-40b9-fae929212913@trinnet.net>
From:   "Bernard Pidoux , f6bvp" <f6bvp@free.fr>
Organization: Dimension Parabole
In-Reply-To: <2394eae7-dada-f43e-40b9-fae929212913@trinnet.net>
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------6TJtqtZ091Xa4Tzkd7yYMq3V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I noticed and already reported elsewhere that rose protocol had been 
broken since kernel 5.4.83.

The symptom is a very long delay during some connect requests 
terminating after a connection timed out.

As suggested by David, using "rose_call" utility from ax25tools package, 
I finally found that the reason of failure is an empty destination 
address as shown in rose sockets displayed by netstat.

By the way, I am glad rose protocol dump patch I committed a while ago 
is now incorporated into netstat, despite --rose option is still 
undocumented in netstat manual and help. Only --ax25 and --netrom are 
documented.

In attached file I demonstrate that rose socket destination address is 
correctly populated when rose_call is used in kernel 5.4.79 but 
unfortunately the address field is empty in kernel 5.4.83 and following 
kernels. I added netrom_call for comparison.

This explains clearly why connect request stays in a waiting loop with 
rose protocole !

Now, one has to find where rose socket destination address is erased or 
forgotten in rose module or libc !

Bernard, f6bvp


--------------6TJtqtZ091Xa4Tzkd7yYMq3V
Content-Type: text/plain; charset=UTF-8; name="Rose_call_comparison.txt"
Content-Disposition: attachment; filename="Rose_call_comparison.txt"
Content-Transfer-Encoding: base64

TGludXggZjZidnAtVWJ1bnR1IDUuNC4wLTk2LWdlbmVyaWMgIzEwOS1VYnVudHUgU01QIFdl
ZCBKYW4gMTIgMTY6NDk6MTYgVVRDIDIwMjIgeDg2XzY0IHg4Nl82NCB4ODZfNjQgR05VL0xp
bnV4CgpuZXRyb21fY2FsbCBuZXRub2QgZjZidnAgZjZidnAtMTQKbmV0cm9tX2NhbGwgbmV0
bm9kIGY2YnZwIGY2YnZwLTIKcm9zZV9jYWxsIHJvc2UwIGY2YnZwIGY2YnZwLTQgMjA4MDE3
NTUyNApyb3NlX2NhbGwgcm9zZTAgZjZidnAgZjZidnAtOCAyMDgwMTc1NTIwCgpuZXRzdGF0
IC0tcm9zZSAtLW5ldHJvbQpBY3RpdmUgTkVUL1JPTSBzb2NrZXRzIGF0IGY2YnZwLTQgKFVi
dW50dSA1LjQuMC05NikKVXNlciAgICAgICBEZXN0ICAgICAgIFNvdXJjZSAgICAgRGV2aWNl
ICBTdGF0ZSAgICAgICAgVnIvVnMgICAgU2VuZC1RICBSZWN2LVEKRjZCVlAtMCAgICBGNkJW
UC0xNCAgIEY2QlZQLTIgICAgbnIwICAgICBDT05OIFNFTlQgICAgMDAwLzAwMCAgMCAgICAg
ICAwICAgICAKRjZCVlAtMCAgICBGNkJWUC0yICAgIEY2QlZQLTIgICAgbnIwICAgICBFU1RB
QkxJU0hFRCAgMDAwLzAwMSAgMCAgICAgICAwICAgICAKRjZCVlAtMCAgICBGNkJWUC0yICAg
IEY2QlZQLTIgICAgbnIwICAgICBFU1RBQkxJU0hFRCAgMDAxLzAwMCAgMCAgICAgICAwICAg
ICAKKiAgICAgICAgICAqICAgICAgICAgIEY2QlZQLTIgICAgbnIwICAgICBMSVNURU5JTkcg
ICAgMDAwLzAwMCAgMCAgICAgICAwICAgICAKKiAgICAgICAgICAqICAgICAgICAgIEY2QlZQ
LTIgICAgbnIwICAgICBMSVNURU5JTkcgICAgMDAwLzAwMCAgMCAgICAgICAwCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpBY3RpdmUgUk9TRSBzb2NrZXRzIGF0IGY2YnZwLTQgKFVidW50
dSAgNS40LjAtOTYpCmRlc3RfYWRkciAgIGRlc3RfY2FsbCAgc3JjX2FkZHIgICAgc3JjX2Nh
bGwgIGRldiAgIGxjaSBuZWlnaCAgIHN0YXRlCiAgICAgICAgICAgIEY2QlZQLTggICAgMjA4
MDE3NTUyNCAgRjZCVlAtMCAgIHJvc2UwICAgMSAgICAgMiAgIEVTVEFCTElTSEVECiAgICAg
ICAgICAgIEY2QlZQLTQgICAgMjA4MDE3NTUyNCAgRjZCVlAtMCAgIHJvc2UwICAgMiAgICAg
MSAgIERJU0MgU0VOVAogICAgICAgICAgICAqICAgICAgICAgIDIwODAxNzU1MjQgIEZQQUQt
MCAgICByb3NlMCAgIDAgICAgIDAgICBMSVNURU5JTkcKICAgICAgICAgICAgKiAgICAgICAg
ICAyMDgwMTc1NTI0ICA/Pz8/Pz8tPyAgcm9zZTAgICAwICAgICAwICAgTElTVEVOSU5HCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpyb3NlIG5vZGUgZjZidnAtNCBjb25uZWN0ZWQgYnkg
YSByb3NlX2NhbGwgZnJvbSBmNmJ2cCBhdCByZW1vdGUgbm9kZSBmNmJ2cC04CnJvc2VfY2Fs
bCByb3NlMCBmNmJ2cCBmNmJ2cC00IDIwODAxNzU1MjQKcm9zZV9jYWxsIHJvc2UwIGY2YnZw
IGY2YnZwLTggMjA4MDE3NTUyMApBY3RpdmUgTkVUL1JPTSBzb2NrZXRzIGF0IGY2YnZwLTgg
KGtlcm5lbCA1LjQuNzkpClVzZXIgICAgICAgRGVzdCAgICAgICBTb3VyY2UgICAgIERldmlj
ZSAgU3RhdGUgICAgICAgIFZyL1ZzICAgIFNlbmQtUSAgUmVjdi1RCiogICAgICAgICAgKiAg
ICAgICAgICBGNkJWUC0yICAgIG5yMCAgICAgTElTVEVOSU5HICAgIDAwMC8wMDAgIDAgICAg
ICAgMCAgICAgCiogICAgICAgICAgKiAgICAgICAgICBGNkJWUC0yICAgIG5yMCAgICAgTElT
VEVOSU5HICAgIDAwMC8wMDAgIDAgICAgICAgMAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
bmV0cm9tX2NhbGwgbmV0bm9kIGY2YnZwIEJWUE44OmY2YnZwLTE0Cm5ldHJvbV9jYWxsIG5l
dG5vZCBmNmJ2cCBCVlBONDpGNkJWUC0yCnNvY2tldHMgTkVUL1JPTSBhY3RpdmVzIGF0IGY2
YnZwLTggKGtlcm5lbCA1LjQuNzkpClV0aWxpc2F0ciAgRGVzdCAgICAgICBTb3VyY2UgICAg
IFBlcmlwaCAgRXRhdCAgICAgICAgIFZyL1ZzICAgIFNlbmQtUSAgUmVjdi1RCkY2QlZQLTAg
ICAgRjZCVlAtMiAgICBGNkJWUC0xNCAgIG5yMCAgICAgQ09OTiBTRU5UICAgIDAwMC8wMDAg
IDAgICAgICAgMCAgICAgCkY2QlZQLTAgICAgRjZCVlAtMTQgICBGNkJWUC0xNCAgIG5yMCAg
ICAgRVNUQUJMSVNIRUQgIDAwMC8wMDEgIDAgICAgICAgMCAgICAgCkY2QlZQLTAgICAgRjZC
VlAtMTQgICBGNkJWUC0xNCAgIG5yMCAgICAgRVNUQUJMSVNIRUQgIDAwMS8wMDAgIDAgICAg
ICAgMCAgICAgCiogICAgICAgICAgKiAgICAgICAgICBGNkJWUC0xNCAgIG5yMCAgICAgTElT
VEVOSU5HICAgIDAwMC8wMDAgIDAgICAgICAgMCAgICAgCiogICAgICAgICAgKiAgICAgICAg
ICBGNkJWUC0xNCAgIG5yMCAgICAgTElTVEVOSU5HICAgIDAwMC8wMDAgIDAgICAgICAgMAot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnJvc2Ugbm9kZSBmNmJ2cC04IGNvbm5lY3RlZCBi
eSBhIHJvc2VfY2FsbCBmcm9tIGY2YnZwLTgKcm9zZV9jYWxsIHJvc2UwIGY2YnZwIGY2YnZw
LTggMjA4MDE3NTUyMApBY3RpdmUgUk9TRSBzb2NrZXRzIGF0IGY2YnZwLTggKGtlcm5lbCA1
LjQuNzkpCmRlc3RfYWRkciAgIGRlc3RfY2FsbCAgc3JjX2FkZHIgICAgc3JjX2NhbGwgIGRl
diAgIGxjaSBuZWlnaCAgIHN0YXRlCjIwODAxNzU1MjQgIEY2QlZQLTQgICAgMjA4MDE3NTUy
MCAgRjZCVlAtMCAgIHJvc2UwICAzMiAgICAyMyAgIEVTVEFCTElTSEVECjIwODAxNzU1MjAg
IEY2QlZQLTAgICAgMjA4MDE3NTUyMCAgRjZCVlAtOCAgIHJvc2UwICAzMSAgICAgMSAgIEVT
VEFCTElTSEVECiogICAgICAgICAgICogICAgICAgICAgMjA4MDE3NTUyMCAgRjZCVlAtMSAg
IHJvc2UwICAgMCAgICAgMCAgIExJU1RFTklORwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
Cg==

--------------6TJtqtZ091Xa4Tzkd7yYMq3V--
