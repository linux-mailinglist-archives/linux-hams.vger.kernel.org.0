Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC5C61384B
	for <lists+linux-hams@lfdr.de>; Mon, 31 Oct 2022 14:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiJaNpD (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 31 Oct 2022 09:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbiJaNpC (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 31 Oct 2022 09:45:02 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AB5101F3
        for <linux-hams@vger.kernel.org>; Mon, 31 Oct 2022 06:45:01 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id c8so8334879qvn.10
        for <linux-hams@vger.kernel.org>; Mon, 31 Oct 2022 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GdiREoTH65t05Ku+PPtavuVyWy6B9SaY0769wU+YJqM=;
        b=YYwLbhpy34BnoDbH5qXqeIwThHbFHeonbYbZzXU9eQcQ1qB95pGJeddS4V3yX9mnsE
         AwItNU7CbstZNW2hkwS93ivoL8sioeazIVSVE/WFgtBDlaHbLlHB3uE2jRHCkjG0aV+V
         RKde887gZDhPPlQkZwkPeBuPtfQhugOInc5eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdiREoTH65t05Ku+PPtavuVyWy6B9SaY0769wU+YJqM=;
        b=f5XV+F4fZokYK0VPfvgf8ZJIELx9lwz9Xjc0j76O4HKxwMYoolX+Li1M7LCdnWHzul
         lv6dRcSQsk6oxNiR74IkaUpLkyuD9jgTL4dyl3tBHjsJ6gPeYafWjkUzXkj9g1uM7W0g
         97MZPI3c6VyH7E3wj7LeU0HpLHGle49sLy7LZcmHQfKZmgRwVM84ys9IjHxm0MZYEEM2
         AWTxafZRWdRhzPFlXq/fnMifm64HEVtAKKjxMQI1HjEUugYdykRPee9LNSc1cG3rw5pW
         6rq2l1+y6AYfbCqxYfQF7r9n0O+q8jQHHLSdTEfw1X3bsZ0tOsVy/cc6FMzPcqgAO5PK
         ZJhw==
X-Gm-Message-State: ACrzQf3vuGrUiNdiPEa5b7VETUJK8qnp7EhXLpvYd2WWVlP6QpyQNVJh
        UPamQoka3UaQulrlrrHCRCRm1r0u87SBdQ==
X-Google-Smtp-Source: AMsMyM4M/YiRjzF98G0iXx+1IdJqzlL4f4Dw2BgPhh68NvsoGUaf0IU10UMxZQ3yvM39XnlxJnJ3Og==
X-Received: by 2002:a05:6214:c2a:b0:4ba:170c:1929 with SMTP id a10-20020a0562140c2a00b004ba170c1929mr10913564qvd.21.1667223900332;
        Mon, 31 Oct 2022 06:45:00 -0700 (PDT)
Received: from ?IPV6:2600:4041:2d4:7900:dac5:925f:c224:6df5? ([2600:4041:2d4:7900:dac5:925f:c224:6df5])
        by smtp.gmail.com with ESMTPSA id v18-20020a05620a0f1200b006ecfb2c86d3sm4584936qkl.130.2022.10.31.06.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 06:44:58 -0700 (PDT)
Message-ID: <aad04e06-59b0-f630-7cef-fdb557860a56@labbott.name>
Date:   Mon, 31 Oct 2022 09:44:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] MAINTAINERS: drop Liam Mark and Laura Abbott
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
        linux-hams@vger.kernel.org, linux-media@vger.kernel.org
References: <20221029131734.616829-1-bagasdotme@gmail.com>
 <20221029131734.616829-3-bagasdotme@gmail.com>
From:   Laura Abbott <laura@labbott.name>
In-Reply-To: <20221029131734.616829-3-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On 10/29/22 09:17, Bagas Sanjaya wrote:
> Emails sent to their respective addresses listed bounces (550 error).
> Their last post on LKML was two years ago ([1] and [2]). Remove them.
> 
> Link: https://lore.kernel.org/lkml/alpine.DEB.2.10.2002201508320.1846@lmark-linux.qualcomm.com/ ([1])
> Link: https://lore.kernel.org/lkml/b85fa669-d3aa-f6c9-9631-988ae47e392c@redhat.com/ ([2])
> Cc: Laura Abbott <laura@labbott.name>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>   Actually Laura's last post was a year ago from her personal address,
>   where she announced 2021 LF TAB results [3], so Cc that address.
> 
>   [3]: https://lore.kernel.org/lkml/6e307861-3149-a984-cc79-088559caeab2@labbott.name/
>   
>   MAINTAINERS | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 63a84d3218a7b4..564c3c66077e0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6221,8 +6221,6 @@ F:	tools/testing/selftests/dma/
>   DMA-BUF HEAPS FRAMEWORK
>   M:	Sumit Semwal <sumit.semwal@linaro.org>
>   R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
> -R:	Liam Mark <lmark@codeaurora.org>
> -R:	Laura Abbott <labbott@redhat.com>
>   R:	Brian Starkey <Brian.Starkey@arm.com>
>   R:	John Stultz <jstultz@google.com>
>   L:	linux-media@vger.kernel.org

https://lore.kernel.org/all/20200108213055.38449-1-labbott@kernel.org/
https://lore.kernel.org/all/20211207225458.622282-1-labbott@kernel.org/

I've sent a request to change this twice and I don't really have the
energy to continue chasing it down. If you can get the removal merged
go ahead.

Thanks,
Laura
