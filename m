Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90794C8F73
	for <lists+linux-hams@lfdr.de>; Tue,  1 Mar 2022 16:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbiCAPy7 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 1 Mar 2022 10:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiCAPy6 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 1 Mar 2022 10:54:58 -0500
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9598F3BBE2
        for <linux-hams@vger.kernel.org>; Tue,  1 Mar 2022 07:54:17 -0800 (PST)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 221FsCjS015240;
        Tue, 1 Mar 2022 07:54:12 -0800
From:   David Ranch <linux-hams@trinnet.net>
Subject: Re: [PATCH] libax25 hamradio: higher baud rate support
To:     John Paul Morrison <jmorrison@bogomips.com>,
        linux-hams@vger.kernel.org
References: <CAO-kYtEhzohMYgk=K_jt0hQ+bdrmReUVBkAzMYTKJeAK9vcenQ@mail.gmail.com>
Cc:     Thomas Osterried <thomas@osterried.de>
Message-ID: <440dc67d-55a2-64c0-bbdf-68b17b404fc5@trinnet.net>
Date:   Tue, 1 Mar 2022 07:54:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAO-kYtEhzohMYgk=K_jt0hQ+bdrmReUVBkAzMYTKJeAK9vcenQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Tue, 01 Mar 2022 07:54:12 -0800 (GMT+8)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Maybe there is no harm in allowing such speeds to be configured but what 
kiss-capable AX.25 serial devices can support such serial speeds?  Maybe 
just back to back serial port connected Linux computers?

--David
KI6ZHD


On 02/28/2022 10:46 AM, John Paul Morrison wrote:
> The kissattach program rejects valid baud rates in /etc/ax25/axports
> so I updated libax25
>
> I tested on x86_64 and armv7l (Raspberry Pi)  up to 1.5 Mbps
>
> VE7JPM
>
>
> Signed-off-by: John Paul Morrison<jmorrison@bogomips.com>
> ---
>
> diff --git a/ttyutils.c b/ttyutils.c
> index a374103..981d630 100644
> --- a/ttyutils.c
> +++ b/ttyutils.c
> @@ -32,6 +32,36 @@ static struct speed_struct {
>   #endif
>   #ifdef  B460800
>    {460800, B460800},
> +#endif
> +#ifdef  B500000
> + {500000, B500000},
> +#endif
> +#ifdef  B921600
> + {921600, B921600},
> +#endif
> +#ifdef  B1000000
> + {1000000, B1000000},
> +#endif
> +#ifdef  B1152000
> + {1152000, B1152000},
> +#endif
> +#ifdef  B1500000
> + {1500000, B1500000},
> +#endif
> +#ifdef  B2000000
> + {2000000, B2000000},
> +#endif
> +#ifdef  B2500000
> + {2500000, B2500000},
> +#endif
> +#ifdef  B3000000
> + {3000000, B3000000},
> +#endif
> +#ifdef  B3500000
> + {1000000, B3500000},
> +#endif
> +#ifdef  B4000000
> + {4000000, B4000000},
>   #endif
>    {-1, B0}
>   };

