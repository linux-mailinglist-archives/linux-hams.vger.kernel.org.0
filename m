Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 922DE16B24B
	for <lists+linux-hams@lfdr.de>; Mon, 24 Feb 2020 22:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgBXV3V (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 24 Feb 2020 16:29:21 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:38698 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgBXV3V (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 24 Feb 2020 16:29:21 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 46B36121A82E9;
        Mon, 24 Feb 2020 13:29:20 -0800 (PST)
Date:   Mon, 24 Feb 2020 13:29:19 -0800 (PST)
Message-Id: <20200224.132919.1558341613972653875.davem@davemloft.net>
To:     jbi.octave@gmail.com
Cc:     boqun.feng@gmail.com, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, kuba@kernel.org, linux-hams@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 11/30] net: netrom: Add missing annotation for
 nr_node_stop()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200223231711.157699-12-jbi.octave@gmail.com>
References: <0/30>
        <20200223231711.157699-1-jbi.octave@gmail.com>
        <20200223231711.157699-12-jbi.octave@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 24 Feb 2020 13:29:20 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

From: Jules Irenge <jbi.octave@gmail.com>
Date: Sun, 23 Feb 2020 23:16:52 +0000

> Sparse reports a warning at nr_node_stop()
> warning: context imbalance in nr_node_stop() - wrong count at exit
> The root cause is the missing annotation at nr_node_stop()
> Add the missing __releases(&nr_node_list_lock) annotation
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>

Applied.
