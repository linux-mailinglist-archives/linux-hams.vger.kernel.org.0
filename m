Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B348B622053
	for <lists+linux-hams@lfdr.de>; Wed,  9 Nov 2022 00:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbiKHX26 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 8 Nov 2022 18:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKHX25 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 8 Nov 2022 18:28:57 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5AFBF63
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 15:28:56 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id B25235C0100;
        Tue,  8 Nov 2022 18:28:55 -0500 (EST)
Received: from imap45 ([10.202.2.95])
  by compute5.internal (MEProxy); Tue, 08 Nov 2022 18:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vehibberd.com;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1667950135; x=
        1668036535; bh=pALwMJKOuYK/w3NEkB3NAlNThXTplf3NNrk0aSLWUIU=; b=i
        KswhpnATSMLzCsqAmEczdlLh3Zgbw5DAVvtgYvNWaIT68rtkb5cjqdAi1Fta/F+8
        gZypZb9eDadU5yQrmWbmOqj3HxMhiir/Acsme0aJv4M5rwW/d6P3//L9F6wKaIrj
        ibIZGg8TgBdLvShYWKJ7GT0uozDF6f1QYC0kMyKWXRFTvOARjkl6uzZttqc56c/e
        tzk5VC0fkgVl2AnLTQuOvI65pCuTNJPJA5Wrj6oPe39fe9zPnRCpB10Fz9KIEynX
        mf0V2Bexf94U7cP6mfYGN0yMCJxfFdUWQf0ssLfjDL55jzihP3Vj708pY6mpC7Wq
        imGehIW0j57Cl2bqPCplQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667950135; x=
        1668036535; bh=pALwMJKOuYK/w3NEkB3NAlNThXTplf3NNrk0aSLWUIU=; b=b
        nhd/WGhE/QWM+nS/aClLzFg/XjYyTHx39TTjNhrkQFYFnFepEj6mtGNTlIUUzAKF
        sa+2SaRGFBYiys3Z9KDXE0I3cIGaKnATLGayaWj23Bokq1U5ROvRQbNQ1pWQay+f
        E3Vfusg6+0DptPBwG9+XbNGu4tfAH5DABmsNTVHnOTusM/hcrdNhIOFvV5g7L0um
        66zF+tqN0FP45N95WrdfXmlXs6cBjyXMJrk8JYtHElMVphquMmbUoCYn4WGg+TKX
        0uapOP+DJ4b7dcGYh4WKSWn+DTBsMQJS6mKQjdEt8HiNaqGgG6AZf6pDUOfpipYb
        lLeH8+of5YMHhcq9etlyg==
X-ME-Sender: <xms:N-ZqY3gesG7ScLXXmJhDDoGPUVEKhzkUQpkXDnaPKtVQdCcCyHi3gw>
    <xme:N-ZqY0Dl8srSZALcSn3oDqc6x7tfZzFXUaHV5vtrG1t4P6fcS-pjNV9nJG4-ZRt9T
    1Zl7dZf2J0iHfc3Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedfffgr
    vhgvucfjihgssggvrhgufdcuoegusehvvghhihgssggvrhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeffveeugfdvveevuddtueeivedvleehhfdtjeeuvddtkeekgfegjedvgeej
    heeuvdenucffohhmrghinhepihhnqdgsvghrlhhinhdruggvpdhlihhnuhigqdgrgidvhe
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pegusehvvghhihgssggvrhgurdgtohhm
X-ME-Proxy: <xmx:N-ZqY3F0w3ESB82o8Pu-GuGI_LoFbKaOt77JpIJ_adB1BxmXcnGHrg>
    <xmx:N-ZqY0SG5aWnqKCLblNjq-iK1V-dPCnYBOLyxdmsxTdkrE-IeI6-aA>
    <xmx:N-ZqY0wHT9SC5DyLhLkTrSKoq8rUMcO1zkRjbhZYPXxqrGAsSKoLQA>
    <xmx:N-ZqYxqWJbCuWFVhNeSiqWcYUWNsF4xJivG0DvEMgvq8kTURA8s8Hg>
Feedback-ID: i6c7042c5:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 330BA272007A; Tue,  8 Nov 2022 18:28:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <1b7d056a-6ae1-415e-bc9f-f98631c35222@app.fastmail.com>
In-Reply-To: <Y2qbfrHkKAf44cdK@x-berg.in-berlin.de>
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
 <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
 <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
 <29F7FF8E-64E6-4927-9DE6-23E98C763832@gmail.com>
 <Y2qbfrHkKAf44cdK@x-berg.in-berlin.de>
Date:   Tue, 08 Nov 2022 23:28:34 +0000
From:   "Dave Hibberd" <d@vehibberd.com>
To:     "Thomas Osterried" <thomas@osterried.de>,
        "Steven R. Loomis" <srl295@gmail.com>
Cc:     "Mike McCarthy, W1NR" <lists@w1nr.net>, linux-hams@vger.kernel.org
Subject: Re: Replacement for linux-ax25.org git?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Tagging a release on git makes it easy for us downstream to know when to=
 pull and lets our tooling know there's been a change to give us a nudge=
 to refresh it, even if there isn't the release of a tarball based on th=
at tag. it also helps keep our revision numbering cleaner than the curre=
nt package we're shipping, so that end users get the most recent version=
 also.


--=20
  Hibby
  MM0RFN

On Tue, 8 Nov 2022, at 6:10 PM, Thomas Osterried wrote:
> Hello Steven,
>
> On Tue, Nov 08, 2022 at 11:50:42AM -0600, Steven R. Loomis wrote:
>> Thanks for bringing this back.
>>=20
>> =E2=80=9CLatest Versions=E2=80=9D on the main page right hand sidebar=
 <http://linux-ax25.in-berlin.de/wiki/Main_Page> still link to the linux=
-ax25.org <http://linux-ax25.org/> URL and are thus broken.
>
> Thank you.
>
> It's recommended to use the git head anyway.
>
>
> I'll fix the links in the wiki.
> But personaly, I really dislike the "releases"-idea in the days of git.
> It's much easier to initiate "git pull" to update a previously checked=
-out
> version.
> Furthermore, if we really like to to have something like "release", we=
 need a
> mechanism that (semi-)automatically makes a new release some time after
> a commit (that has been proven bug-free).
> Else there's no benefit of using such a "release" in production, becau=
se it
> remained old and buggy.
>
> vy 73,
> 	- Thomas  dl9sau
