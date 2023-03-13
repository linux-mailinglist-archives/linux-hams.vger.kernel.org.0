Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0216A6B6E66
	for <lists+linux-hams@lfdr.de>; Mon, 13 Mar 2023 05:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjCMEXZ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 13 Mar 2023 00:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCMEXY (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 13 Mar 2023 00:23:24 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7088C196BF
        for <linux-hams@vger.kernel.org>; Sun, 12 Mar 2023 21:23:23 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id g3so10047186wri.6
        for <linux-hams@vger.kernel.org>; Sun, 12 Mar 2023 21:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678681402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pa+J7kxb6xmphZHzA8aRN14EiK0ndFLTEDLd/WMUn9Q=;
        b=SJxvfvZDU/EjO7YZqTZgJ8xYLjfgXJcRzZiiGpiDOKT87d6+My+1BJye8wNSg8uCwr
         DnqOFQ1iVI7CTz6LOFtcYsiGD/uVBFhhwWNwza84FKvRbmLS/jaFF2Ub/ik4EZDFAG2x
         9V/H+n+11FLC3k69HRBMgJr4r9IiLIpwEgqQfx5xEDiBkvITNYmwPfZxTEO7y01+UExn
         M0cn61A1coJrurzfRAep/Uvq02wxjjR5prVG2jM3FkgA2vczgD2V32LActZ3/qsEzBem
         TQZwEKbUYXdH70szobH5UyDPqGMiRfjK6uCk8p3YurAMktRKB9LbejMFXd/HH8ficl6n
         rJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678681402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa+J7kxb6xmphZHzA8aRN14EiK0ndFLTEDLd/WMUn9Q=;
        b=ZoB80UFJh95xcybvS0PDV8SH9UffdCzokfZcDOzRsD6dl26RdlJwhwdEFM8sX+ApMn
         Ja+/3kZp+yrqIJiOsLFT6pZ+XSemJMcqaRRXd21yWC97oLDlsuyU5Z9yQT730iaDUcKY
         zpeFapDL2f7roW8EQko/oINZDOzF1wWMQIiFPaAifx9sq/r9hwbLuCKCiQ3/dUEA9bmd
         ssjlf/a8oMXgf0ks4eEfH7fVfmyp/GjbZWXUJ7GThGW4u5P92+k0yKb3tQVhGAUKCITw
         wh4DFE/YONVyx5uiB2k1KAr7ungnyBkStnXR/W7poLFgAAe3WuT0zQ9DJmqsCQUr2AGt
         oTWA==
X-Gm-Message-State: AO0yUKVI/THD343J58dv/7K0IpiCJyEIA/y1pIh7+Ofb4NfARCx2Ipbv
        Vzwy2maZeP3MoYxmprDmElxTZQW4JHg=
X-Google-Smtp-Source: AK7set9kaLgZVOCdWwbdeIHgnxH5q8aZgIZtohDZHq2KEPBh9gYUAYzfL2VoUdazZTals1rvOvT9Jg==
X-Received: by 2002:a5d:4044:0:b0:2ce:a612:e3a5 with SMTP id w4-20020a5d4044000000b002cea612e3a5mr3821830wrp.50.1678681401637;
        Sun, 12 Mar 2023 21:23:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q20-20020a1cf314000000b003ebff290a52sm7773954wmq.28.2023.03.12.21.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:23:20 -0700 (PDT)
Date:   Mon, 13 Mar 2023 07:23:16 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     David Ranch <linux-hams@trinnet.net>
Cc:     "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>
Subject: Re: Backport to LTR?
Message-ID: <32c65d90-6917-467e-9902-0d85c0a80b90@kili.mountain>
References: <CANnsUMExojiA6ZNyH=_zjO44N4hR0ytqj-BWrRjO0L6Ox=MjsA@mail.gmail.com>
 <8a2cea63-b0e2-c348-1b72-0f810c022332@trinnet.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a2cea63-b0e2-c348-1b72-0f810c022332@trinnet.net>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Sun, Mar 12, 2023 at 11:05:54AM -0700, David Ranch wrote:
> 
> Hello Chris,
> 
> I think this post covers your question:
> 
> https://unix.stackexchange.com/questions/715465/how-to-submit-patches-and-fixes-to-lts-linux-kernels
> 

That's the general rules, but networking stable patches need to be
approved by the networking maintainers so make sure you add the
following CCs.

M:      "David S. Miller" <davem@davemloft.net>
M:      Eric Dumazet <edumazet@google.com>
M:      Jakub Kicinski <kuba@kernel.org>
M:      Paolo Abeni <pabeni@redhat.com>
L:      netdev@vger.kernel.org

regards,
dan carpenter

