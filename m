Return-Path: <linux-hams+bounces-626-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEBEB467A3
	for <lists+linux-hams@lfdr.de>; Sat,  6 Sep 2025 02:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C848566C10
	for <lists+linux-hams@lfdr.de>; Sat,  6 Sep 2025 00:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5F515667D;
	Sat,  6 Sep 2025 00:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFAwc2h1"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C04A55;
	Sat,  6 Sep 2025 00:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757119492; cv=none; b=CR15/KMT0z6PHS248HoaJFSfTbgvtabMe8+QIPL42O351Z1C2klP7n5b7x+bs2ZtkkUCuky9AgN3C3YwbXKkXXqklSpDQq3Kdy0mM9VZqoaStZ3ToCXk25hCCusIc0wxufy2Ft9KWRRKGjfnnlXtf4j/UfcW86+46diI/bx3kyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757119492; c=relaxed/simple;
	bh=lK+W7jIcDQz4jEABqbetY8xzxzI16JlOdIpsjBqZg+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n5/MswwZArcevAFXKsuOkgmEMpW/ovbEQAP7KOe/Ub+DfThgD0gkns0BjzLeISDV3GJipixxz0fGbIy7x5tW5auDUJE8c8+6hrckzDYz5ubqPFedBIXLUyG8woPhCqeZ78PZGnZDt4xEdemgHf5mgdrB8DR1WJXNjP3p+TwYZuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFAwc2h1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6548C4CEF1;
	Sat,  6 Sep 2025 00:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757119492;
	bh=lK+W7jIcDQz4jEABqbetY8xzxzI16JlOdIpsjBqZg+U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nFAwc2h1ZCdY+tUw+X2TLRQ57btdxSWvNp3dPrpRQnIFJA0l64+Vy1IQ+J9ZRrcL7
	 asEbHHzeeX5xqHB97+yp0MCfaZoGi61QBUMHGO7LJ8u7VZAX4CKcOZpagSRRUUHhhl
	 LCYtcw/IRdnLSOyEWxZ/YnTPAz7sC2JpNMR5ZKQrju5211Xrz5rZxiWWCcsJ3Nx6b/
	 qvbhqgJuNW7dk7PcyuPtlsZzizYsVjMnw7D/O1XUwb9DlxDPVXZotO/43fH+EYAiO9
	 Bw9M9KSivHasUnYn0auIoDj8jc/TmUEnS5Am1xJ0Drpo14Uk8RZUSK7hlFbOD8CZmB
	 pxmaka5uFBiMQ==
Date: Fri, 5 Sep 2025 17:44:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stanislav Fort <stanislav.fort@aisle.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, linux-hams@vger.kernel.org,
 linux-kernel@vger.kernel.org, security@kernel.org, Stanislav Fort
 <disclosure@aisle.com>
Subject: Re: [PATCH net v3] netrom: linearize and validate lengths in
 nr_rx_frame()
Message-ID: <20250905174450.3953023d@kernel.org>
In-Reply-To: <20250903181915.6359-1-disclosure@aisle.com>
References: <20250902112652.26293-1-disclosure@aisle.com>
	<20250903181915.6359-1-disclosure@aisle.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Sep 2025 21:19:15 +0300 Stanislav Fort wrote:
> Linearize skb and add targeted length checks in nr_rx_frame() to avoid out-of-bounds reads and potential use-after-free when processing malformed NET/ROM frames.
> 
> - Linearize skb and require at least NR_NETWORK_LEN + NR_TRANSPORT_LEN (20 bytes) before reading network/transport fields.
> - For existing sockets path, ensure NR_CONNACK includes the window byte (>= 21 bytes).
> - For CONNREQ handling, ensure window (byte 20) and user address (bytes 21-27) are present (>= 28 bytes).
> - Maintain existing BPQ extension handling:
>   - NR_CONNACK len == 22 implies 1 extra byte (TTL)
>   - NR_CONNREQ len == 37 implies 2 extra bytes (timeout)
> 
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Reported-by: Stanislav Fort <disclosure@aisle.com>
> Signed-off-by: Stanislav Fort <disclosure@aisle.com>

Thanks for the fix! The commit message needs a bit of touching up..

Please wrap it at 74 chars.

Please add a Fixes tag pointing to the commit which introduced the
bugs. Quite possibly Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") in area
of the code base.

Please remove the Reported-by:, it's implicit that the author discovered
the bug if no explicit reported-by tag is provided.

Please add the review tag from Eric when reposting.
-- 
pw-bot: cr

