Return-Path: <linux-hams+bounces-628-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B124FB48040
	for <lists+linux-hams@lfdr.de>; Sun,  7 Sep 2025 23:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EAB6178F06
	for <lists+linux-hams@lfdr.de>; Sun,  7 Sep 2025 21:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8293D21B196;
	Sun,  7 Sep 2025 21:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJG6ltbc"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E13315D34;
	Sun,  7 Sep 2025 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280816; cv=none; b=fCxeX1TDxDWSb8WZC0RGIJXHQG5RB6W8zfUo2U7Ck5+p6yHBHuwTa5ok0wVPmYVoII3lhgZxxI11fcrwr+SHiJy/7/ynyrVpzm+ADW29Vp4GM5yuCoJF2Hl+wKyvWdxpGNH/H8sBdUsrkdt2HAdQg83jZj95EJHlIudI9ICRXRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280816; c=relaxed/simple;
	bh=hiMCFehmnx56n2SHN3BYYz7V60JA05vff8v68I8prAo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=urNZndVirFyrA+QMGOYNDl8AqwKa5Imh4JhylwYIrvq37OChwAoe4ekKcrCYEr/8D+PJPy2EQOu7szKml8KNdA+DGs91SO6i9ZK5ykCONO8UthoBL2QGWPGq1wjRqWGF3t40gzgEC/aR/OuHTcZeSVF5TcXpWxMSmMSDP8akeC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJG6ltbc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26086C4CEF0;
	Sun,  7 Sep 2025 21:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757280815;
	bh=hiMCFehmnx56n2SHN3BYYz7V60JA05vff8v68I8prAo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dJG6ltbcaFD6NwmYvMQjuz6nXV3U52qVGIYMKKSKmdeD/T4caAizPm0kndmlxcP3M
	 lf6vzys5sEGUVUiE60ohYv9jN7t6/zAe7KLgkD8Vhxk8SdoG3yFNyvE9Sa5RhVarzF
	 jD4SV7wWP+Qachp8XHykeGTtjsEg3I3zC+cKHHfJWfkgTshv+9pjJwDKi9MO5xRx4+
	 t6grpthV8A/935bpCgEJ45W5M5SDz6TPDYFJ0X/ayAcNpDPIcgwCTf+Q2ngrlAA92m
	 tAFR4m3FMbqwuFDizVpLNbPlj1tw6yBjGMGebaNx0KpnNwkpKqOpdwNdy9P0CXCyyw
	 dSJgWToj/+i4w==
Date: Sun, 7 Sep 2025 23:33:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Bernard Pidoux <bernard.f6bvp@gmail.com>
cc: stanislav.fort@aisle.com, davem@davemloft.net, disclosure@aisle.com, 
    edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
    linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
    netdev@vger.kernel.org, pabeni@redhat.com, security@kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH net v4] netrom: linearize and validate lengths in
 nr_rx_frame()
In-Reply-To: <FDBA9F48-A844-4E65-A8B1-6FB660754342@gmail.com>
Message-ID: <8q049863-056n-7o39-4373-pr9q9213q1n7@xreary.bet>
References: <FDBA9F48-A844-4E65-A8B1-6FB660754342@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 7 Sep 2025, Bernard Pidoux wrote:

> While applying netrom PATCH net v4
> patch says that 
> it is malformed on line 12.
> 
> However I cannot see any reason.

There is a superfluous leading space on each line of the diff. (wasn't the 
case with the previous patches, v4 is the first one to have this).

-- 
Jiri Kosina
SUSE Labs


