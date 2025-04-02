Return-Path: <linux-hams+bounces-508-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 030ADA79731
	for <lists+linux-hams@lfdr.de>; Wed,  2 Apr 2025 23:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFDF6171126
	for <lists+linux-hams@lfdr.de>; Wed,  2 Apr 2025 21:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAA31F0E32;
	Wed,  2 Apr 2025 21:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PZ2dfBED"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDE619ABB6
	for <linux-hams@vger.kernel.org>; Wed,  2 Apr 2025 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628100; cv=none; b=cWEOgFPf8PS2iN9GhFIIL50DVyEBWjMhEcBqCflmUXesNDhOBelfkdoFrYVLXy1OUQstKm2LlnLJHdS75CkJNHNa08iFcN+2MTg0m/yhSc6DNN8J6miLwxeLKtlbP4c4iqpPH8iLoCBK7VQlEnbv5IRUzClbLccBEntVfcukESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628100; c=relaxed/simple;
	bh=yMtg/5bd9WuFFPh1QUVVbVzPyQ8PxgEFM//QPDYEqaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuXPKECgUog3JfRedG8a9zLlYGZYw2lEF6jWgyB6O0fIdws6eHz42jiJ4CaWHGHDlwL2x2dsQ6iI0g415WckJ82BpOa8tetohVV4cQ5mi2tFNaHdwQUJTwcz0PjnbPurcD+E/BcbB9B8G0XkyeQvjMQ2aIjNruhKKiYoGoDiQDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PZ2dfBED; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2963dc379so31204366b.2
        for <linux-hams@vger.kernel.org>; Wed, 02 Apr 2025 14:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743628096; x=1744232896; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6vOkaWbZeGW9ejcyKHqKRgGRaPzQmhuks1cZQp6R9ag=;
        b=PZ2dfBEDSck9VKSWPWTpyfpqoVFmN9XU6hKCXXHIS5GaHyrQIXt6QOKBdZSmH/W9MP
         zG/uOyzis9tHc2WOP4wa6aTbLKywO9drOR+qxe65Av9oK2A/SYdFOV/pxHLcsP4VbkDj
         ST0IwuZQtlriUdyqet7fcyD9JD2INx+AKlX+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628096; x=1744232896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vOkaWbZeGW9ejcyKHqKRgGRaPzQmhuks1cZQp6R9ag=;
        b=o7RoPMWtsd1MBxkyBG6Fy27yEmzmNgk6/KSmQ28EpO4oYdBRYZ6iwl/DI1KiSlWigC
         nqu+3BxaOduHPFYk4uRSsHd1/sfeg9DiL9vRgTQMihsrhWgJnV+wn7RMh4K4SRO+vJfX
         tqRT7tG9UzFADVz32sFS5k9vgzMao3a4OlYKIG5WmDiHI9N0wD560/ZEpNbjSOhrSRjq
         k82EIrVXsT0juiQRNvv/aB7/82eTAKTcddtkXJHyfBwUzfZEMEgNMKRP7yYB/tV+SH2V
         uU32rKbIGv882V3Lx2nr2A3EsP26kPzgFOR2AQz86UhlNR97rgH6Q/pu/CPh55PKWdrH
         R2Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVCt7EuNk182cAKRwhWImJQhEYFWu3TaxaebF661tR3lSM8/Kt+JkFtWvZCTIcUXRGe82Ax2bGEui1E@vger.kernel.org
X-Gm-Message-State: AOJu0YwE6gCZTLNEqUFA9zzmoq/KOopCoC22oGWoZ8QkyOHunQFUmuMD
	Hicgz5flv+yAePH2DaV2FdJHVIOCk9In2LgM/WKktRsPhHIQcBlN2zw33SdloiDpRW4rqOo6Xa1
	B5ck2AA==
X-Gm-Gg: ASbGncvdm2iLWmz1Tn9KXQxzn9NA2m7IeyMlli9qjZSiiCSEZ1Z+DcJL03U3SKL0FsC
	BH0tJ99riCK8o5Ks7XSNlF+TIyho83h6UY56xVvW5vJ7Mbme3w0Y5zotzGwl0Y0QB/tWPBa6jjY
	9q8x0DoQEEWD7DJTKXbfDg49/No6Upsq7pTCBgMkmz1EyC44CHsKIIuTZ+z6QjXP3GH6T48no1l
	LnGfTYMD3ORz92kKh/rrRoziD+o8fkDIEcvphtFf/9p4Gi7qIH4vuwrapwHPwia0F71gdRR/a8I
	oT3dZzsAXJbcvWUV27ZNm3l0Oa3xYs3kJO081WEYwWKTaiMgN+C5/iC/yVRcEPF7lRXsjhGNVVF
	oNmJZIw2sCUHzk8HCXco=
X-Google-Smtp-Source: AGHT+IEeAsZqtCdlS5C/4VprZADEyV9ID11pKixa+tv1ID5gc6vDVvcmD/eirR07cNeu70mdGvmc/g==
X-Received: by 2002:a17:907:da7:b0:ac7:95ae:747f with SMTP id a640c23a62f3a-ac7bc234475mr17539566b.45.1743628095917;
        Wed, 02 Apr 2025 14:08:15 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922ba6fsm975367366b.19.2025.04.02.14.08.12
        for <linux-hams@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 14:08:14 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac298c8fa50so35616666b.1
        for <linux-hams@vger.kernel.org>; Wed, 02 Apr 2025 14:08:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiXENobqb60Kdzw1IN0wz1MNiE4EHBLQaTG1R+5DPR7sLzdJVychsjjj7++OKD38SxYu58bFZspV87@vger.kernel.org
X-Received: by 2002:a17:907:9409:b0:ac7:970b:8ee5 with SMTP id
 a640c23a62f3a-ac7bc126208mr19593966b.27.1743628091735; Wed, 02 Apr 2025
 14:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-sDc-0qyfPZz9lv@mini-arch> <39515c76-310d-41af-a8b4-a814841449e3@samba.org>
 <407c1a05-24a7-430b-958c-0ca78c467c07@samba.org> <ed2038b1-0331-43d6-ac15-fd7e004ab27e@samba.org>
 <Z+wH1oYOr1dlKeyN@gmail.com> <Z-wKI1rQGSgrsjbl@mini-arch> <0f0f9cfd-77be-4988-8043-0d1bd0d157e7@samba.org>
 <Z-xi7TH83upf-E3q@mini-arch> <4b7ac4e9-6856-4e54-a2ba-15465e9622ac@samba.org>
 <20250402132906.0ceb8985@pumpkin> <Z-1Hgv4ImjWOW8X2@mini-arch> <20250402214638.0b5eed55@pumpkin>
In-Reply-To: <20250402214638.0b5eed55@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 14:07:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7p9bKgZt1E1BWE-NjwSRDBQs=Coviiz0ZTQy9OhHvPg@mail.gmail.com>
X-Gm-Features: AQ5f1JpKVAIlc4pALP5yKNCr8F3ijIqVBIOCCdqoIfNZomenel-ajZbKWJ5EdvE
Message-ID: <CAHk-=wi7p9bKgZt1E1BWE-NjwSRDBQs=Coviiz0ZTQy9OhHvPg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] net/io_uring: pass a kernel pointer via optlen_t
 to proto[_ops].getsockopt()
To: David Laight <david.laight.linux@gmail.com>
Cc: Stanislav Fomichev <stfomichev@gmail.com>, Stefan Metzmacher <metze@samba.org>, 
	Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Karsten Keil <isdn@linux-pingi.de>, Ayush Sawal <ayush.sawal@chelsio.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, David Ahern <dsahern@kernel.org>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Neal Cardwell <ncardwell@google.com>, Joerg Reuter <jreuter@yaina.de>, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Robin van der Gracht <robin@protonic.nl>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Alexandra Winter <wintera@linux.ibm.com>, 
	Thorsten Winkler <twinkler@linux.ibm.com>, James Chapman <jchapman@katalix.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Remi Denis-Courmont <courmisch@gmail.com>, Allison Henderson <allison.henderson@oracle.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Wenjia Zhang <wenjia@linux.ibm.com>, Jan Karcher <jaka@linux.ibm.com>, 
	"D. Wythe" <alibuda@linux.alibaba.com>, Tony Lu <tonylu@linux.alibaba.com>, 
	Wen Gu <guwen@linux.alibaba.com>, Jon Maloy <jmaloy@redhat.com>, 
	Boris Pismenny <borisp@nvidia.com>, John Fastabend <john.fastabend@gmail.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Martin Schiller <ms@dev.tdt.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sctp@vger.kernel.org, linux-hams@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, 
	dccp@vger.kernel.org, linux-wpan@vger.kernel.org, linux-s390@vger.kernel.org, 
	mptcp@lists.linux.dev, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, 
	linux-afs@lists.infradead.org, tipc-discussion@lists.sourceforge.net, 
	virtualization@lists.linux.dev, linux-x25@vger.kernel.org, 
	bpf@vger.kernel.org, isdn4linux@listserv.isdn4linux.de, 
	io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> The problem is that the generic code has to deal with all the 'wild stuff'.
> It is also common to do non-sequential accesses - so iov_iter doesn't match
> at all.
> There also isn't a requirement for scatter-gather.

Note that the generic code has special cases for the simple stuff,
which is all that the sockopt code would need.

Now, that's _particularly_ true for the "single user address range"
thing, where there's a special ITER_UBUF thing.

We don't actually have a "single kernel range" version of that, but
ITER_KVEC is simple to use, and the sockopt code could say "I only
ever look at the first buffer".

It's ok to just not handle all the cases, and you don't *have* to use
the generic "copy_from_iter()" routines if you don't want to.

In fact, I would expect that something like sockopt generally wouldn't
want to use the normal iter copying routines, since those are
basically all geared towards "copy and update the iter".

           Linus

