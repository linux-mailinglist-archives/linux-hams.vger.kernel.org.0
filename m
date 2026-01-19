Return-Path: <linux-hams+bounces-757-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21482D3B91C
	for <lists+linux-hams@lfdr.de>; Mon, 19 Jan 2026 22:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DE3C3070356
	for <lists+linux-hams@lfdr.de>; Mon, 19 Jan 2026 21:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9852F7AD2;
	Mon, 19 Jan 2026 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="BktVU86H"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960762E0B48;
	Mon, 19 Jan 2026 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768856826; cv=none; b=DRDFsLJ/POQIudwEv+F13v7GKCNCcJYNzl+pR7M9z5W7wxw/nYArbbLIoMhmAOoGa2e8YBlWIQng9JIxoAUejt3dtl52MR2eExA+PCVYceV7NBU3LmZnq3PYTohEEYxOrUQWNUceYrxSBsxnOD8BBiBKNFnWma5xiQbtThoCma0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768856826; c=relaxed/simple;
	bh=eCQMdSpjjXF6Mq0LqahJADrEJi36OKjv9pke2zT8Wks=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rSrpTSVpJujlKNzpzHQu0su2rJUpqBodYM7rE69tesht7mjmaoHH6x5IdLKincIzig0Ycs9GvkSavGZjmdEwtDxmoj4bvCXsGbpWlNuLKca6iPLlmXxDmdvWtNopWNoeMkqt/xTu2pItftmulCNfD+VkgzpaWfmcwf3EhYBnol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=BktVU86H; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 969D119F5AF;
	Mon, 19 Jan 2026 22:06:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1768856822;
	bh=eCQMdSpjjXF6Mq0LqahJADrEJi36OKjv9pke2zT8Wks=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:From;
	b=BktVU86Ha3S5YYgC9R3axQ8m6WWF/SsVgila6PS3dq/+9X4UUmgGK3rvJQcxp39uS
	 HwjOZnm/Im2O0FNwr1iEW6pvBbq74G0oNtwh3YHkUkIdalZteGTl4vfp80Vy9/zVz0
	 BM1AodhMG8j9vgVtdrX1srGFHeB6O+V/5Y/zSxzkoWmf/MKYWvGV3v1uPnGjeJW0ya
	 pHI1OAWb+S4cFKnwr6zDZ6AFyJpTlbFHU25sd0AqU4dnIk+SYI+8PxIlYhpN6Xi0J1
	 k/Wz/+2Lh7Lc8K3/w7EDfmDVE7DLVHe8Nnm9oexXhII3ghE+KAk05ZR80J7fYt16a0
	 1oxdfv5+rNxbQ==
Message-ID: <f108f1f4-cdd3-4b14-ad24-d1ef328ca316@free.fr>
Date: Mon, 19 Jan 2026 22:06:49 +0100
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: activprithvi@gmail.com
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com,
 syzbot+3f2d46b6e62b8dd546d3@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <20260117142632.180941-1-activprithvi@gmail.com>
Subject: Re: Testing for netrom: fix memory leak in nr_add_node
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <20260117142632.180941-1-activprithvi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Proposed patch is lethal to netrom module and kernel causing a reboot 
after a few minutes running ROSE / FPAC node f6bvp.

Bernard, f6bvp


