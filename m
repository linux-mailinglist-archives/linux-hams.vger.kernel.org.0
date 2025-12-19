Return-Path: <linux-hams+bounces-735-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C5CCCF24C
	for <lists+linux-hams@lfdr.de>; Fri, 19 Dec 2025 10:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4474830046ED
	for <lists+linux-hams@lfdr.de>; Fri, 19 Dec 2025 09:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8AA2F28E3;
	Fri, 19 Dec 2025 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OjtqKXjy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRQL1dsI"
X-Original-To: linux-hams@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AB2F290B
	for <linux-hams@vger.kernel.org>; Fri, 19 Dec 2025 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766136523; cv=none; b=LGQYQhInihRo5BgrFHuVUtuS+HPGasR9at2zaAnGvKCVKburpPBZIdgxVEc6G+uspSX61W0o6DCVqdgOGMQcCPtMfC3yiwZ4ERbphhBrFWWCEzAV2UH+UJWnDQ3j1AUxgXcQrrQbJ0W5pC/xvrolOFUSMqpK+gGrF3RQH0OXIuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766136523; c=relaxed/simple;
	bh=a9kGWB2VoIFD5H0J99TkVfZ6uDR6K/PyNGlZcO7cFag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HUNq2XeP41S9y5Oa4abxhphSBoTapqiCBDSG+J8F35qy1uQwUkV+QVUxVxTw/ORgvO6/BfXKz/zr6p+tX35B8PYQxLfBiq5Fb5MbhHjWjTntmKKGrW27GCTiNQRy6JrLi7/TBHNYwb1qKLQ53Rj2XbFP5IGg0v9R3a+81xCiVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OjtqKXjy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRQL1dsI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766136518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7haCuyhI51FS9KbOrG4WJkMhKxZs4nFFL4lqUWoH9E=;
	b=OjtqKXjyppEiWYKcionWlkJEg7sjAeg+j9USt2DcLdQRFEHtg5sIpgiziWofMrQL5SGWRi
	0saZwRdbEBXtd9Kz+8q7bDLMnMFgQYX5oI3IgKo5K2uSRKx+/EG1gzrLpXQIDJvqzma1fx
	FEAfPPBfAZXffCmnWSQajEPTzoUucJc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-w5ao5VkWPQKKd4GBX8_NpA-1; Fri, 19 Dec 2025 04:28:35 -0500
X-MC-Unique: w5ao5VkWPQKKd4GBX8_NpA-1
X-Mimecast-MFC-AGG-ID: w5ao5VkWPQKKd4GBX8_NpA_1766136514
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4776079ada3so11756515e9.1
        for <linux-hams@vger.kernel.org>; Fri, 19 Dec 2025 01:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766136514; x=1766741314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7haCuyhI51FS9KbOrG4WJkMhKxZs4nFFL4lqUWoH9E=;
        b=WRQL1dsIbkfiQi6LcB6gpdyawE6x4n+UwwgvUzeQpD5QfD2laai4OJWc2MbU7/JvAL
         bbzFG4p3TlDYjWso6L6htwXlCyRfKgN1NP30O14icmeuem3/G0XYsxJHCMzl2ofiBO3k
         ZQTv4+VcyDUZHnuyMydRCOtsIuYba7JiYC+H21H1+Q2mXnXiIyqK93AcrzOETbmEbGU+
         AF34nXSR4ZVScn2AVdyb8ggSVkE3CgfW0Xe+oIUzZcROCig4LyIIrNKWj1p5R5nfJfa/
         U2wCOoCGGITdAA6qalYDGZ3lChXFbBLxDIHNqVIRVCnnIvgLcw6OXUjbOoiLEZh3UO63
         XuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136514; x=1766741314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7haCuyhI51FS9KbOrG4WJkMhKxZs4nFFL4lqUWoH9E=;
        b=Up8GkdrcI8qW7rgGzJ8iG6bSuTmRF1LlMNOm6FuUkZwonIb3Alh0DBqoX4N05R+ZYD
         uTpEQhs76VfYYYDvqtmWFse5T5X6q8CUrb3dHdQ4iXDV0iFB9jVmnmFE2k8OA+yAYYss
         4tNC3shtN+Of1PSVTuBA3E1/UFzNGEw3WR6BDjvMRlU8ofIO5F0DdbMUIWMkwQIdRmt5
         fSYVIiG9ISHrfjQpVEmlyfqUj+KMg41rW0zktWQ196MW3LP3d5bVUFuTQMHI3SXpqQo8
         97R2xLVHGN4Fo7Xilg6ATRCa1DeroiAGIduBQsng8+6ZvgccJrKFxIw4p5uweOIWoiMj
         NDsw==
X-Forwarded-Encrypted: i=1; AJvYcCWkZW1c/PK4yd2TOGHBRe9Q92gBMcqv5SsrRSj3qKUfB32VrICvpcs6RDbP/q741sHcVCBkFD6v5uk9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjw5kdwGPufjZv1jL/xqijAGEibGRu2ZS8h022X2fQLP3BA3xC
	NDuvnny+/9CmwxkLrMyq923HAETCLH3tMlnFs4/I7RAos9ZTw8O7m+LpwI+JDrImS2ha4cQspib
	e3H1rofqKn3jAN2xZ+Pg5/8H+wM4rpCl96ezEfKZUi4qtIZFZB37TyKkB8Ep31XI=
X-Gm-Gg: AY/fxX6R2AqRAxIcgUi8GO52FAMZ5ZYrb++zOKlR3h5L49I2UwaGzReihoYFD9Yuchr
	FqGHezZO/CAemPPMoFXzhRglTZZ/2ajaKni/vl7wCMXFK/BSEolHSYNh8fSdRwe9IRFGna8pAtn
	5orNCNW3pe7ARWg4ICl3Z6sP/bPriC2e8x7OMfM26lWsTVAbP35+ubroRF41P//58ZFRzMaeFi2
	FG0hGtGPsVNZVIlJ+rV1ta3rW1FJU0m91WW3CsuKBUpeIqgt3/eZz73oSXZyn/Jti1MmFiNeR0l
	XbQQ0GdU1k1KZ5UK5w9FWBgQ1EkNX9ZDZYk3hmvsVzRO/LiqzXTEZR0ji2qFw3J9zZ6K8D6lxoS
	6yFTAv8bCwiCb
X-Received: by 2002:a05:600c:8107:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47d19594ce3mr17951305e9.22.1766136514144;
        Fri, 19 Dec 2025 01:28:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNoLKZcFi3Edz90O7ZAZd0UW0hmk7eXl1jBJlmWTqebq88oohMnYaPL71A6ehr5HyEB8Y1LQ==
X-Received: by 2002:a05:600c:8107:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47d19594ce3mr17950875e9.22.1766136513687;
        Fri, 19 Dec 2025 01:28:33 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19352306sm34590835e9.5.2025.12.19.01.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:28:33 -0800 (PST)
Message-ID: <1491a7c7-3ff8-4aea-a6ee-4950f65c756f@redhat.com>
Date: Fri, 19 Dec 2025 10:28:31 +0100
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sysctl: Remove unused ctl_table forward declarations
To: Joel Granados <joel.granados@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org
References: <20251217-jag-sysctl_fw_decl-v2-1-d917a73635bc@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251217-jag-sysctl_fw_decl-v2-1-d917a73635bc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/17/25 1:16 PM, Joel Granados wrote:
> Remove superfluous forward declarations of ctl_table from header files
> where they are no longer needed. These declarations were left behind
> after sysctl code refactoring and cleanup.
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> Acked-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Joel Granados <joel.granados@kernel.org>
> ---
> Apologies for such a big To: list. My idea is for this to go into
> mainline through sysctl; get back to me if you prefer otherwise. On the
> off chance that this has a V3, let me know if you want to be removed
> from the To and I'll make that happen

For the net bits:

Acked-by: Paolo Abeni <pabeni@redhat.com>

I'm ok with merging this via the sysctl tree, given that we don't see
much action happening in the ax25 header (and very low chances of
conflicts). But I would be also ok if you would split this into multiple
patches, one for each affected subsystem.

/P



