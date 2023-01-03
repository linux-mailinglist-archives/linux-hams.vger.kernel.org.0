Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21CA665BC4E
	for <lists+linux-hams@lfdr.de>; Tue,  3 Jan 2023 09:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236854AbjACIgt (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 3 Jan 2023 03:36:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbjACIgt (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 3 Jan 2023 03:36:49 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521EBCE5
        for <linux-hams@vger.kernel.org>; Tue,  3 Jan 2023 00:36:47 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id z16so12227981wrw.1
        for <linux-hams@vger.kernel.org>; Tue, 03 Jan 2023 00:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8A20dvMhTzU7n83VtG3tceqXeunllUksE2qUbN0FPY=;
        b=P1vzXfC/IH9qeRTD4lJ8G6NFxCBclGGK26cKYUsnd0k4Abk/dGc9cQA5ARDZKPgOQf
         NmacrWZubvTflDEC6AQe57kY+1M7t/qQmdCfOkZ1wViaQdLFFe6X1HAQBIBAoPpIuH/Z
         HY/tFDd0d+AxSd1L4unxht7aRT/LoLYEyTEXABJE06lfzhoV592C/1ohWp4piJLY1Xkg
         0r0O1cNXRqQg6frmjdMUSLvIX25l5ZeiFhbcxNvweiieTO2O9SaAdljph4CK3I7DEVAo
         Drw9+HHfZWWOjdNLRvcB2sZt7qVZK936Tz+vYzdltPM2hvuUyPIbCAth42YCnzCXIWEA
         ifPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8A20dvMhTzU7n83VtG3tceqXeunllUksE2qUbN0FPY=;
        b=S0tDOEbCwLpFwAMqHIj4rSHNCckjJxAMQqBl3EyFB/0is90bgogR+VPqiOEUuAtExG
         K7fO/z+pPaE1vkujG3WwmduYr8D3ESkhoYO/YszEmZ7ChPLmdUAx2p1GFRfcPaPwiayz
         utNzRv0eLfRy9+9R1EhPTUei25eNPJwoVX9ITcSiIW+BEye3WAzuKGuIY7yO87fw+0U2
         e+L+/QPoXwiSWBifitDWZO7fqxmO9bWnfyxazg/nMHlAiNy/uH29452V+V5B5IV6V/ae
         aGdO4LEe+owa5LACe2nWm0RDo2Go4nzxcccfoe+gLmX92WA+VfFn/uasmktIGwbmvjeX
         Sh1Q==
X-Gm-Message-State: AFqh2kqtKzUHL+5e2+aODH4kp72pNtJHxRzyjQpCp0irhR5yne+w2PFU
        MnpZCMMFf2YiR4o7+YG5FAIDJd7Ii/ar5wpm
X-Google-Smtp-Source: AMrXdXuzH2NeCv4APedSkWV3WRhCJkOspifZQ1TP/b11WcEf+22oxfSYmyL2RBEkkBcpni3cJs5C4w==
X-Received: by 2002:adf:c644:0:b0:29f:9df0:a6b2 with SMTP id u4-20020adfc644000000b0029f9df0a6b2mr1460330wrg.64.1672735005743;
        Tue, 03 Jan 2023 00:36:45 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s1-20020a5d6a81000000b0024228b0b932sm36335275wru.27.2023.01.03.00.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 00:36:45 -0800 (PST)
Date:   Tue, 3 Jan 2023 11:36:42 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Nate Bargmann <n0nb@n0nb.us>
Cc:     Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org
Subject: Re: [PATCH] ttyutils.c: Correct suspected typo in speed_struct
Message-ID: <Y7PpGuwaVXbhqfxf@kadam>
References: <20221229181420.998996-1-n0nb@n0nb.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229181420.998996-1-n0nb@n0nb.us>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Thu, Dec 29, 2022 at 12:14:20PM -0600, Nate Bargmann wrote:
> Looking over recent commits I noticed what looks to be a typo where
> user_speed did not match termios_speed for the B3500000 declaration.
> 
> Signed-off-by: Nate Bargmann <n0nb@n0nb.us>

It seems like Thomas is going to take care of this and apply it to the
correct repo?

In the future don't put "suspected" in the subject...  :P  You want to
sound more confident than that in the permanent git log.  Put those
kinds of waffle words under

> ---
  ^^^
this cut off line.  "I'm not an expert blah blah bah but it definitely
looks like a typo.  Review carefully etc."

Anyway, it looks like you are correct and have eagle eyes!  Thanks for
the patch!

regards,
dan carpenter

