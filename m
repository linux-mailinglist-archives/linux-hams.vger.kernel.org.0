Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0914DBA49
	for <lists+linux-hams@lfdr.de>; Wed, 16 Mar 2022 22:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355851AbiCPVsI (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 16 Mar 2022 17:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240574AbiCPVru (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 16 Mar 2022 17:47:50 -0400
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5E5A8299
        for <linux-hams@vger.kernel.org>; Wed, 16 Mar 2022 14:46:35 -0700 (PDT)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 22GLkXdh024854;
        Wed, 16 Mar 2022 13:46:33 -0800
Subject: Re: Loss of connection state?
To:     Dennis Boone <drb@msu.edu>, linux-hams@vger.kernel.org
References: <13d4710d-03cc-66e2-e6a4-f7da4b00ca92@trinnet.net>
 <20220315213245.3304328BA6B@yagi.h-net.msu.edu>
 <20220316164321.467262902D1@yagi.h-net.msu.edu>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <015a5074-6ff2-914f-9205-a53faa63d6e3@trinnet.net>
Date:   Wed, 16 Mar 2022 14:46:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20220316164321.467262902D1@yagi.h-net.msu.edu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Wed, 16 Mar 2022 13:46:33 -0800 (GMT+8)
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_20,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Dennis,

I don't know if you and the remote party would be willing to try but if 
you are, try using a software TNC like Direwolf or UZ7HO's soundmodem 
(under Wine).  Those multi-platform TNCs run circles around most 
hardware TNCs when it comes to weak signal decodes. They both also 
support FX.25 which you can enable to add FEC to the communications to 
improve the reliability.

--David
KI6ZHD



>   > I _had_ been interpreting most of the rest of the RRx frames as idle
>   > polls, but I can see where that may have been erroneous and they
>   > could be getting lost.  I don't _think_ that explains why I don't
>   > resend I01 after I get RR1 from him.
>
> David,
>
> I went back and reviewed the spec.  Comparing the timing of the
> conversation with his expected timer settings my known ones, I've
> concluded that what I thought were T3 timeouts (channel keepalives) were
> probably in fact FRACK timeouts, and that therefore as you suggested,
> more packets were getting lost than I originally thought.
>
> This link is a little marginal, and it varies by time of day, but it
> isn't usually _this_ bad.
>
> De

