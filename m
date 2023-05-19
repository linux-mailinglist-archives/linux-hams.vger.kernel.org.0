Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E387B709638
	for <lists+linux-hams@lfdr.de>; Fri, 19 May 2023 13:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbjESLSN (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 19 May 2023 07:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbjESLSI (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 19 May 2023 07:18:08 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955541730
        for <linux-hams@vger.kernel.org>; Fri, 19 May 2023 04:18:04 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3063891d61aso2998992f8f.0
        for <linux-hams@vger.kernel.org>; Fri, 19 May 2023 04:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684495083; x=1687087083;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmxaI1amCfTksu6ynk2557PwK0HJxrBQmYIx/Pz5hBs=;
        b=dp+mR0vkFQD+NRcVbVyj7ZlxJiY8tXKz6Dxjt02kU/9woIUxxNMg5SvP4xJ9eDYE2l
         hEJnfKK8BrITZUJm9ghCyPg0Je/wA7ZgsYMJwVI4lH3jXGvqlwkDJtDwfhLanlOsT7wH
         hQNPeCWF3wvvAZcvRLj33th7gYZ9PBshaM63xjIgYDJS4JRwCX0aFRvKXP3BWylWimpe
         32aKHm6KkPEtxXep1GltN/NdkgyiCPA4l7PN1GNXnXbpDZBBR5hr4EY5Y5zYuEDAHe2L
         02Hos4KJ6tjKqeoN5tOyzagtXmnXAX0KjFhaRoSVPjIKvYuO1hoBO+IbePE5pb7+tpSc
         zBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684495083; x=1687087083;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmxaI1amCfTksu6ynk2557PwK0HJxrBQmYIx/Pz5hBs=;
        b=c6o8QKNYu58tAfPy31T1oKebIPtHVg/hpArN4wJZ+D7KofLGoJJ2XqxPRgsWG1TuPp
         3urfpJI7SYywtbSor16Tn7S7e3Ef+H6QKznHcz5AIj3Wv4HcZzQHRSjryfl5Gpv7wVua
         HObBNYYhGrj8c+IjCFiT8IC8YD6zNlHe+9/UJHvGTz4/FIL5QnCM8huP3+dgqYJTHpIs
         dzyiv0H33sHmFllPDhxD6rbiq+nwI2qSK9xDrIcn/oU1OdpYO5hqoBmUEoxwQ9zUEQW/
         OTQ6vkc8tDN7tsQh9Kr0NIYrnhMtcsdMMMTISBvBWMFb9FQqmPBGmpg0vfj5II1N7yat
         Go/Q==
X-Gm-Message-State: AC+VfDzqoEfl1BqYhbN9DoG1E//38OciRTfvla1iksn0+ShmE+4joc00
        9QVBzFHakgpxoiSvs8avcSUqNSi0EyP+Iyqj8/5LnOZS4HkBNw==
X-Google-Smtp-Source: ACHHUZ4GcdKjctEWmkMJD/Q5ZDCusH7zrjV+w4c4EgP8GDbM+BMa7NNuPpP4cOMUW2oAUk/kOHHzW6hqw5zKR98kQX0=
X-Received: by 2002:a17:907:1b12:b0:8b8:c06e:52d8 with SMTP id
 mp18-20020a1709071b1200b008b8c06e52d8mr1298232ejc.36.1684495062361; Fri, 19
 May 2023 04:17:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:7dab:b0:94f:7d03:8e8b with HTTP; Fri, 19 May 2023
 04:17:41 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <ninacoulibaly199@gmail.com>
Date:   Fri, 19 May 2023 04:17:41 -0700
Message-ID: <CAM7Z2JAd00KW6b=O8M27vwRnsJ1w3AmDO5tP+gSmzkaHvk6=CA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibal
