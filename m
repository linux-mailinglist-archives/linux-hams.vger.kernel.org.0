Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2CE630F36
	for <lists+linux-hams@lfdr.de>; Sat, 19 Nov 2022 15:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbiKSOwh (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 19 Nov 2022 09:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiKSOwg (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 19 Nov 2022 09:52:36 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9436A7FC22
        for <linux-hams@vger.kernel.org>; Sat, 19 Nov 2022 06:52:35 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id u11so10061961ljk.6
        for <linux-hams@vger.kernel.org>; Sat, 19 Nov 2022 06:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tq8NKCo/IRQrHANUtX7hNmqcpxyoqb/UB7vKSlvQ8ow=;
        b=mwQUBzLxjRofffSeoLmJa3+D6AE8W9sBPCatheBhesU15dEhgp63r7PUuKxuAnH8Mt
         8tHQu+qrHktDHxKc6pKj3mmFI3gSwSvVJI2BoLwvP6/12I30fKZEImFxQl+6Lmiipacp
         bDuKG59MjIb/5bBl4M1lR5UpGb279cBnuYhs1DWOam6STqmyp/tuwbEDCwXn8Bu/+u97
         SB44A+60JEEzi+sDHmaw2BaO5kliIFYVm68QJWT/f1uWJpVZg5hKyoYg6Ve2BjyNs0Ws
         MdR8DDigOqBpEYyHR/AIOhR5nUyCDQqsdi8+MaUISVopnpGQDK8K7UCiOUroxqdSzGJH
         lNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tq8NKCo/IRQrHANUtX7hNmqcpxyoqb/UB7vKSlvQ8ow=;
        b=FqjuzvdkXHucfalgW6foXnqT5LACtbLgeGqBEZIRAD/6aWglme436jhKHqcd6QQKVh
         b/w7uGwNrIl+Neukk4fWeUEklMCuwq9u2XfIQstDeLQjVDAVT1NbEkbLZFJBltn4BaZx
         BiCWHnXXZ+KTRl1gfb6r32MWYejeHwN5stX8zyLjxFOEKdE8k1mjv8BgoIbge2Vu6Cjc
         SObuWf/hYTUXfXcn86iJLtRn/0mxTU+wMvJUtJz7MLhs4P8Tu666kPC0118fvw+oFHSX
         3FsAamt5l0p4SAI3ib3oLWbZDFMN6TJJaJEpzvx6k22sPDjSi2hoMOGoupsHFCb1QBlR
         a2gw==
X-Gm-Message-State: ANoB5pkxfMy3jy3Wso8uXjF9rJCf2b1adNgUiN0pO7bw442Wlh1pj9rM
        yiVjHgAPAyeWWuXrO/8cQSN9bn3E9XjaRnJUP3dxQI9YEjw=
X-Google-Smtp-Source: AA0mqf7gzX/q+56wBP0KAVT2G0gcZXuunBNmO4DKWJYal+8E79MCjle8OEnMbIJm6+rSKn5d+rheLb1Nu2kiq8QM63U=
X-Received: by 2002:a05:651c:110a:b0:26d:e85b:92af with SMTP id
 e10-20020a05651c110a00b0026de85b92afmr3504964ljo.464.1668869553285; Sat, 19
 Nov 2022 06:52:33 -0800 (PST)
MIME-Version: 1.0
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Sat, 19 Nov 2022 06:52:41 -0800
Message-ID: <CANnsUMFpKwPWKNaE9=E7_85z_q0O81QsNr039_j9bK757TnsOw@mail.gmail.com>
Subject: Join
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

-- 
Thanks,
Chris Maness
