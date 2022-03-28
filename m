Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58594E8B38
	for <lists+linux-hams@lfdr.de>; Mon, 28 Mar 2022 02:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236817AbiC1A0u (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 27 Mar 2022 20:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbiC1A0t (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 27 Mar 2022 20:26:49 -0400
Received: from yagi.h-net.msu.edu (yagi.h-net.msu.edu [35.9.18.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B805F22B17
        for <linux-hams@vger.kernel.org>; Sun, 27 Mar 2022 17:25:09 -0700 (PDT)
Received: from yagi.h-net.org (unknown [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP id 6C25E12EB5
        for <linux-hams@vger.kernel.org>; Sun, 27 Mar 2022 20:25:08 -0400 (EDT)
X-Virus-Scanned: amavisd-new at example.com
Received: from yagi.h-net.msu.edu ([127.0.0.1])
        by yagi.h-net.org (yagi.h-net.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sE4rlI_PwCfZ for <linux-hams@vger.kernel.org>;
        Sun, 27 Mar 2022 20:25:07 -0400 (EDT)
Received: from yagi.h-net.org (localhost [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP
        for <linux-hams@vger.kernel.org>; Sun, 27 Mar 2022 20:25:07 -0400 (EDT)
References: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com> 
To:     linux-hams@vger.kernel.org
From:   Dennis Boone <drb@msu.edu>
Subject: Re: AX.25 Linux Packet Forwarding
In-reply-to: (Your message of Sun, 27 Mar 2022 20:18:11 -0400.)
             <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <41904.1648427106.1@yagi.h-net.org>
Date:   Sun, 27 Mar 2022 20:25:06 -0400
Message-Id: <20220328002508.6C25E12EB5@yagi.h-net.msu.edu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

 > I'd like to set up my Linux box attached to my base station to
 > forward AX.25 traffic on-frequency as a relay.

 > HT: "K3XEC-1" (Kenwood)
 > Base Station: "MYRELAY" (Yaesu)
 > Remote Station: "MYBBS"

The linux stack doesn't digipeat on its own.  There are a couple of
variants of a digi program that will add the needful.  One such is:

https://github.com/iddq/axdigi2018

All of them seem to be updates of Craig Small's original axdigi tool.

De
