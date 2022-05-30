Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7160537A54
	for <lists+linux-hams@lfdr.de>; Mon, 30 May 2022 14:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbiE3MEl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Mon, 30 May 2022 08:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbiE3MEl (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 30 May 2022 08:04:41 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D3651E71
        for <linux-hams@vger.kernel.org>; Mon, 30 May 2022 05:04:35 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 24UC4Yai902342
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
        for <linux-hams@vger.kernel.org>; Mon, 30 May 2022 14:04:34 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1nve8P-0000Zr-Is; Mon, 30 May 2022 14:04:33 +0200
From:   Thomas Osterried <thomas@osterried.de>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Date:   Mon, 30 May 2022 14:04:32 +0200
Subject: eax25 Poblems: setsockopt() before bind(), and
 setsockopt(AX25_EXTSEQ) after connect()
Message-Id: <964A54A9-109B-47CF-A474-B7EAF87EE2D8@osterried.de>
To:     linux-hams@vger.kernel.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

Roland was testing EAX25 (AX25_EMODULUS).
Interface default mode was AX25_MODULUS.
He used call(1) with option -m e.

But SABM+ instead of SABME+ was sent.


Cause:
call used first setsockopt(), then bind().

Flow:
  userspace socket() ->
  kernel:
    ax25_create()
     -> ax25_create_cb()
       -> ax25_fillin_cb(ax25, NULL)   // defaults for ax25_cb

  user calls bind() -> ax25_bind()
  There:
        if (ax25_dev) {
                ax25_fillin_cb(ax25, ax25_dev); // overwrites ax25_cb with device defaults

  because if ax25_dev != 0:
  ax25_fillin_cb calls ax25_fillin_cb_from_dev(ax25, ax25_dev);

  This overwrites (wich device defaults) all 10 variables which may have changed with
  setsockopt() (after socket() and before bind()).


As far as I know, a programmer may expect he could call setsockopt() before and / or after bind().


Solution:


a) It think would be quite ugly to set for every variable a bool "xxx_was_changed__do_not_touch", 
   for preventing ax25_fillin_cb_from_dev() to overwrite changed variables.

b) printk a notice, that a program should use setsockopt() after bind()


Any comments? What do you prefer?


Btw, I already corrected the userspace call program in ax25-apps.




Another fix I addeds:

setsockopt() is allowed to be called after connect().
But as soon the SABM+ is sent, we are not allowed to change the modulus.
[SABME+ would have indicated a AX25_EMODULUS session, due to protocol spec]
If we'd allow this, remote site acknowledges with UA an (from his view)
AX25_MODULUS session, but we are in mode AX25_EMODULUS.
-> setsockopt(AX25_EXTSEQ) for not-unconnected sessions is now rejected.





diff -Naurp net/ax25/a/af_ax25.c net/ax25/b/af_ax25.c
--- a/af_ax25.c 2022-05-30 12:26:10.564918877 +0200
+++ b/af_ax25.c 2022-05-30 13:21:16.957386836 +0200
@@ -573,6 +573,8 @@ static int ax25_setsockopt(struct socket
        lock_sock(sk);
        ax25 = sk_to_ax25(sk);
 
+        if (!ax25->ax25_dev && optname != SO_BINDTODEVICE)
+               printk(KERN_NOTICE "ax25_setsockopt(): %s: your socket options may be overwritten by device defaults later when you bind(). Use setsockopt() after bind()\n", current->comm);
        switch (optname) {
        case AX25_WINDOW:
                if (ax25->modulus == AX25_MODULUS) {
@@ -639,6 +641,11 @@ static int ax25_setsockopt(struct socket
                break;
 
        case AX25_EXTSEQ:
+               if (sk->sk_type == SOCK_SEQPACKET &&
+                  (sock->state != SS_UNCONNECTED)) {
+                       res = -EISCONN;
+                       break;
+                }
                ax25->modulus = opt ? AX25_EMODULUS : AX25_MODULUS;
                break;

