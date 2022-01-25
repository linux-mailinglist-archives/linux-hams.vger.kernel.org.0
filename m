Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6414649B371
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jan 2022 13:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348972AbiAYMA0 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 25 Jan 2022 07:00:26 -0500
Received: from shiva-su2.sorbonne-universite.fr ([134.157.0.153]:60310 "EHLO
        shiva-su2.sorbonne-universite.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1385561AbiAYLzZ (ORCPT
        <rfc822;linux-hams@vger.kernel.org>);
        Tue, 25 Jan 2022 06:55:25 -0500
X-Greylist: delayed 531 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Jan 2022 06:55:25 EST
Received: from nirriti.ent.upmc.fr (nirriti.dsi.upmc.fr [134.157.0.215])
        by shiva-su2.sorbonne-universite.fr (Postfix) with ESMTP id 122B8560EC63;
        Tue, 25 Jan 2022 12:46:26 +0100 (CET)
Received: from [44.168.19.21] (lfbn-idf1-1-460-252.w86-242.abo.wanadoo.fr [86.242.166.252])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pidoux)
        by nirriti.ent.upmc.fr (Postfix) with ESMTPSA id DF04B12E4BCB1;
        Tue, 25 Jan 2022 12:46:25 +0100 (CET)
Message-ID: <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
Date:   Tue, 25 Jan 2022 12:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [AX25] ipv6 incompatible with AX.25
Content-Language: fr
From:   Bernard Pidoux <bernard.pidoux@sorbonne-universite.fr>
To:     linux-hams@vger.kernel.org
Cc:     List for the LINUX version of FBB <xfbb@f6fbb.org>, fpac@f6fbb.org,
        F3KT <f3kt@free.fr>, F6BVP <f6bvp@free.fr>
References: <4B2CD772.1030106@upmc.fr> <4B2D1025.1020106@gmail.com>
 <4B2E6729.1090102@free.fr> <4B507FAA.8010007@free.fr>
 <20100115203654.GA3084@del.dom.local> <4DFA6A59.2000709@free.fr>
Organization: Dimension Parabole
Reply-To: f6bvp@free.fr
In-Reply-To: <4DFA6A59.2000709@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi,

Recently installing a new node for kernel rose module debugging (...) I 
experienced a few connexion troubles.

Some are already known AX.25 bug and rose bug that I wanted to 
investigate taking advantage of kernel Ubuntu 5.4.151 source 
availability that can be patched and module recompiled.

Here is a new feature interfering with AX.25 connexions as displayed in 
/var/log/syslog :

Jan 25 12:16:31 f6bvp-Ubuntu kernel: [ 6942.400016] IPv6: 
ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready

After some investigations I added the following four lines in 
/etc/sysctl.conf and rebooted :

# Disable ipv6
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1

Then no more ipv6 are shown by ifconfig and AX25 connexions via LAN are 
now ok !

enp5s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
         inet 44.168.19.21  netmask 255.255.255.240  broadcast 44.168.19.31
         ether 00:23:54:8d:41:e9  txqueuelen 1000  (Ethernet)
         RX packets 44907  bytes 60439240 (60.4 MB)
         RX errors 0  dropped 53  overruns 0  frame 0
         TX packets 16668  bytes 2115347 (2.1 MB)
         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

Looking at my ROSE/FPAC nodes I found that I could perform the same 
changes on my RaspBerry Pis nodes for better results.

I hope this will help and I have a question. Shall this line be 
uncommented in sysctl.conf ?

# Uncomment the next line to enable packet forwarding for IPv4
#net.ipv4.ip_forward=1

I actually have the following in my ax25start script :

ax25start:echo 1 > /proc/sys/net/ipv4/ip_forward

