Return-Path: <linux-hams+bounces-154-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A218B4CB4
	for <lists+linux-hams@lfdr.de>; Sun, 28 Apr 2024 18:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA2691F212F5
	for <lists+linux-hams@lfdr.de>; Sun, 28 Apr 2024 16:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9457317F;
	Sun, 28 Apr 2024 16:33:28 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from newsmtp.uns.ac.rs (smtp.uns.ac.rs [147.91.173.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBFF71748
	for <linux-hams@vger.kernel.org>; Sun, 28 Apr 2024 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.91.173.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714322008; cv=none; b=hgZK5T1tGELuNWlXqebqGdOhh7VmPQMawK7FLH65BapwuRkDEBpzpjYA/YBAWDfDuNnyymICHebw4LJXKwLmz9bbniV1kdTVgbL2aLxbeOP43GuuFzuUiNBOeFNSq08GhzS8nQ9tjiBI8smB4jyVlMAK+x4YafWLwg6NlTf7mn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714322008; c=relaxed/simple;
	bh=7VA/a2mTwLc45dfYiPmYzK2MY8bKdi1a2ev+2p/5LrY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=RVhEM52XpcVds2Ned82O6a8UKCOep7oziESpp2e77IXONzLh2WQQyW2BzBt5+5Wy5uvb+PyYG3ALeSXTGMswEBUcjIkunBtrYrLtn2vDQ+NpP2os4OUqEbvMSq/UmGr3P8zTBrTm5EexRtWuF0tJgr3AdJ2MOJVK672WSQrDbkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uns.ac.rs; spf=pass smtp.mailfrom=uns.ac.rs; arc=none smtp.client-ip=147.91.173.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uns.ac.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uns.ac.rs
Received: from newsmtp.uns.ac.rs (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with ESMTP id 5CFAE259BD5
	for <linux-hams@vger.kernel.org>; Sun, 28 Apr 2024 18:06:12 +0200 (CEST)
Received: from [147.91.175.27] (unknown [147.91.175.27])
	by smtp.uns.ac.rs (Postfix) with ESMTP id AF8C4259BBE
	for <linux-hams@vger.kernel.org>; Sun, 28 Apr 2024 18:06:11 +0200 (CEST)
Message-ID: <dd43a40e-ab22-a751-185f-3931ade2fa8f@uns.ac.rs>
Date: Sun, 28 Apr 2024 17:57:30 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Miroslav Skoric <skoric@uns.ac.rs>
Subject: [...] unregister_netdevice: waiting for ax0 to become free. Usage
 count = -1
To: linux-hams@vger.kernel.org
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi,

One of my two machines in the LAN goes into 'endless' repeating of the 
following lines when I want to shut it down. (Ok, not really endless but 
it does take some half an hour.) That comp runs an older version of ax25 
subsystem and on top of it runs FPAC node and FBB mailbox. The issue 
happens whenever the *other* machine has some netrom activity such as a 
BPQ node/bbs or like.

[...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1
[...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1
[...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1
...
...


after some 30 minutes there appear two other lines:


[TIME] Timed out starting Power-Off.
[ !! ] Forcibly powering off: job timed out


and it resumes repeating the above for a while:


[...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1
[...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1


and it finally powers off after a minute or so.

It makes me wonder why it behaves like that. I tested that behaviour 
thoroughly (by having the other machine running, or not running some 
packet node stuff) and realized that it shuts down properly, without any 
delay only when the other machine is not having any packet node active. 
(The other comp can be switched on, but without any node/bbs running.)

Any idea?

Misko YT7MPB


