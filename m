Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A576E69D223
	for <lists+linux-hams@lfdr.de>; Mon, 20 Feb 2023 18:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbjBTRdY (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 20 Feb 2023 12:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbjBTRdX (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 20 Feb 2023 12:33:23 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091EF1ADD8
        for <linux-hams@vger.kernel.org>; Mon, 20 Feb 2023 09:33:17 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h9so1795621ljq.2
        for <linux-hams@vger.kernel.org>; Mon, 20 Feb 2023 09:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TuACUUK2UptT8ASmtL/tVwjmIqfrePBjOKy3OATaNHI=;
        b=La0SQUHCC4ZUzLc20DyIgL8tNne/cWHSN53Sn9T10HO1TC7p5JmVhR1gH1mqb/fh7D
         gw/wlmidj6kV5WZuwgmr0XWttR5eXZaAv5EwSd3qdcqd25u36+WcI2vfEhszP45vfkMG
         oH2bi+mFyp4JhLbiyDQFxnJ3bg9CYSxpKk7h3xKDsB0p5I2BkKtlW+plsHVlfHfyMveM
         z4b7MgPRf7miquej+yR0Ks0MIv5/CVbSvZOrUb8mNZw2ndSU7hWFhmTS+ICuCHzzAY/c
         J6lLyDTDqsOf3fOMKH/a/OniXKWlMkJLLszixm1zrl42Ag6U3lXlOporK1beDETFI3P6
         pKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuACUUK2UptT8ASmtL/tVwjmIqfrePBjOKy3OATaNHI=;
        b=k2dQDWrsU78sxuq3LWaHcQZeurKd9Rxg4JoYG215jwRAEUTI9v6x+3HHEFXTnqDSiA
         rEvLGhSIvZPLNboYCeuV0ZMmbAEMXpmCoLubAY8ITd5IFyWPKWbRK11r/GoFnYnHPfsz
         glaCcXWHu8NDSPwa+/tXdKbzgnq6yP0LdZHIqFiibSKUVqT56Y9dURzsnh5nEs8DOjAy
         ZqizNB2BVaw8oZLwlpfhF9SGfXt53NcFzpyZTm3dO2ivevNPtEmhjEUQ4MZ3KVHZQNc5
         dIrvchqQJHKRCaIpY4xlDqRk9QaOnHvWMVeWwBug8uBVmYFMc1Xyqd2kgl2W1tT8KjT2
         SssQ==
X-Gm-Message-State: AO0yUKXVSJ6IVBSam7XoAXk8xZTPsxFmktgo8AUZ8/KM0w5Zlnyq3O1C
        FabErtcKAoOtJ9lpubpMmWFAcCEUoRs=
X-Google-Smtp-Source: AK7set8HikKHA4ph4b86YZwlFyoul3nlDOlV1iYC70Cb1xdwkBSQz9NLBB5hbdU5wxtINpZ439grLw==
X-Received: by 2002:a05:651c:504:b0:293:5f40:8bdf with SMTP id o4-20020a05651c050400b002935f408bdfmr769883ljp.14.1676914395031;
        Mon, 20 Feb 2023 09:33:15 -0800 (PST)
Received: from [192.168.1.100] ([78.88.244.78])
        by smtp.gmail.com with ESMTPSA id k23-20020a2e92d7000000b002936037334asm465421ljh.134.2023.02.20.09.33.14
        for <linux-hams@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 09:33:14 -0800 (PST)
Message-ID: <409c600f-6dee-6408-e90d-ed832d876e8e@gmail.com>
Date:   Mon, 20 Feb 2023 18:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: AX.25 Patches and the 5.10.0-23 (5.10.158) kernel tree
Content-Language: pl
References: <dac7e971-fe9a-1591-a9b0-c0bc01add71f@wp.pl>
To:     linux-hams@vger.kernel.org
From:   TeWuEs <tewues@gmail.com>
In-Reply-To: <dac7e971-fe9a-1591-a9b0-c0bc01add71f@wp.pl>
X-Forwarded-Message-Id: <dac7e971-fe9a-1591-a9b0-c0bc01add71f@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Greetings



Where I can find patch(es) that will make ax25 stack
working O.K. on Debian 11.6 with kernel 5.10.0-23 (5.10.158), please?

Thank you very much in advance.



HNY.
Best regards.

-- 
Tom - SP2L
------------------------------------
It is nice to be important.
But it is more important to be nice!
Nobody is mistaken - so do I.

