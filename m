Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F37DFFDE
	for <lists+linux-hams@lfdr.de>; Tue, 22 Oct 2019 10:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388484AbfJVIpJ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 22 Oct 2019 04:45:09 -0400
Received: from vk6hgr.net.au ([203.59.226.195]:40880 "EHLO vk6hgr.net.au"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387479AbfJVIpJ (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Tue, 22 Oct 2019 04:45:09 -0400
X-Greylist: delayed 1860 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Oct 2019 04:45:07 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=vk6hgr.echidna.id.au; s=20170629; h=Subject:Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BBe96ghqf9x93yOA4hpGPPi+sywR/9Do8jYBeLU8q1c=; b=p5aVlY9ZfakM5yHch7E5JebKZ
        WOIw9oElBQax1BlwINqsJHbaT25nFEzPYWPj+UQdbEmMTyvFWOXs8iqoibsP0t9bBC4abXNFtVoTT
        PDed+P8VJHdfO466B/S89mJBZXSqT0kjFIY+zQbdLpvjpTlKvtqFGEf/3XkoU3opd6NQ4=;
Received: from [2001:4479:cb3b:7f8:8d97:78a0:d582:89a]
        by vk6hgr.net.au with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <grogers@vk6hgr.echidna.id.au>)
        id 1iMpIj-000645-9o
        for linux-hams@vger.kernel.org; Tue, 22 Oct 2019 16:14:05 +0800
To:     linux-hams@vger.kernel.org
From:   Gavin Rogers <grogers@vk6hgr.echidna.id.au>
Message-ID: <e398cccb-0edf-7751-3c58-565b3fd166ef@vk6hgr.echidna.id.au>
Date:   Tue, 22 Oct 2019 16:13:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-AU
X-SA-Exim-Connect-IP: 2001:4479:cb3b:7f8:8d97:78a0:d582:89a
X-SA-Exim-Mail-From: grogers@vk6hgr.echidna.id.au
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        voyager.vk6hgr.net.au
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.2
Subject: Status of the LISTENING stuck state machine bug
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on vk6hgr.net.au)
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello.

Does anyone know the status of the bug in 4.x kernels causing the kernel 
to become stuck after an AX.25 connection has closed down, causing it to 
permanently stay in a callsign-1 callsign-2 LISTENING status?

i.e. https://www.spinics.net/lists/linux-hams/msg04029.html

The latest kernel machine I have ready access to is running 4.19 and 
it's still there.

I don't know much about kernel development - is this an open bug or how 
can it get attention to be fixed?


Gavin

VK6HGR

-- 
https://vk6hgr.net.au/		

