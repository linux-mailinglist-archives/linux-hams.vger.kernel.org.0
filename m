Return-Path: <linux-hams+bounces-336-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8958D09AA
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 20:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5963A1F2239F
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 18:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9805E15A84A;
	Mon, 27 May 2024 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/G7oaUm"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F9415EFC5
	for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716832806; cv=none; b=SWlOvrU/HT49gUD1IYi4xnEqvYp8WzyltKEwZUgIBbUCwXGRkYWPe4B6vpRDTaf1enwkieP+SdDKgqAujqRokFkUeR2BQPgIY0OEN8ahqoBc6i4DEq1ldRjh0RKfsy4E5Vejv6cRFOBfRCEOhUY4yLuiEthgWy5bRn++mMG8QV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716832806; c=relaxed/simple;
	bh=1n3d0qmPPWh/VcErjQlacpXA2ftPv3OmP5xra0QpO80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOIll+9UmoHbDY5rhmmunrB7an6q3BihBaBKjl8PdfsSYgDFs0MITRfK7c3B6tIKUIAYWSIVYJAPrgTzOVbtMfj1O98YN8kqfzdHdS8MYWw6qRss2lKuswHBYP3e5ohRbrhQ867Fzc/jGNQgzR3Vr7Q3AaM47k3qVWxr5OACjm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/G7oaUm; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-62a0849f5a8so35088197b3.2
        for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716832804; x=1717437604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAhFce8jDW8c6h4ekHewBxG9q/l8WZjryc3Xl0XIjlY=;
        b=D/G7oaUmfEj7n+Fnwp0hL7iPyikweZovfiJjxwKVq5ZofTQIHSLzv7K+UwBp3LgCk6
         oGBudOgt10KixQRARXPBEUoGcEnNzLQHY+iLsjkerjy9vijtZAD7MuEPP9ETeTSI+gP6
         AEowuH+9uOWwZG5WkNnPDZrKQYr9Vm+v7Peb34bSZDli4uLH4jMJbJio4kueun8/3+2f
         6zsrglYITSOMQ9Nh2CIIe+ZQ8X4Ls26ZBWW1lZwq+iYegJ1ulporeq3zUWiU5Qt25WJr
         FSIFPUTrtDhnWJaodU2Q4bUVWZBoFYGjlVUfkZQlrMgLFqubub4CTvXwPDWru423Kv4L
         5zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716832804; x=1717437604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAhFce8jDW8c6h4ekHewBxG9q/l8WZjryc3Xl0XIjlY=;
        b=AlSDNOo+E/JWe1l883fi6rmjdiH1AX7l1Mhx2frtahvnLyX8gsMXVV1eqkmT9NRESI
         zNiZyvJl81sAxJc0mm7zWa7lyA5XZ21VCY94yYNS+0Rgzk3HRIhf0htbd7t+Ip313s3E
         LrhtR9lF+IFTv0GlDyIUh1MGD9R/IPguJvmkMqHUnVQ/PsmQomLzGBDghT5jS/jWSQih
         5/uGdoSaB/n2wcPeZ2xmg5Tlo/SREfbeKmli2DkRSVFsvmpxHZEjEsxDgdqE1NiIIZwG
         LtwZrny0Gq8hh4LrcCU8PnFghSDtjXyUaicn2m6pwGN42i137yYs++0gdCC09mjnHu+v
         KA9g==
X-Forwarded-Encrypted: i=1; AJvYcCUp9CNFTJzfUUm503qAYU7YYA88ZMrQVGAK/OT+PQXPoOMzye7mKIS/SZuuvWqyLo6DMBemZrKryWknWnh1OSVQnZIeOTiHk/0bbA==
X-Gm-Message-State: AOJu0YwV8iZJUXWDhidSjMQ3dwd/7o5X00OqqKllESM2ujQk9g1+nk9b
	HGAvVxStxD/iA94N48Vk7mLSOMAQZ8X3jOTJ2fi85/ZnSvxrqrDM8tccqbLhqz0QpJ2YUEdQwp7
	iyvsq61KOLL+WTEx5dhw9xkp7MKw=
X-Google-Smtp-Source: AGHT+IFSaCCGnS9FaqpBe9wkic/FwVCM4QCuqrzhYNGO5iCLH68x0aBKEOtYmH1d+O3/FGY0mfAEM+FvjZNAZ5mr8/Q=
X-Received: by 2002:a81:a154:0:b0:627:d23a:4505 with SMTP id
 00721157ae682-62a08d28b85mr96746367b3.3.1716832803800; Mon, 27 May 2024
 11:00:03 -0700 (PDT)
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
Date: Mon, 27 May 2024 10:59:51 -0700
Message-ID: <CANnsUMEQ6+jERNk1pCToxAfutdcdQnMQgjz9UzYGBoXFkS89sw@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Now running this kernel on an otherwise stock Slackware-15 system.  It
is working FB.  The stock kernel 5.15.145 works for incoming
connections, but it does not release the socket if I make an outbound
connection and crash out of the remote end leaving my outbound socket
orphaned.  With the 6.9.1 kernel (with lars inbound patch), the
orphaned socket clears after about 5minutes, and I would consider that
a normal function.

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



--=20
Thanks,
Chris Maness

