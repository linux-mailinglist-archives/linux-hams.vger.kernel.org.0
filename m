Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDCA4CED06
	for <lists+linux-hams@lfdr.de>; Sun,  6 Mar 2022 19:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbiCFSGi (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 6 Mar 2022 13:06:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiCFSGh (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 6 Mar 2022 13:06:37 -0500
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC686574B1
        for <linux-hams@vger.kernel.org>; Sun,  6 Mar 2022 10:05:45 -0800 (PST)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 226I5hYG021227;
        Sun, 6 Mar 2022 10:05:43 -0800
Subject: Re: Kernel freeze on killall kissattach
To:     Roland Schwarz <roland.schwarz@blackspace.at>,
        linux-hams@vger.kernel.org
References: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
 <ca12cec2-3301-2926-f04a-cf8103af72e8@trinnet.net>
 <5d2ac637-5fff-b91d-9d34-6e0ce4d7fdba@blackspace.at>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <10a4c20b-f618-472d-aebc-38ff838307e2@trinnet.net>
Date:   Sun, 6 Mar 2022 10:05:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5d2ac637-5fff-b91d-9d34-6e0ce4d7fdba@blackspace.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sun, 06 Mar 2022 10:05:43 -0800 (GMT+8)
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_50,KHOP_HELO_FCRDNS,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Roland,

> When I kill kissatach from within one of the ssh sessions the complete
> VM freezes without even printing anything on the console view. I guess
> this might be different on real hardware which I would need to prepare.

Hmmm.. even within a VM, it's console interface should show the panic 
screen.  What VM hypervisor are you using?  Please be specific and also 
mention versions, etc.

--David
KI6ZHD
