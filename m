Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB25742ED79
	for <lists+linux-hams@lfdr.de>; Fri, 15 Oct 2021 11:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237205AbhJOJXl (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 15 Oct 2021 05:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234769AbhJOJXk (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 15 Oct 2021 05:23:40 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890B8C061570
        for <linux-hams@vger.kernel.org>; Fri, 15 Oct 2021 02:21:34 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id bp7so3342265qkb.12
        for <linux-hams@vger.kernel.org>; Fri, 15 Oct 2021 02:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6mzgk3Q/ZKfmvfS3GQVhP4B7iaIuE1nOmBdFL4ICsOc=;
        b=OXGNFl3q9M0BAUU7hFW4z0wrtUn5865cXAhGdQquujaHtvO/ZRSrq8/4B1X3DgQ+Nn
         2gMDF++bkjnwoGGmlh96042R7eg1xHkbpfiL+uoQRcsekf96fnmxZZZsV1Xv0+70bgnS
         hKkBR2JdTmlEWlTUX3Fwe7uXe/CTivK3aIEgzr9b95nLtLDAPAa62AsRpxZsDu1r+YTl
         OLXal27zhngRHTtmJ3lmfs6UgI8sDv0aos62hYvD5S+cGjQsBITi00hxQmedHDnyrWuW
         yYtzpqGoQbHF//OotGJ3NU6HU1Wbvl2VLvJ3RDkj66lQ+gq+w6Nxo1zNV/eiOPbWKMAL
         lMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6mzgk3Q/ZKfmvfS3GQVhP4B7iaIuE1nOmBdFL4ICsOc=;
        b=UHTehqwheVMLpb+LJqOy8hV/zwgKgQXZpi9IQCri6aNyaP8djKTE7AzxqyEccDNGjp
         hAbC91FT6ZY2hkTWpDlpHfh1QDZ5GSFakORUhtvsAM7j1sH8PHIyNbJd6UqMIEQyYzY3
         szJfFjaJyQSMLrwVJ3tE4V00LHyvPZOu5ZUDA0EVKPAijpeQugrlqFuEkpKfOSc/6W0f
         vVK3HpqR9YS9RBbhAxUCzK/JlvvzLQ6UCz+dLhC/YE6W8Y7bS0u7/tT1AO+T3wEjEJsq
         zgOCbs7ioXbCbSdmhJtyKmBw7CPUNbYVTQ+gkJX8a30q4Ih8Os+WXALTQYUpsjOciTco
         5GLg==
X-Gm-Message-State: AOAM533XeYXPiG8FcUrHl2zEfFPPYD/LLiiRP1NyAQpFYixpBnsSevLp
        sGf8LmEh11zN3Vr+9e2+6n2gbSxkW77IVaBIDmo0kXta
X-Google-Smtp-Source: ABdhPJxL3gLeTTrrSwbcc6oN3Qh55gp6kQcuo1nJs26e8jT2QQa0K7PXVCiMDzkHqmds5Yz3MA3ouYQ2pFgmDgNnQSM=
X-Received: by 2002:a05:620a:1788:: with SMTP id ay8mr1074839qkb.332.1634289693700;
 Fri, 15 Oct 2021 02:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <YPp7qeWGSW/s4TI6@linux-mips.org> <b94e876a-b629-48bb-1497-bbed6c43ee9d@blackspace.at>
 <700e0381-4e63-54b0-7068-46e5fa4f1d40@blackspace.at>
In-Reply-To: <700e0381-4e63-54b0-7068-46e5fa4f1d40@blackspace.at>
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Fri, 15 Oct 2021 11:21:22 +0200
Message-ID: <CAH4uzPMdsLG8eKszj-HW19ifSzyDDyok9mcO1nNWNjrmeQ_iOw@mail.gmail.com>
Subject: Re: Status of the stuck sockets bugs.
To:     Roland Schwarz <roland.schwarz@blackspace.at>
Cc:     linux-hams@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi,

Any status update on the 'stuck sockets bug'?

73! Dave

Op za 31 jul. 2021 om 18:05 schreef Roland Schwarz
<roland.schwarz@blackspace.at>:
>
> Partly answering my question by myself:
>
> Am 30.07.21 um 13:47 schrieb Roland Schwarz:
>  > I guess what I am observing is an incarnation of the "stuck sockets
>  > bug", yes?
>
> I applied YO2LOJ's changes to the current sources and verified that now
> the connection is not left stuck in listening mode.
>
> What I still do not understand why the socket still signals connected
> when doing an axcall from a remote machine although there is no peer
> process connected. Is this normal behavior of the socket layer?
>
> Attached to this mail also is a (hopefully) properly formatted
> patchfile. At least I was able to apply it to a current kernel source
> tree. I also have verified that these are the only changes that have
> been introduced by YO2LOJ with respect to stock kernel.
>
> vy 73 de Roland oe1rsa
>
> --
> __________________________________________
>    _  _  | Roland Schwarz
>   |_)(_  |
>   | \__) | mailto:roland.schwarz@blackspace.at
> ________| http://www.blackspace.at
