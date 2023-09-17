Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66E37A366D
	for <lists+linux-hams@lfdr.de>; Sun, 17 Sep 2023 17:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjIQPbm (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 17 Sep 2023 11:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237269AbjIQPbV (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 17 Sep 2023 11:31:21 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E0530FC;
        Sun, 17 Sep 2023 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1694964615; x=1695223815;
        bh=bEXM9/dCe+EHmuHvAsUl6hwg4d9fPB916f0mispCZ8k=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=DJZe4ey53qNrzkB4T/crLs1Dzwd0YnP5ACgXY0vDYTC2QyvwfW5zkmYmPmk2n6ITe
         a5vuSYNEpcViHxEHCIoFfmD1t//GPTluNfGyMLOCTpmvWSkRrky03x/lWINhMqoEHS
         /acB72RnKyRe5IwKw9eZfeaBVIJ3T+0qU95D49z4ngiA57wStpYw7FkBtdVA7n6wd6
         lwsy1rkujXgp2ddWvOWAWxDbqjXPrcVx2RVG5LJJwg9YDjjx/vP+e6HS5XmKWuOb6q
         FvSVZyEqag+J8uRwvIAh9J7zFipfYTr3JXgSvZBz/oH0bDstnF3gsII8NwgWi5aF4D
         2qj10Guv1TY2w==
Date:   Sun, 17 Sep 2023 15:29:58 +0000
To:     linux-doc@vger.kernel.org
From:   Peter Lafreniere <peter@n8pjl.ca>
Cc:     Peter Lafreniere <peter@n8pjl.ca>, linux-hams@vger.kernel.org,
        thomas@osterried.de, corbet@lwn.net, netdev@vger.kernel.org,
        ralf@linux-mips.org
Subject: [PATCH 1/3] Documentation: netdev: fix dead link in ax25.rst
Message-ID: <20230917152938.8231-2-peter@n8pjl.ca>
In-Reply-To: <20230917152938.8231-1-peter@n8pjl.ca>
References: <20230908113907.25053-1-peter@n8pjl.ca> <20230917152938.8231-1-peter@n8pjl.ca>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

http://linux-ax25.org has been down for nearly a year. Its official
replacement is https://linux-ax25.in-berlin.de.

Update the documentation to point there instead. And acknowledge that
while the linux-hams list isn't entirely dead, it isn't what most would
call 'active'. Remove that word.

Link: https://marc.info/?m=3D166792551600315
Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
This patch is nearly identical in substance to the patch sent on 2023-09-08=
,
but included in a wider patch series that updates every reference to
linux-ax25.org treewide.

The only change is the removal of a Cc: stable@vger.kernel.org.
Please disregard the previous patch.

 Documentation/networking/ax25.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/ax25.rst b/Documentation/networking/a=
x25.rst
index f060cfb1445a..605e72c6c877 100644
--- a/Documentation/networking/ax25.rst
+++ b/Documentation/networking/ax25.rst
@@ -7,9 +7,9 @@ AX.25
 To use the amateur radio protocols within Linux you will need to get a
 suitable copy of the AX.25 Utilities. More detailed information about
 AX.25, NET/ROM and ROSE, associated programs and utilities can be
-found on http://www.linux-ax25.org.
+found on https://linux-ax25.in-berlin.de.
=20
-There is an active mailing list for discussing Linux amateur radio matters
+There is a mailing list for discussing Linux amateur radio matters
 called linux-hams@vger.kernel.org. To subscribe to it, send a message to
 majordomo@vger.kernel.org with the words "subscribe linux-hams" in the bod=
y
 of the message, the subject field is ignored.  You don't need to be
--=20
2.42.0


