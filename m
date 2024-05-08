Return-Path: <linux-hams+bounces-254-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B318E8BF985
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 11:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686C31F23C47
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 09:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FB874BF5;
	Wed,  8 May 2024 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jIBlJr22"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021FD71753
	for <linux-hams@vger.kernel.org>; Wed,  8 May 2024 09:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715160426; cv=none; b=HfL+8sE2vIecOfghO1HyTEfsxGWITAEsYX8wNnBLUjx6bg29CfUtyqD2WTHwE7dC6khHFzm/EpM0lsennbWwO5ucBGmMU062lAJ+9+woqG5ku2df9913DTGERpyUTGAAx0MdeaKblEP9Ta+vcNmKo0b7pDOE6ELi78fO23ALpMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715160426; c=relaxed/simple;
	bh=I7pv7f+ut7mmoHRh+e6d5bAbNnkXRbwl9zeRm1pjhLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ld99zl9yyYbma07K1mYkFDfKx+G6w+Rtp0IfQ1Zod/OcBHtBAEF+J+6SgEDJfKDT09QVvsOBRzWuFTp+q1XUGPrmu2UkFUo94TSJhumifJs8M9ZoObOychxUSzWRSLQf85oI6VPEI/io4INeZGsHlGIeBWjbsNBoLDglP+stBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jIBlJr22; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59b81d087aso905045866b.3
        for <linux-hams@vger.kernel.org>; Wed, 08 May 2024 02:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715160423; x=1715765223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=emAqUnKczWRRhzY+RTuEKbwoWep7QqES9D2//iEyQ5I=;
        b=jIBlJr22q8KBi/0X6Xm2oBednW2z3IAZM+k2O1S2LMi9hNmL9Ranx2PBRQqjmX6Ctn
         CThy4ee4Yr6NBrb0zdm6y5wtS1wpza6F8VLX8wN7bzLm3xryCidu9M5ycgrmkqnP49CK
         YDJEG8/kQxcBzrw3qLecwaB+piy1XaJ+vxVWAVO2SpLIYp/nGyL8JRqfzWIRwoiiFG94
         3BeNfiL5ydsMYg84jTTPKw1rGq96QYAZc1mfZSRFILh9I/G6oni49PneVe+q6M5mCg0D
         iz4MelbcJfD8yNEKoPq+Q6PcKeU4NQ0U9BgKNhq5xdnbdrFGHdfXHeZRE2LdI5ujAbVz
         SIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715160423; x=1715765223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emAqUnKczWRRhzY+RTuEKbwoWep7QqES9D2//iEyQ5I=;
        b=gQp2kNKfM5TuQfY6yJPEA/aut6yPZ8v+IVjA0GJR6ljpuNxivjJgCxvXTXkqJO6ueL
         3/ZAjrbUdKRlSebEiOvPXK9DAdgb8a1W2J3jqTsWDIik+KKPLOMHemHgQlowGS51c7lz
         anK3SlBXtg9ho+z+ApqWDSYUAArEt+h5g0IBRWTPqk8BhP2x1xRZplSZZuTs60uSFn7V
         hBrwqERDK6idt10O0yHVkVseq1X/6wMJn9ZxZkncfP+8XXCilitFQniOSroZqW1iXorK
         mtYNoQz9M2gdzsFvQp/3p3ADjS7tNrnXda1/Eo22u236zAVGogQV1KEnOJeHiqxdIeW/
         +ovw==
X-Forwarded-Encrypted: i=1; AJvYcCVzG39/euW1DPAjzl+jKhsn1fD7+U47rDE1geZpeH3BAQ6mgH4UL95UlXeZ9yvCYzGTIyPZPPnNyf7TgkOddO7zZaOAKqC4zCbFFQ==
X-Gm-Message-State: AOJu0YxqIxBYkYjDh7GFT7zgoG8/JSv9bx7nxWzwQQ4vnBZNERrAfMh9
	4/Ae1GAO9kkVuwzh2ysGn2ItFljYfUSai4ei1jILQbObJysRb/espX9AZI9MfZWwYkpXm/P1vre
	D
X-Google-Smtp-Source: AGHT+IETdOLR0cZOx09zMsWEWT6Q0YvZcHpZMAwo/DFKK+XdGtIMkgfkfvjj/8N5NtcflTYuGw01DA==
X-Received: by 2002:a17:906:34c7:b0:a59:c833:d274 with SMTP id a640c23a62f3a-a59fb9595b5mr189995066b.37.1715160422945;
        Wed, 08 May 2024 02:27:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ag3-20020a1709069a8300b00a59a6fac3besm5371482ejc.211.2024.05.08.02.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 02:27:02 -0700 (PDT)
Date: Wed, 8 May 2024 12:26:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
	jreuter@yaina.de
Subject: Re: [PATCH net v5 1/4] ax25: Use kernel universal linked list to
 implement ax25_dev_list
Message-ID: <e4751c30-b950-411b-aeab-5259915f649e@moroto.mountain>
References: <cover.1715065005.git.duoming@zju.edu.cn>
 <bd49e83817604e61a12c9bf688a0825f116e67c0.1715065005.git.duoming@zju.edu.cn>
 <sijkuyypbnelg3w2shbxm3y6zu3qhfurvpvkoij5eluolnqr5w@y5dq74ycxzkm>
 <z5l3dfardxqrwf2lzzpktuifqaxvv2clrgah5gnz4t6iphskeb@otrcl5cwyghx>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z5l3dfardxqrwf2lzzpktuifqaxvv2clrgah5gnz4t6iphskeb@otrcl5cwyghx>

Let's drop all the other netdev people from the CC list.

On Tue, May 07, 2024 at 07:46:51PM -0400, Lars Kellogg-Stedman wrote:
> On Tue, May 07, 2024 at 03:43:11PM GMT, Lars Kellogg-Stedman wrote:
> > On Tue, May 07, 2024 at 03:03:39PM GMT, Duoming Zhou wrote:
> > >  typedef struct ax25_dev {
> > > -	struct ax25_dev		*next;
> > > +	struct list_head	list;
> > 
> > Would it make sense to replace this with:
> >
> > LIST_HEAD(ax25_dev_list);
> 
> Sorry, *this*:
> 
> > +static struct list_head ax25_dev_list;

I'm not sure I understand.  The code is correct though...

regards,
dan carpenter


