Return-Path: <linux-hams+bounces-277-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7064E8C9F01
	for <lists+linux-hams@lfdr.de>; Mon, 20 May 2024 16:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 931101C2106B
	for <lists+linux-hams@lfdr.de>; Mon, 20 May 2024 14:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6085136669;
	Mon, 20 May 2024 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/7P63gF"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4FF1E878
	for <linux-hams@vger.kernel.org>; Mon, 20 May 2024 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716216599; cv=none; b=klWVtCeC4Mw3QqbrKRdrko8M+WSgScOQ5o5Rvy99lzWn6rB8FFilGws0xByGJvruLlP8f/SQ//e5R7mq290KCRSfHf1Z3jvoH5Ydz6zw6mhdz5npiXgFUpu2eNq4RnyEhOjTbhR7E6zD+b/y/cl/K8p4x1TadR0UKg03+JMxJBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716216599; c=relaxed/simple;
	bh=EAYvt9e9q9py08qSwewrTi5wAe3GVXJWn2erdneLuI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzTHBjWyCQhmDpoxc5JS4vIrh/uAYHHW5BXTJlOyMo+S+RAhm+RfxVSOAg438E2Frxl5Hx6zEw7RiwO/+2FK7wupdvFszTLwTIe3xYlh3GQSQPEdetPA4El7sUPc663PyMgTj3pky39ALvHvR34SnFWolcpGCfdo2BJjDvt6BDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/7P63gF; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de462979e00so2882268276.3
        for <linux-hams@vger.kernel.org>; Mon, 20 May 2024 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716216597; x=1716821397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVBZzVurc7ik3enjJmuH210rGxQZlITd0DjWn/4QALk=;
        b=G/7P63gFyRTH2uwbpp6h3PIBBODOJe0WmjT8yrWVutCh5/ZPVzEH6e3rlZ5VYW5oyR
         goVBx8BeSoJj/2/FV05XBLqn0xokKBpHOe/8HSp+FbCwc4htjFSUgbfQqmEaoLOhOqMi
         QuXTnKkN6y2OZITT9yGE8Zhr7NJgDmI54/ysmiWCQjUr+7AfYeAtXnar3MlpSCX33AgP
         hkYWh79JLOZmUg79SR+1pI/JeYhxcdqNOIP5YyQ1Az1ye+TU2CB0jDQEIU0Wy+SjfKeW
         RVr8e9UuEZqjPusgqKqxHrzkkfbR/aA2IH5g3h9JIshazVuONistlmg4daSiPnIceJgJ
         gfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716216597; x=1716821397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVBZzVurc7ik3enjJmuH210rGxQZlITd0DjWn/4QALk=;
        b=P201Wl9T9XRRVWxZyWyenWGXdn/J3RN8bNsljkCMxe71nABMbypkV1q6B4iAKz9CA4
         7MLztSt+c/RbyWPelrIoht5fMBFyZmHtYupK6IcV2ZvY6X63hQYKJTgy3wRow3dt2TOV
         xQQ3p30BRAfkori5L0EpyjC6SArd72X1tTBDNVLKRkgWY/XhysKn39G8n0UtHwN+tcoW
         Wn0kMrmWoEE/ehbW6UwZveRT0g1YiAMw2iRk+erkXiy+lQ4mpwySFUpGaSHVSBDvmGjJ
         JDwhGGGMomP22B58ZZN/oXh8BLzh7Q+ezNwt+fo5EL4AlypYffnBl4kGiyWJ+K6dOW0h
         S0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCULm/iFHhg9ZG/vkUKGqM+78GEOkwxK4a+SQw7ABRBE2kR2aFQLib0s65qeb1c3Ek2254aQ825Fu72lUDdM9FSRliSqTMQsQbbS5Q==
X-Gm-Message-State: AOJu0YwMXXRAJOTo0WXzDGs+tv8zh+TXc6+/z7wTcPqqqn9gW/9fY+E0
	tlKwWqCCvLm6gkWglqQ3V3576w3Kf51zM6sWOMLoGgGFiMj5YTtAcsKYnETEQrdj6MXwNUq+Cpg
	2zRZHrVyY89GfWtG7/ZM5JO1DcuQ=
X-Google-Smtp-Source: AGHT+IFgIb+h+j5tZBR4jdHsDNiyOuFkh5sGAFXAAfUY2SB7hSc8PHsLP3I3/qjcou6FaiKS+Ug71vL8MiXRrlACSPA=
X-Received: by 2002:a25:df4c:0:b0:de6:1992:e633 with SMTP id
 3f1490d57ef6-dee4f31a3d7mr30330534276.22.1716216597004; Mon, 20 May 2024
 07:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501060218.32898-1-duoming@zju.edu.cn> <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn> <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com> <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
In-Reply-To: <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
From: Chris Maness <christopher.maness@gmail.com>
Date: Mon, 20 May 2024 07:49:44 -0700
Message-ID: <CANnsUMF+mKTjrJA-FN_DnBRL4ckjQ_OG4AoVuH7_Sd44yhju-Q@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 7:42=E2=80=AFAM Lars Kellogg-Stedman <lars@oddbit.c=
om> wrote:
>
> On Sun, May 19, 2024 at 07:52:41PM GMT, Chris Maness wrote:
> > Since you guys have been working on this, I have started playing around
> > with slackware-current to check on your progress.  I setup LinFBB with =
one
> > pseudo tty  port generated with ax25ipd.  It does release the socket af=
ter
> > connection, and worked for a couple of hours.  However, it crashed hard
> > with no terminal dump when I was forwarding some bulls over AX.25 over =
UDP
> > to the ax25ipd.  This does involve the AX.25 stack as FBB needs an ax0 =
port.
>
> Chris,
>
> At the moment, the Linux ax.25 stack is unusable for handling incoming
> connections (outbound connections seem to be stable).
>
> I posted a patch to this list at the end of April that has completely
> resolved the ax.25 crashing problems for me. I'm running it on x86_64
> systems with kernel 6.9.0, and on Raspberry Pi systems running 6.6.30.
>
> Dan was unhappy with the patch, and Duoming has been silent on this
> topic, so I'm not sure how to proceed. I am confident that there is a
> "more correct" solution to this problem, but I am also confident that
> this patch corrects a real issue; without a more experienced developer
> either suggesting changes to this patch or submitting their own I don't
> know if this will move forward. Duoming indicated some interest  in
> the issue on 5/15 [1], but I haven't heard anything since then.
>
> I've included the current version of the patch in this email. If you
> have the chance to try it out, I'm curious to know whether or not it
> solves your problems.
>
> Cheers,
>
> -- Lars
>
> [1] https://marc.info/?l=3Dlinux-kernel&m=3D171576662414653&w=3D2
>
> >8------------------------------------------------------8<
>
> When closing a socket in ax25_release(), we call netdev_put() to decrease
> the refcount on the ax.25 device. However, the execution path for accepti=
ng
> an incoming connection never calls ax25_hold(). This imbalance leads to
> refcount errors, and ultimately to kernel crashes.
>
> A typical call trace for the above situation looks like this:
>
>     Call Trace:
>     <TASK>
>     ? show_regs+0x64/0x70
>     ? __warn+0x83/0x120
>     ? refcount_warn_saturate+0xb2/0x100
>     ? report_bug+0x158/0x190
>     ? prb_read_valid+0x20/0x30
>     ? handle_bug+0x3e/0x70
>     ? exc_invalid_op+0x1c/0x70
>     ? asm_exc_invalid_op+0x1f/0x30
>     ? refcount_warn_saturate+0xb2/0x100
>     ? refcount_warn_saturate+0xb2/0x100
>     ax25_release+0x2ad/0x360
>     __sock_release+0x35/0xa0
>     sock_close+0x19/0x20
>     [...]
>
> On reboot (or any attempt to remove the interface), the kernel gets
> stuck in an infinite loop:
>
>     unregister_netdevice: waiting for ax1 to become free. Usage count =3D=
 0
>
> The attached patch corrects these issues by ensuring that we call
> netdev_hold() and ax25_dev_hold() in ax25_accept().
>
> Fixes: 7d8a3a477b
> Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
> ---
>  net/ax25/af_ax25.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 9169efb2f43..5aa6e5c3495 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -1381,6 +1381,8 @@ static int ax25_accept(struct socket *sock, struct =
socket *newsock, int flags,
>         DEFINE_WAIT(wait);
>         struct sock *sk;
>         int err =3D 0;
> +       ax25_cb *ax25;
> +       ax25_dev *ax25_dev;
>
>         if (sock->state !=3D SS_UNCONNECTED)
>                 return -EINVAL;
> @@ -1434,6 +1436,10 @@ static int ax25_accept(struct socket *sock, struct=
 socket *newsock, int flags,
>         kfree_skb(skb);
>         sk_acceptq_removed(sk);
>         newsock->state =3D SS_CONNECTED;
> +       ax25 =3D sk_to_ax25(newsk);
> +       ax25_dev =3D ax25->ax25_dev;
> +       netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
> +       ax25_dev_hold(ax25_dev);
>
>  out:
>         release_sock(sk);
> --
> 2.45.1
>
> --
> Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
> http://blog.oddbit.com/                | N1LKS

That would make sense, because I triggered the crash by initiating a
forward session from an external BBS connecting IN with my listening
LinFBB BBS software instance running inside the Slackware-current
(6.9.1) machine.  It crashed immediately.

I will patch and rebuild the kernel.  Fortunately, that is easy to do
with Slackware as they run a stock kernel.

-Chris KQ6UP

--=20
Thanks,
Chris Maness

