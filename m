Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2847754DFE4
	for <lists+linux-hams@lfdr.de>; Thu, 16 Jun 2022 13:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376747AbiFPLT7 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 16 Jun 2022 07:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376753AbiFPLT6 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 16 Jun 2022 07:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9A4F5E178
        for <linux-hams@vger.kernel.org>; Thu, 16 Jun 2022 04:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655378396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GJSHiXGnbIKwEFbP5SDVLebTcXv1rK1oD5ajGiN6VGI=;
        b=IG7PZtHZsAZqOD0K2EVSdwzVa8thSZBWr0E3wP+pf8ekGSN1wGS9j3RHicYueWMntuhMzn
        P1RDU83XEFhU7oRuTdATlJD0w7UMdR4nf3Ca3Ht6M/GXsveH3AHHxYcw0Mv/+t/CTFPJZS
        RXw0AfxUX6f6gOAMVhWkvq0+g97Wdxo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-479Hn8P_PBuETSuQK6Etfg-1; Thu, 16 Jun 2022 07:19:46 -0400
X-MC-Unique: 479Hn8P_PBuETSuQK6Etfg-1
Received: by mail-qk1-f200.google.com with SMTP id u8-20020a05620a454800b006a74e6b39eeso1399486qkp.12
        for <linux-hams@vger.kernel.org>; Thu, 16 Jun 2022 04:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GJSHiXGnbIKwEFbP5SDVLebTcXv1rK1oD5ajGiN6VGI=;
        b=jQYbJX7irTINVJ8dwm0u26+6m53ZqbAfsF9TTNQgv2lT++uFgfrGRyAXcaAp8z147T
         0c1NyL6VmIP2GD3yhsRRwmHMkmOYq5EnasLJcj/6UTvjbr+M8ngjwpO4AzSt3OpeV0CB
         IvRgixOeoP1YOGh/NZzfUBstTlyxIjQ+4OZvQtiN3kLp5b8+L+Zrfab7Gl/I6x+44iBv
         N06+p1Cb9FUohGEzGZc92U6vLYS/K8fV+nBJ74es9nicvZEMKXPCsEfiiM1DcIgl+Z8D
         myTxeY0EmaUivu+UgNo6u/OElQsBKdp5UsrAccIytGca8AGjNiHx/9Z63UwDsdtu/hKP
         XZNA==
X-Gm-Message-State: AJIora8vTO3bpPZ33rLg/xC7qb3VX4c3kc0H/aGHGhW+bpFba/7pZldM
        TjUgpdQkjf6yvDLE22trE5xERzeU3AxyxgVNCAxLVgJDl5dbtX2DKa3YElqj73VbqD5Y4w5XFK7
        8LVojc/X0mbHPWv8M2tygSg==
X-Received: by 2002:a05:6214:23c8:b0:45f:b582:346e with SMTP id hr8-20020a05621423c800b0045fb582346emr3505536qvb.109.1655378385560;
        Thu, 16 Jun 2022 04:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vPN3NH8XTlj3THOQd1RTUVZn+AfZCg1MWBWUAl6ty7RvnBmiNf2CcC5MJboEh3hTayNo/tiw==
X-Received: by 2002:a05:6214:23c8:b0:45f:b582:346e with SMTP id hr8-20020a05621423c800b0045fb582346emr3505524qvb.109.1655378385294;
        Thu, 16 Jun 2022 04:19:45 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-113-202.dyn.eolo.it. [146.241.113.202])
        by smtp.gmail.com with ESMTPSA id c4-20020a05620a268400b006a691904891sm1588334qkp.16.2022.06.16.04.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 04:19:44 -0700 (PDT)
Message-ID: <648a6e70fdfaa94ee678abda210860287ad09bc3.camel@redhat.com>
Subject: Re: [PATCH v3] ax25: use GFP_KERNEL in ax25_dev_device_up()
From:   Paolo Abeni <pabeni@redhat.com>
To:     Peter Lafreniere <pjlafren@mtu.edu>, linux-hams@vger.kernel.org
Cc:     netdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Date:   Thu, 16 Jun 2022 13:19:42 +0200
In-Reply-To: <20220615220947.3767-1-pjlafren@mtu.edu>
References: <20220615220947.3767-1-pjlafren@mtu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

On Wed, 2022-06-15 at 18:09 -0400, Peter Lafreniere wrote:
> ax25_dev_device_up() is only called during device setup, which is
> done in user context. In addition, ax25_dev_device_up()
> unconditionally calls ax25_register_dev_sysctl(), which already
> allocates with GFP_KERNEL.
> 
> Since it is allowed to sleep in this function, here we change
> ax25_dev_device_up() to use GFP_KERNEL to reduce unnecessary
> out-of-memory errors.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peter Lafreniere <pjlafren@mtu.edu>
> ---
> v2 -> v3:
>  - Rebased for clean application to net-next
> 
> v1 -> v2:
>  - Renamed patch from "ax25: use GFP_KERNEL over GFP_ATOMIC where possible"
>    (Is that okay?)
>  - Removed invalid changes to ax25_rt_add()
> 
>  net/ax25/ax25_dev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index ab88b6ac5401..2093f94f6852 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -52,7 +52,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  {
>  	ax25_dev *ax25_dev;
>  
> -	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_ATOMIC)) == NULL) {
> +	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL)) == NULL) {
>  		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
>  		return;
>  	}

Since you are touching this line, please move the assignment in a
separate statement:

	ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL);
	if (!ax25_dev) {

so that we get rid of this obsolete codying style.

Thanks!

Paolo

