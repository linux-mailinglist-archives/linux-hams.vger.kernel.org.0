Return-Path: <linux-hams+bounces-380-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F2D924C0F
	for <lists+linux-hams@lfdr.de>; Wed,  3 Jul 2024 01:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17B752857AB
	for <lists+linux-hams@lfdr.de>; Tue,  2 Jul 2024 23:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7425D129E66;
	Tue,  2 Jul 2024 23:19:03 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE42A1DA30B
	for <linux-hams@vger.kernel.org>; Tue,  2 Jul 2024 23:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719962343; cv=none; b=rgYBENYi2iJ8/RvH1pweZ4vwGK5DNPmNKMblIRyDOQ9wXnfFRAey5w7Rw+Ki3jztBKjURBFVdwua6Or1uKR5HX4GJceLuNy4/mNm85O9vdefjcNNRDeEneVEuUwnJbSnk8K6M8Io0fJeDxvZRa10YzIN+DGHlHoqs3sfr0F0Cl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719962343; c=relaxed/simple;
	bh=EmvS78z8f+jh/H3Tgt/fLFAm/ie1UxlkPZipfeBghe8=;
	h=From:Subject:References:To:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DD91y06RrcHQ35LoVI/f2v4x9tdY3UcTfEbAXRx5bqt7MyaAUzHIbSM2QQHPSKV7Ofy1VjizO88KrvXLpYV/zSEs6LwD0/+lmi1WegdqlDNCTxrNl4mi7chqRWuqoy8LlmfDJXFrwQr8LEHzCchy6ns5wc4yeJ+Sy7SusmUzXRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 462NIkxL025886;
	Tue, 2 Jul 2024 16:18:47 -0700
From: David Ranch <linux-hams@trinnet.net>
Subject: Re: remote login(1) (telnetd; innetgr(3))
References: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
 <CAEoi9W7YEkhYnNTmrG=NSuZLQhEXxqYid_J_BB5Wgn6gqoF=1A@mail.gmail.com>
 <xyilquq3zxmrnbjgxgtxtbxdngxswhpxyd6t3aas4psm4zuy6j@xzvr3h3bsvue>
 <CAEoi9W6C4h-9StNJXQqv615xc9smM1rNGd6wALE=1ck4630tLA@mail.gmail.com>
To: linux-hams@vger.kernel.org
Message-ID: <2f05220f-4d75-3d5c-b92d-9a655a2a4184@trinnet.net>
Date: Tue, 2 Jul 2024 16:18:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAEoi9W6C4h-9StNJXQqv615xc9smM1rNGd6wALE=1ck4630tLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Tue, 02 Jul 2024 16:18:47 -0700 (PDT)

[second try as the first try had some strange delivery errors ]


I am relaying the following reply from Thomas Osterried DLASAU who is=20
the maintainer of the "Official" AX.25 userland libaries, apps, and=20
tools hosted at https://linux-ax25.in-berlin.de/wiki/Main_Page regarding =

this proposed change.  I'm doing this relay as he cannot send this=20
message himself at the moment but he will follow up soon. The TL;DR=20
summary here is he is strongly against this change.

--
I dislike the idea of login dropping the =E2=80=9A-h=E2=80=98 option, bec=
ause
   1) it makes debian gnu/linux incompatible to most of other UNIXes

   2) if ham admins use the =E2=80=9A-e=E2=80=98 option of axspawn (inten=
ded for systems=20
like openwrt which were missing the login command) and write a=20
wrapper-script or -program, then the chances are great they do things=20
wrong. The result is less than more security.

3) when implementing own login routines in axspwawn (the way login or=20
sshd does) things may also go wrong, and because our community is right=20
small, there will be less review for this security critical progress.

4) (old?) man pages describe how to handle cases via PAM,  dependent=20
where users come from (-h =E2=80=A6)

5) We see IPv4 and IPv6 addresses, =E2=80=9Ascreen=E2=80=98, =E2=80=9Atmu=
x=E2=80=99 and so on via utmp.=20
Why this useful info is disliked for AX.25 / NetRom / ROSE?

And a note about telnetd:
We use this when doing ip.tcp.telnet over ax25 or ax25.netrom. If a unix =

would come without telnetd, admins will make a hack (ssh is no option:=20
ssh is encrypted and encryption is forbidden in amateur radio). And=20
everything which is self-compiled or q&d hack may has security flaws,=20
will become no updates - and no one will notice.

-> My opinion about the planned changes will make Debian a less secure=20
system, despite the opposite was intended.
--

--David
KI6ZHD


On 06/25/2024 10:31 AM, Dan Cross wrote:
> On Tue, Jun 25, 2024 at 11:39=E2=80=AFAM Alejandro Colomar <alx@kernel.=
org> wrote:
>> On Tue, Jun 25, 2024 at 11:28:52AM GMT, Dan Cross wrote:
>>> On Tue, Jun 25, 2024 at 4:09=E2=80=AFAM Alejandro Colomar <alx@kernel=
=2Eorg> wrote:
>>>> We were discussing the possibility of removing support for remote lo=
gin
>>>> in shadow utils' login(1) via telnetd or similar; that is, remove th=
e
>>>> '-h' flag.
>>>>
>>>> <https://github.com/shadow-maint/shadow/pull/1022>
>>>>
>>>> And then Chris reported that ax25-tools uses that flag.
>>>>
>>>> <https://sources.debian.org/src/ax25-tools/0.0.10-rc5+git20230513+d3=
e6d4f-2/ax25/axspawn.c/?hl=3D64#L1837>
>>>>
>>>> Do you know if that code is actively used or if it's something from =
the
>>>> past?  Would it be possible to switch to something secure like SSH, =
or
>>>> is that not viable in the systems you use?
>>> Variations of it are actively used. See, for example,
>>> https://kz2x.radio/posts/complex/
>>>
>>> However, looking at the linked code you pointed to, it appears that
>>> the `-h` flag is only used to insert the _protocol_ a user uses to
>>> connect with into the `ut_host` field of the utmp file; one of the
>>> empty string, "AX.25", "NET/ROM" or "Rose". Presumably this is so tha=
t
>>> if one runs `w` or `who` or `finger` or `last` something on a host
>>> that a user has logged into using `axspawn`, one would know what
>>> protocol they used. It's subjective, but I don't know how valuable
>>> that information is; I suspect not very, given what's already a prett=
y
>>> niche case.
>>>
>>> More to the point, one could remove the lines from `axspawn` that add=

>>> the `-h` option and its argument to `login` and `axspawn` would
>>> continue to work for its intended purpose; just a small bit of
>>> information would no longer be present about the connection itself.
>>> For that matter, nothing prevents `axspawn` from logging that
>>> information via other means (syslog, for instance).
>> Hmmm.  Thanks!  Would you mind reviewing the patches here:
>> <https://github.com/shadow-maint/shadow/pull/1022> to make sure I can =
do
>> it without breaking anything for you.
> Sure! I put some comments on that review. It won't affect me at all.
>
>> If there's any chance we can break stuff, just let me know and I'll dr=
op
>> my patches.
> Well, I can't speak to other folks, who are using the unmodified
> `axspawn` (assuming such people exist), but as far as I'm concerned,
> you're fine.
>
> `axspawn.c` should probably be updated to remove reference to the `-h`
> flag when it invokes `login`, but that's outside of the scope of your
> change.
>
>          - Dan C.
>




