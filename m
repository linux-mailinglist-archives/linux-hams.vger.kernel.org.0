Return-Path: <linux-hams+bounces-738-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37316CD730B
	for <lists+linux-hams@lfdr.de>; Mon, 22 Dec 2025 22:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 962C03013540
	for <lists+linux-hams@lfdr.de>; Mon, 22 Dec 2025 21:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C1F30EF76;
	Mon, 22 Dec 2025 21:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiPuzxEe"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0959330AD10
	for <linux-hams@vger.kernel.org>; Mon, 22 Dec 2025 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766438880; cv=none; b=SKEez2HFPeKeK9rXxHuRMNL5W74ERKTs7HCNkOxPv4u9QACuV+gWc62X5LcXEVkQ6FzQ99bTtTrNsH4PrcL+WVYSJzJv1l7mv3Oz927uTQE56TqpTnEfB6kBnBbPb5wygaYVhVI1Aypg2MH1o2gduxAK8gEFanqJ4lDQO3o0ivc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766438880; c=relaxed/simple;
	bh=bGjSfp0irDcNCUjSGsSSbiflO2qqyyuZ2c2uycxSrTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9ohZwp1OSpx0isO1sMUObpB1DxHU0f3J1aLdC5YfFV+NBvmD/xovZEnYDXZ/UjbR4vyrjIbvWMEVy0/LmZtz8ZfHygFT8uMo6jEDHsUzdBuduji3f3Ev7OG/csXTfJxapu6juX7SoVLNOx0UdwTj0CCF5XLccrY9oI+bBdQ0DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiPuzxEe; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3e898ba2a03so3641223fac.0
        for <linux-hams@vger.kernel.org>; Mon, 22 Dec 2025 13:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766438878; x=1767043678; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kOiq+AaTcURkJtr2tRcFECXTz5Tt6lNoL3qxDjozJKg=;
        b=JiPuzxEeCdoTSRb3QKPOJjCdts34qCMfS3GgKPYKCNxmj1HyEKgJBR8f1xmE1SnUIl
         fTZ4XyX/qjM+43RUGOxTS1bDSCKj7mPN0ETxUmluOuMsk6htjATNugE8hLlqVCorzV9S
         uwI8IbUN1OQw/huQuU+TlHqCVKfcgyYCWl7PYl1mNMR5tX4HRPc066q7FHxD8SUdngYZ
         qoi8LPh7znOV1fd+CQ/6JBJP8bGtgiqfiwIt4mnOPffN72M1qG47Y7q1Ti1+tUb1yRvj
         2QpaOMK4Hk0mAgu9iubKDAsQxnevd+UDcshHOdvXYUYgAsq3GOLyFLmUjYkhxso0z5u5
         Lolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766438878; x=1767043678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOiq+AaTcURkJtr2tRcFECXTz5Tt6lNoL3qxDjozJKg=;
        b=ZAqQnaOzWugEpnqu0xotuqzMSiLKe+kNGyIAPYnXWTHE++cBFoRz3NRhzpaqDHRZdK
         pjhDAyod9CosjF3LdKbn1OjPoZC9YVKInhiMBzSPWGnvB2RsqZYuQ3tstriNxO/YpecJ
         GLlcPHFgT5Ny6xD/jVvFJgPcX4hFmekV3Kuj0SmV24nF4PSSfK/et1Mxt4rWendWLLrk
         igPGn/Ighi0IlGtUHKMJ+6vrNuQWe1yw7AeNkLeXCN2BXF3mAqZoJg8nxWFuBU/hXbaD
         aOlTYLbVf3gnj3oISwZvX/giF8Xi8K55uxm5/ruycheUeW80I4/lStYvJr0iykfpPmZq
         cCZg==
X-Forwarded-Encrypted: i=1; AJvYcCUgWUFXS7YPcVvNh8Rnvk9lB/ZhtPKMZOpFEWTy4NsTwiL/dlK/hSsfWjejBAuQvxE+CTUEejiDnEaf@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9J7kFT4ZoB0PURn5k0j3PiTn2NMgsRgmnb7aurtcoLx1n71k
	1NpZyke7KrMknRoCNb7DeCQLO4mE1vJouODqDH6XCapKXoEmKURc7pZkzBUvJD676NHC4idtAU2
	PzutpoEqlf7AV43y4azQHxZbuLe65H5g=
X-Gm-Gg: AY/fxX6Z25ANCn22M8L1JyOn0mPndcZ5vFlXO+O/3xDqD+45uEgKVIqchEM2KyaT+rh
	4ThcJJRThVGHNpu458Y2j7Wun0JCua+eF+wyKdaaiMrkRERlj/I1hl0Ncu/z7HczAKL2REaLgK8
	0suGCiTXHxdeYXI+MbQflxzzeNKh+ZwXDcZpJuviZDu7p91mhsxVI7vx3SjGknnPQNsxtYOt3vB
	9uSXNb3w9uaR58IrpgQkBay3Nm4rmFGUaw6gFBm7XhR/p1+EMJU56AK5dLn1AEIlvExqmVhxA==
X-Google-Smtp-Source: AGHT+IFlCrXJ44z9TTLXMWHdryMXJq8dnG5H7yZb2w9BRw6DPqOYPVIXLEgXgaePQjNUL5ja2QfDys/vVYE/OnDBwM4=
X-Received: by 2002:a05:6820:2291:b0:65b:2795:cb06 with SMTP id
 006d021491bc7-65d0e94cfacmr5166926eaf.10.1766438877779; Mon, 22 Dec 2025
 13:27:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222212227.4116041-1-ritviktanksalkar@gmail.com>
In-Reply-To: <20251222212227.4116041-1-ritviktanksalkar@gmail.com>
From: Ritvik Tanksalkar <ritviktanksalkar@gmail.com>
Date: Mon, 22 Dec 2025 16:27:23 -0500
X-Gm-Features: AQt7F2pKvyktbMs0yI_BmEnw6Qcre1AIbAFi27KRD_CfZf_l_MgFpSOQVR2scpA
Message-ID: <CAJxTgFzwzAnJkRt9Y0nF6ByG1vKRs81JQ-oUq4AL5zWv40eihg@mail.gmail.com>
Subject: Re: [PATCH net] net: rose: fix invalid array index in rose_kill_by_device()
To: kuba@kernel.org, pabeni@redhat.com
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-hams@vger.kernel.org, 
	Pwnverse <stanksal@purdue.edu>, Fatma Alwasmi <falwasmi@purdue.edu>
Content-Type: multipart/mixed; boundary="000000000000d432d30646911970"

--000000000000d432d30646911970
Content-Type: multipart/alternative; boundary="000000000000d432d1064691196e"

--000000000000d432d1064691196e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Apologies for another ping. I forgot to attach the POC (results in crash
under CAP_NET_ADMIN).

Warm Regards,
Ritvik Tanksalkar

On Mon, Dec 22, 2025 at 4:22=E2=80=AFPM Sai Ritvik Tanksalkar <
ritviktanksalkar@gmail.com> wrote:

> From: Pwnverse <stanksal@purdue.edu>
>
> rose_kill_by_device() collects sockets into a local array[] and then
> iterates over them to disconnect sockets bound to a device being brought
> down.
>
> The loop mistakenly indexes array[cnt] instead of array[i]. For cnt <
> ARRAY_SIZE(array), this reads an uninitialized entry; for cnt =3D=3D
> ARRAY_SIZE(array), it is an out-of-bounds read. Either case can lead to
> an invalid socket pointer dereference and also leaks references taken
> via sock_hold().
>
> Fix the index to use i.
>
> Fixes: 64b8bc7d5f143 ("net/rose: fix races in rose_kill_by_device()")
> Co-developed-by: Fatma Alwasmi <falwasmi@purdue.edu>
> Signed-off-by: Fatma Alwasmi <falwasmi@purdue.edu>
> Signed-off-by: Pwnverse <stanksal@purdue.edu>
> ---
>  net/rose/af_rose.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index fd67494f2815..c0f5a515a8ce 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -205,7 +205,7 @@ static void rose_kill_by_device(struct net_device *de=
v)
>         spin_unlock_bh(&rose_list_lock);
>
>         for (i =3D 0; i < cnt; i++) {
> -               sk =3D array[cnt];
> +               sk =3D array[i];
>                 rose =3D rose_sk(sk);
>                 lock_sock(sk);
>                 spin_lock_bh(&rose_list_lock);
> --
> 2.43.0
>
>

--000000000000d432d1064691196e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Apologies for another=
 ping. I forgot to attach the POC (results in crash under CAP_NET_ADMIN).</=
div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Warm Rega=
rds,<div>Ritvik Tanksalkar</div></div></div></div></div></div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Dec 22, 2025 at 4:22=E2=80=AFPM Sai Ritvik Tanksalkar &lt;=
<a href=3D"mailto:ritviktanksalkar@gmail.com">ritviktanksalkar@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Pwnverse &lt;<a href=3D"mailto:stanksal@purdue.edu" target=3D"_blank">st=
anksal@purdue.edu</a>&gt;<br>
<br>
rose_kill_by_device() collects sockets into a local array[] and then<br>
iterates over them to disconnect sockets bound to a device being brought<br=
>
down.<br>
<br>
The loop mistakenly indexes array[cnt] instead of array[i]. For cnt &lt;<br=
>
ARRAY_SIZE(array), this reads an uninitialized entry; for cnt =3D=3D<br>
ARRAY_SIZE(array), it is an out-of-bounds read. Either case can lead to<br>
an invalid socket pointer dereference and also leaks references taken<br>
via sock_hold().<br>
<br>
Fix the index to use i.<br>
<br>
Fixes: 64b8bc7d5f143 (&quot;net/rose: fix races in rose_kill_by_device()&qu=
ot;)<br>
Co-developed-by: Fatma Alwasmi &lt;<a href=3D"mailto:falwasmi@purdue.edu" t=
arget=3D"_blank">falwasmi@purdue.edu</a>&gt;<br>
Signed-off-by: Fatma Alwasmi &lt;<a href=3D"mailto:falwasmi@purdue.edu" tar=
get=3D"_blank">falwasmi@purdue.edu</a>&gt;<br>
Signed-off-by: Pwnverse &lt;<a href=3D"mailto:stanksal@purdue.edu" target=
=3D"_blank">stanksal@purdue.edu</a>&gt;<br>
---<br>
=C2=A0net/rose/af_rose.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c<br>
index fd67494f2815..c0f5a515a8ce 100644<br>
--- a/net/rose/af_rose.c<br>
+++ b/net/rose/af_rose.c<br>
@@ -205,7 +205,7 @@ static void rose_kill_by_device(struct net_device *dev)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_bh(&amp;rose_list_lock);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; cnt; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sk =3D array[cnt];<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sk =3D array[i];<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rose =3D rose_sk(sk=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock_sock(sk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_bh(&amp;r=
ose_list_lock);<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000d432d1064691196e--
--000000000000d432d30646911970
Content-Type: application/octet-stream; name="net_rose_poc.c"
Content-Disposition: attachment; filename="net_rose_poc.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mjho2lib0>
X-Attachment-Id: f_mjho2lib0

I2luY2x1ZGUgPHN0ZGlvLmg+DQojaW5jbHVkZSA8c3RkbGliLmg+DQojaW5jbHVkZSA8c3RyaW5n
Lmg+DQojaW5jbHVkZSA8dW5pc3RkLmg+DQojaW5jbHVkZSA8c3lzL3NvY2tldC5oPg0KI2luY2x1
ZGUgPHN5cy9pb2N0bC5oPg0KI2luY2x1ZGUgPGxpbnV4L2lmLmg+DQojaW5jbHVkZSA8bGludXgv
aWZfYXJwLmg+DQojaW5jbHVkZSA8YXJwYS9pbmV0Lmg+DQoNCi8qIFJPU0UgcHJvdG9jb2wgZGVm
aW5pdGlvbnMgKi8NCiNpZm5kZWYgQUZfUk9TRQ0KI2RlZmluZSBBRl9ST1NFIDExDQojZW5kaWYN
Cg0KI2lmbmRlZiBQRl9ST1NFDQojZGVmaW5lIFBGX1JPU0UgQUZfUk9TRQ0KI2VuZGlmDQoNCiNp
Zm5kZWYgQVJQSFJEX1JPU0UNCiNkZWZpbmUgQVJQSFJEX1JPU0UgMjcwDQojZW5kaWYNCg0KI2lm
bmRlZiBST1NFX0FERFJfTEVODQojZGVmaW5lIFJPU0VfQUREUl9MRU4gNQ0KI2VuZGlmDQoNCiNp
Zm5kZWYgQVgyNV9BRERSX0xFTiAgDQojZGVmaW5lIEFYMjVfQUREUl9MRU4gNw0KI2VuZGlmDQoN
Ci8qIFJPU0UgYWRkcmVzcyBzdHJ1Y3R1cmUgKi8NCnR5cGVkZWYgc3RydWN0IHsNCiAgICB1bnNp
Z25lZCBjaGFyIHJvc2VfYWRkcltST1NFX0FERFJfTEVOXTsNCn0gcm9zZV9hZGRyZXNzOw0KDQov
KiBBWC4yNSBhZGRyZXNzIHN0cnVjdHVyZSAqLw0KdHlwZWRlZiBzdHJ1Y3Qgew0KICAgIHVuc2ln
bmVkIGNoYXIgYXgyNV9jYWxsW0FYMjVfQUREUl9MRU5dOw0KfSBheDI1X2FkZHJlc3M7DQoNCi8q
IFJPU0Ugc29ja2V0IGFkZHJlc3MgKi8NCnN0cnVjdCBzb2NrYWRkcl9yb3NlIHsNCiAgICBzYV9m
YW1pbHlfdCBzcm9zZV9mYW1pbHk7DQogICAgcm9zZV9hZGRyZXNzIHNyb3NlX2FkZHI7DQogICAg
YXgyNV9hZGRyZXNzIHNyb3NlX2NhbGw7DQogICAgaW50IHNyb3NlX25kaWdpczsNCiAgICBheDI1
X2FkZHJlc3Mgc3Jvc2VfZGlnaTsNCn07DQoNCnN0cnVjdCBmdWxsX3NvY2thZGRyX3Jvc2Ugew0K
ICAgIHNhX2ZhbWlseV90IHNyb3NlX2ZhbWlseTsNCiAgICByb3NlX2FkZHJlc3Mgc3Jvc2VfYWRk
cjsNCiAgICBheDI1X2FkZHJlc3Mgc3Jvc2VfY2FsbDsNCiAgICB1bnNpZ25lZCBpbnQgc3Jvc2Vf
bmRpZ2lzOw0KICAgIGF4MjVfYWRkcmVzcyBzcm9zZV9kaWdpc1s2XTsNCn07DQoNCi8qIFNldCBh
IFJPU0UgYWRkcmVzcyAoMTAgQkNEIGRpZ2l0cyBwYWNrZWQgaW50byA1IGJ5dGVzKSAqLw0Kc3Rh
dGljIHZvaWQgc2V0X3Jvc2VfYWRkcihyb3NlX2FkZHJlc3MgKmFkZHIpDQp7DQogICAgbWVtc2V0
KGFkZHIsIDAsIHNpemVvZigqYWRkcikpOw0KICAgIGFkZHItPnJvc2VfYWRkclswXSA9IDB4MTI7
DQogICAgYWRkci0+cm9zZV9hZGRyWzFdID0gMHgzNDsNCiAgICBhZGRyLT5yb3NlX2FkZHJbMl0g
PSAweDU2Ow0KICAgIGFkZHItPnJvc2VfYWRkclszXSA9IDB4Nzg7DQogICAgYWRkci0+cm9zZV9h
ZGRyWzRdID0gMHg5MDsNCn0NCg0KLyogU2V0IGFuIEFYLjI1IGNhbGxzaWduICg2IGNoYXJzIHNo
aWZ0ZWQgbGVmdCBieSAxLCArIFNTSUQgYnl0ZSkgKi8NCnN0YXRpYyB2b2lkIHNldF9heDI1X2Nh
bGwoYXgyNV9hZGRyZXNzICpjYWxsLCBjb25zdCBjaGFyICpzdHIpDQp7DQogICAgaW50IGk7DQog
ICAgbWVtc2V0KGNhbGwsIDAsIHNpemVvZigqY2FsbCkpOw0KICAgIGZvciAoaSA9IDA7IGkgPCA2
ICYmIHN0cltpXTsgaSsrKSB7DQogICAgICAgIGNhbGwtPmF4MjVfY2FsbFtpXSA9IHN0cltpXSA8
PCAxOw0KICAgIH0NCiAgICBmb3IgKDsgaSA8IDY7IGkrKykgew0KICAgICAgICBjYWxsLT5heDI1
X2NhbGxbaV0gPSAnICcgPDwgMTsNCiAgICB9DQogICAgY2FsbC0+YXgyNV9jYWxsWzZdID0gMHg2
MDsgLyogU1NJRCAqLw0KfQ0KDQovKiBDb25maWd1cmUgcm9zZTAgaW50ZXJmYWNlICovDQpzdGF0
aWMgaW50IHNldHVwX3Jvc2VfaW50ZXJmYWNlKGludCBicmluZ191cCkNCnsNCiAgICBpbnQgc29j
a19mZDsNCiAgICBzdHJ1Y3QgaWZyZXEgaWZyOw0KDQogICAgc29ja19mZCA9IHNvY2tldChBRl9J
TkVULCBTT0NLX0RHUkFNLCAwKTsNCiAgICBpZiAoc29ja19mZCA8IDApIHsNCiAgICAgICAgcGVy
cm9yKCJzb2NrZXQgZm9yIGlvY3RsIik7DQogICAgICAgIHJldHVybiAtMTsNCiAgICB9DQoNCiAg
ICBpZiAoYnJpbmdfdXApIHsNCiAgICAgICAgLyogU2V0IHRoZSBST1NFIGhhcmR3YXJlIGFkZHJl
c3Mgb24gcm9zZTAgKi8NCiAgICAgICAgbWVtc2V0KCZpZnIsIDAsIHNpemVvZihpZnIpKTsNCiAg
ICAgICAgc3RybmNweShpZnIuaWZyX25hbWUsICJyb3NlMCIsIElGTkFNU0laIC0gMSk7DQogICAg
ICAgIA0KICAgICAgICBpZnIuaWZyX2h3YWRkci5zYV9mYW1pbHkgPSBBUlBIUkRfUk9TRTsNCiAg
ICAgICAgaWZyLmlmcl9od2FkZHIuc2FfZGF0YVswXSA9IDB4MTI7DQogICAgICAgIGlmci5pZnJf
aHdhZGRyLnNhX2RhdGFbMV0gPSAweDM0Ow0KICAgICAgICBpZnIuaWZyX2h3YWRkci5zYV9kYXRh
WzJdID0gMHg1NjsNCiAgICAgICAgaWZyLmlmcl9od2FkZHIuc2FfZGF0YVszXSA9IDB4Nzg7DQog
ICAgICAgIGlmci5pZnJfaHdhZGRyLnNhX2RhdGFbNF0gPSAweDkwOw0KDQogICAgICAgIGlmIChp
b2N0bChzb2NrX2ZkLCBTSU9DU0lGSFdBRERSLCAmaWZyKSA8IDApIHsNCiAgICAgICAgICAgIHBl
cnJvcigiU0lPQ1NJRkhXQUREUiByb3NlMCIpOw0KICAgICAgICAgICAgY2xvc2Uoc29ja19mZCk7
DQogICAgICAgICAgICByZXR1cm4gLTE7DQogICAgICAgIH0NCiAgICAgICAgcHJpbnRmKCJbK10g
U2V0IFJPU0UgYWRkcmVzcyBvbiByb3NlMFxuIik7DQogICAgfQ0KDQogICAgLyogR2V0IGN1cnJl
bnQgZmxhZ3MgKi8NCiAgICBtZW1zZXQoJmlmciwgMCwgc2l6ZW9mKGlmcikpOw0KICAgIHN0cm5j
cHkoaWZyLmlmcl9uYW1lLCAicm9zZTAiLCBJRk5BTVNJWiAtIDEpOw0KICAgIA0KICAgIGlmIChp
b2N0bChzb2NrX2ZkLCBTSU9DR0lGRkxBR1MsICZpZnIpIDwgMCkgew0KICAgICAgICBwZXJyb3Io
IlNJT0NHSUZGTEFHUyByb3NlMCIpOw0KICAgICAgICBjbG9zZShzb2NrX2ZkKTsNCiAgICAgICAg
cmV0dXJuIC0xOw0KICAgIH0NCg0KICAgIGlmIChicmluZ191cCkgew0KICAgICAgICBpZnIuaWZy
X2ZsYWdzIHw9IElGRl9VUCB8IElGRl9SVU5OSU5HOw0KICAgICAgICBwcmludGYoIlsrXSBCcmlu
Z2luZyByb3NlMCBVUFxuIik7DQogICAgfSBlbHNlIHsNCiAgICAgICAgaWZyLmlmcl9mbGFncyAm
PSB+KElGRl9VUCB8IElGRl9SVU5OSU5HKTsNCiAgICAgICAgcHJpbnRmKCJbK10gQnJpbmdpbmcg
cm9zZTAgRE9XTiAodGhpcyB0cmlnZ2VycyB0aGUgYnVnKVxuIik7DQogICAgfQ0KICAgIA0KICAg
IGlmIChpb2N0bChzb2NrX2ZkLCBTSU9DU0lGRkxBR1MsICZpZnIpIDwgMCkgew0KICAgICAgICBw
ZXJyb3IoIlNJT0NTSUZGTEFHUyByb3NlMCIpOw0KICAgICAgICBjbG9zZShzb2NrX2ZkKTsNCiAg
ICAgICAgcmV0dXJuIC0xOw0KICAgIH0NCg0KICAgIGNsb3NlKHNvY2tfZmQpOw0KICAgIHJldHVy
biAwOw0KfQ0KDQppbnQgbWFpbih2b2lkKQ0Kew0KICAgIGludCByb3NlX2ZkOw0KICAgIHN0cnVj
dCBmdWxsX3NvY2thZGRyX3Jvc2UgbG9jYWxfYWRkcjsNCiAgICAvKiBTdGVwIDE6IFNldCB1cCBy
b3NlMCBpbnRlcmZhY2Ugd2l0aCBhZGRyZXNzIGFuZCBicmluZyBVUCAqLw0KICAgIHByaW50Zigi
WypdIFN0ZXAgMTogU2V0dGluZyB1cCByb3NlMCBpbnRlcmZhY2UuLi5cbiIpOw0KICAgIGlmIChz
ZXR1cF9yb3NlX2ludGVyZmFjZSgxKSA8IDApIHsNCiAgICAgICAgZnByaW50ZihzdGRlcnIsICJb
LV0gRmFpbGVkIHRvIHNldCB1cCByb3NlMCBpbnRlcmZhY2VcbiIpOw0KICAgICAgICBmcHJpbnRm
KHN0ZGVyciwgIiAgICBNYWtlIHN1cmUgQ09ORklHX1JPU0UgaXMgZW5hYmxlZCBhbmQgeW91IGhh
dmUgcm9vdCBwcml2aWxlZ2VzXG4iKTsNCiAgICAgICAgcmV0dXJuIDE7DQogICAgfQ0KDQogICAg
LyogU3RlcCAyOiBDcmVhdGUgUk9TRSBzb2NrZXQgKi8NCiAgICBwcmludGYoIlsqXSBTdGVwIDI6
IENyZWF0aW5nIFJPU0Ugc29ja2V0Li4uXG4iKTsNCiAgICByb3NlX2ZkID0gc29ja2V0KEFGX1JP
U0UsIFNPQ0tfU0VRUEFDS0VULCAwKTsNCiAgICBpZiAocm9zZV9mZCA8IDApIHsNCiAgICAgICAg
cGVycm9yKCJzb2NrZXQgQUZfUk9TRSIpOw0KICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIiAgICBN
YWtlIHN1cmUgQ09ORklHX1JPU0UgaXMgZW5hYmxlZFxuIik7DQogICAgICAgIHJldHVybiAxOw0K
ICAgIH0NCiAgICBwcmludGYoIlsrXSBST1NFIHNvY2tldCBjcmVhdGVkIChmZD0lZClcbiIsIHJv
c2VfZmQpOw0KDQogICAgLyogU3RlcCAzOiBCaW5kIHRoZSBzb2NrZXQgdG8gcm9zZTAncyBhZGRy
ZXNzDQogICAgICogVGhpcyBhZGRzIHRoZSBzb2NrZXQgdG8gcm9zZV9saXN0IHdpdGggcm9zZS0+
ZGV2aWNlID0gZGV2DQogICAgICovDQogICAgcHJpbnRmKCJbKl0gU3RlcCAzOiBCaW5kaW5nIHNv
Y2tldCB0byByb3NlMC4uLlxuIik7DQogICAgbWVtc2V0KCZsb2NhbF9hZGRyLCAwLCBzaXplb2Yo
bG9jYWxfYWRkcikpOw0KICAgIGxvY2FsX2FkZHIuc3Jvc2VfZmFtaWx5ID0gQUZfUk9TRTsNCiAg
ICBzZXRfcm9zZV9hZGRyKCZsb2NhbF9hZGRyLnNyb3NlX2FkZHIpOw0KICAgIHNldF9heDI1X2Nh
bGwoJmxvY2FsX2FkZHIuc3Jvc2VfY2FsbCwgIlRFU1QwIik7DQogICAgbG9jYWxfYWRkci5zcm9z
ZV9uZGlnaXMgPSAwOw0KDQogICAgaWYgKGJpbmQocm9zZV9mZCwgKHN0cnVjdCBzb2NrYWRkciAq
KSZsb2NhbF9hZGRyLCBzaXplb2Yoc3RydWN0IHNvY2thZGRyX3Jvc2UpKSA8IDApIHsNCiAgICAg
ICAgcGVycm9yKCJiaW5kIFJPU0UiKTsNCiAgICAgICAgY2xvc2Uocm9zZV9mZCk7DQogICAgICAg
IHJldHVybiAxOw0KICAgIH0NCiAgICBwcmludGYoIlsrXSBST1NFIHNvY2tldCBib3VuZCB0byBy
b3NlMFxuIik7DQoNCiAgICAvKiBTdGVwIDQ6IEJyaW5nIHJvc2UwIERPV04NCiAgICAgKiANCiAg
ICAgKiBUaGlzIHRyaWdnZXJzOg0KICAgICAqIC0gcm9zZV9kZXZpY2VfZXZlbnQoKSB3aXRoIE5F
VERFVl9ET1dODQogICAgICogLSByb3NlX2tpbGxfYnlfZGV2aWNlKGRldikgaXMgY2FsbGVkDQog
ICAgICogLSBPdXIgc29ja2V0IGlzIGZvdW5kIGFuZCBhZGRlZCB0byBhcnJheVswXSwgY250IGJl
Y29tZXMgMQ0KICAgICAqIC0gTG9vcDogZm9yIChpID0gMDsgaSA8IDE7IGkrKykgeyBzayA9IGFy
cmF5WzFdOyAuLi4gfQ0KICAgICAqICAgQlVHOiBSZWFkcyBhcnJheVsxXSBpbnN0ZWFkIG9mIGFy
cmF5WzBdIQ0KICAgICAqIC0gYXJyYXlbMV0gY29udGFpbnMgZ2FyYmFnZS91bmluaXRpYWxpemVk
IHN0YWNrIGRhdGENCiAgICAgKiAtIGxvY2tfc29jayhzaykgY3Jhc2hlcyB3aXRoIE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZQ0KICAgICAqLw0KICAgIHByaW50ZigiXG5bKl0gU3RlcCA0OiBUcmln
Z2VyaW5nIGJ1ZyBieSBicmluZ2luZyByb3NlMCBET1dOLi4uXG4iKTsNCiAgICBwcmludGYoIlsh
XSBFeHBlY3RlZDogS2VybmVsIGNyYXNoIGluIGxvY2tfc29jaygpIGR1ZSB0byBhcnJheVtjbnRd
IGJ1Z1xuXG4iKTsNCiAgICANCiAgICBpZiAoc2V0dXBfcm9zZV9pbnRlcmZhY2UoMCkgPCAwKSB7
DQogICAgICAgIGZwcmludGYoc3RkZXJyLCAiWy1dIEZhaWxlZCB0byBicmluZyByb3NlMCBkb3du
XG4iKTsNCiAgICAgICAgY2xvc2Uocm9zZV9mZCk7DQogICAgICAgIHJldHVybiAxOw0KICAgIH0N
Cg0KICAgIC8qIElmIHdlIHJlYWNoIGhlcmUsIHRoZSBidWcgZGlkbid0IHRyaWdnZXIgKHNob3Vs
ZG4ndCBoYXBwZW4pICovDQogICAgcHJpbnRmKCJbP10gSW50ZXJmYWNlIGJyb3VnaHQgZG93biAt
IGNoZWNrIGRtZXNnIGZvciBjcmFzaFxuIik7DQoNCiAgICBjbG9zZShyb3NlX2ZkKTsNCiAgICBy
ZXR1cm4gMDsNCn0=
--000000000000d432d30646911970--

