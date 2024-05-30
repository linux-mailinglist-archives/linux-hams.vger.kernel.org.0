Return-Path: <linux-hams+bounces-351-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDE8D5418
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 23:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DED562850E6
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 21:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A7265E20;
	Thu, 30 May 2024 21:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="d+quTZIt"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp71.iad3b.emailsrvr.com (smtp71.iad3b.emailsrvr.com [146.20.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B4141760
	for <linux-hams@vger.kernel.org>; Thu, 30 May 2024 21:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717102901; cv=none; b=YpP2Oc58tMO+6sLv6MB0ed44BEB3eBBBCjlmEacf5sAyD9o0gEM8HEXd+2daLEourcJ6oqvDx/dYqI3HSsuUWTmVVqD9untI1DQOMUe1DsBfXwhfQRePhOnqEFU3XpD5gnDiyEMDuK7MaikCo1NCqxUrjszjAJ9c5dvTBcSSe9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717102901; c=relaxed/simple;
	bh=OtwSaqGaMfFtD5beqnkIOIHKBfN2KwB6s8iaEu2Trsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaIE8zh/fa4cUQxJVqmWimkyt9cnJs24q8TME0bCO4FVln5kKQ2pC/02G9ybiDm1i/o9u9h+37p/NVedaYTKHXn3LKMVXasIw+g9yEIdPQnlHYS0NzbWTaF4gwVW1qbLHO9um/p1/Zrn8e5mVu0JpPCxmgBAQ4B7BxZIrM0JraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=d+quTZIt; arc=none smtp.client-ip=146.20.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1717100589;
	bh=OtwSaqGaMfFtD5beqnkIOIHKBfN2KwB6s8iaEu2Trsg=;
	h=Date:From:To:Subject:From;
	b=d+quTZItRvFSOWM3TO1mMl0j6c95CPdE//iIRQuJ/kHu2V+UbA+QbDheNNZVHDjy3
	 EIGTF06EuyHsx+NtrmHkIkuVkWUfSjUYD0th7SBeSpUn77NAh3W3bbnFfv0joAyU1f
	 Tf8+4mqItbknDHwyUmR5pzDDExuB5xvMEc8FmCw8=
X-Auth-ID: lars@oddbit.com
Received: by smtp1.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 7E4136027D;
	Thu, 30 May 2024 16:23:09 -0400 (EDT)
Date: Thu, 30 May 2024 16:23:09 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams <linux-hams@vger.kernel.org>
Subject: Re: Kernel fails to flush queues when closing sockets
Message-ID: <bex6tfuzbkj4dmljg7n3yqe43274hdwqavwoj5hvm3q6eq42pu@73hzthuqmg66>
References: <2qncrme5xuch2w2vzznk5eoiebdiiwcwck3dmxet73mzos7zh2@lgdxko4x5bsj>
 <a3f92265-bc95-f23d-e88c-6246d036df07@trinnet.net>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3f92265-bc95-f23d-e88c-6246d036df07@trinnet.net>
X-Classification-ID: 700162ed-ca02-4590-9b9f-a63ef5e7f187-1-1

On Thu, May 30, 2024 at 09:53:43AM GMT, David Ranch wrote:
> > For testing purposes, I wanted a simple ax25 listener that would accept
> > a new connection, send a fixed string, and then disconnect.
> 
> I can't comment on the SO_LINGER function but I'm surprised you're seeing
> data loss like that.  Seems like that should be fixed. Anyway, as an
> alternative test, consider setting up ax25d running a bash script with echo
> or even "netcat" commands.

The problem with involving ax25d is that now we're also testing ax25d,
which is why I started with a minimal socket exmaple.

I do see slightly different behavior when ax25d is involved; using a configuration like this:

    [udp0]
    default * * * * * * - root /bin/bash bash /tmp/helloax25

Where /tmp/helloax25 is an executable script that contains:

    #!/bin/sh
    echo HELLO AX.25 CALLER

Results in an approximate 25% failure rate (that is, 25% of the time
there is a successful connection but the message is not received by the
client). I'm testing like this:

    worked=0
    failed=0
    for i in {1..100}; do
      if axcall -Sr udp0 radio0 | grep -q HELLO.AX.25.CALLER; then
        let worked++
      else
        let failed++
      fi
      sleep 8
    done
    echo $worked $failed

I see approximately the same failure rate if I replace the `helloax25`
shell script with the compiled output of:

    #include <stdio.h>

    int main() {
            printf("HELLO AX.25 CALLER\r\n");
            fflush(stdout);
    }

I'm reasonably confident there is a kernel issue here that needs to be
resolved.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

