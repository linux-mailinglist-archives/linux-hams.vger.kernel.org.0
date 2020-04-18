Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7608F1AF487
	for <lists+linux-hams@lfdr.de>; Sat, 18 Apr 2020 22:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgDRUMX (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 18 Apr 2020 16:12:23 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:49140 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbgDRUMX (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 18 Apr 2020 16:12:23 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 642E11273B3A2;
        Sat, 18 Apr 2020 13:12:19 -0700 (PDT)
Date:   Sat, 18 Apr 2020 13:11:00 -0700 (PDT)
Message-Id: <20200418.131100.1675181599729717011.davem@davemloft.net>
To:     xiyuyang19@fudan.edu.cn
Cc:     ralf@linux-mips.org, kuba@kernel.org, linux-hams@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        yuanxzhang@fudan.edu.cn, kjlu@umn.edu, tanxin.ctf@gmail.com
Subject: Re: [PATCH] net: netrom: Fix potential nr_neigh refcnt leak in
 nr_add_node
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1586939780-69791-1-git-send-email-xiyuyang19@fudan.edu.cn>
References: <1586939780-69791-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sat, 18 Apr 2020 13:12:19 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Date: Wed, 15 Apr 2020 16:36:19 +0800

> nr_add_node() invokes nr_neigh_get_dev(), which returns a local
> reference of the nr_neigh object to "nr_neigh" with increased refcnt.
> 
> When nr_add_node() returns, "nr_neigh" becomes invalid, so the refcount
> should be decreased to keep refcount balanced.
> 
> The issue happens in one normal path of nr_add_node(), which forgets to
> decrease the refcnt increased by nr_neigh_get_dev() and causes a refcnt
> leak. It should decrease the refcnt before the function returns like
> other normal paths do.
> 
> Fix this issue by calling nr_neigh_put() before the nr_add_node()
> returns.
> 
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>

Applied and queued up for -stable, thanks.
