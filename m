Return-Path: <linux-hams+bounces-289-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F768CB2A4
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 19:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 009CA1C217F1
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 17:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3C7147C79;
	Tue, 21 May 2024 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darc.de header.i=@darc.de header.b="a0wyafEv"
X-Original-To: linux-hams@vger.kernel.org
Received: from dd52932.kasserver.com (dd52932.kasserver.com [85.13.131.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3417C22F11
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.13.131.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716311587; cv=none; b=uOaM16bN/SZjTSO4uZitinp4k8voIzNWKqLZQDSqp+cSzve0ILey42czSw6rbUweOlFQLuyGaT8saURwXKjmri8WeE9NVJX0+XOIel7pg6RHhIGPISMEUTn9lpzs/0X7Ns3wrCoLML7S96AVbstG7aN6GXYZZ9jrRDf/T+umKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716311587; c=relaxed/simple;
	bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=VPkR/knRoLyTLv+fX0YECkGpviKqLk01XfU4WpM+khyIYph9bUoYB+lgFdT/wllC6nJRFNp3W041ltA1CxJg7qyzm1yKCC+sY2EevJcr5frfZj4WORoF9Tes7kj9+0zd9tOXCZXU5OXZV+mc/p8BhdYN+6PTqB+aPpM4ZV14GvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darc.de; spf=pass smtp.mailfrom=darc.de; dkim=pass (2048-bit key) header.d=darc.de header.i=@darc.de header.b=a0wyafEv; arc=none smtp.client-ip=85.13.131.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darc.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darc.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=darc.de;
	s=kas202403131044; t=1716311069;
	bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
	h=Date:To:From:Subject:From;
	b=a0wyafEvi/kNC17kCh8hsDLHgk+SuMXUu+eXMgPX85lhMkRlvil1PNrsGWPZ45IFQ
	 XfjdV9aNJvMZouvSWl0btdcpKnQMT6dr+wHbSokZzvr6nHxi9J5gOSEq4HRIfDBUj+
	 zgx9d5V+jlMJyn0hx6zMTBocxIeu/f61HxtXIzg0XdKbQa4Cj9/g0d5Isf55KRmXl/
	 bAndy8D3ekHn2yqJjqfTA56nDlTgZlSEndB5WGENXQnm+BRWjddTMjCu4vXOjXEE2Q
	 FNCkFcOrane6rIsqbQiCMSHiEwmGR8d5Gf/IZX7vgvWLODRonl4Y2PfFMNGbfLYzjw
	 /teWutcdhYiVA==
Received: from [192.168.178.21] (dynamic-092-224-049-059.92.224.pool.telefonica.de [92.224.49.59])
	by dd52932.kasserver.com (Postfix) with ESMTPSA id 15561DE802C3
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 19:04:29 +0200 (CEST)
Message-ID: <3bb96528-20e2-442b-bab4-db98547cc3f1@darc.de>
Date: Tue, 21 May 2024 19:04:28 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: linux-hams@vger.kernel.org
From: Reiner / Tania Hagn <DF9RY@darc.de>
Subject: unsubscribe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: /

unsubscribe



