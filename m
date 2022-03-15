Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82EE34DA4A5
	for <lists+linux-hams@lfdr.de>; Tue, 15 Mar 2022 22:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237103AbiCOVeA (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 15 Mar 2022 17:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237319AbiCOVd7 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 15 Mar 2022 17:33:59 -0400
Received: from yagi.h-net.msu.edu (yagi.h-net.msu.edu [35.9.18.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22F34CA
        for <linux-hams@vger.kernel.org>; Tue, 15 Mar 2022 14:32:46 -0700 (PDT)
Received: from yagi.h-net.org (unknown [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP id 3304328BA6B
        for <linux-hams@vger.kernel.org>; Tue, 15 Mar 2022 17:32:45 -0400 (EDT)
X-Virus-Scanned: amavisd-new at example.com
Received: from yagi.h-net.msu.edu ([127.0.0.1])
        by yagi.h-net.org (yagi.h-net.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4mk1wrxCG1-P for <linux-hams@vger.kernel.org>;
        Tue, 15 Mar 2022 17:32:44 -0400 (EDT)
Received: from yagi.h-net.org (localhost [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP
        for <linux-hams@vger.kernel.org>; Tue, 15 Mar 2022 17:32:44 -0400 (EDT)
To:     linux-hams@vger.kernel.org
From:   Dennis Boone <drb@msu.edu>
Subject: Loss of connection state?
Reply-to: drb@msu.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <14067.1647379964.1@yagi.h-net.org>
Date:   Tue, 15 Mar 2022 17:32:44 -0400
Message-Id: <20220315213245.3304328BA6B@yagi.h-net.msu.edu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Folks,

Here's an axlisten dump of an incoming ax25 session.  The path between
my station (KB8ZQZ) and the other end (W8TCC) is a little marginal, and
some packets are occasionally lost.

Once my end received the RR1+ at 21:02:20, should it not have resent the
I01 packet?  Is this bug in my understanding, or in the linux kernel?

nino: fm W8TCC to KB8ZQZ ctl SABM+ 21:01:33.281614 
nino: fm KB8ZQZ to W8TCC ctl UA- 21:01:33.306663 
nino: fm KB8ZQZ to W8TCC ctl I00^ pid=F0(Text) len 70 21:01:33.320522 
0000  P2P only; note that if I can't reach you direct, I cannot respon
0040  d P2PM
nino: fm KB8ZQZ to W8TCC ctl I01+ pid=F0(Text) len 55 21:01:33.341994 
0000  ;FW: KB8ZQZM[Pat-0.12.1-B2FHMG$]M; W8TCC DE KB8ZQZ ()>M
nino: fm W8TCC to KB8ZQZ ctl RR1v 21:01:38.125616 
nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:01:48.296217 
nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:02:08.775673 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:02:20.726051 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:02:20.734985 
nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:02:39.495671 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:05.669523 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:05.678565 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:12.782127 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:12.791099 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:17.868836 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:17.879992 
nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:03:20.454989 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:25.586093 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:25.599152 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:30.669941 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:30.679536 
nino: fm W8TCC to KB8ZQZ ctl DMv 21:03:38.636458 

(Scattered stray M characters were reverse video in the color original,
representing carriage returns.  Don't think that's relevant here.)

De
