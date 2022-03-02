Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403524CA8C5
	for <lists+linux-hams@lfdr.de>; Wed,  2 Mar 2022 16:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239644AbiCBPGD (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 2 Mar 2022 10:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243359AbiCBPGB (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 2 Mar 2022 10:06:01 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A65FCA722
        for <linux-hams@vger.kernel.org>; Wed,  2 Mar 2022 07:05:17 -0800 (PST)
Received: from rns-stearn.co.uk ([51.148.159.8]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.179]) with ESMTPSA (Nemesis) id
 1Mduym-1nwpXI3GMA-00az5A for <linux-hams@vger.kernel.org>; Wed, 02 Mar 2022
 16:00:10 +0100
Received: from [192.168.32.6] (IDENT:1000@ux5.g1sog [192.168.32.6])
        by ux4.g1sog (8.15.2/8.15.2) with ESMTP id 222F07Nu019388;
        Wed, 2 Mar 2022 15:00:07 GMT
Message-ID: <621F8677.3000008@rns-stearn.co.uk>
Date:   Wed, 02 Mar 2022 15:00:07 +0000
From:   Richard Stearn <richard@rns-stearn.co.uk>
Organization: Someday
User-Agent: Thunderbird 2.0.0.18 (X11/20081105)
MIME-Version: 1.0
To:     Linux Hams <linux-hams@vger.kernel.org>
Subject: Re: Wireshark ax25 dissector
References: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
In-Reply-To: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:mU5Z8Ctx+FViaf8MflYF/oH0ZxNKNKlW8UREru9weeyqaFliVlQ
 B6yDGp93cCa3p5q+szwR4bcZoWGq2uDRsFcGUA38GZXm1ZI/cjZ/+8Ip/HHpvnLo6+HPCyt
 b6ci/jELAjrg1STCwtUlCYuV8Lp7sRRJf1gkGYecmn9CSWSK9cJ5ha0PZg+NZUMtjNIZ2yY
 2rpPw+TtNygOF37Ti4ORQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2PnkG7szUKE=:nfdWALY0zhFHJI42x/90VF
 Hla09am8qb0GtLWv7QrKEMCcfpZcoQkHpXwPBtt/Sv0hFpEfsMxBk/+m9M2qfHg/GiAQrNMH7
 CBzB+6Eeu1bhHyW2dq2aQoQ+J1SCwdV80Htih5mOkeHfDoFxnweJyhl3RZoZe35XeKiHA5FNY
 fubm5IRq2I2QxCWIDVHT5WUDnEGxo/KBDdzbKYkA4lRJfNNLazsSaEv0qCWA3h0h8X4BN4+9Y
 ZQwH4bZxYg8Ujg8/EvcoiLEIWRI9QSE4SKVmZsjN3YuV7B4cNEWR/7JpE5kEijfTgl5swgzrf
 V7Ja7UK1jdaib597E0AVnTQMTX/WPWQrvbsXH4h/TjhKbTKLaivWgot2LvpE5ZppQYBEN8jQH
 qkpr/TyyfvBdHFoBDZYYauY8WNfQo505elQ8cJtWVZ1ZJqNqZRMuQy+uXHi8i1IBp2BmPqsqF
 LASjnZ5ax4NP8N4C6PaUemMkOICMNWs7NM6IR2a6iJZkMDD66hGu3wvS3GjKzKgzXAJGzeM3f
 MLJ27QWa5okoKNagrzTJoN8fg/oGpbGXMlXFDVz25G1lowiteuEMn4igKxsiLcK9oLV2HX55X
 rg4AvHbyY1C5oYC6WtAeHRoFbooH9iqcAQX5ogbZy+t6XqPV8bb5TDKTmspOWb8xM2FQWM5bo
 eo6BAXBHoLPa/JXLV82eISsOjoEgTY9bzcS/pXgY5kvDmYSJR3lTKcGpjn0W9D0+l6+oduKjd
 UPvKIHzQZJOJzuVJ
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Dennis Boone wrote:

> I'm having trouble getting Wireshark's ax25 dissector to process
> callsign filters properly.  I can't get _anything_ to match.  I've tried
> expressions like:

The ax25 dissector never had the ability to filter on a callsign in the form 
<CALL>-<SSID> it has always used the builtin filter primitives.

See "man wireshark-filter"

So to filter on KB8ZQZ you would use:

	ax25.src[0:6] == 97:85:71:B5:A3:B5

to filter on the source address or

	ax25.dst[0:6] == 97:85:71:B5:A3:B5

You can find the hexadecimal in the AX.25 line in brackets after the
callsign.

So it is not a bug per se.  More of the point at which I had to abandon
development due to ill health.

-- 
Regards
	Richard

