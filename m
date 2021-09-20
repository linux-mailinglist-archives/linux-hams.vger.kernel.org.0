Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF70411326
	for <lists+linux-hams@lfdr.de>; Mon, 20 Sep 2021 12:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234273AbhITKyc (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 20 Sep 2021 06:54:32 -0400
Received: from ham.blackspace.at ([78.46.20.155]:49628 "EHLO
        mail.blackspace.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbhITKyb (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 20 Sep 2021 06:54:31 -0400
Received: from [192.168.20.13] (unknown [185.44.54.65])
        by mail.blackspace.at (Postfix) with ESMTPSA id EC2781F72052;
        Mon, 20 Sep 2021 12:53:03 +0200 (CEST)
To:     Dave van der Locht <d.vanderlocht@gmail.com>
Cc:     linux-hams@vger.kernel.org, David Ranch <linux-hams@trinnet.net>
References: <8b7a1545-3631-b62d-6430-4a51652023ba@free.fr>
 <CAH4uzPPVfYnRzGH5OTL6JX7JC64sY5XSsurHBLt=EOV+EPbJ2A@mail.gmail.com>
 <45792400-294f-b496-9c7e-679d19614884@free.fr>
 <CAH4uzPPtsgz8tnQXwukDVL7=_pgfnK8OS+J8tdHBnsnJE1m5kw@mail.gmail.com>
 <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net>
 <a5d51093-fb07-0683-e094-9da57d9f25fa@blackspace.at>
 <CAH4uzPOO2zDHnP9V0_iYPMb85qM6FcaSEYz3iqiPuMr7rx90+Q@mail.gmail.com>
From:   Roland Schwarz <roland.schwarz@blackspace.at>
Subject: Re: AX25 disconnect patch and ROSE socket failure
Message-ID: <3345fdf3-26e7-5f2c-cbf0-53026a76399a@blackspace.at>
Date:   Mon, 20 Sep 2021 12:53:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAH4uzPOO2zDHnP9V0_iYPMb85qM6FcaSEYz3iqiPuMr7rx90+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hallo Dave,

On 19.09.21 at 20:07 wrote Dave van der Locht:

> Well... That problem is there for quite some years now and there still
> isn't a solution. 

Have you seen Ralfs comment?
> I wasn't even aware of these patches and an internet search didn't turn
> up anything.

So it looks to me as if no one had tried to contact the maintainer via 
this list before. I don't believe it is the duty of a maintainer to 
track all possible places on the net for issues, do you?

> Although that proposed solution might not be the root cause I'm
> wondering what the real root cause is and why it's still not
> researched and fixed after years with everyone complaining about it.

Again it's two months at best and this is not much time.

> In the mean time it still seems better to have a good work-around than
> a pretty useless AX.25 stack.

The work around already is there. One just need to compile with the 
patch in place.

73 de Roland oe1rsa

-- 
__________________________________________
   _  _  | Roland Schwarz
  |_)(_  |
  | \__) | mailto:roland.schwarz@blackspace.at
________| http://www.blackspace.at
