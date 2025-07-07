Return-Path: <linux-hams+bounces-539-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF6DAFB851
	for <lists+linux-hams@lfdr.de>; Mon,  7 Jul 2025 18:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87764266A4
	for <lists+linux-hams@lfdr.de>; Mon,  7 Jul 2025 16:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04B3226D0F;
	Mon,  7 Jul 2025 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uW8b2Nal"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A00A2264C7;
	Mon,  7 Jul 2025 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751904355; cv=none; b=bP2pYovrUasNq01MBqYBkptxMRiIpjumeamJw8YukEslKzVXFIz0nSaAZfPmlKQXUrryoDjeS65xnDSLiZTf7xEXtYAY9Zp1r/ob2QOyFttrdGaEutSoq8HU2Sf4dSgwkJKgwCcKh0es72Afi7s8D902110T6/QDnhOI7+R6Dsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751904355; c=relaxed/simple;
	bh=OLXZd0KBQvPjOWpxBtPRwVVnDWfEjr+VS4Vu1kVOzIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4a9VcHC4jd6sBywVlmowc85GntC+Ma8g4MNkcstevMCI8V9fpfdva3WT4RXn7DbwU2ra4LZRUCLwJQlUaR9D+Hzzroa0ZduFIGZ8eOSGQN+I8nOStUX3fBbSeEYy4xAqoCibuzJLRMiyxqUblofH2MW5jIz/8NX3r2UdI4XaeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uW8b2Nal; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51712C4CEE3;
	Mon,  7 Jul 2025 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751904355;
	bh=OLXZd0KBQvPjOWpxBtPRwVVnDWfEjr+VS4Vu1kVOzIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uW8b2Nal4M2l8ACxYu+6AJ2p5a1pZEGwKjGUtBc7d+Oekd5QssMCjQxHPAeo6VoVW
	 1hlCRXSsoHMulrganY8cHN/EQhlFSZZWAqByicjREsb0KoFx2We/WG1xHdckXypjnq
	 VYzHNmO1cX4JSH+j3vrTKSRJApbIE2APfRzvOiLfe4MCn7A2agn71Jy1EPxrj8WSpG
	 i8/z38L3NrPrebNaiBrI4fZGUqSIQJR1p5sOkC48vHTmBVlL/2QP/UMMZDb00w1Ulx
	 34+4+5Rnmn/tcVLU/WcMOHPRvdCssleQNZRgdEIYe7n/9hcdf/HhlxEqsm06KKA6AM
	 +RmRF29tiCbPg==
Date: Mon, 7 Jul 2025 17:05:51 +0100
From: Simon Horman <horms@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Kohei Enju <enjuk@amazon.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net/rose: Remove unnecessary if check in
 rose_dev_first()
Message-ID: <20250707160551.GM89747@horms.kernel.org>
References: <20250704083309.321186-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704083309.321186-3-thorsten.blum@linux.dev>

On Fri, Jul 04, 2025 at 10:33:08AM +0200, Thorsten Blum wrote:
> dev_hold() already checks if its argument is NULL.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Hi Thorsten,

I agree that this is correct. But I think that cleanup like this
needs to be in the context of other changes to make it worthwhile.

Quoting documentation:

  Clean-up patches
  ~~~~~~~~~~~~~~~~

  Netdev discourages patches which perform simple clean-ups, which are not in
  the context of other work. For example:

  * Addressing ``checkpatch.pl`` warnings
  * Addressing :ref:`Local variable ordering<rcs>` issues
  * Conversions to device-managed APIs (``devm_`` helpers)

  This is because it is felt that the churn that such changes produce comes
  at a greater cost than the value of such clean-ups.

  Conversely, spelling and grammar fixes are not discouraged.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#clean-up-patches

--
pw-bot: cr

