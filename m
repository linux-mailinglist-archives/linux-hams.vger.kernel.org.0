Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D785229364
	for <lists+linux-hams@lfdr.de>; Wed, 22 Jul 2020 10:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbgGVI0u (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 22 Jul 2020 04:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbgGVI0s (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 22 Jul 2020 04:26:48 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B70C05BD0F
        for <linux-hams@vger.kernel.org>; Wed, 22 Jul 2020 01:26:46 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a1so981334edt.10
        for <linux-hams@vger.kernel.org>; Wed, 22 Jul 2020 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ijnpSqTzlWs7OuuIHaz94zTqsgZ4TkbrlxGL7rF8SvM=;
        b=xFRbFe5eYCppxJ62qFkLFv33fQa9ER4RHEl34g5WwIC4xdcR+4tivo7mnn1S+rNlbS
         cMN8QwQ1eW0avv9rFxBRIQMUktSGW06zNgKrNWQvq5F25hq8QLzdYCQ1hmqL4iSIvq09
         Szc8YdqC97qHUqKRHbhQr8/oguhWktZDZtVMGTavTEfzVAENBpjq7LQbsQSFC/Qb56AS
         G/7MNxNktsXQmENPoH9ousqNoZVBW0eyiSYtxkhGP/mapdbBWtSCpZCTmHbB+1rtyqO0
         wY2Oxf7ffMMplrOPj5lpx8Ya/rpegVFUOFLBmwqnjZVN6pLS4eW+iRKkCxAtMw4/FDqK
         d09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ijnpSqTzlWs7OuuIHaz94zTqsgZ4TkbrlxGL7rF8SvM=;
        b=PNd54M+F5GZF68Muodax5vH7USOX3eCdOLvcrKWyCOKwj+nCZwo/awcgDBZoCqxNre
         xGJQKzsW1/GycrOIWNDvpFATrq5q0phAYHQAii16e6J2zj/u4rAZehKkGNMHQjpxQoXB
         Hmks0H1sq00nvoLWsKiKPOCA2nUI15WX56jEsX0MOK07aciVwaT2VokeyBnowMFSMbtq
         QjRueDPNv/vdRpYMu+I6qSkyInUAKz2AZI20JlWzbEXRw5o9wDJRCHQx9nnmnafXGC0Q
         2r/qmW521JHvkSU9sTlTZ8oF53NgMoq65xP2vMc9724Cw1GvWeFW+Rixi3RFqnFsEowJ
         b+BQ==
X-Gm-Message-State: AOAM5330kvRLAehdmxC6TP0HjqcCzEmWV5q2LtAYuF7bt76qOD/waj8n
        kCPPUWdX2FBaBDOCUbzHpGYu+A==
X-Google-Smtp-Source: ABdhPJxnWSvai+9iaNos8sJtXdeBHraQbZUkyduEvMUxv8nKJJQfjOWUUSDiYYhu744BzkT/PRbBSQ==
X-Received: by 2002:aa7:d341:: with SMTP id m1mr28525320edr.50.1595406404862;
        Wed, 22 Jul 2020 01:26:44 -0700 (PDT)
Received: from tsr-lap-08.nix.tessares.net ([79.132.248.22])
        by smtp.gmail.com with ESMTPSA id x16sm19025267edr.52.2020.07.22.01.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 01:26:44 -0700 (PDT)
Subject: Re: [MPTCP] [PATCH 24/24] net: pass a sockptr_t into ->setsockopt
To:     Christoph Hellwig <hch@lst.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Eric Dumazet <edumazet@google.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        linux-sctp@vger.kernel.org, linux-hams@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, bridge@lists.linux-foundation.org,
        linux-can@vger.kernel.org, dccp@vger.kernel.org,
        linux-decnet-user@lists.sourceforge.net,
        linux-wpan@vger.kernel.org, linux-s390@vger.kernel.org,
        mptcp@lists.01.org, lvs-devel@vger.kernel.org,
        rds-devel@oss.oracle.com, linux-afs@lists.infradead.org,
        tipc-discussion@lists.sourceforge.net, linux-x25@vger.kernel.org
References: <20200720124737.118617-1-hch@lst.de>
 <20200720124737.118617-25-hch@lst.de>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
Message-ID: <b3665200-2476-9d35-8dea-d5da141c6b70@tessares.net>
Date:   Wed, 22 Jul 2020 10:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720124737.118617-25-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi Christoph,

On 20/07/2020 14:47, Christoph Hellwig wrote:
> Rework the remaining setsockopt code to pass a sockptr_t instead of a
> plain user pointer.  This removes the last remaining set_fs(KERNEL_DS)
> outside of architecture specific code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

...
> diff --git a/net/mptcp/protocol.c b/net/mptcp/protocol.c
> index 27b6f250b87dfd..30a8e697b9db9c 100644
> --- a/net/mptcp/protocol.c
> +++ b/net/mptcp/protocol.c
> @@ -1627,7 +1627,7 @@ static void mptcp_destroy(struct sock *sk)
>   }
>   
>   static int mptcp_setsockopt_sol_socket(struct mptcp_sock *msk, int optname,
> -				       char __user *optval, unsigned int optlen)
> +				       sockptr_t optval, unsigned int optlen)
>   {
>   	struct sock *sk = (struct sock *)msk;
>   	struct socket *ssock;
> @@ -1643,8 +1643,8 @@ static int mptcp_setsockopt_sol_socket(struct mptcp_sock *msk, int optname,
>   			return -EINVAL;
>   		}
>   
> -		ret = sock_setsockopt(ssock, SOL_SOCKET, optname,
> -				      USER_SOCKPTR(optval), optlen);
> +		ret = sock_setsockopt(ssock, SOL_SOCKET, optname, optval,
> +				      optlen);

A very small detail related to the modifications in MPTCP code, only if 
you have to send a v2 and if you don't mind: may you move "optlen" to 
the previous line like it was before your patch 7/24. Same below at the 
end of the function.

That would reduce the global diff in MPTCP files to function signatures 
only.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
