Return-Path: <linux-hams+bounces-286-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C182F8CB089
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 16:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78C74285650
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 14:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7E213D61E;
	Tue, 21 May 2024 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q36JYCTN"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8109E13D53C;
	Tue, 21 May 2024 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716301948; cv=none; b=XsLxEew0QogBAAmJLF9CMJQoHLNO0M8l9OItl6He9oQiujuhgDO4QzvkhVug+sZDcgMCbkurB5syJ4+59htGm4BSBGLv2n+vgIjQ0sfzCOKvNPpqgS0vtq0iGkzch+0+TyK0emjhGDKWFk6XSAEXquKIlqqkX4HwhxXieDOl4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716301948; c=relaxed/simple;
	bh=FzeSwI1swDQh0J0EmXCLScyhvTMLWCKOY3XckRIY5FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcT/vHAGj7/+LvymQFXV7sTGB/cZtLT8XcvIbH7HL0qANamFYS6NMI0z5s/ikUfZDAtYPiYPDoWTwSmoYjRaJL3OTlT3trE4n1jbD3GsZSv+AVUamUJUslT5hGa7Uj368Kw7Zhqrt8y1Ts5opbE4EZVCjkNi2T/uhVjDhvFi54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q36JYCTN; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61df903aa05so40014957b3.3;
        Tue, 21 May 2024 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716301945; x=1716906745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5XWsM+JWN05sn6G/e4ijgQ/tt/d9nOoRE4e8j05XU4=;
        b=Q36JYCTNu3dWMhnSuXY2N5iBtjlBNsFN7jV9RfJqIWP55VjUCkBZG3mVIqVksSw5pp
         TOn7BY6xQQ/qXt1uG+jceT2cUiXc165N8CMhEmamDlktpEP/shXHnjQ9tNkfPngoUPGc
         nlRKgSnRT0VmokaBE1s7VIezmAO+nMR+ZFHP4ObPUZA/KTZIlLANZTWgEniWWLmBivJ8
         JHHF6MJtH9M5DW8Txww8YheRr/5SGtnF/QlVOjUzuumqTVw8XsvVPIcCYrkvqTX4WQI5
         E+7eGx5qxmv3yVwH6bKO9aZnG6zAHsusYiPTN6NMrwTcGi8wJ1FgHJkdhhE5aJvh0vwm
         dfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301945; x=1716906745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5XWsM+JWN05sn6G/e4ijgQ/tt/d9nOoRE4e8j05XU4=;
        b=VjMNotfnb6tpta+n61RHdoS67DUT88I38fBxDebQrouv495H5XCBLnGF0xg9lku7xQ
         prycFvagf0j18lnmiknXTwEiUlSNVu/lq01im1ZgDd4y++xKFL/jOgt9ieJJSn9cwXY9
         4Ty55QvVXoZciZrt4imm4eD4sCLI0/q7X6bkdsbBUiSFQMjMmKq//pfCA0pUtk58gnoc
         Es4/+oculb7Mws3gU6napc1aTm/GiodSDJt01vIANMwQj5Irui912qi7tp1RXaTzNmp+
         2oD5+VUrl+cH+v3zTsxZ7pLxdraPJHIwnq6/i+fyYDB16P7MFQc1drMzhbt0+rgaA9G0
         rocw==
X-Forwarded-Encrypted: i=1; AJvYcCWNEWOclTI05N9D9rxgTMz+YVHCTvwPyY2sSMlASKjOsiIzG3rICfSi12KmZd3FHi8p1gD2PEkrnjuRxYVo+MBn9qRZV2ELjqijEg==
X-Gm-Message-State: AOJu0YzzHmtLoxjhdAIvOqngwnJEDWw7fR8tH8+qxhkLeA1Vg3IlsmY7
	y0TDCcWF5rvq0iOcM2/dU5CWsBiLKcrf2zv9pTzLbUNnmftLIAvnhrLJA94aetIlR+OnlMR3fCn
	jpdF18lCQBbyTG28sEKamUjKgqXc=
X-Google-Smtp-Source: AGHT+IFMFG7woVoqwWAxNu3j2H1Fc3n3gZWkyf5XluLQjyaRUVueGmZuDtm1CyyeSERqIG003prntULMQSMAZiKkjrc=
X-Received: by 2002:a25:bf89:0:b0:dc2:2f4b:c9d8 with SMTP id
 3f1490d57ef6-dee4f336a6dmr42286374276.16.1716301945351; Tue, 21 May 2024
 07:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
In-Reply-To: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
From: Chris Maness <christopher.maness@gmail.com>
Date: Tue, 21 May 2024 07:32:14 -0700
Message-ID: <CANnsUMEyMqyNv-3gtqb60=KsDv1fxDska+QFNMzDtW0J7Pw48g@mail.gmail.com>
Subject: Re: [PATCH v2] ax25: Fix refcount imbalance on inbound connections
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Should I expect to this downstream in 6.9.2?

-Chris KQ6UP

On Tue, May 21, 2024 at 7:26=E2=80=AFAM Lars Kellogg-Stedman <lars@oddbit.c=
om> wrote:
>
> The first version of this patch was posted only to the linux-hams
> mailing list. It has been difficult to get the patch reviewed, but the
> patch has now been tested successfully by three people (that includes
> me) who have all verified that it prevents the crashes that were
> previously plaguing inbound ax.25 connections.
>
> Related discussions:
>
> - https://marc.info/?l=3Dlinux-hams&m=3D171629285223248&w=3D2
> - https://marc.info/?l=3Dlinux-hams&m=3D171270115728031&w=3D2
>
> >8------------------------------------------------------8<
>
> When releasing a socket in ax25_release(), we call netdev_put() to
> decrease the refcount on the associated ax.25 device. However, the
> execution path for accepting an incoming connection never calls
> netdev_hold(). This imbalance leads to refcount errors, and ultimately
> to kernel crashes.
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
>     unregister_netdevice: waiting for ax0 to become free. Usage count =3D=
 0
>
> This patch corrects these issues by ensuring that we call netdev_hold()
> and ax25_dev_hold() for new connections in ax25_accept(), balancing the
> calls to netdev_put() and ax25_dev_put() in ax25_release.
>
> Fixes: 7d8a3a477b
> Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
> ---
>  net/ax25/af_ax25.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 8077cf2ee44..ff921272d40 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -1381,6 +1381,8 @@ static int ax25_accept(struct socket *sock, struct =
socket *newsock,
>         DEFINE_WAIT(wait);
>         struct sock *sk;
>         int err =3D 0;
> +       ax25_cb *ax25;
> +       ax25_dev *ax25_dev;
>
>         if (sock->state !=3D SS_UNCONNECTED)
>                 return -EINVAL;
> @@ -1434,6 +1436,10 @@ static int ax25_accept(struct socket *sock, struct=
 socket *newsock,
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
>


--=20
Thanks,
Chris Maness

