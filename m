Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D317A6643
	for <lists+linux-hams@lfdr.de>; Tue, 19 Sep 2023 16:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbjISOO5 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 19 Sep 2023 10:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbjISOO5 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 19 Sep 2023 10:14:57 -0400
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6C51AC
        for <linux-hams@vger.kernel.org>; Tue, 19 Sep 2023 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695132885; x=1695392085;
        bh=vPL1MT90V5hwUBxn6nmVibwGx/TKACB+/zyKiiwt3hI=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=XJ2jy0fcgXvClcpNh0sWmuLY7c/jCyOSrEd+qn8XFgCuPNn11yNaPM2decmB3xa0d
         5OR7iplV6v3+OD+g+O/LzjHd7eiiVBnXmzd/5moakHjLDtMoW6nrIJa912pnijJrKu
         x+29Ica/T3imO2zFcLoIJiTpiKy15C3y47L6H4DXoyMA9RFbSTB8KZi/30QQO7A+pw
         qy5mUQzQDg7XVTsnTueJacUzSWAet8+hZzY/Z07D2+SywsYtshj9L2qd3sHRuEIHqt
         IC1ETP4q6infWPpf1Asctv0MN1sPuErJm0rPLbUfInB/ychBzlvdYrgpnKa7N5z9LX
         ZGrX/MEwFVBAw==
Date:   Tue, 19 Sep 2023 14:14:23 +0000
To:     linux-hams@vger.kernel.org
From:   Peter Lafreniere <peter@n8pjl.ca>
Cc:     Peter Lafreniere <peter@n8pjl.ca>, netdev@vger.kernel.org
Subject: [PATCH] hamradio: baycom: remove useless link in Kconfig
Message-ID: <20230919141417.39702-1-peter@n8pjl.ca>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

The Kconfig help text for baycom drivers suggests that more information
on the hardware can be found at <https://www.baycom.de>. The website now
includes no information on their ham radio products other than a mention
that they were once produced by the company, saying:
"The amateur radio equipment is now no longer part and business of BayCom G=
mbH"

As there is no information relavent to the baycom driver on the site,
remove the link.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 drivers/net/hamradio/Kconfig | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/hamradio/Kconfig b/drivers/net/hamradio/Kconfig
index a94c7bd5db2e..25b1f929c422 100644
--- a/drivers/net/hamradio/Kconfig
+++ b/drivers/net/hamradio/Kconfig
@@ -94,8 +94,8 @@ config BAYCOM_SER_FDX
 =09  driver, "BAYCOM ser12 half-duplex driver for AX.25" is the old
 =09  driver and still provided in case this driver does not work with
 =09  your serial interface chip. To configure the driver, use the sethdlc
-=09  utility available in the standard ax25 utilities package. For
-=09  information on the modems, see <http://www.baycom.de/> and
+=09  utility available in the standard ax25 utilities package.
+=09  For more information on the modems, see
 =09  <file:Documentation/networking/device_drivers/hamradio/baycom.rst>.
=20
 =09  To compile this driver as a module, choose M here: the module
@@ -112,8 +112,7 @@ config BAYCOM_SER_HDX
 =09  still provided in case your serial interface chip does not work with
 =09  the full-duplex driver. This driver is deprecated.  To configure
 =09  the driver, use the sethdlc utility available in the standard ax25
-=09  utilities package. For information on the modems, see
-=09  <http://www.baycom.de/> and
+=09  utilities package. For more information on the modems, see
 =09  <file:Documentation/networking/device_drivers/hamradio/baycom.rst>.
=20
 =09  To compile this driver as a module, choose M here: the module
@@ -127,8 +126,8 @@ config BAYCOM_PAR
 =09  This is a driver for Baycom style simple amateur radio modems that
 =09  connect to a parallel interface. The driver supports the picpar and
 =09  par96 designs. To configure the driver, use the sethdlc utility
-=09  available in the standard ax25 utilities package. For information on
-=09  the modems, see <http://www.baycom.de/> and the file
+=09  available in the standard ax25 utilities package.
+=09  For more information on the modems, see
 =09  <file:Documentation/networking/device_drivers/hamradio/baycom.rst>.
=20
 =09  To compile this driver as a module, choose M here: the module
@@ -142,8 +141,8 @@ config BAYCOM_EPP
 =09  This is a driver for Baycom style simple amateur radio modems that
 =09  connect to a parallel interface. The driver supports the EPP
 =09  designs. To configure the driver, use the sethdlc utility available
-=09  in the standard ax25 utilities package. For information on the
-=09  modems, see <http://www.baycom.de/> and the file
+=09  in the standard ax25 utilities package.
+=09  For more information on the modems, see
 =09  <file:Documentation/networking/device_drivers/hamradio/baycom.rst>.
=20
 =09  To compile this driver as a module, choose M here: the module
--=20
2.42.0


