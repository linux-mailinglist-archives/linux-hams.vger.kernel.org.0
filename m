Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90DD7E2455
	for <lists+linux-hams@lfdr.de>; Mon,  6 Nov 2023 14:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbjKFNUo (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 6 Nov 2023 08:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjKFNUn (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 6 Nov 2023 08:20:43 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675DED45
        for <linux-hams@vger.kernel.org>; Mon,  6 Nov 2023 05:20:40 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6B2C433D9;
        Mon,  6 Nov 2023 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699276840;
        bh=LWu2ijjbw3+l7OVawD8UrZdOZNUfi0BIHSzpOLinvZQ=;
        h=Date:From:To:Subject:From;
        b=WB2EXuPTcHCbd4U0nty4ctaUDVu/EDe7x63O9A4+eoZ33CRSm6N3mIhbG9EjF0vLl
         QR3HGcdk5HeIYMfvMhaPTncjUDVTD/UpH2Nh9SzA20qT9yP1C0rhzX3Hf00+KWX/yK
         Puh1w6u5UcL5ts4wQpyV+IGpunSoHL2mjjHW1izE=
Date:   Mon, 6 Nov 2023 08:20:38 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-hams@vger.kernel.org
Subject: PSA: migrating linux-hams to new vger infrastructure
Message-ID: <20231106-optimal-dazzling-pigeon-5aedab@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Good day!

I plan to migrate the linux-hams@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
