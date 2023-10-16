Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3CA7CB36B
	for <lists+linux-hams@lfdr.de>; Mon, 16 Oct 2023 21:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbjJPTm1 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 16 Oct 2023 15:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbjJPTm0 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 16 Oct 2023 15:42:26 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF65CE6
        for <linux-hams@vger.kernel.org>; Mon, 16 Oct 2023 12:42:24 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-57babef76deso2754708eaf.0
        for <linux-hams@vger.kernel.org>; Mon, 16 Oct 2023 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697485344; x=1698090144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ExrixakovrZwkXwzxSDYUz9hfcSEIbjsFsf/1/2B5EU=;
        b=bvq0tPG9Qz3Ml50a36v5I3pehFpxpSrEQTk/117kB6CUdoToUIT8AAeUV9tq/MI8Sp
         94GvEvuXqu6WSgKw3bJFofFt+Apzq6tCn5fbloaSAuGSdcs6tn44yHZdcXYEeJ7k5246
         v3SO3KcXl168YUke5TZ+D2sMEEeTCleK5j4es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697485344; x=1698090144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExrixakovrZwkXwzxSDYUz9hfcSEIbjsFsf/1/2B5EU=;
        b=cza+0xoAD/07rdPl4bT4BiTDmn4H8eEyZXJQG3r7048TusrG4IZ02DbOMMCXQeFNrx
         Va2O2+amopJS5Y7U0fFOZ8C5s11lgn2MomGN+id01XX6pCZCQlfT2T9+/piDt47cEyWB
         +MTL0gr7fjDnxGhytHh6qauX+xk0xxrXifmCY/EqxoWzoO+uEKUnZ1SI2sMYyleCXOIz
         OVChmgyqMgY8zB+74iUNGJXTmtDxnL7edVqyzoUUCmqazIgtbfDHabdA0wKkAcuZZimm
         4rioZCb2V7lu95H72ngAhdPPP467ufuVLkIPEqQPq9EOJB5tAr4bzoifYeNgwwJIvfXN
         55nQ==
X-Gm-Message-State: AOJu0Yy6YVu+pNZvBM//QVUXtp/CaWPM5/20TD4Ji9gvEYzQlRrfE20W
        wl+kWJAfWmD+e8GP8DnCIqg4VQ==
X-Google-Smtp-Source: AGHT+IEeMQKbP2fH+oTMUOPgV4TLaiTN+m0ARSGjw8cOPGexL7cup7dn1q/zvw3k9ghoXA+I9hEAuQ==
X-Received: by 2002:a05:6358:56:b0:132:f294:77fe with SMTP id 22-20020a056358005600b00132f29477femr477811rwx.2.1697485344034;
        Mon, 16 Oct 2023 12:42:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k126-20020a632484000000b005b488b6441esm3746pgk.58.2023.10.16.12.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 12:42:23 -0700 (PDT)
Date:   Mon, 16 Oct 2023 12:42:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Thomas Sailer <t.sailer@alumni.ethz.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] hamradio: replace deprecated strncpy with strscpy_pad
Message-ID: <202310161242.B0F9B693@keescook>
References: <20231016-strncpy-drivers-net-hamradio-baycom_epp-c-v2-1-39f72a72de30@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-strncpy-drivers-net-hamradio-baycom_epp-c-v2-1-39f72a72de30@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Mon, Oct 16, 2023 at 06:42:42PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> We expect both hi.data.modename and hi.data.drivername to be
> NUL-terminated based on its usage with sprintf:
> |       sprintf(hi.data.modename, "%sclk,%smodem,fclk=%d,bps=%d%s",
> |               bc->cfg.intclk ? "int" : "ext",
> |               bc->cfg.extmodem ? "ext" : "int", bc->cfg.fclk, bc->cfg.bps,
> |               bc->cfg.loopback ? ",loopback" : "");
> 
> Note that this data is copied out to userspace with:
> |       if (copy_to_user(data, &hi, sizeof(hi)))
> ... however, the data was also copied FROM the user here:
> |       if (copy_from_user(&hi, data, sizeof(hi)))
> 
> Considering the above, a suitable replacement is strscpy_pad() as it
> guarantees NUL-termination on the destination buffer while also
> NUL-padding (which is good+wanted behavior when copying data to
> userspace).
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
