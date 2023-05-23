Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA2970DB7E
	for <lists+linux-hams@lfdr.de>; Tue, 23 May 2023 13:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236532AbjEWLcw (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 23 May 2023 07:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236373AbjEWLcv (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 23 May 2023 07:32:51 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0D9119
        for <linux-hams@vger.kernel.org>; Tue, 23 May 2023 04:32:48 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f600a6a890so55485e9.0
        for <linux-hams@vger.kernel.org>; Tue, 23 May 2023 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684841567; x=1687433567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbROoHa1pSTuFDb1xaCJvalyJJVqq/a6pn7ge+KYRic=;
        b=ArQE/FGoscqnRZOB/VMsy3T+HRVUpuD/WDRB/4Vwg0QqDQZSot7ZTtjwIi0LYw9aEx
         Ys1VDB08Q9CMq34klCFWH25f38Fs5RisBoSWiGuEt8jexlDTFz1Tjb7LBQUzmnQVXeYA
         BwYx5n5x+EStlDaODwLiEWhZRBAL1fTbLmt9QTqyomWFKLqJOlmFy3QvIHMQKPtJFzxG
         RVsThqj28sPMy379e0LTJdQE5lABOeYTjCFKjC2qD+Bs691GXrsmBBaVr3AMB+yB4dhP
         QD2qnEpJ72wbVICLShNngQ3dWzxUGZNsa5q0XtjPbnqws69r9DnXkFUTVKO5NxM7XUAb
         Wmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684841567; x=1687433567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbROoHa1pSTuFDb1xaCJvalyJJVqq/a6pn7ge+KYRic=;
        b=dS5o0TBMVlwuH6mlINeUI2+n74/HWKbMlzKXV+ZSDPLskvHyPWc0/ibZl/pOOzLXf3
         jCb/hmcXU/F4DZvykNCYQSmxiYRP15hpvZMYHwjWC8FiI5e3aqVQbdjOI4LV9E2nzGzx
         TNbyLxT6UQ0KCClrnM5eVREPwq/63fiag+prLdJoON2L+2Uhgm7D7X+Vc9iCwEqJA7aR
         FlfMLPK85RAwiBpBbnH1D3jzBaVMNRUVG1ukPSuDNVkrcf7p4oGSlqQwnX2tDviqZk1+
         z3wyedMER8ft6t8H4WoGzCLOOLdxr7QtBHn7m6B7JHWgmijbuwbdjbjvV1FBq62WzG9F
         dTEQ==
X-Gm-Message-State: AC+VfDzfypsCj6GO3oCTelJXAlVjagu32+aUPD+JLJoIyTiYTMmX069B
        pBKHKBLcSIQpcJ9F+olD7KDYYwr3MM7BWmQS/nQZNQ==
X-Google-Smtp-Source: ACHHUZ6IgbQqYHpr8yMryQC8/ZZT42dyGkppjDyBLuFFiojEpIDumnPKBU02NIw9b6XaZE5EMTihVRBV5R4e5pzxxzE=
X-Received: by 2002:a05:600c:2f88:b0:3f5:f63:d490 with SMTP id
 t8-20020a05600c2f8800b003f50f63d490mr109429wmn.5.1684841567120; Tue, 23 May
 2023 04:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAJE3E7JoJfrnST3dU-vu_=6T_eB5gWVBKbfUSkCMu44gkbD3iQ@mail.gmail.com>
 <CAJE3E7LfO5us9MvKZX1MMP8mUTFzO324cxshHTDSw6qkB6kHTw@mail.gmail.com>
 <CANn89iKEX9wLYA3aisvVAGKJ2mGr9K35ALZTwHeM7DwEV2+nkg@mail.gmail.com> <CAJE3E7+EZVLRoLohp3Y2529HpKSndFZAyakX-FcbEe9wMBe-Bg@mail.gmail.com>
In-Reply-To: <CAJE3E7+EZVLRoLohp3Y2529HpKSndFZAyakX-FcbEe9wMBe-Bg@mail.gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Tue, 23 May 2023 13:32:35 +0200
Message-ID: <CANn89iJ=eQhM4AJd9qZjn8JTupTpeGeGNeu=x3RAa5zvB+AMHg@mail.gmail.com>
Subject: Re: Bug in the net/rom kernel module
To:     Simon Kapadia <szymon@kapadia.pl>
Cc:     security@kernel.org, Tom M0LTE <tom@m0lte.uk>,
        linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.6 required=5.0 tests=AC_HTML_NONSENSE_TAGS,
        BAYES_00,DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
        DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Tue, May 23, 2023 at 12:47=E2=80=AFPM Simon Kapadia <szymon@kapadia.pl> =
wrote:
>
> Would be much appreciated if you could send a patch -- happy to have my n=
ame to it, just haven't done so in this century so would likely make a styl=
istic error or something stupid!
>
> Thanks,
>
> -simon
>
> --- linux/net/netrom/nr_subr.c.orig     2023-04-19 19:50:03.080791821 +01=
00
> +++ linux/net/netrom/nr_subr.c  2023-04-19 19:50:22.410995440 +0100
> @@ -149,7 +149,7 @@ void nr_write_internal(struct sock *sk,
>          */
>         skb_reserve(skb, NR_NETWORK_LEN);
>
> -       dptr =3D skb_put(skb, skb_tailroom(skb));
> +       dptr =3D skb_put(skb, len);


Note that this patch does not look correct to me.

len includes NR_NETWORK_LEN at this point.

nr_transmit_buffer() will later add:

dptr =3D skb_push(skb, NR_NETWORK_LEN);

If you look again at your pcap after your patch, I guess we still send
15 extra bytes ?

>
>
>
>         switch (frametype & 0x0F) {
>         case NR_CONNREQ:
>
> --
> Simon Kapadia, B.A., M.Sc., C.Eng.
> szymon@kapadia.pl | http://kapadia.pl
> http://astrophotos.uk/
>
>
> On Tue, 23 May 2023 at 10:55, Eric Dumazet <edumazet@google.com> wrote:
>>
>>
>>
>> On Tue, May 23, 2023 at 11:47=E2=80=AFAM Simon Kapadia <szymon@kapadia.p=
l> wrote:
>>>
>>> Hello there,
>>>
>>> I sent the attached bug report over a month ago to the maintainer of th=
e AX.25 and NETROM modules as per the current MAINTAINERS file, but I haven=
't had any response.
>>>
>>> While this apparent bug has been around for a long time (it appears to =
have been introduced in kernel version 2.0 in 1996), I do consider it a sec=
urity problem.  We leak random bits of memory over the network, including u=
ser data; see the attached pcaps and screenshots, showing sending informati=
on on internal IP addresses and even an ELF binary out over the network.  I=
 can't immediately think of a way in which it could directly be remotely ex=
ploitable (eg to read a targeted section of memory) but simply leaking priv=
ate data by dumping raw memory contents onto the network is, in my opinion,=
 a significant concern.
>>>
>>> While this may seem pretty "niche" (who all uses packet networks and am=
ateur radio nowadays, right?*) -- there is quite a large community of users=
 that run AX25 over IP, including using NETROM, which means that this data =
may be leaked and routed over the internet.
>>>
>>> Is there some way to "escalate" such an issue with the maintainers of t=
he kernel module?
>>>
>>> Many thanks,
>>>
>>> -simon (M0GZP)
>>>
>>> *actually there is quite a resurgence of packet radio in the UK -- star=
t at http://packet.oarc.uk if interested
>>>
>>> --
>>> Simon Kapadia, B.A., M.Sc., C.Eng.
>>> szymon@kapadia.pl | http://kapadia.pl
>>> http://astrophotos.uk/
>>>
>>> ---------- Forwarded message ---------
>>> From: Simon Kapadia <szymon@kapadia.pl>
>>> Date: Wed, 19 Apr 2023 at 21:21
>>> Subject: Bug in the net/rom kernel module
>>> To: <ralf@linux-mips.org>
>>> Cc: <linux-hams@vger.kernel.org>, <tom@m0lte.uk>, <naylorjs@yahoo.com>
>>>
>>>
>>> Hi there,
>>>
>>> The Online Amateur Radio Community (OARC) has recently been experimenti=
ng with building a nationwide packet network in the UK.  As part of our exp=
erimentation, we have been testing out packet on 300bps HF, and playing wit=
h net/rom.  For HF packet at this baud rate you really need to make sure th=
at your MTU is relatively low; AX.25 suggests a PACLEN of 60, and a net/rom=
 PACLEN of 40 to go with that.  However the Linux net/rom support didn't wo=
rk with a low PACLEN; the mkiss module would truncate packets if you set th=
e PACLEN below about 200 or so, e.g.:
>>>
>>> Apr 19 14:00:51 radio kernel: [12985.747310] mkiss: ax1: truncating ove=
rsized transmit packet!
>>>
>>> This didn't make any sense to me (if the packets are smaller why would =
they be truncated?) so I started investigating.  I looked at the packets us=
ing ethereal, and found that many were just huge compared to what I would e=
xpect.  A simple net/rom connection request packet had the request and then=
 a bunch of what appeared to be random data following it:
>>>
>>>
>>>
>>> Weird eh?  But then I noticed this in a disconnect request from a frien=
d (Tom, on copy of this mail):
>>>
>>>
>>>
>>> This is leaking internal data from his system.  So somehow, his disconn=
ect request has some random bit of memory included in the packet!  I did so=
me further experimentation and found that the data included truly is random=
.  Here for example is a packet shown in my TNC log:
>>>
>>> Apr 18 12:14:17 radio direwolf[8011]: [2L] M0GZP-7>M0LTE-7:(I cmd, n(s)=
=3D0, n(r)=3D0, p=3D0, pid=3D0xcf)<0x9a>`<0x8e><0xb4><0xa0>@l<0x9a>`<0x98><=
0xa8><0x8a>@o<0x0f><0x01><0x01><0x00><0x00><0x01><0x04><0x9a>`<0x8e><0xb4><=
0xa0>@l<0x9a>`<0x8e><0xb4><0xa0>@lx<0x00><0x00><0x00><0x00><0x00><0x00><0x0=
0><0x00><0x00><0x00><0x00><0x00><0x03><0x00><0x00><0x00><0x19><0x00><0x00><=
0x00><0x10><0x10>4<0xc3><0x10><0x10>4<0xc3><0x00><0x00><0x00><0x00><0x00><0=
x00><0x00><0x00><0x00><0x00><0x00><0x00><0x00><0x00><0x00><0x00><0xec>o<0xa=
2><0xbe><0x00><0x00><0x80><0x00><0xff><0xff><0xff><0xff><0x7f>ELF<0x01><0x0=
1><0x01><0x00><0x00><0x00><0x00><0x00><0x00><0x00><0x00><0x00><0x02><0x00>(=
<0x00><0x01><0x00><0x00><0x00>0'<0x01><0x00>4<0x00><0x00><0x00><0x08><0xd4>=
<0x00><0x00><0x00><0x04><0x00><0x05>4<0x00><0x20><0x00><0x09><0x00>(<0x00><=
0x1d><0x00><0x1c><0x00><0x01><0x00><0x00>p<0x00><0xc0><0x00><0x00><0x00><0x=
c0><0x01><0x00><0x00><0xc0><0x01><0x00><0x08><0x00><0x00><0x00><0x08><0x00>=
<0x00><0x00><0x04><0x00><0x00><0x00><0x04><0x00><0x00><0x00><0x06><0x00><0x=
00><0x00>4<0x00><0x00><0x00>4<0x00><0x01><0x00>4<0x00><0x0
>>>
>>> 0x7f 0x45 0x4c 0x46 0x02 0x01 0x01 is the header for an ELF program bin=
ary, which I'm sending over the wire...
>>>
>>> I spent some time reacquainting myself with kernel development (the las=
t time I did any was the mid 90s), and I think I have worked out what is go=
ing on (with copious use of printk of course).  Apologies in advance if I'v=
e gotten all of this wrong, but I think I'm on solid ground.  I narrowed in=
 on the problem when I noticed that this only happens for "internal" packet=
s which are part of the protocol itself.  It seems that the problem arises =
in nr_subr.c in when building up the packet to send:
>>>
>>> void nr_write_internal(struct sock *sk, int frametype)
>>> {
>>>         struct nr_sock *nr =3D nr_sk(sk);
>>>         struct sk_buff *skb;
>>>         unsigned char  *dptr;
>>>         int len, timeout;
>>>
>>>         len =3D NR_NETWORK_LEN + NR_TRANSPORT_LEN;
>>>
>>>         switch (frametype & 0x0F) {
>>>         case NR_CONNREQ:
>>>                 len +=3D 17;
>>>                 break;
>>>         case NR_CONNACK:
>>>                 len +=3D (nr->bpqext) ? 2 : 1;
>>>                 break;
>>>         case NR_DISCREQ:
>>>         case NR_DISCACK:
>>>         case NR_INFOACK:
>>>                 break;
>>>         default:
>>>                 printk(KERN_ERR "NET/ROM: nr_write_internal - invalid f=
rame type %d\n", frametype);
>>>                 return;
>>>         }
>>>
>>>         if ((skb =3D alloc_skb(len, GFP_ATOMIC)) =3D=3D NULL)
>>>                 return;
>>>
>>>         /*
>>>          *      Space for AX.25 and NET/ROM network header
>>>          */
>>>         skb_reserve(skb, NR_NETWORK_LEN);
>>>
>>>         dptr =3D skb_put(skb, skb_tailroom(skb));
>>>
>>> This code ends up building a packet structure which is too large.  The =
reason for this is the skb_put() function, which is defined in skbuff.h as:
>>>
>>>         void *skb_put(struct sk_buff *skb, unsigned int len);
>>>
>>> The skb_tailroom of the struct at this point when it's used in the skb_=
put is 241 (256 minus the NR_NETWORK_LEN of 15 which was taken by the skb_r=
eserve).  By using the tailroom of the struct as the length of the data, we=
 are effectively telling it that the data part of the skbuff should be equa=
l to the tailroom.
>>>
>>> The following patch will make the skb_put use len as the length of the =
data we want in the packet.
>>>
>>> --- linux/net/netrom/nr_subr.c.orig     2023-04-19 19:50:03.080791821 +=
0100
>>> +++ linux/net/netrom/nr_subr.c  2023-04-19 19:50:22.410995440 +0100
>>> @@ -149,7 +149,7 @@ void nr_write_internal(struct sock *sk,
>>>          */
>>>         skb_reserve(skb, NR_NETWORK_LEN);
>>>
>>> -       dptr =3D skb_put(skb, skb_tailroom(skb));
>>> +       dptr =3D skb_put(skb, len);
>>>
>>>         switch (frametype & 0x0F) {
>>>         case NR_CONNREQ:
>>
>>
>> Hi Simon
>>
>> Can you send an official linux patch to netdev@vger.kernel.org ?
>>
>> We fix similar bugs every day really.
>> With enough time, any hacker can claim a bug is a security one ;)
>>
>> 'The wire' seems limited to L2 domain, which is pretty narrow these days=
, AX25 is essentially dead.
>>
>> Alternatively, I can cook/send the patch, with your 'Signed-off-by: Simo=
n Kapadia <szymon@kapadia.pl>'
>>
>> Thanks.
>>
>>>
>>>
>>> This appears to work correctly; netrom packets are the right size, you =
can happily use an AX25 PACLEN of 60 (which for HF means that transmissions=
 are about 2 seconds and not 10), there are no more truncations, and as a b=
onus no random parts of memory are shared over the network.  I've attached =
two packet captures to this email to support my assertions.  bad_cap.pcap s=
hows a number of bad net/rom packets (including data leakage).  good_cap.pc=
ap shows a net/rom conversation with the patch applied -- no huge packets, =
everything working correctly.
>>>
>>> Since this issue does leak random bits of memory over the network, pote=
ntially including user data, I considered copying it to security@kernel.org=
, but since the bug appears to have been around for a long time (looking at=
 history I think it was introduced in kernel version 2.0 in 1996) it's prob=
ably not urgent, so I'll leave the decision as to whether there's any need =
to treat it as a security issue to you :-)
>>>
>>> Many thanks,
>>>
>>> -simon M0GZP
>>>
>>> --
>>> Simon Kapadia, B.A., M.Sc., C.Eng.
>>> szymon@kapadia.pl | http://kapadia.pl
>>> http://astrophotos.uk/
