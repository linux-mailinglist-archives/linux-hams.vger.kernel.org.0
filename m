Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3142B4CAF70
	for <lists+linux-hams@lfdr.de>; Wed,  2 Mar 2022 21:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiCBUJo (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 2 Mar 2022 15:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiCBUJn (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 2 Mar 2022 15:09:43 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EC426DB
        for <linux-hams@vger.kernel.org>; Wed,  2 Mar 2022 12:08:56 -0800 (PST)
Received: from rns-stearn.co.uk ([51.148.159.8]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.163]) with ESMTPSA (Nemesis) id
 1MAtoX-1nVqqk3A8f-00BMgl for <linux-hams@vger.kernel.org>; Wed, 02 Mar 2022
 21:03:51 +0100
Received: from [192.168.32.6] (IDENT:1000@ux5.g1sog [192.168.32.6])
        by ux4.g1sog (8.15.2/8.15.2) with ESMTP id 222K3lHP006749;
        Wed, 2 Mar 2022 20:03:48 GMT
Message-ID: <621FCDA3.9030908@rns-stearn.co.uk>
Date:   Wed, 02 Mar 2022 20:03:47 +0000
From:   Richard Stearn <richard@rns-stearn.co.uk>
Organization: Someday
User-Agent: Thunderbird 2.0.0.18 (X11/20081105)
MIME-Version: 1.0
To:     Linux Hams <linux-hams@vger.kernel.org>
Subject: Re: Wireshark ax25 dissector
References: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu> <621F8677.3000008@rns-stearn.co.uk> <ad99bc17-9a89-9524-b7d8-81a4582e0380@trinnet.net>
In-Reply-To: <ad99bc17-9a89-9524-b7d8-81a4582e0380@trinnet.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:P7DBuRRhxTQykMoc4eAwOVARZni6ZHtwDbRO17SDywcLvaYTJP2
 67K0szJHbGtLytml8WjejLwrp27X7T+FYL7iptJsHVHAQZ+QVN+OditoMykJAZTbTOH/CI5
 9ivtilegVdFwXsL7cV+XG0Zgh0fQG6/vK+/S3Tmx1YiXIbbRW0tGBrJH1MNszZQnUjjZEec
 suo0ZX1jU4GUADkgMDsjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tfhelTQKn3Q=:tYiC/ith9ZzmbaBbqewTm9
 NyazUd6YJnCDC0kauRmcomoBkFBnsQYdGsd8N/k44wl9NaPi+o7thlaw28Zm8mvnLJyXy/Whg
 x7zsUxS3gYvJhw5lv3heL5JgtMGGkYbqksu+XqVJRGvwqyi/Hqh6p3A9b0EzQhCRCU1qF78Dn
 iIHQ0EO1KEFAl0dCD+fmq5DFjQK+l9q6ATY6g9H6Wg13Qgig+wGVdOG4ERMAgfwDzoKp3MaO0
 kbDzQcRS1g1VyVgybhCl3gk3Ijt6lhbpdEevve2tXKj7LHdGbGaJFc0X8xBlgVCDqRKS+/IA9
 7jZpABcJE2xJQ1i9ynYXm8wPOzTS0z0rP5rQ2IzlCtFE2ISVOqqpEcPsQhzqdO80JpoPDHdv4
 wgk/xx9/JNzsqnTgiBH3QIQo4Wez8XD3luQsRc37PxJv9Uwgv40xOfgNZrjllaSI7cEGTTMV0
 MOoryUdHCl3sXs8cYP+dxybn/I18kqj9lRgNGfEx97d57pjigSSKCXuJsMsY9LxTU9MnL3Cbr
 XUnNgriKtxDE4KayHz/h7cM87P6mHjX+GA6NWICDdXQ0DTNFlnMwG4Knmj0QnazT4pbfJeO+p
 YL3kLBk1CNYyCMKXWV3Ae7jP3ucwixhCUbEJIqgeAkVUmh5vP/mODsrz4EzRtt7xaxxwl8BwI
 GA/1mcew28aP/ghQnJodfLu40MTY28vdl8mK5qURWMCiuaF/UK/gdaHn0sVkoeLX7RJijAGV1
 I3LOsBLCy5JeKABr
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

David Ranch wrote:
> 
> Hello Richard,
> 
> Ah... I think I understand now and this more of an AX-IP filter and not 
> a standard AX.25 callsign filter.  I guess the more appropriate filter 
> name should be "ax25.srcmac"?

It is applying the filter to the ax25.src fields but the callsign parser that 
should convert an ax25 callsign to the bit pattern for comparison is incomplete
so only a hexadecimal comparison field can be used.

in epan/ftypes/ftype-bytes.c the following function in incomplete:

static gboolean
ax25_from_unparsed(fvalue_t *fv, const char *s, gboolean allow_partial_value, 
LogFunc logfunc)
{
         /*
          * Don't log a message if this fails; we'll try looking it
          * up as another way if it does, and if that fails,
          * we'll log a message.
          */
         if (bytes_from_unparsed(fv, s, TRUE, NULL)) {
                 if (fv->value.bytes->len > FT_AX25_ADDR_LEN) {
                         logfunc("\"%s\" contains too many bytes to be a valid 
AX.25 address.",
                             s);
                         return FALSE;
                 }
                 else if (fv->value.bytes->len < FT_AX25_ADDR_LEN && 
!allow_partial_value) {
                         logfunc("\"%s\" contains too few bytes to be a valid 
AX.25 address.",
                             s);
                         return FALSE;
                 }

                 return TRUE;
         }

         /*
          * XXX - what needs to be done here is something such as:
          *
          * Look for a "-" in the string.
          *
          * If we find it, make sure that there are 1-6 alphanumeric
          * ASCII characters before it, and that there are 2 decimal
          * digits after it, from 00 to 15; if we don't find it, make
          * sure that there are 1-6 alphanumeric ASCII characters
          * in the string.
          *
          * If so, make the first 6 octets of the address the ASCII
          * characters, with lower-case letters mapped to upper-case
          * letters, shifted left by 1 bit, padded to 6 octets with
          * spaces, also shifted left by 1 bit, and, if we found a
          * "-", convert what's after it to a number and make the 7th
          * octet the number, shifted left by 1 bit, otherwise make the
          * 7th octet zero.
          *
          * We should also change all the comparison functions for
          * AX.25 addresses check the upper 7 bits of all but the last
          * octet of the address, ignoring the "end of address" bit,
          * and compare only the 4 bits above the low-order bit for
          * the last octet, ignoring the "end of address" bit and
          * various reserved bits and bits used for other purposes.
          *
          * See section 3.12 "Address-Field Encoding" of the AX.25
          * spec and
          *
          * 
http://www.itu.int/ITU-R/terrestrial/docs/fixedmobile/fxm-art19-sec3.pdf
          */
         logfunc("\"%s\" is not a valid AX.25 address.", s);
         return FALSE;
}


-- 
Regards
	Richard
