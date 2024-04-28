Return-Path: <linux-hams+bounces-155-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 613798B4DB6
	for <lists+linux-hams@lfdr.de>; Sun, 28 Apr 2024 22:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C5D5281584
	for <lists+linux-hams@lfdr.de>; Sun, 28 Apr 2024 20:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054EC74407;
	Sun, 28 Apr 2024 20:03:31 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C677172B
	for <linux-hams@vger.kernel.org>; Sun, 28 Apr 2024 20:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714334610; cv=none; b=T2RuMMALrwT7Tbe7UH5HhWYrC7MhIAXo56WLnyy0s3PRE5zG4FoqXfeArdbl4ftpPz5X/QCFDv2RMa7fEMR9cS3HbOpxo3Cyd1lHX+EMlYl76O/eLlJvkdcJlzLSWnyTFq8CDlEUoIKKdEBHIyJynlaxjq1UByE256NH0/EmnlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714334610; c=relaxed/simple;
	bh=469CMxlDHUCPRkmZ8HxLpxKFmlyQqCqviLL0riT4PDo=;
	h=From:Subject:To:References:Cc:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=HKvf3VhK9+vIPnfF8nO9q9hqh9qbfwQBIDCzxxEYoAeTCJLvbbZ+UqvBu3gh0o8RgxbQnJJo6PjIgiiDHKQXkNyC44tBpLngyZXSlxH3xV8Vv8cFeo1UgW/NMUTrmSpvhoFoav9dWyU3A6JS36+ZddRlYsV0Xr0QVn1AbW1EDTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 43SK3Nca026569;
	Sun, 28 Apr 2024 13:03:25 -0700
From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [...] unregister_netdevice: waiting for ax0 to become free. Usage
 count = -1
To: linux-hams@vger.kernel.org
References: <dd43a40e-ab22-a751-185f-3931ade2fa8f@uns.ac.rs>
Cc: Miroslav Skoric <skoric@uns.ac.rs>
Message-ID: <840d1156-4aa0-8d13-5a17-7109eb771ef9@trinnet.net>
Date: Sun, 28 Apr 2024 13:03:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <dd43a40e-ab22-a751-185f-3931ade2fa8f@uns.ac.rs>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sun, 28 Apr 2024 13:03:25 -0700 (PDT)


Hello Misko,

This is a kernel bug and has been discussed in the list (see the 
archives): http://vger.kernel.org/vger-lists.html#linux-hams

    I recently responded with: 
https://www.spinics.net/lists/linux-hams/msg05486.html

it seems to me that different kernel versions can hit this issue in 
different ways but I can confirm that the Ubuntu 20.04 distro's 5.15.0 
kernel hits this issue.  I'm also starting to believe that if 
Canonical's kernel "LivePatch" feature is enabled and you have stale 
AX.25 connections, the kernel starts to have issues and maybe after 
?5-7? days of decay, the machine will eventually hard lock up.  You 
won't see the panic output if you're running X as the GUI displays hides 
the output.  Btw, it's also becoming painfully obvious that different 
Linux distro's version of "their" kernel might or might not be taking on 
some of these new kernel "fixes" that break or fix parts of the AX.25 
stack.  It's very clear to me, these patches are coming in w/o any real 
testing and as long as it passes a visual review and it compiles, it's 
committed into the tree.

I've since moved from u20.04 over to a Raspberry Pi OS Bookworm 6.6.20 
kernel setup for ~2wks.  So far I haven't seen any similar issues 
(except I found a new issue with the axparms tool now corrupting the 
callsign+ssid stack).

--David
KI6ZHD







Re: unregister_netdevice: waiting for ax0 to become free


On 04/28/2024 08:57 AM, Miroslav Skoric wrote:
> Hi,
>
> One of my two machines in the LAN goes into 'endless' repeating of the 
> following lines when I want to shut it down. (Ok, not really endless 
> but it does take some half an hour.) That comp runs an older version 
> of ax25 subsystem and on top of it runs FPAC node and FBB mailbox. The 
> issue happens whenever the *other* machine has some netrom activity 
> such as a BPQ node/bbs or like.
>
> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
> count = -1
> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
> count = -1
> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
> count = -1
> ...
> ...
>
>
> after some 30 minutes there appear two other lines:
>
>
> [TIME] Timed out starting Power-Off.
> [ !! ] Forcibly powering off: job timed out
>
>
> and it resumes repeating the above for a while:
>
>
> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
> count = -1
> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
> count = -1
>
>
> and it finally powers off after a minute or so.
>
> It makes me wonder why it behaves like that. I tested that behaviour 
> thoroughly (by having the other machine running, or not running some 
> packet node stuff) and realized that it shuts down properly, without 
> any delay only when the other machine is not having any packet node 
> active. (The other comp can be switched on, but without any node/bbs 
> running.)
>
> Any idea?
>
> Misko YT7MPB
>


