Return-Path: <linux-hams+bounces-357-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB36A8D72C2
	for <lists+linux-hams@lfdr.de>; Sun,  2 Jun 2024 01:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8FC1F217A2
	for <lists+linux-hams@lfdr.de>; Sat,  1 Jun 2024 23:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4654502E;
	Sat,  1 Jun 2024 23:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AteW4l6o"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15744366;
	Sat,  1 Jun 2024 23:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717285069; cv=none; b=qq5QfI3jwrJh7y2VRu3AglcZ38RGJ00tHfpp1YDanL9tz4J5SOxxHwlBRWizI7QUYJ+RIiQGGZMXZOSIz40Fas9ca8bU/C0WgxM44dHmcS9+OrcUr6/ZKk0fEsCGIQ0FBpmLMfNmbrcZ/grYX1FN09X4nCKP5q/sHqN7b/QjEks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717285069; c=relaxed/simple;
	bh=6MOhWZepGJ9M55gNC5LW5b2xqcSBsNRF60locReLHWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUCdAVN+YCpo6qPLKGsuz+08jFznV6PCmkloZwAIZlOEguZTLVVcHsztswlXP3NmdOCT0wegZrawYSsY1AJ+Fo3I/ewOMIBsvMDoto2cjA5fVZVeNYTC1EtzCGyQIHzbYF4R/UXeojTUT+u9kmBTY319y3CXdSKPdbV4mnl2W/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AteW4l6o; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62a087c3a92so29783937b3.2;
        Sat, 01 Jun 2024 16:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717285067; x=1717889867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBblh6fXFx3/CtfuJ8K++e7ut3+jzamyM7fjsFIb9Q0=;
        b=AteW4l6obbf5KXvMcvudFq9XQNjkkRm7EpumbJMLRDOYAoC5SuppU0whBGuFxM2+O1
         JaNHJOUyNAxvV38cTRefRBR2k6fzQInSmYs0c+rLFCAHq3KPS0DhBH2o4B49edCGGBVg
         VSNtR9DiT2mJOZcyZQXlNKA4v8OaRiff/ttzAQYtcljX2ea/YBfENB9jDPAnZId1wxfj
         ltbFallMisr4PoMu4iwDPPAciG6oGtbPcqKfQHnjDLDT5F4GqCvIl82sgpolyzcNQevh
         djBJAwT8YvvHCcP+OmBLOFod+6wXB7vb7xyn6LwOqHdAmUE/lWNP9JldbTEd3Vtv8L/3
         DinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717285067; x=1717889867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBblh6fXFx3/CtfuJ8K++e7ut3+jzamyM7fjsFIb9Q0=;
        b=ma71sSlXVzAHQGub3+33ySh3zYhKcnIDLsMoUszcJPu9BTa30qDwd4+sKXgu+3vxls
         2Vb67kVGsjdoaPSOYfoIH02X1Pdyh5PjlBHkZJQguphXGoKrUnFrUhExrjOCRMXGm47W
         rloPNLmKU5qb2BgUkj4eDwtcNS3sStEn/0L013Bn9sVYzL8ni1TcsEHwzny12PMTxR1b
         X7MOCEGssZys2/08PHZ4KMz76hZ5B3ZGkCzMKvee36zUD4wu9bbr0HAYrd71A5Yy00sD
         8s7NuS+fyltau0MZXuESPwZtsCoPO+vbM96iYhYjrPex9khrFN1OMVc6/tTsq4mZD9YG
         3R9w==
X-Forwarded-Encrypted: i=1; AJvYcCUTH6i7ROOhsVfPLBoK3TwUTFsCuAtppqUkUqQ7nv+6I6IRnzQo5SQFhCYgjPHZsbCPc4plddKDgdfctG6i6VTC4eVMgaKyjWMVITDICPmi/eJoHs3KmipYW5ANgo+CJEByRA==
X-Gm-Message-State: AOJu0YwKMBMzM9wLF3lU6fTs8yX7CpYt06hf6Ui4oog6Q0qpsXSx4ycD
	ZJOjqmf98m0/l9YCKHeR4A/pyhpgIlp1gUTnRzHS9uSAkb7SVcASKmG0eDXMQ+z61M37mYvVK7C
	NswUKGbsS+ahU+cErqlXXjjPZnAc=
X-Google-Smtp-Source: AGHT+IH/XMpr/rpOp8xDzzakAxrzKXFJm+6tWSXgNFlrs6iS7JWTRDOTQJTMEj6JdEtkvbZdb6F1KIh0hX+jLXXklUE=
X-Received: by 2002:a81:ce03:0:b0:618:8e76:af45 with SMTP id
 00721157ae682-62c797ef694mr50134587b3.52.1717285066667; Sat, 01 Jun 2024
 16:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529210242.3346844-2-lars@oddbit.com> <171728283034.4092.12616353767873504629.git-patchwork-notify@kernel.org>
 <CANnsUMG4sqomBWpU95u1q+guCAt9-G12cBCcvqsndkBWKn8zzA@mail.gmail.com>
In-Reply-To: <CANnsUMG4sqomBWpU95u1q+guCAt9-G12cBCcvqsndkBWKn8zzA@mail.gmail.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Sat, 1 Jun 2024 16:37:35 -0700
Message-ID: <CANnsUMEM7pLgiTBzMXh7Ym5=dKJ01yCcZV4DZQgD7FnAGqZDYg@mail.gmail.com>
Subject: Re: [PATCH v5] ax25: Fix refcount imbalance on inbound connections
To: patchwork-bot+netdevbpf@kernel.org
Cc: Lars Kellogg-Stedman <lars@oddbit.com>, crossd@gmail.com, duoming@zju.edu.cn, 
	linux-hams@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is this the only patch to get the last stable branch off of the
mainline (6.9) up to date?

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 8077cf2ee4480..d6f9fae06a9d8 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1378,8 +1378,10 @@ static int ax25_accept(struct socket *sock,
struct socket *newsock,
{
struct sk_buff *skb;
struct sock *newsk;
+ ax25_dev *ax25_dev;
DEFINE_WAIT(wait);
struct sock *sk;
+ ax25_cb *ax25;
int err =3D 0;
if (sock->state !=3D SS_UNCONNECTED)
@@ -1434,6 +1436,10 @@ static int ax25_accept(struct socket *sock,
struct socket *newsock,
kfree_skb(skb);
sk_acceptq_removed(sk);
newsock->state =3D SS_CONNECTED;
+ ax25 =3D sk_to_ax25(newsk);
+ ax25_dev =3D ax25->ax25_dev;
+ netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
+ ax25_dev_hold(ax25_dev);
out:
release_sock(sk);

#########################################

and I am going to guess that the next stable fork will have this
commit already applied?

Thanks in advance,
Chris KQ6UP

On Sat, Jun 1, 2024 at 4:10=E2=80=AFPM Chris Maness
<christopher.maness@gmail.com> wrote:
>
> Awesome!
>
> Thanks,
> Chris Maness
> -Sent from my iPhone
>
>
> On Sat, Jun 1, 2024 at 4:00=E2=80=AFPM <patchwork-bot+netdevbpf@kernel.or=
g> wrote:
>>
>> Hello:
>>
>> This patch was applied to netdev/net.git (main)
>> by Jakub Kicinski <kuba@kernel.org>:
>>
>> On Wed, 29 May 2024 17:02:43 -0400 you wrote:
>> > From: Lars Kellogg-Stedman <lars@oddbit.com>
>> >
>> > When releasing a socket in ax25_release(), we call netdev_put() to
>> > decrease the refcount on the associated ax.25 device. However, the
>> > execution path for accepting an incoming connection never calls
>> > netdev_hold(). This imbalance leads to refcount errors, and ultimately
>> > to kernel crashes.
>> >
>> > [...]
>>
>> Here is the summary with links:
>>   - [v5] ax25: Fix refcount imbalance on inbound connections
>>     https://git.kernel.org/netdev/net/c/3c34fb0bd4a4
>>
>> You are awesome, thank you!
>> --
>> Deet-doot-dot, I am a bot.
>> https://korg.docs.kernel.org/patchwork/pwbot.html
>>
>>


--=20
Thanks,
Chris Maness

