Return-Path: <linux-hams+bounces-243-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5608BDD7A
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 10:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9200E28300A
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 08:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4EF14D433;
	Tue,  7 May 2024 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="se2REd1I"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3E16D1A9;
	Tue,  7 May 2024 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715071861; cv=none; b=tRg11C+QKtcgSKNl4t84HgaafmdCk3KG1JlsCNSgl8kK9AJLaSPFBavMWs6jYeeBuQxK7RU7hOerc6ZgoCYq1a+Ch1RLZZopHRWVM0VujcI0zq0HAP0EU1Bgkd5DAI497fY8y6ewOjzOgrE1D63ZXZ4E0uhv4je6RW07tK8f6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715071861; c=relaxed/simple;
	bh=PdzkpfEmwxK/pzn735F8E3DY8ddcp/oOwhlxuPHUSGU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iDYFziTf7vIJsEpOg/uq2cVaNeljm4JuDEVH4TZi8FjO5W8WiZE64reA/ls0z7fymJnNNIAGfKS3HfRdyhvUtrpEhGehYJmk+v/3ea4Q0N9HpdyGOxUioXvNnB2CGP50el3zIogI/Ea8YriM6vDtzm0p2K4LTIqt3gGk1QlPZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=se2REd1I; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715071728; x=1715676528; i=markus.elfring@web.de;
	bh=PdzkpfEmwxK/pzn735F8E3DY8ddcp/oOwhlxuPHUSGU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=se2REd1IuGnkcNo/dOgrzsZn3JdWJx5pwg5nFSsQ740oiJGSxzz4fmMDj+1ez3W2
	 4sZz4cKlGlqOMyCaTRSNn0h0oM7uPp8BQgWiW1VJJPzVGta30XjjD8tKDX57D4pNd
	 bhMEYlkWP3aLVlPnUztWF0LnnulTD8Fvq19wRTO5vFiVNXxMi48QYANCeBP7qH1xs
	 CHWtzqStPEWnQaOOTRK7h6Trv+E55o49HjDnc31Cna5oRoUSn42fpXAHk25Mue2yX
	 c3Oye5D2Ihap9uV9zKpIlrcTe+Ek72gPBqGsaVmb3ta+Hdo8TI0ibVzyXj09H8hlV
	 qzoT+EXWniHy9yHfLQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N2BHw-1slSrG2FeI-0120rS; Tue, 07
 May 2024 10:48:48 +0200
Message-ID: <09851d72-533f-4a30-99a0-09122af4f2e5@web.de>
Date: Tue, 7 May 2024 10:48:35 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?J=C3=B6rg_Reuter?= <jreuter@yaina.de>,
 Paolo Abeni <pabeni@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Lars Kellogg-Stedman <lars@oddbit.com>, Simon Horman <horms@kernel.org>
References: <bd49e83817604e61a12c9bf688a0825f116e67c0.1715065005.git.duoming@zju.edu.cn>
Subject: Re: [PATCH net v5 1/4] ax25: Use kernel universal linked list to
 implement ax25_dev_list
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <bd49e83817604e61a12c9bf688a0825f116e67c0.1715065005.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hzN5HcI6Zd7BBby/m2pAitYCWjGmJIV6c8WrKJELNp0sDtOktQ6
 BmqEiFjllXfwBdtY2O4KR3r1u0HYhC29jJvEV8INkRPGFgTst/sZyO73Gwj6TnSdivTa8Ye
 ayV+YHAKp9Vi+cC8FEmj1LYoBsi5YmG9QJydZ6arUEsKPjvCDUs1wiZo8NsdBWfbdMTMxaW
 RPBt/SIVqjTHkUy2Ij7Kg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OVReoEuT2vc=;p9gX44S8yh70XANrK4NitB+mWWW
 hjqS7EWo7E2zFVaw1G4zUE+brJJcTzdX9aII64hDbljmg+V8D0t7/Yi+PU8pkDLMYfEpBiRTF
 YOsOa2hnCcZQs1i/qpAfWJES9v16AJ1Nu+Q7+G8wEF7CXF+MMBNKRuy625IZpuNEJwbjfLzi8
 kvpdye6fJWoTz0iKaCAQSIOqb/yrOgTq9lkYvDohj11U1dEHR47OW0e9cnd0RMENeUjdxpRtK
 1QNC8GE5ozaQnzgVhP/QvD7ag7dFMsq5EQT14UOU9ULLVAPurHO8ybXGc+eXgkrO+59JMWsbw
 IsC/PzYTxLc2nCGHoz+FyNoB12ewvofr3F0jCUYrsxwkOegKQXwoqvX1P/wvt782pCcABssMB
 GXQa74wJ8ghFzS9VYCRQI+rVoLKzpNBXFqvecCZY+vdO6K0bkKgOdGBWTQ/PcA5QJIcHTKzV0
 /jAYKozniLLB2RUOhxUFoeJzp07SlOlFGqC5YQiRcU+tT2BQwxCAghAvBs/tUo1WmXJ+R1KWK
 6FxS4ypklCxAsXGreRL2TGnmfNvWEIb2Hf4oCawy89RAgyq2zmFbI0kEP7AqwtgJZGZBkUEID
 mKyTrt3tiutaalLdnv1xYpD1XpO7HJkBYdYBUDX/jW0as3oVF15Nk2TigmD8zCu9l4olBTA4L
 NM47Ou40UAE+47x3cJ3koujgzay+4gORZ5H7wZTHUzs1spFrHw+n7B5aa2PkvwV3R9XgNWCY9
 i4L1vKrHJ2nka/EMQxia/BXeNYScHEVGpXHWtreufzXIm3t9xuFsa6gBNRxnDiGV7RAOGhXBr
 al3FJ1aHsrydJ9d2a8zGFcQ08X2uxV25kRXmtolDXdN2c=

> =E2=80=A6 that need to notice:

I suggest to improve such a wording.


> [1] We should add a check to judge whether =E2=80=A6

Are imperative wordings more desirable for improved change descriptions?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc7#n94

Regards,
Markus

