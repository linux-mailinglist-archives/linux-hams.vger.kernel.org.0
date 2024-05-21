Return-Path: <linux-hams+bounces-287-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6B28CB20D
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 18:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 631F91F221D2
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 16:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B11D1B948;
	Tue, 21 May 2024 16:19:01 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0584C66
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716308341; cv=none; b=kbi254oM3VsHf89w/f+grjgmgwAUcJKPp5xNm/9soX9NFlQxeB1TasZl6aBetPBJcw7N7DoG5J1oEpjr8a0Q0gmz7XEstUB2R2ucUNRBTbE0QHQ4geGaO01wQh2lN4cDNdiGwpnpfnrkaU5QHAJNDnbvjtmNHIEdw/nmF1tY74Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716308341; c=relaxed/simple;
	bh=GAe4ZOKJ+Z1cjGX493rKDnKXeSTPCPqn66u78Y7gD/8=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BDG1jNI/+EunBdqzEAqkKCithY9zfB84X3Bym5HQfm+szvcPVAgneQy884QmfiTcoqS2Opq4mAG5nX15Kt2zz76gAy+7kPI/d0vZeOBcHSr1+sM/L9V0jJnYOuRnIFh41Wh6ij8ju/8ECFCpE0r6ED1i9uiX8TJBGyZHTRASiWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 44LFr6Ub017978;
	Tue, 21 May 2024 08:53:06 -0700
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>,
        Chris Maness <christopher.maness@gmail.com>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
        dan.carpenter@linaro.org
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
Date: Tue, 21 May 2024 08:53:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Tue, 21 May 2024 08:53:07 -0700 (PDT)


Hello Lars,

> Well, partly because you're the first person to confirm that it works
> for someone besides me :). Dan (Cross) has offered to test it out as
> well; if I can get a couple of confirmations that it's working, I'll
> probably go ahead and submit it to netdev.
>
> The bigger issue has been that there are very few people interested in
> the ax.25 support in the kernel; there's not a real maintainer, so it's
> difficult to get code approved. There were some concerns expressed that
> maybe this isn't the *correct* fix, but I would argue that even if it's
> not the most correct fix we should try to get it in anyway, since
> otherwise ax.25 is completely broken.

First off, Lars, I wanted to thank you for getting some of these REAL 
fixes actually committed into the mainline.  You've done something that 
many others could not!  That said, I wanted to chime in here about your 
commend about "very few people interested in the a.25 support in the 
kernel".  That's definitely not true.

I and several others tried for many quarters and years to try to get 
some of these initial toxic commits that came in around the 4.19.x 
timeframe fixed but there was never any real meaningful responses and 
fixes.  I do agree that the lack of a real maintainer aka steward for 
the mkiss / ax25 / netrom / rose kernel code really hurts the ongoing 
health of the stack.  I wish I could take up that job but I don't have 
the required skillset.  The larger issue here is that random Linux 
kernel developers are periodically changing various parts of kernel 
infrastructure and when they try to make "updates" to the AX.25 code, 
the mindset is that they only consider a successful kernel compile as a 
"code pass".  That's VERY bad.  The other significant issue is that the 
kernel branch maintainers / powers at be seem to just accept these 
changes without any real scrutiny and don't require any real testing 
results to confirm things still work.  I had previously asked how some 
of these developers had really tested their code when they offered 
official patches here on the vger list and never received *any* 
meaningful responses.  I've asked if there is some form of a per-commit 
or daily CI build and regression test environment that I could offer up 
some basic toxicity test scenarios to.  No response.  It's been hugely 
frustrating for YEARS now and all of the "silently suffering" Linux 
packet users have resorted to still run ancient Linux distros like 
Debian Wheezy to keep their systems fully operational.

I am hugely grateful to you (Lars) on being able to submit some 
meaningful fixes and was able to get them committed to the mainline.  
The next major hurdle that I would love to get feedback on is how to get 
these new changes but also create a set of backported fixes committed 
into various Linux distributions kernels that don't strictly follow the 
mainline kernel.  My personal interest is in the Raspberry Pi OS kernel 
and the Canonical Ubuntu 22.04 / 20.04 kernels.  If people have 
recommendations / contacts to try / etc...please contact me offline and 
I will work on trying to get these fixes committed.

--David
KI6ZHD
Maintainer of the Linpac AX.25 terminal program
Advocate of the Direwolf multi-platform AX.25 software based TNC
AMPR 44-net Coordinator for the Silicon Valley, USA region


