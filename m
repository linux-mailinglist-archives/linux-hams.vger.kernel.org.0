Return-Path: <linux-hams+bounces-758-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E1719D3BE75
	for <lists+linux-hams@lfdr.de>; Tue, 20 Jan 2026 05:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 684564EA95A
	for <lists+linux-hams@lfdr.de>; Tue, 20 Jan 2026 04:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AA8352FB8;
	Tue, 20 Jan 2026 04:36:16 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D67B352C49;
	Tue, 20 Jan 2026 04:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768883776; cv=none; b=k1Kbtm/2sQAe2S0HwYIu7Re9qawgZBEsZd5U/JL1560+fNSD93gqoeSaPt/lFedKX6ICM9eAfBKXfKEdi4rLrtmZMqAqocqxp0mGr+V/yMLy+usSw6M2y4eIIiAGKDUtwqUghQ58c5ptX9FGWrW22Cdy4a+PzYzScA9I+4N1WJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768883776; c=relaxed/simple;
	bh=zq3aUv+vd68NVbEXfx5sSGDDJVBnY2T2xdOvzRF3I3k=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mZxH3WEk1zgZ4p/LgqGKiKIJ9106nQASn0oU7SYML0+gcU/eqKuCyTrOdfYjh9Cc6D6TIkNzt1oxkALzFdrqq8TVilbQlKOd61gW/1ighLYwg7v1+PcJ+y2OY+cb2y8AwBkOmqBV6IYh6eADLK8BmzvBrET7Z80DmlcMJpu86Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 60K3b7lF024053;
	Mon, 19 Jan 2026 19:37:07 -0800
Subject: Re: Testing for netrom: fix memory leak in nr_add_node
To: F6BVP <f6bvp@free.fr>, activprithvi@gmail.com
References: <20260117142632.180941-1-activprithvi@gmail.com>
 <f108f1f4-cdd3-4b14-ad24-d1ef328ca316@free.fr>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
        kuba@kernel.org, linux-hams@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        pabeni@redhat.com,
        syzbot+3f2d46b6e62b8dd546d3@syzkaller.appspotmail.com,
        syzkaller-bugs@googlegroups.com
From: David Ranch <dranch@trinnet.net>
Message-ID: <46f8fefa-f549-0b8b-d37e-0d608c5ee5f6@trinnet.net>
Date: Mon, 19 Jan 2026 19:37:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f108f1f4-cdd3-4b14-ad24-d1ef328ca316@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Mon, 19 Jan 2026 19:37:08 -0800 (PST)


Thanks for catching that Bernard and I sure wish kernel committers would 
test their code before committing it! Does the kernel show any sort of 
diagnostic information before it resets?  An oops on the serial console, 
etc?

--David
KI6ZHD


On 01/19/2026 01:06 PM, F6BVP wrote:
>
> Proposed patch is lethal to netrom module and kernel causing a reboot 
> after a few minutes running ROSE / FPAC node f6bvp.
>
> Bernard, f6bvp
>


