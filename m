Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19CFF67B07B
	for <lists+linux-hams@lfdr.de>; Wed, 25 Jan 2023 11:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbjAYK74 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 25 Jan 2023 05:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235291AbjAYK7y (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 25 Jan 2023 05:59:54 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472294CE47
        for <linux-hams@vger.kernel.org>; Wed, 25 Jan 2023 02:59:50 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so1606896pji.5
        for <linux-hams@vger.kernel.org>; Wed, 25 Jan 2023 02:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICPh4ucOG8VhHgcT8LdJRYteqNP6YNEJa4n2j3Tp+DM=;
        b=X8lZuRfmKOeOd/Gxd88ZSPwQW9rppcmGTooGS0ER7XGjHuStilRNK90G2tagg0aoNb
         mMleeTA+B5er8uzinFC9pmzdUlnNrgBhXGyrjWMeAF+rn+PiBKiHPGZYoWHoMg3mEIi6
         +4eNIVSf4u6BDf+j8kFBrlVuP1355Esi8GHuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICPh4ucOG8VhHgcT8LdJRYteqNP6YNEJa4n2j3Tp+DM=;
        b=QcyXB/oCPQcaP0X1O/daDir8recybP2hP+AD+kVOvvvnlypybuk3Vxpxt0AKNTRuK5
         UzAxoVtBiQwfhcqc6lOila5zM0ObG1X6i6bwNNI0QH0WVf4OPopedf8goGC627aB2PP2
         /z6vHiqkUKbkBL9GX5sRSVDcNKiQ8zE03rYpG45G6MUX08s5MwggORdW8k/5T67QqRaC
         ci0aJCNFPKZ8MvrYHmgze0VOYNj0tGwvAM70rcuojjFV1t2MXcJpwwNkFFvM7eDHOWd4
         BDJ07BG3xswtn5Q7KRX5y+SewWD+gz6FvHYifjvynFVRMAqBB0HVwH8jcIEO1QVIZapm
         nfbQ==
X-Gm-Message-State: AFqh2krXAg3NxzyOHoZEfdwfwKpPRhlSdGcfbGFJComqvtE2+uUD7o1G
        C25F/uIk9a4P9pVhMVNxPVsq5Q==
X-Google-Smtp-Source: AMrXdXuMJIxdTbv3efMIGbOCeyjaiEjFddx9zL9cfRq/OdyU7lYbabTEdj8i7JE0AGNv4d2eIV7QzQ==
X-Received: by 2002:a17:903:11c7:b0:194:58c7:ab79 with SMTP id q7-20020a17090311c700b0019458c7ab79mr40534103plh.63.1674644389563;
        Wed, 25 Jan 2023 02:59:49 -0800 (PST)
Received: from ubuntu ([39.115.108.115])
        by smtp.gmail.com with ESMTPSA id g9-20020a170902740900b001743ba85d39sm3346167pll.110.2023.01.25.02.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 02:59:49 -0800 (PST)
Date:   Wed, 25 Jan 2023 02:59:44 -0800
From:   Hyunwoo Kim <v4bel@theori.io>
To:     ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, kuniyu@amazon.com
Cc:     v4bel@theori.io, imv4bel@gmail.com, linux-hams@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH v3] net/rose: Fix to not accept on connected socket
Message-ID: <20230125105944.GA133314@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

If you call listen() and accept() on an already connect()ed
rose socket, accept() can successfully connect.
This is because when the peer socket sends data to sendmsg,
the skb with its own sk stored in the connected socket's
sk->sk_receive_queue is connected, and rose_accept() dequeues
the skb waiting in the sk->sk_receive_queue.

This creates a child socket with the sk of the parent
rose socket, which can cause confusion.

Fix rose_listen() to return -EINVAL if the socket has
already been successfully connected, and add lock_sock
to prevent this issue.

Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
---
v1 -> v2 : Change the flag to check to SS_UNCONNECTED
v2 -> v3 : Fix wrong patch description
---
 net/rose/af_rose.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 36fefc3957d7..ca2b17f32670 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -488,6 +488,12 @@ static int rose_listen(struct socket *sock, int backlog)
 {
 	struct sock *sk = sock->sk;
 
+	lock_sock(sk);
+	if (sock->state != SS_UNCONNECTED) {
+		release_sock(sk);
+		return -EINVAL;
+	}
+
 	if (sk->sk_state != TCP_LISTEN) {
 		struct rose_sock *rose = rose_sk(sk);
 
@@ -497,8 +503,10 @@ static int rose_listen(struct socket *sock, int backlog)
 		memset(rose->dest_digis, 0, AX25_ADDR_LEN * ROSE_MAX_DIGIS);
 		sk->sk_max_ack_backlog = backlog;
 		sk->sk_state           = TCP_LISTEN;
+		release_sock(sk);
 		return 0;
 	}
+	release_sock(sk);
 
 	return -EOPNOTSUPP;
 }
-- 
2.25.1

