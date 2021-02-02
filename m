Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F1F30B40D
	for <lists+linux-hams@lfdr.de>; Tue,  2 Feb 2021 01:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhBBAXo (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 1 Feb 2021 19:23:44 -0500
Received: from trinity.trinnet.net ([96.78.144.185]:3969 "EHLO
        trinity3.trinnet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhBBAXn (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 1 Feb 2021 19:23:43 -0500
X-Greylist: delayed 1203 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Feb 2021 19:23:43 EST
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 1120N23d018119
        for <linux-hams@vger.kernel.org>; Mon, 1 Feb 2021 16:23:02 -0800
To:     Linux Hams <linux-hams@vger.kernel.org>
From:   David Ranch <linux-hams@trinnet.net>
Subject: ax25mail-utils 0.14 released
Message-ID: <6d23eeea-f898-629a-636b-3ae65f8c81fc@trinnet.net>
Date:   Mon, 1 Feb 2021 16:23:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Mon, 01 Feb 2021 16:23:02 -0800 (GMT+8)
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Everyone,

I'm happy to announce that ax25mail-utils 0.14 has been released. A HUGE 
thanks to Martin KD6YAM for all his help in this release!

This new version has some needed fixes, structural improvements to the 
code for mail, initial support for relaying messages to/from Kantronics 
KPC3 PBBS, fixed broken config parsing, updated the native Debian 
debuild support, improvements to the autoconf files, added the 
ax25mail-utils.spec RPM spec file, etc.

https://sourceforge.net/p/ax25mail/news/2021/02/ax25mail-utils-014-released/

--David
KI6ZHD

