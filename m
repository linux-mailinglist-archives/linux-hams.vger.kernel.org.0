Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2ED965A4A6
	for <lists+linux-hams@lfdr.de>; Sat, 31 Dec 2022 14:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiLaNYQ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 31 Dec 2022 08:24:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiLaNYP (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 31 Dec 2022 08:24:15 -0500
X-Greylist: delayed 254 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 31 Dec 2022 05:24:13 PST
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9EE3B4A3
        for <linux-hams@vger.kernel.org>; Sat, 31 Dec 2022 05:24:13 -0800 (PST)
X-Envelope-From: thomas@x-berg.in-berlin.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 2BVDJrY11420650
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Sat, 31 Dec 2022 14:19:53 +0100
Received: from thomas by x-berg.in-berlin.de with local (Exim 4.94.2)
        (envelope-from <thomas@x-berg.in-berlin.de>)
        id 1pBbmD-0004gF-1i; Sat, 31 Dec 2022 14:19:53 +0100
Date:   Sat, 31 Dec 2022 14:19:53 +0100
From:   Thomas Osterried <thomas@osterried.de>
To:     Nate Bargmann <n0nb@n0nb.us>
Cc:     Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org
Subject: Re: [PATCH] ttyutils.c: Correct suspected typo in speed_struct
Message-ID: <Y7A2+f7dz/J2pbmz@x-berg.in-berlin.de>
References: <20221229181420.998996-1-n0nb@n0nb.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229181420.998996-1-n0nb@n0nb.us>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Thank you Nate.
Sorry for the misktake.

I'll fix this asap.

vy 73,
	- Thomas  dl9sau

On Thu, Dec 29, 2022 at 12:14:20PM -0600, Nate Bargmann wrote:
> Looking over recent commits I noticed what looks to be a typo where
> user_speed did not match termios_speed for the B3500000 declaration.
> 
> Signed-off-by: Nate Bargmann <n0nb@n0nb.us>
> ---
>  ttyutils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ttyutils.c b/ttyutils.c
> index 6ffd2fb..6bd6b56 100644
> --- a/ttyutils.c
> +++ b/ttyutils.c
> @@ -61,7 +61,7 @@ static struct speed_struct {
>  	{3000000,	B3000000},
>  #endif
>  #ifdef  B3500000
> -	{1000000,	B3500000},
> +	{3500000,	B3500000},
>  #endif
>  #ifdef  B4000000
>  	{4000000,	B4000000},
> -- 
> 2.34.1
> 
> 
