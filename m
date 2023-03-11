Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F84E6B609D
	for <lists+linux-hams@lfdr.de>; Sat, 11 Mar 2023 21:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjCKUtL (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 11 Mar 2023 15:49:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjCKUtK (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 11 Mar 2023 15:49:10 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137E45F218
        for <linux-hams@vger.kernel.org>; Sat, 11 Mar 2023 12:49:09 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id h9so8878031ljq.2
        for <linux-hams@vger.kernel.org>; Sat, 11 Mar 2023 12:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678567747;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2kGUq7Kdmy3YCIq2jBACr2A/la99uzNeOtVsLF2JIb8=;
        b=X0NFg2SgE8PPDcO+TK7qUadmlEKvdeK1c5ZhJ2IGmaPO64dbx7Xi2fyB+83NN746O9
         McuM6ThKG/VhTFrpSzOQmf6jnlXf5PnGvEC4dSXe35BdsdkLeQGXLW4+Lk07wRziS26Z
         sc3doWLdseHhkuyXsXI88PMgYFAeaqxoXe2hMq7D6jgCdmicP0ewXW1OGfuoYpIfAzJ7
         feIDOGjAe56UQjieUKf0L6rmXYj9+a+yFyetiqvg6BwNRD6yXpy+k9TfmMFlomfCpnPb
         eXRNQ4ZTB/9XtIv95Lh8p2jj7l6P8YoY9Ndcb4dRcCl3DmZahGZ3uO9aDW2yfx/04c6z
         iqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678567747;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2kGUq7Kdmy3YCIq2jBACr2A/la99uzNeOtVsLF2JIb8=;
        b=2FGsaKi+SWmhk9fGBtd9iY3JYJ/GPhD1XIwe6H4IBeI4iqOiw6Z8z/40rK5VFEcSUi
         8AUzh8vVWhub8/zYSojL4N5RoaCpZcSgpvHJVmDRDp6JgFx9jVx96uIBrQ+qyRUAHvIE
         amoHy5cR2Vd1IEO7ip4cS9Bo8Ge4Zk/sfO/TOy4Aq3xqIuaNyLs8h7WnO0PHhyRj/Pla
         vHVCrKPMVfZwDW0xie8gStmctDWEvi/1Rwwg/S/8MCtMNZsbj9wvy2+ymKBxZuIq5uMg
         Eraq9/i9WJ5DpR+JIaieE5gn+awau9IKHxsNbk/1FWsvRGpi3H5nR9g1WqS9/3d47k44
         b1zw==
X-Gm-Message-State: AO0yUKWUxoXD4WzPEvrrKAUiBpkKQiFFzxk235pQs6sd3J8ZK8ouL6i/
        JR5qx/rFdpRQA/UvK8cHZSOjR+Gy/KFmnxvBEq4RCXTbzGQ=
X-Google-Smtp-Source: AK7set90zGMwzoGaQ7uC/BR9sxlC8izd2dnSc6ZDMJaK3pfkb4Cx5cjMQoBgLN5FiKupwa4J2lX7wc/Mz/iPm1bUMmw=
X-Received: by 2002:a05:651c:2322:b0:295:93eb:bab1 with SMTP id
 bi34-20020a05651c232200b0029593ebbab1mr9249769ljb.1.1678567746781; Sat, 11
 Mar 2023 12:49:06 -0800 (PST)
MIME-Version: 1.0
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Sat, 11 Mar 2023 12:48:54 -0800
Message-ID: <CANnsUMExojiA6ZNyH=_zjO44N4hR0ytqj-BWrRjO0L6Ox=MjsA@mail.gmail.com>
Subject: Backport to LTR?
To:     "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

I am wondering what the process is to get maintainers to backport
AX.25 fixes to LTS kernels.  Any suggestions?  This is a diff I pulled
off the latest LTS kernel, so unfortunately it still has not been
committed.

diff linux-5.15.100/net/ax25/af_ax25.c linux-5.15.89/net/ax25/af_ax25.c
(I patched 5.15.89 by hand, and it has been working solid on both
x86_64 and also 64 bit Pi.

I am going to the latest release branch and see if runs my
Slackware-15 ok.  I will keep my stuff as a fallback.

64a65
>       spin_lock_bh(&ax25_list_lock);
66d66
<               spin_lock_bh(&ax25_list_lock);
68d67
<               spin_unlock_bh(&ax25_list_lock);
70a70
>       spin_unlock_bh(&ax25_list_lock);
83a84
>       ax25_dev->device_up = false;
93a95
>                               ax25_cb_del(s);
105a108
>                       ax25_cb_del(s);
998,1000c1001,1005
<                       release_sock(sk);
<                       ax25_disconnect(ax25, 0);
<                       lock_sock(sk);
---
>                       if (!sock_flag(ax25->sk, SOCK_DEAD)) {
>                               release_sock(sk);
>                               ax25_disconnect(ax25, 0);
>                               lock_sock(sk);
>                       }
1056,1060c1061,1067
<               del_timer_sync(&ax25->timer);
<               del_timer_sync(&ax25->t1timer);
<               del_timer_sync(&ax25->t2timer);
<               del_timer_sync(&ax25->t3timer);
<               del_timer_sync(&ax25->idletimer);
---
>               if (!ax25_dev->device_up) {
>                       del_timer_sync(&ax25->timer);
>                       del_timer_sync(&ax25->t1timer);
>                       del_timer_sync(&ax25->t2timer);
>                       del_timer_sync(&ax25->t3timer);
>                       del_timer_sync(&ax25->idletimer);
>               }



-- 
Thanks,
Chris Maness
