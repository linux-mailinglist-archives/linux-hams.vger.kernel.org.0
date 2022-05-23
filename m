Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660875312A7
	for <lists+linux-hams@lfdr.de>; Mon, 23 May 2022 18:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236940AbiEWOPp (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 23 May 2022 10:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236939AbiEWOPn (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 23 May 2022 10:15:43 -0400
X-Greylist: delayed 470 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 23 May 2022 07:15:40 PDT
Received: from zg8tmtyylji0my4xnjqunzqa.icoremail.net (zg8tmtyylji0my4xnjqunzqa.icoremail.net [162.243.164.74])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 89EF859943
        for <linux-hams@vger.kernel.org>; Mon, 23 May 2022 07:15:40 -0700 (PDT)
Received: by ajax-webmail-mail-app2 (Coremail) ; Mon, 23 May 2022 22:07:03
 +0800 (GMT+08:00)
X-Originating-IP: [124.236.130.193]
Date:   Mon, 23 May 2022 22:07:03 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   duoming@zju.edu.cn
To:     "Thomas Osterried" <thomas@osterried.de>
Cc:     linux-hams@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        "Paolo Abeni" <pabeni@redhat.com>
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
  82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgCHOAgHlYtikYSiAA--.14775W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgwTAVZdtZ1YqQAJsH
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

SGVsbG8sCgpPbiBNb24sIDIzIE1heSAyMDIyIDA3OjQ2OjU3ICswMjAwIFRob21hcyB3cm90ZToK
Cj4gUmVncmVzc2lvbiBkdWUgdG8gcGF0Y2ggODJlMzE3NTVlNTVmYmNlYTZhOWRmYWFlNWZlNDg2
MGFkZTE3Y2JjMCAiYXgyNTogRml4IFVBRiBidWdzIGluIGF4MjUgdGltZXJzIiwKPiAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC9jb21taXQvbmV0L2F4MjUvYWZfYXgyNS5jP2lkPTgyZTMxNzU1ZTU1ZmJjZWE2YTlkZmFh
ZTVmZTQ4NjBhZGUxN2NiYzAKPiBhbmQgZGlzY3Vzc2lvbiBhYm91dCBuZWNlc3Nhcml0eSBvZgo+
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L2NvbW1pdC9uZXQvYXgyNS9heDI1X3N1YnIuYz9pZD1mYzZkMDFmZjllZjAz
YjY2ZDRhM2EyM2I0NmZjM2MzZDhjZjkyMDA5Cj4gKGJlY2F1c2UgaXQgYWRkcmVzc2VzIHRoZSBz
YW1lIHByb2JsZW0pLgo+IAo+IAo+IER1ZSB0byBwYXRjaCA4MmUzMTc1NWU1NWZiY2VhNmE5ZGZh
YWU1ZmU0ODYwYWRlMTdjYmMsIGFueSBheDI1IHNlc3Npb24gaXMgY2xlYW5lZCB1cCBhbnltb3Jl
IG9uIGRpc2Nvbm5lY3QuCj4gLT4gbmV0c3RhdCAtLWF4MjUgc2hvd3MgdGhlIGV4LWNvbm5lY3Rl
ZCBzZXNzaW9uIGl0IGluIHN0YXRlICJMSVNURU4iLiBNYWtlcyBheDI1IHVudXNhYmxlIGluIGEg
cHJvZHVjdGlvbiBlbnZpcm9ubWVudC4KPiA9PiBSZWdyZXNzaW9uLgoKSXMgdGhlcmUgYW55IHdh
eXMgdG8gcmVwcm9kdWNlIHRoaXMgcHJvYmxlbT8gCgo+IFRoaXMgaXMgbXkgcHJvcG9zYWwgZm9y
IGEgZml4Lgo+IEknZCBhcHByZWNpYXRlIHlvdSB0ZXN0IGFuZCBnaXZlIGZlZWRiYWNrLgoKSSB3
aWxsIHRlc3QgdGhpcyBzb2x1dGlvbiBhbmQgZ2l2ZSBmZWVkYmFjay4KCkJlc3QgcmVnYXJkcywK
RHVvbWluZyBaaG91Cg==
