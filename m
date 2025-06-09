Return-Path: <linux-hams+bounces-521-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D393AD2A27
	for <lists+linux-hams@lfdr.de>; Tue, 10 Jun 2025 00:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3365817005E
	for <lists+linux-hams@lfdr.de>; Mon,  9 Jun 2025 22:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F422225A35;
	Mon,  9 Jun 2025 22:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrTWFZRG"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F713221FB5;
	Mon,  9 Jun 2025 22:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509851; cv=none; b=I9NDKRjb4pKbRLvDMyuVJDk0sTAuqd8ePvAFrj71S3+D46WAzTUyixhngT7KbSJFbGWyBdGkFeemJOEwAl1FHJ4ZsOmuXponWdbgjj5EexoOXaw+lRdmaUgRVLvlodGlpMPA0N5E1TqHsBj03S18pMHd+LOOfSdgR8QafFxzXuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509851; c=relaxed/simple;
	bh=O3RIkh8fIuDuUU8AHiU0ARvWF+AEnkDibFM2u4pe1EE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VQLJ5NsBBYQXoGhWr//mZxsJY5UGSXvShH1BxNOLnd8FvI0GdLeByE3yK45bfaSdrUU2Y09jVMdKACuw1y04axl5/URCWg/nc+kshucNM9ybcBcJhjLDSuUREXY8CCPN/tTHPyeePRcbc9V/l1VxVSVNKETgrfmhqQ2wUiE6oBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrTWFZRG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1893AC4CEED;
	Mon,  9 Jun 2025 22:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749509850;
	bh=O3RIkh8fIuDuUU8AHiU0ARvWF+AEnkDibFM2u4pe1EE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OrTWFZRGCSKXvFXerjpJ0TQtjDnZg5rvcHLQVLrgweDOnqPI+J/BqgKPYK4V/Cwt2
	 05YqbHrzTFyiecdNQYV0dod66aVSUMQ87ITkRO7zMHg/HxTmJULuQ7z+UV91hAjh5e
	 BYkIzAAPuJtyX5ZHhxIAm6+g4a2A4mUQE/3fIjfuTgEyPtpx2wriroLxKIm75fJqhe
	 wwtNUxuGOYcWWUFFUdk5PW9ig8SnqcW9lZx2U80o0vIpkANoGORpR1fyvjzBmX6g+i
	 aXSsZq7hCoKMJCDUnZkG/Y94aVhFatNgkXkGjta7rSvr+8EQpp+y5EclA1x4yf2JdA
	 SogPKYhMZcDfQ==
Date: Mon, 9 Jun 2025 15:57:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Denis Arefev <arefev@swemel.ru>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Nikita Marushkin <hfggklm@gmail.com>, Ilya Shchipletsov
 <rabbelkin@mail.ru>, Hongbo Li <lihongbo22@huawei.com>,
 linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org,
 syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com
Subject: Re: [PATCH net] netrom: fix possible deadlock in nr_rt_device_down
Message-ID: <20250609155729.7922836d@kernel.org>
In-Reply-To: <20250605105449.12803-1-arefev@swemel.ru>
References: <20250605105449.12803-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Jun 2025 13:54:48 +0300 Denis Arefev wrote:
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

I suspect syzbot is the only user of this code.
Can you delete one of the locks to make the maintenance simpler?
At a glance - I don't think your fix covers all the ABBA cases.
-- 
pw-bot: cr

