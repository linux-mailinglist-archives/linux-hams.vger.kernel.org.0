Return-Path: <linux-hams+bounces-624-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DB6B45543
	for <lists+linux-hams@lfdr.de>; Fri,  5 Sep 2025 12:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 542973A39F1
	for <lists+linux-hams@lfdr.de>; Fri,  5 Sep 2025 10:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5593530DD29;
	Fri,  5 Sep 2025 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WYaKJiyi"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809783164B4
	for <linux-hams@vger.kernel.org>; Fri,  5 Sep 2025 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069237; cv=none; b=FdzDe3KJsWC+2yu0XV6uV7VcZaUwWeUibrr+q5pzJxs21tRYvWDaqa9hiSRiOPCzfuirZP9N98CecM4GKnuZFnBOtM0SyWCpHIPvatQlMYFRE/tZg09aNLfqG7SDcLkWDbZsF4SDXXdLiMufB6BMlttEtxVghLvoFag2psUX7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069237; c=relaxed/simple;
	bh=tqiu3s9zFltkSv11AxpsXkUUUkqMUieGxD3BL7JwWec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRYPdjaFHhwUCTKaGzzcjXVbc5oMhmkbnJzD4zihOFslogpzmFqCbX2N9qJLW/iuO8RTHeflRttSLu7HQ6sggwhZUazK3hm5W8jn+ZcP7h1TWePD65dl9f/gyrKLcWgmo2Kt6UDs4SkLMuUZBX08prVuRUHzicsEOUdsEajbgxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WYaKJiyi; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-80e2c527010so105058985a.1
        for <linux-hams@vger.kernel.org>; Fri, 05 Sep 2025 03:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757069234; x=1757674034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy3M+/QDMFTe34OIV0nD0yl53yFOocCSebdPGEJFkD0=;
        b=WYaKJiyimC59PycZD+Wl6RgPGCNG7VhTffk98C//szr3/mhYdc2yP1J4kJGcsCetyQ
         vvCwhkNCkv6am91orhrcgj6yl4ZrjyjrOscI2xnBEO9HnYrxnTGpLma/VJqKGF52BLSA
         usEdJDTV8nHIU9bk6LzpAOUWMUztse7/SQaOHUT+ic3xjE3bJxkhUlh3UI6Ugeeiwi3w
         IC816SC8yC1QhfgtKs6WWiBJ2pI+N4BKPIv6UWeEsQxgfbTDZZh0N3ULBKxrWpmI7FSk
         vdxJpwGXIYz+D9oTUeq6YHgtoRuqb8UwFAd5mPryJ41W7CnWw47hfQiTzsjQitVjq8D6
         tbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069234; x=1757674034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zy3M+/QDMFTe34OIV0nD0yl53yFOocCSebdPGEJFkD0=;
        b=uvrJRc7CSVClVT/e0MkkytZFcMrO2V3Z4SpVY+SLiQ5mkkAWoKtsWdpqo1A2qYW4GS
         GcDFFz4znCkE/Q+2OwyLh4tiM7JdbJO6hSWvChhJnK4M+aPPymtj3MqGJlI7J+Lg4wr1
         f8B2s4qScW4RPVY7yz/Bmkfs5NqOZWkOW35MaW0c53yZ3dEzFrgnr/sCAt+VMCzvjCZp
         zpv+Bo3oawHTVu2yP0rdbsKlgmz1Zz/7+E3WsD46UjwjQf3JbzRXWp4LhMsYilOyw2wR
         Uc959qSdKvrBSpBZvJmisCYqBkFcvEnt3WCRLM3qvR8IMGa8GPPeXmUfB60FsSkw+Vrw
         Q4hg==
X-Forwarded-Encrypted: i=1; AJvYcCUKx4Yd69Ee/E/XgVHuoe4XghoGXCaCs6Ffn1Nr4DN+poHLlQSGbXGjw90fbR9kmMjvmaS6QptbJsRq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+sdICb18Bto1q4JeiJcQkjn6R47hhXdbbh/qgRelo55rpWuGX
	Sue+AV85K7rPo4TJ1KAZ2/s6MflN4r08LUItl1s5VamK8TxmbbtHnrWVB/4ZgMN8MYUR3YQamic
	gp7odutWsH1A/8WZrFc/M1vbeIs9HYillhSkTwVY6
X-Gm-Gg: ASbGncuaXckxoRcZ/MJ1ZtTiae7iGROQF2ZvYQfcD6AyPEkHbEVD5pSBWUDFTu+LCDW
	72EfPH4fzieNcjYq0HsaQP2CmA0g6NGzxwF2NxZtFJRwA4Lf4qK5rRRR3YGhGXlnYNtwv6Cc2nS
	ZJ8ClyZWsOtZpbGpZPuyrl8/iFI0jcDVjyU1L8sLVzs5LEfFAVg8401/8Fl2/OR8PQRRl+ZFw8J
	RA141jc+cA/b/Z0RcJBg87t
X-Google-Smtp-Source: AGHT+IEf/phnrXIkufCTZk4sFshrIxsZkHhdjyS4/aEGRW+A2spzOP7s35tJPyhD8Xp2ObBAoTmD8NeiPLucXfyQr3w=
X-Received: by 2002:a05:620a:4016:b0:7e7:fe1e:80ce with SMTP id
 af79cd13be357-7ff27b20314mr2475069885a.19.1757069233923; Fri, 05 Sep 2025
 03:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902112652.26293-1-disclosure@aisle.com> <20250903181915.6359-1-disclosure@aisle.com>
In-Reply-To: <20250903181915.6359-1-disclosure@aisle.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 5 Sep 2025 03:47:02 -0700
X-Gm-Features: Ac12FXzy0Cy-WdhGEnYslQBiaE0zk7uzikMaUzSMrpzivq_gHWsb4MyLhAXuOfI
Message-ID: <CANn89iJKZCfsNzM8D=JQqQ=vyaun38oXfcC77AC6BTC0MWvUog@mail.gmail.com>
Subject: Re: [PATCH net v3] netrom: linearize and validate lengths in nr_rx_frame()
To: Stanislav Fort <stanislav.fort@aisle.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org, 
	Stanislav Fort <disclosure@aisle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 11:19=E2=80=AFAM Stanislav Fort <stanislav.fort@aisl=
e.com> wrote:
>
> Linearize skb and add targeted length checks in nr_rx_frame() to avoid ou=
t-of-bounds reads and potential use-after-free when processing malformed NE=
T/ROM frames.
>
> - Linearize skb and require at least NR_NETWORK_LEN + NR_TRANSPORT_LEN (2=
0 bytes) before reading network/transport fields.
> - For existing sockets path, ensure NR_CONNACK includes the window byte (=
>=3D 21 bytes).
> - For CONNREQ handling, ensure window (byte 20) and user address (bytes 2=
1-27) are present (>=3D 28 bytes).
> - Maintain existing BPQ extension handling:
>   - NR_CONNACK len =3D=3D 22 implies 1 extra byte (TTL)
>   - NR_CONNREQ len =3D=3D 37 implies 2 extra bytes (timeout)
>
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Reported-by: Stanislav Fort <disclosure@aisle.com>
> Signed-off-by: Stanislav Fort <disclosure@aisle.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>

