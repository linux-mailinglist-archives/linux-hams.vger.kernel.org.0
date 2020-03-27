Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95419195D1F
	for <lists+linux-hams@lfdr.de>; Fri, 27 Mar 2020 18:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgC0RsB (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 27 Mar 2020 13:48:01 -0400
Received: from trinity.trinnet.net ([96.78.144.185]:4810 "EHLO
        trinity3.trinnet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgC0RsB (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 27 Mar 2020 13:48:01 -0400
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS/8.15.2) with ESMTP id 02RHm054029504
        for <linux-hams@vger.kernel.org>; Fri, 27 Mar 2020 09:48:00 -0800
From:   David Ranch <linux-hams@trinnet.net>
To:     Linux Hams <linux-hams@vger.kernel.org>
Subject: New Linpac pre-release ready for testing..
Message-ID: <4df52fc2-29b3-dcfd-613a-cb165b411bea@trinnet.net>
Date:   Fri, 27 Mar 2020 10:48:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Fri, 27 Mar 2020 09:48:00 -0800 (GMT+8)
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello Everyone,

If you're a Linux AX.25 user, I'm looking for compile-savvy testers to 
give the new version of Linpac posted in my DEVELOP branch a test:

    https://sourceforge.net/projects/linpac/


If you're not familiar with Linpac, the description is:
    --
    A modular TUI oriented (ncurses) amateur radio AX.25 keyboard to 
keyboard chat and PBBS program using Linux's AX.25 stack. Includes 
support for multiple concurrent connected sessions, a unconnected (UI) 
message screen, and an automated packet message client
    --


Compiling and install guides are available in :

    - The source's README file
    https://sourceforge.net/p/linpac/linpac/ci/develop/tree/README

    - Raspberry Pi / Debian centric guide:
http://www.trinityos.com/HAM/CentosDigitalModes/RPi/rpi4-setup.html#28.install-linpac

    - Centos centric (includes screen captures):
http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.html#11.linpac


If you need any help, you can post to this list or to the Discussion 
area on SourceForge:

    https://sourceforge.net/p/linpac/discussion/

If you find any bugs / real issues, please create a ticket on Linpac's 
SourceForge area:

    https://sourceforge.net/p/linpac/_list/tickets


--David
KI6ZHD
