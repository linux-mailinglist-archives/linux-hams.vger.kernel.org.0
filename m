Return-Path: <linux-hams+bounces-602-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B64B3E22B
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 14:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5890416DF03
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 12:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77FD25783E;
	Mon,  1 Sep 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rfndXf+t"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C301FC7C5
	for <linux-hams@vger.kernel.org>; Mon,  1 Sep 2025 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756728281; cv=none; b=DB1agdiqCbLLk6fvP4veQp4AnQnJrYttEMK9LkerlkzfCcvVCDgJjFVPFYKNB7fVNvg4+f4Q7twYPtd9gkp5R681CGEeCbZLOhTFGl5Aizf2r07XSb4zsPoHtiZn4AVOOF3+67fJ7RZUexxO4R2wMM1qS8p1cY44zmEqdXYl5pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756728281; c=relaxed/simple;
	bh=ZAL4JSbuGN7clEILizrJP1aCe+7lS+wzK3j/u4WwUm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOMf+E3Zetb7WxH+J8vhuyvJXkBbZs+f/TCJdmbisxEQzRO0zY/XTGPBNpOrVSzu8gvsJgO51WavevBPiqzV+Wksa5TskwWrN2kmLNz4qESiFhyYq50w4/zARXe03NzoaMci19aoeefmn1fWAZiHPF5dwfh3CKER+VTmmyDumKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rfndXf+t; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b34066b52eso397101cf.0
        for <linux-hams@vger.kernel.org>; Mon, 01 Sep 2025 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756728279; x=1757333079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0m5TaZOBG6hNhsJncSaSdhQCERlDKCkltKeD46o2PQ=;
        b=rfndXf+t9tuwllloodMfUS+XSqC/D1Deu4jtXhNV6CqJy7aToaVt7DyE7K9qrnHSeT
         QXc+6POhdlVuaCaEHLolCbfwrR6zshz2ZxkLrulbbZoPgnl+JsRIrkr8aLB7UtCgrebK
         hh4k8Id8TqE1CmwWsuNuQtzGt/F457Gz4qILkaQ9h+yN6g3dGtwY9cNlhH9qji5ZZu0j
         9dFVFKlUBygbNnjSp+GU/NYettnNP3N/cd40c8RP11D9Yq7hHx25RueW5+op2mWZ7/2x
         yLXW93RoeaYwOgGUTa+x9oYC/ym58ai+4FaJGapevbvb6SV02CK09PPHzP2gz+MsRU77
         xJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756728279; x=1757333079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0m5TaZOBG6hNhsJncSaSdhQCERlDKCkltKeD46o2PQ=;
        b=NWtcBEHEHrMC0fecqahUvpRjHZuEpE0AD08iq2tEb8RvzTGyaq7mGNmVd3Z34YCAOF
         zXVe1lKVMNxBMU+LQZhJ9+bRvqEnkPhOe0LF0bifsYq2rWoAzZ642EbSyr5q6IyG6f+/
         sasVP6x4iy8aE6JuNRG9NNeZ/Pw2+kwpXCYkmLk1dxtXbrCucp1ifj4nTIwng4sBjEd7
         VWml1qcArjmfPvIfNr7e8Dwpqz0XMPtldxkfqZQ6jxNdJbZDDXJ2FfOJt0dud9fwaWZy
         wXaKe6pV+mviNuUiZizVauvx1+3auP1kjq9PsVLPL3Rv17XFKrVkAN2dp0xzYLkcHq/M
         VmSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfOLRqxxlja0CcvRXs2iS79QWykF4skTffg38lP4nYnD1LjYME0ttlGPPb/UEDJRD2adrOz3VFOwC/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ExPRszeRMuqpPb6beBjOkPTKzXb6RoBZ6liO4epQSfVCRCW3
	YiyZY04/tQbdLMHNY92P3wZwaHRwMLZVCq9a3w5be4illRYDRoFL3yuiQHhItiaCe/s5BbJVLZP
	0kCKqf/CHJzENYR0/9T2whbrHL5o7uIJxNLGOpZwx
X-Gm-Gg: ASbGncs0jDaAknw4iQ6smSNWNlJDa+q2CXxBmfGf6nBsshNHbIikj4p+04e9ex2yXr0
	wl9EHsGCij+xpfvPaakaxqISdL2noAVOP/tfIuhqWBzk1jJdA6Evad4B4uFX9j+tfHUufBLvi2D
	0JqdzXYmYwxcoPMTG6UeNc56VmorL0a7mpHbGCN5NswW4UiZZZEn6NW2OVIL5+Cq2YV7r9Cx7wJ
	K8qOooS9jHgIRqywA92hWzE
X-Google-Smtp-Source: AGHT+IFQF2pH058NqXIJm35jHW/FV+ZbPWM4pad9Vni511iB/p+Jgp3wZotzA1KYXw2Im6cNyRI4hVMlqoIhjqERFC8=
X-Received: by 2002:a05:622a:428a:b0:4b3:12f7:8bb5 with SMTP id
 d75a77b69052e-4b31da3aa09mr78397721cf.49.1756728278740; Mon, 01 Sep 2025
 05:04:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr> <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr> <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
 <d073ac34a39c02287be6d67622229a1e@vanheusden.com> <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>
 <aKxZy7XVRhYiHu7c@stanley.mountain> <0c694353-2904-40c2-bf65-181fe4841ea0@free.fr>
 <CANn89iJ6QYYXhzuF1Z3nUP=7+u_-GhKmCbBb4yr15q-it4rrUA@mail.gmail.com>
 <4542b595-2398-4219-b643-4eda70a487f3@free.fr> <aK9AuSkhr37VnRQS@strlen.de>
 <eb979954-b43c-4e3d-8830-10ac0952e606@free.fr> <1713f383-c538-4918-bc64-13b3288cd542@free.fr>
In-Reply-To: <1713f383-c538-4918-bc64-13b3288cd542@free.fr>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 1 Sep 2025 05:04:27 -0700
X-Gm-Features: Ac12FXzOGcBqZHVXsh5dWbI3sjavR7rzJbdiLYMYiBL3jHSlObbZv5DJMOh4aMM
Message-ID: <CANn89i+Me3hgy05EK8sSCNkH1Wj5f49rv_UvgFNuFwPf4otu7w@mail.gmail.com>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: F6BVP <f6bvp@free.fr>
Cc: Paolo Abeni <pabeni@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>, 
	Dan Cross <crossd@gmail.com>, David Ranch <dranch@trinnet.net>, 
	Folkert van Heusden <folkert@vanheusden.com>, Florian Westphal <fw@strlen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 4:37=E2=80=AFPM F6BVP <f6bvp@free.fr> wrote:
>
> Here is a bad commit report by git bisect and the corresponding decoded
> stack trace of kernel panic triggered when mkiss receives AX25 packet.
>
> All kernels following 6.14.11, i.e. starting with 6.15.1 until net-next
> are affected by the issue.
>
> I would be pleased to check any patch correcting the issue.
>

Thanks for the report.

At some point we will have to remove ax25, this has been quite broken
for a long time.

Please try :

diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
index 1cac25aca637..f2d66af86359 100644
--- a/net/ax25/ax25_in.c
+++ b/net/ax25/ax25_in.c
@@ -433,6 +433,10 @@ static int ax25_rcv(struct sk_buff *skb, struct
net_device *dev,
 int ax25_kiss_rcv(struct sk_buff *skb, struct net_device *dev,
                  struct packet_type *ptype, struct net_device *orig_dev)
 {
+       skb =3D skb_share_check(skb, GFP_ATOMIC);
+       if (!skb)
+               return NET_RX_DROP;
+
        skb_orphan(skb);

        if (!net_eq(dev_net(dev), &init_net)) {

