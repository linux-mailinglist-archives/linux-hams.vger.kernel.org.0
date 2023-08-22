Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E9B784F88
	for <lists+linux-hams@lfdr.de>; Wed, 23 Aug 2023 06:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbjHWEKO (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 23 Aug 2023 00:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjHWEKN (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 23 Aug 2023 00:10:13 -0400
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61A3E56
        for <linux-hams@vger.kernel.org>; Tue, 22 Aug 2023 21:10:07 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-60-64e571b7338f
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 94.06.10987.7B175E46; Wed, 23 Aug 2023 07:40:55 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=C5XRz2HPavdRnCOZjPaze1JrCt1TibjPiTKrJuS0pSUckL8wERUwLmg/6/61QO65C
          xGlvShKRNr+IWZwkODUlhZc9vc6l967EUPDAkXE+ek/hSHveBQTV7coPG5QlX+Deq
          At8VeT8NZcj4ypEqgiNyN+Pwa3WT9mhh7EnWQhEqE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=T1rbWlaYD1oYxdplINh92m5lwiqQRwhpngmnMya0yLfDls7ZOcUnKdNrOvJo3gQOg
          dgYRtIc74MNm8P8ZT0WIwfRoHP8H+r5a+pqjL9+3J1Y5RLxlkaKTfkpm8rfl2Wigo
          vwrX+yrcbpKJbGf/Bx3Dhb97jSszYxWaYmz8O93Vs=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:01 +0500
Message-ID: <94.06.10987.7B175E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-hams@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:15 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW3d74dMUgyunBCyubb/L5MDo8XmT
        XABjFJdNSmpOZllqkb5dAlfGknUXWAp2M1e09S9iaWB8zNTFyMEhIWAi0XLWpYuRi0NIYA+T
        xK2bV1lAHBaB1cwSq64tY4dwHjJLfD/6hxWirJlRonH9JKAyTg5eAWuJjf2f2UBsZgE9iRtT
        p7BBxAUlTs58wgIR15ZYtvA1M8g6ZgE1ia9dJSBhYQExiU/TQBZwcogIyEl8nH8SzGYT0JdY
        8bWZEcRmEVCVODbpLtgYIQEpiY1X1rNNYOSfhWTbLCTbZiHZNgth2wJGllWMEsWVuYnAUEs2
        0UvOzy1OLCnWy0st0SvI3sQIDMPTNZpyOxiXXko8xCjAwajEw/tz3ZMUIdbEMqCuQ4wSHMxK
        IrzS3x+mCPGmJFZWpRblxxeV5qQWH2KU5mBREue1FXqWLCSQnliSmp2aWpBaBJNl4uCUamCs
        EulYzdy+ycnP4NXMQ4c6lzdXveJs/BYQJDaNrX2pZdOUpCP/59tqeWjzMDbu9lX4O+f0oohO
        lSWRi60WJjibrJiY5GDPxRGt9+u2965rAWdt7+14LvJ341mjgPYbu0K/X7H+pfopufnScm/X
        qgSZXbnMJfcEM/3nT987QVfozYpnqy+v8bqgxFKckWioxVxUnAgArsK7HT8CAAA=
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_PASS,
        T_SPF_HELO_TEMPERROR,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 T_SPF_HELO_TEMPERROR SPF: test of HELO record failed
        *      (temperror)
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

