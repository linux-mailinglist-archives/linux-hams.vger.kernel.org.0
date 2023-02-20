Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C0369D227
	for <lists+linux-hams@lfdr.de>; Mon, 20 Feb 2023 18:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbjBTRee (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 20 Feb 2023 12:34:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjBTRed (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 20 Feb 2023 12:34:33 -0500
X-Greylist: delayed 399 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Feb 2023 09:34:30 PST
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437B818179
        for <linux-hams@vger.kernel.org>; Mon, 20 Feb 2023 09:34:29 -0800 (PST)
Received: (wp-smtpd smtp.wp.pl 20115 invoked from network); 20 Feb 2023 18:27:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1676914064; bh=TuACUUK2UptT8ASmtL/tVwjmIqfrePBjOKy3OATaNHI=;
          h=To:From:Subject;
          b=Yw9aLqnpmXHdVCxDs+bQ/A63cLUJwZO+pWDKDeU6Oh4DWRBNoktJ/K9UMSDbTARNV
           1pRADjNRJN/RMMvpbHefRhbzWyIBNjVUtxrBK1v5mGgmehnt+hr38IISkXf6p4fQWM
           UliJMbPhuqouSlAiFcY41xbJd1YfNMZM7v7X26rA=
Received: from 078088244078.tczew.vectranet.pl (HELO [192.168.1.100]) (SP2L@wp.pl@[78.88.244.78])
          (envelope-sender <SP2L@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-hams@vger.kernel.org>; 20 Feb 2023 18:27:44 +0100
Message-ID: <dac7e971-fe9a-1591-a9b0-c0bc01add71f@wp.pl>
Date:   Mon, 20 Feb 2023 18:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: pl
To:     linux-hams@vger.kernel.org
From:   SP2L Tom <SP2L@wp.pl>
Subject: AX.25 Patches and the 5.10.0-23 (5.10.158) kernel tree
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-DKIM-Status: good (id: wp.pl)                                      
X-WP-MailID: 7464c39f9127b7ac274c187199a1d220
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [ASOk]                               
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Greetings



Where I can find patch(es) that will make ax25 stack
working O.K. on Debian 11.6 with kernel 5.10.0-23 (5.10.158), please?

Thank you very much in advance.



HNY.
Best regards.

-- 
Tom - SP2L
------------------------------------
It is nice to be important.
But it is more important to be nice!
Nobody is mistaken - so do I.

