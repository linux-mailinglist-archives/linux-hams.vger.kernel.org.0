Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F67674CB0
	for <lists+linux-hams@lfdr.de>; Fri, 20 Jan 2023 06:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjATFmu (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 20 Jan 2023 00:42:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbjATFmh (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 20 Jan 2023 00:42:37 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B27D30E0
        for <linux-hams@vger.kernel.org>; Thu, 19 Jan 2023 21:42:17 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id w11so2834297lfu.11
        for <linux-hams@vger.kernel.org>; Thu, 19 Jan 2023 21:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaOgLjjG/NeNDnxWkKZI3+sO/gO9gejlyZI7M7Hfz4w=;
        b=jHPZjLs0oHrY8hySPq5EZGQb8/bwn15YPRTRgE+JdVgA2dAvjShHB1+456jbUWyt99
         j9ZrLRdT3sseVc1Sf1wLQfPAULya5eotTGY5qK/PU7FO3U5MXx/roUa1gC5i3X689Sx/
         ZbqoC9OLIGbjLpZABakN8DjP0doeGsjWJuysXyukVacY0XNo6uS9cKUkdvH1xAG/SNhF
         YUd5TAY89YQs73X9tqwXuBvo6vGeldjXdmSJmRn2dXn5054WrLS7TcqN6gbRy3FBUqmA
         eMHWmhJzx+rt9jUbR2Le3qOBE1Bh3HMbUWzg1FyTVR+C1HVF8IvmvTzJKbglL/drxHJ0
         1VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaOgLjjG/NeNDnxWkKZI3+sO/gO9gejlyZI7M7Hfz4w=;
        b=UmGckc5WTnFn+YHp361P+5TIzcWAivDPOYkyJJexnfNfzS8L3y4BSYaCxOio8TRhkt
         3mJAI6uPFu7ZfeutBsMMuIM3lbYVK/dV78364L6a9MlK/8SRTflo10MfhxPUJ50a4oxD
         ZUvTVnSMjF9QPEcEbgW5xzaG/4+ptQHLJGLclRPYEf//4nCJXZyRs8IhrCZXBX3RQQv7
         fm1l9vEV0kAcrmTp4Xd3Sdw1v7ugv1x7RSOPHaD3Qu5ye6nhB3qhftsFuXRfrA4RzHiK
         VqzCfAZNfOW0G+7+JB9jEruaUAQGXXZEox3qt6AA1u8Kp5wYk2PkKbmjxrFq+bK2FTbQ
         scCg==
X-Gm-Message-State: AFqh2kp7Wl7AWefKKoHolUGDhh/mV6a9pDaiOcd7dk94TR8lX3feG3S5
        ZooDdfoMkxvhtenp4lJEEUKIHc8WsKyCghcoOSHJk/QC2xI=
X-Google-Smtp-Source: AMrXdXsAHO9pjowSKuV3xBbKxC330cAr5To5qhDxlAu4cD/isn0Ixm8JSghwDt7Mj6QtajkU8HeOnimbglHa9cDg3BI=
X-Received: by 2002:a05:6512:1107:b0:4d0:570c:2c2a with SMTP id
 l7-20020a056512110700b004d0570c2c2amr874824lfg.208.1674193335394; Thu, 19 Jan
 2023 21:42:15 -0800 (PST)
MIME-Version: 1.0
References: <CANnsUMFRCJ1rszt-67GywV4_pU0yyW56dis1iSnSO9f23-oa=w@mail.gmail.com>
 <153d9f95-3c7c-1361-49d9-ca7707b93f98@trinnet.net>
In-Reply-To: <153d9f95-3c7c-1361-49d9-ca7707b93f98@trinnet.net>
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Thu, 19 Jan 2023 21:42:03 -0800
Message-ID: <CANnsUMF1i+oZ6oGWNkv=LK7HnNm0BtdjCmVF_0B1C977UTtHvw@mail.gmail.com>
Subject: Re: AX.25 Patches and the 5.15.89 Kernel tree?
To:     David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

They have their kernel on Gethub, and I just reported it as a bug and
posted the patch.  They jumped on that fast!  And it is now in the
current source, so should be in the next binary push.

-Chris KQ6UP

On Thu, Jan 19, 2023 at 8:56 PM David Ranch <dranch@trinnet.net> wrote:
>
>
> Hey Chris,
>
> Thank you for getting those AX.25 fixes backported into the Raspberry Pi =
kernel.  I'm curious, who did you work with to make that happen?  With that=
 said, getting many other Linux distributions to "inherit" the fixes from t=
he
> upstream Linux-next sources ( https://git.kernel.org/pub/scm/linux/kernel=
/git/next/linux-next.git ) is not automatic and some of these distros argua=
bly manage their kernels in a very similar way to how the Raspberry Pi Foun=
dation manages theirs.  This means you might need to start a conversation w=
ith Canonical devs, Redhat devs, Fedora devs, etc.
>
> It's a rather VERY frustrating process to get fixes backported into exist=
ing distro kernel releases via their "bug fix" program.
>
> --David
> KI6ZHD
>
>
>
>
> On 01/19/2023 06:30 PM, Chris Maness wrote:
>
> Thanks for fixing the AX.25 issues, I was able to get them backported
> to the Raspberry Pi source tree for the current version.  However, for
> desktop Linux distros, they are generally running some iteration of
> 5.15 as well.  I pulled the latest from kernel.org and compared it to
> my pi code that has the patches committed, and I see that the latest
> (5.15.89) does not have the patches committed.  Is there any way you
> guys could commit to that tree to?  I have not attempted a checkout
> for kernel code before and feel a tad intimidated to do so.
>
> VY 73 de Chris KQ6UP
>
>


--=20
Thanks,
Chris Maness
