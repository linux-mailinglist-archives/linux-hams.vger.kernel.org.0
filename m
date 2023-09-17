Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 282057A366E
	for <lists+linux-hams@lfdr.de>; Sun, 17 Sep 2023 17:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236169AbjIQPbn (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 17 Sep 2023 11:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237988AbjIQPbh (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 17 Sep 2023 11:31:37 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716E7CE9
        for <linux-hams@vger.kernel.org>; Sun, 17 Sep 2023 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1694964627; x=1695223827;
        bh=r9tNyhYUviuUIEjOuqr/xK8XRYTBBhupTvy6oQw3GAo=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=iJhtsrVLAM+MN352MItoeVXIZAmzRmi64/3kba/5ayqO6ZUeikmUWrIfeG1WARKr7
         SlGe4kY/YIUWmwDvHEPbb7hLAUPhTdUApEe7pWEnQjrBsQxUReIzzUmJID2CBOwlrD
         ATLD055icLaFwn+2Q89JzofuRnqXTKDnED7z7S7g+UISYO4uZqmtKiqVmELfvkpjBp
         8okehxph3hDO/FrJOZoV+qTGVV7u0bZZFG/mlsFIiM/89CCFxc4BzHPW9dLyFOifQE
         nvmJhcQFp/iMNKyEiPnE73J+jxHZoiuXgxD7Xjh6Y9ELSfHWvF8ax3I3xKrhqC65Bo
         YksA78WGaxOsQ==
Date:   Sun, 17 Sep 2023 15:30:21 +0000
To:     linux-hams@vger.kernel.org
From:   Peter Lafreniere <peter@n8pjl.ca>
Cc:     Peter Lafreniere <peter@n8pjl.ca>, thomas@osterried.de,
        netdev@vger.kernel.org, ralf@linux-mips.org
Subject: [PATCH 3/3] ax25: Kconfig: Update link for linux-ax25.org
Message-ID: <20230917152938.8231-4-peter@n8pjl.ca>
In-Reply-To: <20230917152938.8231-1-peter@n8pjl.ca>
References: <20230908113907.25053-1-peter@n8pjl.ca> <20230917152938.8231-1-peter@n8pjl.ca>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

http://linux-ax25.org has been down for nearly a year. Its official
replacement is https://linux-ax25.in-berlin.de. Change all references to
the old site in the ax25 Kconfig to its replacement.

Link: https://marc.info/?m=3D166792551600315
Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 net/ax25/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/net/ax25/Kconfig b/net/ax25/Kconfig
index d3a9843a043d..fdb666607f10 100644
--- a/net/ax25/Kconfig
+++ b/net/ax25/Kconfig
@@ -10,7 +10,7 @@ menuconfig HAMRADIO
 =09  If you want to connect your Linux box to an amateur radio, answer Y
 =09  here. You want to read <https://www.tapr.org/>
 =09  and more specifically about AX.25 on Linux
-=09  <http://www.linux-ax25.org/>.
+=09  <https://linux-ax25.in-berlin.de>.
=20
 =09  Note that the answer to this question won't directly affect the
 =09  kernel: saying N will just cause the configurator to skip all
@@ -61,7 +61,7 @@ config AX25_DAMA_SLAVE
 =09  configuration. Linux cannot yet act as a DAMA server.  This option
 =09  only compiles DAMA slave support into the kernel.  It still needs to
 =09  be enabled at runtime.  For more about DAMA see
-=09  <http://www.linux-ax25.org>.  If unsure, say Y.
+=09  <https://linux-ax25.in-berlin.de>.  If unsure, say Y.
=20
 # placeholder until implemented
 config AX25_DAMA_MASTER
@@ -87,9 +87,9 @@ config NETROM
 =09  A comprehensive listing of all the software for Linux amateur radio
 =09  users as well as information about how to configure an AX.25 port is
 =09  contained in the Linux Ham Wiki, available from
-=09  <http://www.linux-ax25.org>. You also might want to check out the
-=09  file <file:Documentation/networking/ax25.rst>. More information about
-=09  digital amateur radio in general is on the WWW at
+=09  <https://linux-ax25.in-berlin.de>. You also might want to check out
+=09  the file <file:Documentation/networking/ax25.rst>. More information
+=09  about digital amateur radio in general is on the WWW at
 =09  <https://www.tapr.org/>.
=20
 =09  To compile this driver as a module, choose M here: the
@@ -106,9 +106,9 @@ config ROSE
 =09  A comprehensive listing of all the software for Linux amateur radio
 =09  users as well as information about how to configure an AX.25 port is
 =09  contained in the Linux Ham Wiki, available from
-=09  <http://www.linux-ax25.org>.  You also might want to check out the
-=09  file <file:Documentation/networking/ax25.rst>. More information about
-=09  digital amateur radio in general is on the WWW at
+=09  <https://linux-ax25.in-berlin.de>.  You also might want to check out
+=09  the file <file:Documentation/networking/ax25.rst>. More information
+=09  about digital amateur radio in general is on the WWW at
 =09  <https://www.tapr.org/>.
=20
 =09  To compile this driver as a module, choose M here: the
--=20
2.42.0


