Return-Path: <linux-hams+bounces-337-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F31A8D1764
	for <lists+linux-hams@lfdr.de>; Tue, 28 May 2024 11:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FDAD1C227A0
	for <lists+linux-hams@lfdr.de>; Tue, 28 May 2024 09:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5018A16A391;
	Tue, 28 May 2024 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VK1iTYxl"
X-Original-To: linux-hams@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C1716939B
	for <linux-hams@vger.kernel.org>; Tue, 28 May 2024 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716889248; cv=none; b=ZlefQjGs8Hs8VcOjppTbQ00HsPvc5XwQEP3wwbHDl7zlGk9NdD3QHiyKWLes9h23BVWCXYji2ht6/DS17pHCEUSBBOV4ysoA4aUsGMz9rNJqGPLVYOWRPx+GRBB0fMDKGKIEx+xUZFrXu6aTMlMLXn1vI45Zcw8WiAHi4mMJKOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716889248; c=relaxed/simple;
	bh=YH6D6t8LjSd6ZdaoF1qxzPiRxqeaviZWvViDnSpvmss=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UR3ofPV2WZ3VBLuA6xmutsSM/FwB54uEWOrSSQ4MZm1kpI2rdWayT5iBF4R7CBzXB/hJhJtLQisnXlMPcML13NsLYvmB3JdwwrIbBAQ8p3yVgRBUKuDCw/ih0QKkhjc1j/Ym59JqDOnilFhcu/y2LsLfGXBYptltb33QPjWlDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VK1iTYxl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716889245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=olf++kd9oSrYpwCRfwxaifJg9UKpBqtRKznCFfuolSM=;
	b=VK1iTYxlXlL+7O4JJY+9dSFB8bXoNb/SvNgW7v8C4Hqb63xRkLpXy8h0MqoARutup+tOnV
	RplO1lx9XFVyvTapvwz/dqi76PrYsS/6P0D8sSFEpF7LO2VWaJJtlF/V3DwnaKVP2RJkbJ
	5qjCitFDs1xsS88qLCEmzJmB4H0JEo0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-MFlJz6_cOS-ULX_8LWEcNQ-1; Tue, 28 May 2024 05:40:42 -0400
X-MC-Unique: MFlJz6_cOS-ULX_8LWEcNQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-355072f3014so79046f8f.2
        for <linux-hams@vger.kernel.org>; Tue, 28 May 2024 02:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716889240; x=1717494040;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olf++kd9oSrYpwCRfwxaifJg9UKpBqtRKznCFfuolSM=;
        b=cCybju4FvTvEsNMmCPNTn1iTuby3sYDyIUPlFx5e/WJObrM0Z6QIvykz1C7DsnRdM2
         ChhKnASgBT7hdHsxnDsU8oQqTCeL/b/fFIiODR6VaXZSZhbP0XSMR2dAheRX4+JtLA7X
         nsJnhyRpG44Kd8w1e3czsQ/tRPvI6kSVxVRSmU7IzmLaivcbNkF3xmtEGKxnOTVoXse9
         DQqGTo7r7C5zmdcUtwe5BhygWqUMrzh0Z7TPHhYOPbOwgoEgljZsM5LQzk2SH43+PjYG
         XDQR17qHalNvqBRQnfHcIIQyrkMmmp4mRRfebxMafVlqVKo55ymKJQG0zmcoK0TKVFNr
         dh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBYIIPlRZ/w/mPbeWPVc+J32o3ZlQJgU5yNoZF70G6T1eNVYcIPBvjfHYJjHVB/1NkXWeoSklfUzfPkKzP4CZq/U5E98iQ4M1khQ==
X-Gm-Message-State: AOJu0YxB221//TNW9DEVBYnUmM15jSCD0BwGQFx+/1V1ECCRaMMPeYPV
	Bpt6FH91Iu48JrXYpnHZaXt8x4is6VdMVyZXWTMr55ZPz38kH5o4kzHiwu5CZrwaBt8Pv5nan+D
	7wAbzPZQqpEoVDWfRdReP23FrJccnwBXqhBExAKReeooj0QxSbPIAjRteIXc=
X-Received: by 2002:a05:600c:3b1f:b0:41f:cfe6:3648 with SMTP id 5b1f17b1804b1-421089d00a1mr87871385e9.1.1716889240624;
        Tue, 28 May 2024 02:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+uJQO5Jblyp/BlXIv5vxdeNeZd2dFUU1KBQ+Y+D8WmgQbfrw6HAZdF5433fAh3ihIspeHFA==
X-Received: by 2002:a05:600c:3b1f:b0:41f:cfe6:3648 with SMTP id 5b1f17b1804b1-421089d00a1mr87871215e9.1.1716889240132;
        Tue, 28 May 2024 02:40:40 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b094:ab10:29ae:cdc:4db4:a22a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee806esm167655615e9.3.2024.05.28.02.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 02:40:39 -0700 (PDT)
Message-ID: <8e9a1c59f78a7774268bb6defed46df6f3771cbc.camel@redhat.com>
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
From: Paolo Abeni <pabeni@redhat.com>
To: lars@oddbit.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org
Date: Tue, 28 May 2024 11:40:38 +0200
In-Reply-To: <20240522183133.729159-2-lars@oddbit.com>
References: <20240522183133.729159-2-lars@oddbit.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-05-22 at 14:31 -0400, lars@oddbit.com wrote:
> From: Lars Kellogg-Stedman <lars@oddbit.com>
>=20
> When releasing a socket in ax25_release(), we call netdev_put() to
> decrease the refcount on the associated ax.25 device. However, the
> execution path for accepting an incoming connection never calls
> netdev_hold(). This imbalance leads to refcount errors, and ultimately
> to kernel crashes.
>=20
> A typical call trace for the above situation looks like this:
>=20
>     Call Trace:
>     <TASK>
>     ? show_regs+0x64/0x70
>     ? __warn+0x83/0x120
>     ? refcount_warn_saturate+0xb2/0x100
>     ? report_bug+0x158/0x190
>     ? prb_read_valid+0x20/0x30
>     ? handle_bug+0x3e/0x70
>     ? exc_invalid_op+0x1c/0x70
>     ? asm_exc_invalid_op+0x1f/0x30
>     ? refcount_warn_saturate+0xb2/0x100
>     ? refcount_warn_saturate+0xb2/0x100
>     ax25_release+0x2ad/0x360
>     __sock_release+0x35/0xa0
>     sock_close+0x19/0x20
>     [...]
>=20
> On reboot (or any attempt to remove the interface), the kernel gets
> stuck in an infinite loop:
>=20
>     unregister_netdevice: waiting for ax0 to become free. Usage count =3D=
 0
>=20
> This patch corrects these issues by ensuring that we call netdev_hold()
> and ax25_dev_hold() for new connections in ax25_accept().
>=20
> Fixes: 7d8a3a477b ("ax25: Fix ax25 session cleanup problems")

Note that the fixes tag above is still wrong - the hash must be 12
chars long, see:

https://elixir.bootlin.com/linux/v6.10-rc1/source/Documentation/process/5.P=
osting.rst#L207

so regardless of Dan's eventual ack you will have to repost this patch.

Please run checkpatch locally before the next submission, thanks,

Paolo


