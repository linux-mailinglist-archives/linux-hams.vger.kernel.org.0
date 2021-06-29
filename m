Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E562F3B7742
	for <lists+linux-hams@lfdr.de>; Tue, 29 Jun 2021 19:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhF2Res (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 29 Jun 2021 13:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbhF2Rer (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 29 Jun 2021 13:34:47 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34DEC061760
        for <linux-hams@vger.kernel.org>; Tue, 29 Jun 2021 10:32:18 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id j184so31863263qkd.6
        for <linux-hams@vger.kernel.org>; Tue, 29 Jun 2021 10:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=tvLENEQlIdoAzwVjqF8KDJPrXGYjd92ajdYPOKXYkaE=;
        b=bVseTxONpcO9M/m5KZEnnrsAk9FZKJlxdz+wNBTfkoYc8GTMjKiiaJ2eUG9Kldbbtx
         7Dk4+MjBOZE+dYXQHUpW5yzIRhkQEluEBppvXIpkR5jzSykiQm/0RrIDLZbsEuzJdF7b
         DyJvf7/6OVoRYhJroGuWIBywoVB5CiJ4qfkdbT2nYqjS6fDnybGhEcH4qCA6jaLfHaA7
         8dD5sq3iqBK9UY/3QgSv3gERSfy7qnZ5zsF0eUCepfbBJHFmkdt8wlObQk9Y9jDrWJhM
         VndBa52ZKVJbETGP8qLLBoV9FdRx1z+svMeocXLxFHcAXM6bv29lzi75g2g9OUssiH74
         7EEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=tvLENEQlIdoAzwVjqF8KDJPrXGYjd92ajdYPOKXYkaE=;
        b=DyBdwiL3l9o0uhhhWDNo7T9UUfR1y+cm8ITS95/+dWV8lPS9BAOSKCFVahuPxvLE+6
         GQdrQF2qp7Z0QkbLu7Kvx6Ci204uZ/nRMCBD+eTw1I33AkgomITbgO5LeGWYNKsrlDjz
         Z9fORTpInEel4+7hWDtxd9+HVeUtHsc/tlnhN42N9hpWVlq6YeBnpCoWO6UxZBydNVmN
         V4vbF0NWqP4T/IKFXECFwFgjNjw7ejgHlCZ/dbfLf1W9zDwv+tIKseU2iu/lBOQQgzf5
         ZMvG9/gwzTxq9CRR4CebhqHy8ADFmGsJhoCQX7vpENn9Dgdqmu8YmZJuUXWoQXVnDJft
         jRSg==
X-Gm-Message-State: AOAM532bKbJtnmiz7Kak7LtrH6X1g0AuZNNfCqET62a7z3G6gBu3+wyJ
        Hsa6BEwsdIMVTBgE2lBgxJzMLTBhNUGLEpF9+RVLu5Ab6LU=
X-Google-Smtp-Source: ABdhPJz7qV+lzJ0hN/439dSCpSLXOaehF0Pujl6/kwTh8W53qxGnIA5FlhtT2fLOLMldlYMW1BvPz1WQ9XblVTQ5sGA=
X-Received: by 2002:a05:620a:4e9:: with SMTP id b9mr31003070qkh.358.1624987938252;
 Tue, 29 Jun 2021 10:32:18 -0700 (PDT)
MIME-Version: 1.0
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Tue, 29 Jun 2021 19:32:07 +0200
Message-ID: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
Subject: Status of the stuck sockets bugs.
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

Is there any news about the well known bug regarding sockets getting
stuck in LISTENING state?

Some years ago (already) Marius Petrescu YO2LOJ wrote a patch for the
ax25_subr.c file which seems to work very well and solves the issue.
But it's really annoying having to patch the kernel with each update
again.

What about that patch, I've heard it was rejected several times for
some reason? But can't find info regarding that.
What can be done - or who is able - to get rid of this bug and get it
fixed in the kernel?

Kind regards,
Dave van der Locht
