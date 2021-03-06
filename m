Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E438432FD9E
	for <lists+linux-hams@lfdr.de>; Sat,  6 Mar 2021 22:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhCFVp5 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 6 Mar 2021 16:45:57 -0500
Received: from trinity.trinnet.net ([96.78.144.185]:1855 "EHLO
        trinity3.trinnet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhCFVp5 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 6 Mar 2021 16:45:57 -0500
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 126Ljuq1028950
        for <linux-hams@vger.kernel.org>; Sat, 6 Mar 2021 13:45:57 -0800
From:   David Ranch <linux-hams@trinnet.net>
Subject: Linux AX.25 stack now toxic for connected packet connections with
 Ubuntu 20.04 / 5.8.0-44-generic #50
To:     Linux Hams <linux-hams@vger.kernel.org>
Message-ID: <32262788-02bf-5a92-dff6-75b916390108@trinnet.net>
Date:   Sat, 6 Mar 2021 13:45:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sat, 06 Mar 2021 13:45:57 -0800 (GMT+8)
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello Everyone,

I wanted to check with the larger community to see if others are 
experiencing system crashes when making connected AX.25 sessions. I have 
confirmed that this is NOT an RFI thing and sending unconnected (UI) 
transmissions (beacons) small or large is fine, and even initiating the 
beginning of connected session to a non-existent remote station callsign 
is OK with axcall, linpac, etc.  The issue is that once a valid AX.25 
connection is established, I begin to receive data from the remote 
station and then seemingly when my station is to send an ACK packet, the 
machine locks hard.  No segmentation failure, no kernel panic, the 
Gnome3 display stays up but the screen no longer updates , nothing in 
the logs and even stops pinging from a different machine on the LAN.  
The machine is 100% crashed and this is 100% reproducible.

Is anyone else seeing this?

    $ uname -a
    Linux hampacket3 *5.8.0-44-generic #50*~20.04.1-Ubuntu SMP Wed Feb 
10 21:07:30 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux


Any recommendations on how to get some sort of details out of my system 
about this crash would be helpful.

--David
KI6ZHD
