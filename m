Return-Path: <linux-hams+bounces-24-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A3182A660
	for <lists+linux-hams@lfdr.de>; Thu, 11 Jan 2024 04:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9963EB278E2
	for <lists+linux-hams@lfdr.de>; Thu, 11 Jan 2024 03:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4BD23D1;
	Thu, 11 Jan 2024 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPpQ03O7"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF81A1856;
	Thu, 11 Jan 2024 03:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-67fa018c116so25839196d6.3;
        Wed, 10 Jan 2024 19:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704942671; x=1705547471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nc3ktMNNFa2cWnkCDEWGuayvZvC4OkexR8gSuH0qQO0=;
        b=fPpQ03O7WPkpBLWPvX8nzWPKCKuLIn87kiqJ/aHLPKhBUR0gv3Fdn4xWg/X3lk3K6+
         iX+aEBJHFR9VC35npPDeZOhLyhhEkQLs+APWzaNVvT2q9ou5fD9B0rEscsa7GWc9/KWb
         lfAT702W36ONh8Oe2u4Bx/KeMKntCjehQ8L73pLKjhTrx+rRhFTbsVGJIIFuuJ++iz/b
         KxVuKu7O1UDSFfEyGmzNsnZXsx+3EnzTTKe8IWawFwiqNLqHMA8Srwhta35Gfy+Mw4VE
         dS7KlfI+1+yTF3tN7oOESfqGdxPblTR31zT0AKyYFkeCXsTtSsAbKDqSlLljpv8Upu69
         Jerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704942671; x=1705547471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nc3ktMNNFa2cWnkCDEWGuayvZvC4OkexR8gSuH0qQO0=;
        b=B7B4IkrGWx00oCibGVFYb+2vONBWvJ1+rdhPR510SgkJnm5OsRr5hj+qWS69ITBuve
         CxOUH4JyDdOfLHaVWrdOzPJDFODN40OV5TrT8NVpIz+IO9sbk9wr7uMeRodoZA4CBUGt
         Eoyex5LX0moy5znpEiJm+gk3hdJWtwDTLjACQjo7RWe4bKH05cpu2kbfQcxshx+Wrs1R
         BbPV29Aga9PAMNOH7koK5IvHhkZsN2+C1z2H5tT4gMO9j0tG2dRKomoo9NG4nDSFYbbP
         jO8ciuUlX23dm9xwMAWNn2A8HwFiqDQIvQxCPOfdHGaM9iJvx5YryZjoeWMLuAi+kANj
         Yt3g==
X-Gm-Message-State: AOJu0YwWwdw3DM8ZhGQmH56WROwjsR2mv/YVp9y8QtoLnGwCRFTYzNlE
	6OsDfppByu910jN3wnNQCg==
X-Google-Smtp-Source: AGHT+IGQ5DriceuDeh/UwLFRuSfHpV/E7Nn3LkhcKbwyRjvnQV+zDNHYPBoCTS4ZWi4TBtHh4HCd0Q==
X-Received: by 2002:a0c:ab17:0:b0:681:30e5:1c5a with SMTP id h23-20020a0cab17000000b0068130e51c5amr253946qvb.110.1704942671588;
        Wed, 10 Jan 2024 19:11:11 -0800 (PST)
Received: from ?IPV6:2600:1700:edc:4810:7a2a:2a9e:8cfc:b9f7? ([2600:1700:edc:4810:7a2a:2a9e:8cfc:b9f7])
        by smtp.gmail.com with ESMTPSA id c6-20020a05620a200600b0078314a8190dsm57455qka.25.2024.01.10.19.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 19:11:11 -0800 (PST)
Message-ID: <95dc4923-9796-4007-b132-599555ed9eab@gmail.com>
Date: Wed, 10 Jan 2024 21:11:09 -0600
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 6/7] MAINTAINERS: mark ax25 as Orphan
Content-Language: en-US
To: Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, Ralf Baechle <ralf@linux-mips.org>,
 linux-hams@vger.kernel.org
References: <20240109164517.3063131-1-kuba@kernel.org>
 <20240109164517.3063131-7-kuba@kernel.org> <20240110152200.GE9296@kernel.org>
From: Eric Johnson <micromashor@gmail.com>
In-Reply-To: <20240110152200.GE9296@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed 10 Jan 2024 09:22 -0600, Simon Horman wrote:
> On Tue, Jan 09, 2024 at 08:45:16AM -0800, Jakub Kicinski wrote:
>> We haven't heard from Ralf for two years, according to lore.
>> We get a constant stream of "fixes" to ax25 from people using
>> code analysis tools. Nobody is reviewing those, let's reflect
>> this reality in MAINTAINERS.
>>
>> Subsystem AX.25 NETWORK LAYER
>>   Changes 9 / 59 (15%)
>>   (No activity)
>>   Top reviewers:
>>     [2]: mkl@pengutronix.de
>>     [2]: edumazet@google.com
>>     [2]: stefan@datenfreihafen.org
>>   INACTIVE MAINTAINER Ralf Baechle <ralf@linux-mips.org>
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Reviewed-by: Simon Horman <horms@kernel.org>
>
>
I didn't realize this wasn't actively being maintained, but I am
familiar with the code in the AX.25 layer. I use it pretty frequently,
so I would happily look after this if nobody else is interested.


