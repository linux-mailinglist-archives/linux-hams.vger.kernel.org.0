Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342FF51093D
	for <lists+linux-hams@lfdr.de>; Tue, 26 Apr 2022 21:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354165AbiDZTmw (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 26 Apr 2022 15:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345512AbiDZTmw (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 26 Apr 2022 15:42:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEDCF99C9
        for <linux-hams@vger.kernel.org>; Tue, 26 Apr 2022 12:39:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9006061AC3
        for <linux-hams@vger.kernel.org>; Tue, 26 Apr 2022 19:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE543C385AA;
        Tue, 26 Apr 2022 19:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651001983;
        bh=KkDnkCg/JFAxyOhXKTUX60IGcXirjWY0qVr+2xp7p7A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hkjiS3vRcgCjTYBif9K04UToj/JG/sdqL37ylQGMybuUG3fPReUi3XbYaLU6OOf7o
         lJ2Uzn4c67KF7YEh50sCjmEh8ucdF28JueP07G3STnLbdybWc/ykFPyUAaezcGHbew
         jGRY7csl5Fx8UuK3qC9rx4WYRUfTd3UptIx+MnTjsSRKK21W8Y5durSywfim/anufR
         WeoX9uXO1zheeMEZqQqFPpoO0fyIYyy4VTwkSrMV4XU1Q9VXAI5Sdn4R32CxOMCssY
         myIkz1ev6JPpdMZYWutkSnTueMFYawjJFE5+ZhpIwstZgLepv8z7kxM2z4p2hdlt7a
         I2qBsYzn1pfNQ==
Date:   Tue, 26 Apr 2022 12:39:41 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Thomas Osterried <thomas@osterried.de>
Cc:     linux-hams@vger.kernel.org, jreuter@yaina.de, arnd@arndb.de
Subject: Re: [PATCH net-next 6/6] net: hamradio: remove support for DMA SCC
 devices
Message-ID: <20220426123941.5c6643ee@kernel.org>
In-Reply-To: <YmhACVaakjATNFl4@x-berg.in-berlin.de>
References: <20220426175436.417283-1-kuba@kernel.org>
        <20220426175436.417283-7-kuba@kernel.org>
        <YmhACVaakjATNFl4@x-berg.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Tue, 26 Apr 2022 20:55:05 +0200 Thomas Osterried wrote:
> Jakub informed, that the dmascc driver will be removed from kernel.
> 
> I think, Jakub's descision should be discussed here on the list, by the users.

Thanks a lot for the forward!

> DMASCC is the "high speed DMA" driver.
> SCC driver (also with Z8530) will be left in the kernel.
> 
> Hmm, I cannot really understand the decision of kickoff for DMASCC, and
> why the code "older" SCC ISA-bus cards will be kept.

We are infamously bad at deciding when to retire code in the kernel,
the arbitrary rule I used now was "does it depend on VIRT_TO_BUS".
I figured the non-DMA SCC will go when ISA goes.
