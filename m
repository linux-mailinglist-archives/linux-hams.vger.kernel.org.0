Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6F3362131F
	for <lists+linux-hams@lfdr.de>; Tue,  8 Nov 2022 14:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234535AbiKHNrB (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 8 Nov 2022 08:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234562AbiKHNq5 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 8 Nov 2022 08:46:57 -0500
X-Greylist: delayed 330 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Nov 2022 05:46:56 PST
Received: from shemp.w1nr.net (shemp.w1nr.net [IPv6:2600:3c02:e000:d4::1:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0438A5F847
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 05:46:55 -0800 (PST)
Received: from [192.168.73.78] (pool-98-118-1-5.bstnma.fios.verizon.net [98.118.1.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by shemp.w1nr.net (Postfix) with ESMTPSA id 974DF100188
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 08:41:23 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 shemp.w1nr.net 974DF100188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=w1nr.net; s=default;
        t=1667914883; bh=EWD0eOlXHZxRQWBS01ZAMGCwhjY4oKD5SNjhUii81m8=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=V7hgMgNqNqitAkeloBtZQchY4JJF3c3r1TnUGPKPd22nX/Ahl0awK6y9gNwpqnPgx
         vDJpFFIDheMZmDtQxILMB2TAuyZOVKtl7ZBhYNBfpfpW4Qa0kq2RQMFKHjnWNLI/re
         U2rP5dzfZbiwJVeTTOh5x7rgIfN0oPjIMgHjH8qU=
Message-ID: <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
Date:   Tue, 8 Nov 2022 08:41:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Replacement for linux-ax25.org git?
Content-Language: en-US
To:     linux-hams@vger.kernel.org
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
From:   "Mike McCarthy, W1NR" <lists@w1nr.net>
In-Reply-To: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Does anyone know if the repos at linux-ax25.org were archived anywhere 
before it went offline?

Mike, W1NR

On 11/8/2022 7:41 AM, Dave Hibberd wrote:
> Hi all,
> 
> I'm one of the folks in the Debian Hamradio team with an active interest in keeping our packet tooling going.
> 
> With the demise of linux-ax25.org and discussions here about change of maintenance, is there a new canonical repo for ax25-tools and similar where these components are held?
> 
> Our last upstram mirror was about 3 years ago, we've got it tagged as 0.0.10-rc5+git20190411+3595f87 [1] - this is what will have flowed down into Ubuntu, Raspberry Pi OS etc.
> 
> If there's currently active work going on with these userland components, where is it happening so we can rebase our packages?
> If not, I guess this is something we need to make a decision on how to proceed as a community!
> 
> 
> [1]: https://salsa.debian.org/debian-hamradio-team/ax25-tools/-/tree/upstream
> 
