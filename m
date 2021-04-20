Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17628366141
	for <lists+linux-hams@lfdr.de>; Tue, 20 Apr 2021 22:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233769AbhDTU62 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 20 Apr 2021 16:58:28 -0400
Received: from gateway20.websitewelcome.com ([192.185.65.13]:49828 "EHLO
        gateway20.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233991AbhDTU61 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>);
        Tue, 20 Apr 2021 16:58:27 -0400
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id ABA594016FAA3
        for <linux-hams@vger.kernel.org>; Tue, 20 Apr 2021 14:59:47 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id YwhslhTRPb8LyYwhsljN5n; Tue, 20 Apr 2021 15:10:48 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CkRrAR3rCpK4uliJ7LJ71iNQodpgSH1kYlP/RKhfhGo=; b=Ueb+udY2kyoTD5pHw4Y8wqYIni
        nIQy8U6Ne3ALQYgfy/x0h1iEGgKxTEWlmbOT/CI/7GCpn6hu14Wa0b+PoORM7ZKHKKggosQA+Ip9l
        CcmjjD4Wp+ApERE6f8OCqMO5l/xH92PHIlJReKlxuC+TL06N/NOvLkkOoVVV/4KIslHMQhAgFUI0j
        taGG9CVVtPFUlvBTNxstk+vwd3dEcbymBOM0ye//KqaG0NHaY/JrVYYi6inJJMadKIFkqfUelRjs3
        mkHzi4B1oT9bPCPX2CzNlq3seQW0Xo1CtEzEya8CQuieGZxSrRpUAphnfejKyT5oOuOSBp+7GH7Ie
        qG+8DPuw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:48952 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lYwho-002gkB-S1; Tue, 20 Apr 2021 15:10:44 -0500
Subject: Re: [PATCH RESEND][next] net: netrom: Fix fall-through warnings for
 Clang
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     linux-hams@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210305092210.GA139864@embeddedor>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <5047001a-e5a8-ec64-0dc7-662e7cb0d100@embeddedor.com>
Date:   Tue, 20 Apr 2021 15:11:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305092210.GA139864@embeddedor>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lYwho-002gkB-S1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:48952
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 65
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 3/5/21 03:22, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding multiple break statements instead of
> letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  net/netrom/nr_route.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
> index 78da5eab252a..de9821b6a62a 100644
> --- a/net/netrom/nr_route.c
> +++ b/net/netrom/nr_route.c
> @@ -266,6 +266,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
>  		fallthrough;
>  	case 2:
>  		re_sort_routes(nr_node, 0, 1);
> +		break;
>  	case 1:
>  		break;
>  	}
> @@ -359,6 +360,7 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
>  					fallthrough;
>  				case 1:
>  					nr_node->routes[1] = nr_node->routes[2];
> +					break;
>  				case 2:
>  					break;
>  				}
> @@ -482,6 +484,7 @@ static int nr_dec_obs(void)
>  					fallthrough;
>  				case 1:
>  					s->routes[1] = s->routes[2];
> +					break;
>  				case 2:
>  					break;
>  				}
> @@ -529,6 +532,7 @@ void nr_rt_device_down(struct net_device *dev)
>  							fallthrough;
>  						case 1:
>  							t->routes[1] = t->routes[2];
> +							break;
>  						case 2:
>  							break;
>  						}
> 
