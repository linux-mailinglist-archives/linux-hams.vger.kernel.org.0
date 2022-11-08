Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFB0621693
	for <lists+linux-hams@lfdr.de>; Tue,  8 Nov 2022 15:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbiKHO3o (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 8 Nov 2022 09:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbiKHO3Z (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 8 Nov 2022 09:29:25 -0500
X-Greylist: delayed 2768 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Nov 2022 06:27:32 PST
Received: from shemp.w1nr.net (shemp.w1nr.net [45.79.193.215])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A397E201A1
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 06:27:32 -0800 (PST)
Received: from [192.168.73.78] (pool-98-118-1-5.bstnma.fios.verizon.net [98.118.1.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by shemp.w1nr.net (Postfix) with ESMTPSA id F1E0E103C84
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 09:27:31 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 shemp.w1nr.net F1E0E103C84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=w1nr.net; s=default;
        t=1667917652; bh=JhmLNUzfX9ymsI7lyyWfgfOBndgH2MAxHEmYq2YHVZk=;
        h=Date:To:From:Subject:From;
        b=McnYPMNYPSFJ37DmOUVg1+7LIkGBx2FLlrPJNrL64YD46D5hotKWOox1qZTvOBy8i
         ZF61CT2ZSvxiBEP8663qwzQGxOpoR/anKSYxZ/Npk6fstRHdSpc5RZc3OiGdNwd/co
         B/QQhj46CfY4fdKOzp0x9nSLmuHblz4+k9xK3zYk=
Message-ID: <474b488c-87d9-9cac-eaa0-a423782a7f70@w1nr.net>
Date:   Tue, 8 Nov 2022 09:27:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To:     linux-hams@vger.kernel.org
Content-Language: en-US
From:   "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: New linux-ax25 repository
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

OK, I took the ball and created a free organization on github, 
https://github.com/linux-ax25

Now I need collaborators to sign up and help. If you would like to 
contribute, please drop me an email to w1nr at w1nr dot org.

First thing is the names of all the repositories that used to be on 
linux-ax25.org and any pointers to the most recent known "clones". It 
would be nice to be able to get complete clones with all the old history 
intact.

73 de Mike, W1NR
