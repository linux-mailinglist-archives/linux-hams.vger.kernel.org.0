Return-Path: <linux-hams+bounces-270-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 494028C0DFB
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 12:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7910C1C21990
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 10:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305CD14AD14;
	Thu,  9 May 2024 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gm32d/jJ"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7806E14AD2F
	for <linux-hams@vger.kernel.org>; Thu,  9 May 2024 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715249405; cv=none; b=jT0JzjS/AOhwh3Ha0OXrIYTOi43raMj6OYmXmsMyE8sPN/i+HLn37d3OasPhaGYNgnWs1DarPgRvNeGvPkWmmVBmS+IBhUVyHYeiHMDgzJxMt1HVhHB1W0x6MNYXB6amECAe/ATfj5GROuQYccrBRjXCNl96zvGRgNUuhS9MjC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715249405; c=relaxed/simple;
	bh=nGDHMJYfkL4nju2+is+kww5uk6KkuyZpMB47n2TaaUU=;
	h=From:To:Date:Message-ID:Subject:MIME-Version:Content-Type; b=nM18pDOWXNWMN6B77qx3dtH+3dWdtJvRlrcsDvw3RPTO4kBfWIbMrj884sIPKAlZs5GFj29uo5zqTZruIM8dIkADATevCYoUkhIQy+cPdXIqcfLxAYVHYyBifKiPz6iK5z88B+gjMKvgfjnXgHvQ9aLGE0+ja+auROnv9MelSLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gm32d/jJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a5a13921661so146953566b.2
        for <linux-hams@vger.kernel.org>; Thu, 09 May 2024 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715249402; x=1715854202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :message-id:date:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGDHMJYfkL4nju2+is+kww5uk6KkuyZpMB47n2TaaUU=;
        b=gm32d/jJTyHzbow0PX/dGsvXMtYAPX5sbUJ1etgwc+IokJZbW5DQdXfZd9qX8E50Si
         kJyNd5Y/j7d19hWrab/tcddB1XNrL5fp0LWQ4BZRB65O4ND51gq4yw5RdaLkDcLcruPY
         LJwXJdjHb42hw4Azb/77XwQb81AAB8T+Q2tlFhKk5m/9FM6TUUdpVN1atH/95hb7zGdn
         sJaxG5JFFqie+mcFtQLaBe7K5bzw4J/KE6Omo5z15mnsHcIOrNeVC+6R9q5RZkbOp+HO
         Yw0fP7GFnMy5ewadxs3TXl0b3R/zjwmRyhephqyO1Y4/+HVrSIDM6QLfcOooJdv8bTUh
         Vcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715249402; x=1715854202;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :message-id:date:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGDHMJYfkL4nju2+is+kww5uk6KkuyZpMB47n2TaaUU=;
        b=MoDtEiM92WwAHyL1u8St/e+WXLzzbWHK2N8cSfNNnTz6MqBq395GQYEn3RpQn7O7Ho
         rm92xXTwLu51lKteQAfZC0cCb3QNSvpIpjRCIWgCzWbDa9qEGS78nMZWmTNAFsAVINIj
         1mSRfihjfl9wF8QdHRVwxJooEBDXjqc7eNmaqcqZuU1jnPmXvWl51rdF9f4RF/s+B0Zi
         hSQ4fWTinkKyBzISZp9BQgkEfeZhxiswjZ7/7RznFRDi5Ut0Yd8BYqCOgu+8o5TlMsj0
         TfYB+L0BG59D3VBDol+6KxkwWNvk4l2z7wqZK8Vg4fShNYDR+MPtpVE4KjX9ruIDehFa
         33xA==
X-Gm-Message-State: AOJu0YwiL/+xZ1z0bKkHTtB1voXfkjjT6omwBJHyYypsRBBzBZ/vxNbT
	7hMsXlRGJdNVix4/ebcvp7ilf8g1tVzD0+Xadi0MHLV47W9e3dSwkhdkbJaj
X-Google-Smtp-Source: AGHT+IEt6jBVYOuouzlRjcK8CpX14S2Hnp9L0TYGA1DSa2olIgXifJ2utgy+ASbt029dzObK2He1LQ==
X-Received: by 2002:a17:907:bb95:b0:a59:a05c:b559 with SMTP id a640c23a62f3a-a59fb9d2275mr295541866b.70.1715249401589;
        Thu, 09 May 2024 03:10:01 -0700 (PDT)
Received: from [192.168.1.152] ([78.88.244.78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cf70sm57704766b.30.2024.05.09.03.10.00
        for <linux-hams@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2024 03:10:01 -0700 (PDT)
From: SP2L Tom <tewues@gmail.com>
To: <linux-hams@vger.kernel.org>
Date: Thu, 09 May 2024 12:10:01 +0200
Message-ID: <18f5cd4cca8.2802.8f75195883235ac341a2526b993b57c3@gmail.com>
User-Agent: AquaMail/1.51.1 (build: 105101461)
Subject: Unsubscribe
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

Unsubscribe



