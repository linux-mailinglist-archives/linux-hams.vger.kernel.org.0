Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB3340FCDF
	for <lists+linux-hams@lfdr.de>; Fri, 17 Sep 2021 17:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbhIQPmh (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 17 Sep 2021 11:42:37 -0400
Received: from yagi.h-net.msu.edu ([35.9.18.40]:51064 "EHLO yagi.h-net.msu.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233735AbhIQPmh (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Fri, 17 Sep 2021 11:42:37 -0400
X-Greylist: delayed 378 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 Sep 2021 11:42:37 EDT
Received: from yagi.h-net.org (unknown [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP id DE6B832983F
        for <linux-hams@vger.kernel.org>; Fri, 17 Sep 2021 11:34:56 -0400 (EDT)
X-Virus-Scanned: amavisd-new at example.com
Received: from yagi.h-net.msu.edu ([127.0.0.1])
        by yagi.h-net.org (yagi.h-net.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oSl7CX3QjAKh for <linux-hams@vger.kernel.org>;
        Fri, 17 Sep 2021 11:34:56 -0400 (EDT)
Received: from yagi.h-net.org (localhost [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP
        for <linux-hams@vger.kernel.org>; Fri, 17 Sep 2021 11:34:56 -0400 (EDT)
References: <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at> 
To:     linux-hams@vger.kernel.org
From:   Dennis Boone <drb@msu.edu>
Subject: Re: unknown kiss packet: 0x80 0x9e
In-reply-to: (Your message of Fri, 17 Sep 2021 17:21:56 +0200.)
             <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49226.1631892896.1@yagi.h-net.org>
Date:   Fri, 17 Sep 2021 11:34:56 -0400
Message-Id: <20210917153456.DE6B832983F@yagi.h-net.msu.edu>
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

 > unknown kiss packet: 0x80 0x9e
 > unknown kiss packet: 0x20 0x9e

If 0x80 and 0x20 are the second byte of the frame (after the FEND), then
they're data packets (low nibble 0) from devices addressed (high nibble)
as 8 and 2 respectively.

De
