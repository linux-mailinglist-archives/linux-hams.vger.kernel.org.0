Return-Path: <linux-hams+bounces-158-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97B8B5387
	for <lists+linux-hams@lfdr.de>; Mon, 29 Apr 2024 10:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A59761F219F3
	for <lists+linux-hams@lfdr.de>; Mon, 29 Apr 2024 08:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BA220B2E;
	Mon, 29 Apr 2024 08:54:12 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FAB1805A
	for <linux-hams@vger.kernel.org>; Mon, 29 Apr 2024 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.211.30.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714380852; cv=none; b=ELbaumrlmquGQg2oUe8cesXT/e3OK3eBn3vAZwkqsw36OVfupqsTe6EEwLkthsxUZwXLG9pMVvKMcRBpiF4Z/Iqdyblfb8aBdjXt+quZl6rpVbAOnbPQ/XnXBQbLnbLlslkvvQ+GDuPxhoMG/KFy62VwtARV8ae5Q348A99p0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714380852; c=relaxed/simple;
	bh=39/LY3r7dvVvCjMdt27gl95vbrEuu8DvmfjktGo/Bk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtVvTDo5xOdQhCWYA0lESSZeB2o9x+VxFSLSRikwj6vu2XI66VhNptd0Wvudqydvg8JmBRPdBbxXZXDnocIwe/ixH7s2D8zFZsEDxRaj6pkCcDy0tGrucVc6+eqqGyxq4ddUbi0EP5rkmkd9ZFSrvENee0MBxBE25WlDneDtT6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=none smtp.mailfrom=queasysnail.net; arc=none smtp.client-ip=207.211.30.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=queasysnail.net
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-ZW5VIqNkMmGdttBEc-vIJA-1; Mon,
 29 Apr 2024 04:54:00 -0400
X-MC-Unique: ZW5VIqNkMmGdttBEc-vIJA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E4A538000A9;
	Mon, 29 Apr 2024 08:53:58 +0000 (UTC)
Received: from hog (unknown [10.39.193.137])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B198740BB4E;
	Mon, 29 Apr 2024 08:53:48 +0000 (UTC)
Date: Mon, 29 Apr 2024 10:53:47 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: j.granados@samsung.com
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Ahern <dsahern@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	Remi Denis-Courmont <courmisch@gmail.com>,
	Allison Henderson <allison.henderson@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
	Jan Karcher <jaka@linux.ibm.com>,
	"D. Wythe" <alibuda@linux.alibaba.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, Martin Schiller <ms@dev.tdt.de>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Simon Horman <horms@verge.net.au>, Julian Anastasov <ja@ssi.bg>,
	Joerg Reuter <jreuter@yaina.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dccp@vger.kernel.org,
	linux-wpan@vger.kernel.org, mptcp@lists.linux.dev,
	linux-hams@vger.kernel.org, linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-afs@lists.infradead.org,
	linux-sctp@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	linux-x25@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	lvs-devel@vger.kernel.org
Subject: Re: [PATCH v5 1/8] net: Remove the now superfluous sentinel elements
 from ctl_table array
Message-ID: <Zi9gG82_OKnLlFI2@hog>
References: <20240426-jag-sysctl_remset_net-v5-0-e3b12f6111a6@samsung.com>
 <20240426-jag-sysctl_remset_net-v5-1-e3b12f6111a6@samsung.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240426-jag-sysctl_remset_net-v5-1-e3b12f6111a6@samsung.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

2024-04-26, 12:46:53 +0200, Joel Granados via B4 Relay wrote:
> diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
> index 6973dda3abda..a84690b13bb9 100644
> --- a/net/core/sysctl_net_core.c
> +++ b/net/core/sysctl_net_core.c
[...]
> @@ -723,12 +722,11 @@ static __net_init int sysctl_core_net_init(struct net *net)
>  		if (tbl == NULL)
>  			goto err_dup;
>  
> -		for (tmp = tbl; tmp->procname; tmp++)
> -			tmp->data += (char *)net - (char *)&init_net;

Some coding style nits in case you re-post:

> +		for (int i = 0; i < table_size; ++i)

move the declaration of int i out of the for (), it's almost never
written this way (at least in networking)

> +			(tbl + i)->data += (char *)net - (char *)&init_net;

                        tbl[i].data = ...

is more in line with other similar functions in the rest of net/


[...]
> diff --git a/net/mpls/af_mpls.c b/net/mpls/af_mpls.c
> index 6dab883a08dd..ecc849678e7b 100644
> --- a/net/mpls/af_mpls.c
> +++ b/net/mpls/af_mpls.c
[...]
> @@ -2674,6 +2673,7 @@ static const struct ctl_table mpls_table[] = {
>  
>  static int mpls_net_init(struct net *net)
>  {
> +	size_t table_size = ARRAY_SIZE(mpls_table);

This table still has a {} as its final element. It should be gone too?

-- 
Sabrina


