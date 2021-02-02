Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927E830B437
	for <lists+linux-hams@lfdr.de>; Tue,  2 Feb 2021 01:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhBBAjs (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 1 Feb 2021 19:39:48 -0500
Received: from trinity.trinnet.net ([96.78.144.185]:3980 "EHLO
        trinity3.trinnet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhBBAjs (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 1 Feb 2021 19:39:48 -0500
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 11202xvQ017997
        for <linux-hams@vger.kernel.org>; Mon, 1 Feb 2021 16:02:59 -0800
To:     Linux Hams <linux-hams@vger.kernel.org>
From:   David Ranch <linux-hams@trinnet.net>
Subject: Linpac 0.28 released!
Message-ID: <a8078bf7-4cd4-9661-773d-78e5497f4a8c@trinnet.net>
Date:   Mon, 1 Feb 2021 16:02:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Mon, 01 Feb 2021 16:02:59 -0800 (GMT+8)
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


https://sourceforge.net/p/linpac/news/2021/02/linpac-028-released/

I'm happy to announce that Linpac 0.28 has been released. A HUGE thanks 
to Martin KD6YAM for all his help in this release!

This new version has some needed fixes (buffer overflows, stack 
corruptions, etc), structural improvements to the code for mail, 
integrated the lptelnet package for access as a client into client 
(master control is still best via a screen session), improvements to the 
mail reader view, initial support for relaying messages to/from 
Kantronics KPC3 PBBS, updated the start-linpac.sh script to better work 
with screen, tuned the mheard output, added native Debian debuild 
support, more testing using ax25spyd, updated the User documentation 
with additional FAQ entries, the applguide doc received major updates, 
updated the linpac-todo.txt file, etc.

--David
KI6ZHD


