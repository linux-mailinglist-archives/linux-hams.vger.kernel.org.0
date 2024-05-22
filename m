Return-Path: <linux-hams+bounces-302-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 979BA8CC552
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 19:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53338282B9D
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 17:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F991420A8;
	Wed, 22 May 2024 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwO47zU6"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31431F17B;
	Wed, 22 May 2024 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716397623; cv=none; b=rmXih3MK20Orws7K6vdOeeYvdLFp15NRd/aTSerHt0xPtZOsoXYrK3QVk3aENPhNEpiWV2b9PIUFbF5617EzvOpvLYS2MDsKBdy3P2WT43W90naj0UdSqVDQV8HWPu7vVPRbe54fY4nszm9AEiI7J3RPmla96VGZlnr8GPOmgiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716397623; c=relaxed/simple;
	bh=VT/JBh3eDnFD11dqMnYx/UbHuUSPBomoQuwIbMCHTHU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqSYD65tQ9siMkL65K2cqte6DNsdcUdpcOjLaUR0myH72PXlmlwooLFnlb+jzsKjrexyt57pOP+A/7bbEF64xMCioBh2EeXsJpx9d3zW9yZzYaxdfpr7kQKA2camB4eCUvD9Mpsyo7x3M3U7UTnjrLWx763SimzxNuUTLiEH/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwO47zU6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7481CC2BBFC;
	Wed, 22 May 2024 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716397622;
	bh=VT/JBh3eDnFD11dqMnYx/UbHuUSPBomoQuwIbMCHTHU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YwO47zU68N09SE0yuqseE9tBnDiXbQ1YIV332OZ1VBRsUpWb1vECX5iKMKg+Sj0OU
	 63Xvr7KnEZogatJm78JyXQrkA7vH1qX+56vSWzN6npfPDPDKGAlxnHy/zAjlSh8zfT
	 9gVWA8z+xmYUIk7YsNRn8R3neoUotBuE4jF6Hy1jm4DvKI7OHBZrDt6AOmGye3fuUD
	 vhahbM0X9snkAbBqxc2+Zvhc4laqMX6QD+RSXQ6cwLn5A4ijcjZwu+OV/6G4aUlbCU
	 Jb5gv9YFIl8P4WoscJFnzY7q0SnWtgXwqTV46qGnoO4vYcwDKM+BZb0erG5/UtkmQv
	 kpNtOPmD8T4oA==
Date: Wed, 22 May 2024 10:07:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: lars@oddbit.com
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3] ax25: Fix refcount imbalance on inbound connections
Message-ID: <20240522100701.4d9edf99@kernel.org>
In-Reply-To: <20240521182323.600609-3-lars@oddbit.com>
References: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
	<20240521182323.600609-3-lars@oddbit.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 May 2024 14:23:25 -0400 lars@oddbit.com wrote:
> Fixes: 7d8a3a477b

correct fixes tag for this hash would be:

Fixes: 7d8a3a477b3e ("ax25: Fix ax25 session cleanup problems")

Please post v4 as a new thread (not in reply to).
Please CC maintainers (per script/get_maintainer.pl)
-- 
pw-bot: cr

