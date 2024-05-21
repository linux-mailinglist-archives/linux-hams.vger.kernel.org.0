Return-Path: <linux-hams+bounces-278-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439278CA552
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 02:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E53F1C210F7
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 00:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B032C81E;
	Tue, 21 May 2024 00:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZddgNXs"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF0C23A9
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 00:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716250313; cv=none; b=mZ9c/X2sInkMts1pmQsGXi7FTmwUTJE8Rj0d6YJwwW0SJtbDixoSx3+3zqKMokKs8m6CM34mgvFu9LXgSJpU6qzJf3oiEubvDOAFLlF+qlDpmO+Z1SffOkQDsAmv6O8mSmlf+mfBZAj2XYUFZkbfceG1PMVb56aeeMIugsq9+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716250313; c=relaxed/simple;
	bh=NotbNlI6wu/8cpzGQq46hQA8ZSq/g56B2y/76KpjhU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xbsnm4moy+EjJt6iy86eU5k8EhJaqXjM5pDKqcU7XbmQvkEJH1nsJL1dCNQv1dxylictI9C+cWwQgL5QQbUSZbDtNDwo5j7n8MQRg9tczBETM2dtcPOqmjLPUO3DIXKsUchGGITQ6eEgyrKX2iqZu9Cd5JsKPArC77uP3kcJC2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZddgNXs; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbed0710c74so2427257276.1
        for <linux-hams@vger.kernel.org>; Mon, 20 May 2024 17:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716250311; x=1716855111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qli0i+Hbv3NaLYGsbt7/EP5jqNLY/z0ezbm0FH01MYI=;
        b=KZddgNXsASWeqelcBo+DjGzZGchPFZqhJm0l7mtbDZKptfAPEi9H8GBw3gszFcfwXy
         w6qT9jbvqrc+8Z2APF3MKDvJw4R6dwMyPeTG/JopUJkEW+kfam/fXysWLlIcluNBYwuF
         EKVsxJbxkWsndjE7SPzNs4Zi1aAv7pEhMKjzLqmu7Z9i44ZuEa6ouFKa9byiv4sM4rwo
         IVPvxYVmsbzR8ZflUuOgm09aVBpK86veyO57qolBrOX3Qziigd5fwH6NppylF51NFE55
         wnZDXQsRCiIZD1l/2tpAY2z06jGQbe7tJeU//qSfjXf6qViDvBHLbY3VdkDfeTVdoOpc
         JByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716250311; x=1716855111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qli0i+Hbv3NaLYGsbt7/EP5jqNLY/z0ezbm0FH01MYI=;
        b=LxdpfPKQYQzoCaUHyTKrSc8OS4TzkddLwiTxX+Fc/oIssE6pbPtiFFzQ6KsTdq1aW9
         CJSXng5sscD1RZc3BCzAs9+mNO2mh9B3WiAdqMLIWTD6CbA3dg6W7sjeNIP0qXs3t171
         YxrTIvVFLqbh8lkB2l00k7JxKx+Q9yAIgDyRXs6qX6AP0AaZWS1awG18RuPaukrDBw1j
         7BM436gDQuO/u0DusD8/bPFZQe4uYTZvXdZUeff9rwwvSrE8Tf1jkkU4WuVs1nS3N5Ww
         CTzGNREFuUGgy+UB5VqwRSR5fvFnTVWlneQO3Mn8tuOakWhTxyaca04FE9o7uc+i2GQp
         lrkg==
X-Forwarded-Encrypted: i=1; AJvYcCW/WF3dLqCg0fxD9VOJJfJbJeLhLWq8DQ9/Uu7Exyhc+h/xmJ8FyBy6NLT876PH4UuRB88qdtGvnoIWuTBcpdUmajSxcOJLkEgbbA==
X-Gm-Message-State: AOJu0YwrtiXKqxkilBsyFpv6eElxhm31wfCNc1ed5ilMzLXNel5Zd4G6
	9SgBe7aCkdLjxT25EAcGA/MnZbsgrYqKPc2hj3RO6SeMMOFBnJAa9GTwMbGTM7PWi096FmOCckK
	Yuxoi6iy+/fDRmVpZTswLKoBMxqE=
X-Google-Smtp-Source: AGHT+IGLRDpWwUS/riv/xzCDRUhhonSkABBDFpD6aSswktaZhBXAQTNSXDRhfMABtL1oPKwO5o7gIAeJIQKJmIO/7ko=
X-Received: by 2002:a25:7087:0:b0:de5:416a:f9ab with SMTP id
 3f1490d57ef6-dee4f31d935mr29639462276.25.1716250310865; Mon, 20 May 2024
 17:11:50 -0700 (PDT)
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
Date: Mon, 20 May 2024 17:11:39 -0700
Message-ID: <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Your patch seems to have fixed the issue so far.  It would require a
longer stress test, but shot some pretty
big bulletins at it, and so far so good.  How come this patch is not
included in the mainline source?

-Chris KQ6UP

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

