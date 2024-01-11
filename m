Return-Path: <linux-hams+bounces-25-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 130BF82A67D
	for <lists+linux-hams@lfdr.de>; Thu, 11 Jan 2024 04:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B444C28381F
	for <lists+linux-hams@lfdr.de>; Thu, 11 Jan 2024 03:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76589EC9;
	Thu, 11 Jan 2024 03:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4gzuFQu"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA2CEBC;
	Thu, 11 Jan 2024 03:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbed7c0744cso3676191276.2;
        Wed, 10 Jan 2024 19:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704943881; x=1705548681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNnByNcgQPfFPOxqB3lBXoYDFUvarYkS/yPoMk3sYQo=;
        b=P4gzuFQuGRFyLddjmS/MokHUGDdncNumYTpddRRutg7KXneY67/3Ymo2dcaDsKC87s
         hr2Ra6gXpnEcNyxpKxYFMWiFEHXx0ufiMeZm72hMkWj+liwtBQTWcXv1Hm8VHDluEtxN
         2yxoJJ3Q3KHOlzR5kp/QXIFHJD/fRZVYFSHw9ONzZfadk+z6JyTqemMzl1BIIeHf5wCA
         CbmeMLg6NzDx68r31p9C0IBrXpTza+ooDQTkvZIsGUXDIV8HqgCoHxNI3FB8Hh7OHW3U
         IlXtyqfKycqoeCJ4sPlYD/nGPYuzmgJF0hvQ3pFxSF8G+EgFPOFHHVTgb8L0zsm3ENUY
         LCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704943881; x=1705548681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNnByNcgQPfFPOxqB3lBXoYDFUvarYkS/yPoMk3sYQo=;
        b=b2aBk0UL02BI3Jw/5r63yug/EFXCf6bl1b8z9J4auLWIgoYrchK26HLptUTXgyUm1u
         P/7rdRzwSNNMy3Fyx+pCA1PyuDLIWHraLsYcFtMYNDKEvRNn+TpkI/4Ii1xxoL7qNhSp
         0CeD+X1z9qwIg2e5ilzmxUbgaqotNSwDTn16Ex+dk8HevHhkbGCUEriaRqieAhyCxQLK
         izS7HGjaBHUW+ejoS17zk9YGqQhlCpTvY8165N7DTf1Tn4jN0i0kGyiWDygYPA1pN7ne
         TvYmjELlFewf5QbWU1wKK7kujBS5Jo0jejdWzsAgcRHKhFtUy9vuAVlC6LNgEikD3DuQ
         G8gA==
X-Gm-Message-State: AOJu0YyzPdsOQA/HveYW7mm4gtvbeMP0LIccbK3rHf2vVP/hitDmgOcz
	wODS9/pYWM+JW6riWIWRxTt5Wp7J6eva4Y8rPddmQ8auCglqmw==
X-Google-Smtp-Source: AGHT+IHIH0spOMu6GkyhJG6LMzIhg68MudRGXT3EzyBopfE01E34x+JyOWm2Z2j1vf8za5YOHeiig3efsJQmceUbpm0=
X-Received: by 2002:a05:6902:1022:b0:dbe:ac2c:8818 with SMTP id
 x2-20020a056902102200b00dbeac2c8818mr584284ybt.109.1704943881494; Wed, 10 Jan
 2024 19:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109164517.3063131-1-kuba@kernel.org> <20240109164517.3063131-7-kuba@kernel.org>
 <20240110152200.GE9296@kernel.org> <95dc4923-9796-4007-b132-599555ed9eab@gmail.com>
 <CAG9xq4Efi9O4LbJj7kYjne1EjPJ9BkWiuNy_QxYTHW9eyGz5bg@mail.gmail.com>
In-Reply-To: <CAG9xq4Efi9O4LbJj7kYjne1EjPJ9BkWiuNy_QxYTHW9eyGz5bg@mail.gmail.com>
From: Michael <mikecress@gmail.com>
Date: Wed, 10 Jan 2024 22:31:28 -0500
Message-ID: <CAG9xq4FuqWv3bH4iTT+EMWUksNu_gbkF5n5dh6CGRt90HnGgEQ@mail.gmail.com>
Subject: Re: [PATCH net 6/7] MAINTAINERS: mark ax25 as Orphan
To: Eric Johnson <micromashor@gmail.com>
Cc: Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, 
	Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't recall how I got on the list, so I don't know where to go to
find the source and bug tracker. Can someone point me to the official
pages?


On Wed, Jan 10, 2024 at 10:19=E2=80=AFPM Michael <mikecress@gmail.com> wrot=
e:
>
> I don't recall how I got on the list, so I don't know where to go to find=
 the source and bug tracker. Can someone point me in the right direction?
>
> On Wed, Jan 10, 2024 at 10:11=E2=80=AFPM Eric Johnson <micromashor@gmail.=
com> wrote:
>>
>> On Wed 10 Jan 2024 09:22 -0600, Simon Horman wrote:
>> > On Tue, Jan 09, 2024 at 08:45:16AM -0800, Jakub Kicinski wrote:
>> >> We haven't heard from Ralf for two years, according to lore.
>> >> We get a constant stream of "fixes" to ax25 from people using
>> >> code analysis tools. Nobody is reviewing those, let's reflect
>> >> this reality in MAINTAINERS.
>> >>
>> >> Subsystem AX.25 NETWORK LAYER
>> >>   Changes 9 / 59 (15%)
>> >>   (No activity)
>> >>   Top reviewers:
>> >>     [2]: mkl@pengutronix.de
>> >>     [2]: edumazet@google.com
>> >>     [2]: stefan@datenfreihafen.org
>> >>   INACTIVE MAINTAINER Ralf Baechle <ralf@linux-mips.org>
>> >>
>> >> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> > Reviewed-by: Simon Horman <horms@kernel.org>
>> >
>> >
>> I didn't realize this wasn't actively being maintained, but I am
>> familiar with the code in the AX.25 layer. I use it pretty frequently,
>> so I would happily look after this if nobody else is interested.
>>
>>

