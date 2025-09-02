Return-Path: <linux-hams+bounces-614-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1814DB4066A
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 16:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98828173977
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 14:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5A8304BA0;
	Tue,  2 Sep 2025 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uXV6WkRp"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA12FF177
	for <linux-hams@vger.kernel.org>; Tue,  2 Sep 2025 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756822431; cv=none; b=R/DmMXLZ3+UdOyG4ZiBRfpMS5dYmUqihQ5qb9ktlwrSP/HTT9/PAGPWzA1RlTQJHQpq/jkTKYNRFIGni0MCnq+MOKAlK43A4Mu7wTNWGEHwjsL+iC48+MI2E4PIJlNKPY21SGroCGvbnraX5qCj7IEgL8/GwyIOLwAjbZCxkXQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756822431; c=relaxed/simple;
	bh=kw25kwG5juinLcviM33uV5OduOQnXZC8Hbmi59w20uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBpT4BK9hvaMvAUSD1Q0GFMdbfwFk8VbP1oU5X/uTwbNy0dT8TOg+4z05QkjnII7bedcuE+XgjZDsqD8QpyeefV6/ttrb0OwcNGEafWvVXA8B3dM2FQsJvfRoIr86YQ8Yg5+I7JGN5r/+d8h9a+2t7o3V66ZvOkPXolE9YaMmQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uXV6WkRp; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b3289ed834so27186541cf.1
        for <linux-hams@vger.kernel.org>; Tue, 02 Sep 2025 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756822428; x=1757427228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++yAPNqTPkyFr5q1wxsfUrcYCQ8IFbMj37oJ5TVn3Gk=;
        b=uXV6WkRprO+3dmdVA9DPMLTu4d9h0JQdqj11NXeK5Ol/JuvfPridtxueNLV80Qyfbp
         slFOFY6T/8st3EUwf9KFmeWxIEm36Wocp5/PslBPZtT5KJYRC2xN1X99SX6K+dtdPwS3
         btyZApy8uPCzk5GIuoWaMV+ROkGIzOy8EkRExQF9ZTZ8PoOL6NZB3fXr/K+9sBdWD00U
         THQXZvkeMHe3jSmN0vsQtICF9vZCrauaT1bbGDllBiquzXp3P5QoLuhYYUddO5jRCMBK
         MHIgouYAFmTi5xToRvfUScG5Wf5b3mgTMYUFizz53sFoYFNWD0u911W4+WeQOnuBRsUi
         Kh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822428; x=1757427228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++yAPNqTPkyFr5q1wxsfUrcYCQ8IFbMj37oJ5TVn3Gk=;
        b=uBHVMQSXq9odIAcHIPYjkE1ESqf42U3buKTmjKDL9vFmpMBRlSX00m1Tsg6KHA4isi
         WJLceUx2GKMCd+tVgUOQ9N9ure1d7s4gDI3pxMuLLj9hxn33ImLpi+ocnyU+WCTvsw6T
         zTzSkotO3yxV6aJOKMHa/PHAb7TwNzs1mc1eaNjgoLqQTtL+F9/1f2pPQgTimH+Bl9km
         1EM8nBdxVllf7UsBEvA31Uj9F8lGOtNS9BJU5dbqaA3lfl6vfetq+GA2uWBzHpugkztU
         4/wT22gBg4KOch7e1Pm+sLpq7y7nJK5m9abnKApKjXdMnNAK21mlyCdFcvHdVoYieZAm
         us4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKU+/vjxvf/TuJ90EIK+dioSZr24ywXrl4Q7/D2fl578Aa5WeQ6zNNR1k+arfT/Sk4jlTxV0JDUrfo@vger.kernel.org
X-Gm-Message-State: AOJu0YziAvL0HPF7pbLjPnOZUQPY+rS5T5lLn4B19uZ6PVk9veNBixj0
	/WS0u6mv1aLL0Ida/aWs6vqTQ4JQh/qlRXozjusvEkITnm2HWXYRFsXDkqCdYPdScahYyVv47Qt
	C97iG3gtXAik4X6juEmluYmQTYFoep7ME035nqhc1
X-Gm-Gg: ASbGncuazan7upe52LNyFQ/EOmQqopfL5aMWtLxZvlQXlex26lIYYIVEjxj8K0yxNGA
	QZ5Eu+ITjv82U4iEeZ68qFjAKRZNtME6kS725S58dntkm/DjicS042unq31KsFG1kb7Kt7xdS57
	8qT9BrHxI0hkNc232ZBKs3OgnU84AahXCEqr7weG7FuniuHWSbJOCb3WTTQxeTiDE1P9AshwqJ2
	GDOUCZ+FVC4/rVscIJtMzhe
X-Google-Smtp-Source: AGHT+IECB/V2dpALueegwIuVq0SFNzzaQjigQlrhCrBNw8v8jUQqop8FFS1zW+wdLIIHCzy3bpQVo1DL4zM1CpZUiaA=
X-Received: by 2002:ac8:5d54:0:b0:4b0:883b:f031 with SMTP id
 d75a77b69052e-4b31da239edmr121095491cf.49.1756822427084; Tue, 02 Sep 2025
 07:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902124642.212705-1-edumazet@google.com> <CAEoi9W7ni8r6yZY6okZb3JHLHHbvXOtJmB9VXurykx0Nuio0LQ@mail.gmail.com>
In-Reply-To: <CAEoi9W7ni8r6yZY6okZb3JHLHHbvXOtJmB9VXurykx0Nuio0LQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Sep 2025 07:13:36 -0700
X-Gm-Features: Ac12FXzARHz7nm7kFxNmQq6WqbnA1D-O6jJK5bzER-VgPuyITsa06RsZScApjqI
Message-ID: <CANn89iJjRPnAvVQebv3V5H=b5+aaL=rTBrSiB6-TR-UcXks2TQ@mail.gmail.com>
Subject: Re: [PATCH net] ax25: properly unshare skbs in ax25_kiss_rcv()
To: Dan Cross <crossd@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com, Bernard Pidoux <f6bvp@free.fr>, Joerg Reuter <jreuter@yaina.de>, 
	linux-hams@vger.kernel.org, David Ranch <dranch@trinnet.net>, 
	Folkert van Heusden <folkert@vanheusden.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 5:51=E2=80=AFAM Dan Cross <crossd@gmail.com> wrote:
>
> On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Eric Dumazet <edumazet@google.com>=
 wrote:
> > Bernard Pidoux reported a regression apparently caused by commit
> > c353e8983e0d ("net: introduce per netns packet chains").
> >
> > skb->dev becomes NULL and we crash in __netif_receive_skb_core().
> >
> > Before above commit, different kind of bugs or corruptions could happen
> > without a major crash.
> >
> > But the root cause is that ax25_kiss_rcv() can queue/mangle input skb
> > without checking if this skb is shared or not.
> >
> > Many thanks to Bernard Pidoux for his help, diagnosis and tests.
> >
> > We had a similar issue years ago fixed with commit 7aaed57c5c28
> > ("phonet: properly unshare skbs in phonet_rcv()").
>
> Please mention the analysis done here in the change description:
> https://lore.kernel.org/linux-hams/CAEoi9W4FGoEv+2FUKs7zc=3DXoLuwhhLY8f8t=
_xQ6MgTJyzQPxXA@mail.gmail.com/#R
>

I was not aware of all the long past discussions.

No need for me to respin this patch, there is the Closes: tag for this purp=
ose.

Whoever wants to find all the details can follow it.

For this changelog, I basically copy/pasted my phonet change,
as it included all the relevant information for this old bug.

Thank you.

> Reviewed-by: Dan Cross <crossd@gmail.com>
>
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Reported-by: Bernard Pidoux <f6bvp@free.fr>
> > Closes: https://lore.kernel.org/netdev/1713f383-c538-4918-bc64-13b3288c=
d542@free.fr/
> > Tested-by: Bernard Pidoux <f6bvp@free.fr>
> > Signed-off-by: Eric Dumazet <edumazet@google.com>
> > Cc: Joerg Reuter <jreuter@yaina.de>
> > Cc: linux-hams@vger.kernel.org
> > Cc: David Ranch <dranch@trinnet.net>
> > Cc: Dan Cross <crossd@gmail.com>
> > Cc: Folkert van Heusden <folkert@vanheusden.com>
> > ---
> >  net/ax25/ax25_in.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
> > index 1cac25aca637..f2d66af86359 100644
> > --- a/net/ax25/ax25_in.c
> > +++ b/net/ax25/ax25_in.c
> > @@ -433,6 +433,10 @@ static int ax25_rcv(struct sk_buff *skb, struct ne=
t_device *dev,
> >  int ax25_kiss_rcv(struct sk_buff *skb, struct net_device *dev,
> >                   struct packet_type *ptype, struct net_device *orig_de=
v)
> >  {
> > +       skb =3D skb_share_check(skb, GFP_ATOMIC);
> > +       if (!skb)
> > +               return NET_RX_DROP;
> > +
> >         skb_orphan(skb);
> >
> >         if (!net_eq(dev_net(dev), &init_net)) {
> > --
> > 2.51.0.318.gd7df087d1a-goog
> >

