Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7656998DA
	for <lists+linux-hams@lfdr.de>; Thu, 16 Feb 2023 16:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjBPP1E (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 16 Feb 2023 10:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjBPP1D (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 16 Feb 2023 10:27:03 -0500
Received: from mail-yw1-x1142.google.com (mail-yw1-x1142.google.com [IPv6:2607:f8b0:4864:20::1142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B07155E57
        for <linux-hams@vger.kernel.org>; Thu, 16 Feb 2023 07:26:24 -0800 (PST)
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-5339759be1cso15706227b3.3
        for <linux-hams@vger.kernel.org>; Thu, 16 Feb 2023 07:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conferencedatalist.com; s=google;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rio92At0sOIu/IWYYBib7d781COwumWXxhMg48MIfsQ=;
        b=CpRmosxfGNIAd002oCrIO2Wz9BHa1eUOKcNnOs5vlr6sEU+OqEol0ZTP9t5bvJYubb
         ngBbfyExLQtFARzzShu4kBUq0QADGLDc+4aw/mm+aYwI9c7xM4Y4WdStqMdqw1C9zkvZ
         qkjBAqiHcIhB7xTOWqPtrzpwMgmYLf/12ZcEn8hKS5GceFuuT/KC//9al2F9xQb4Cxxr
         kz1g4rjZGkssMAo+FVViYVf11hJdfaEbNI0jKcm+SGf62bQI043OPSNQeItZ+1FBVO/Q
         0Zq/DG0q1/872cnG6JBDTWsUlxI6XpJxEgwlaWQwsiX7bv+Xx1fyQ0+rutq/o4eNnk45
         88Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rio92At0sOIu/IWYYBib7d781COwumWXxhMg48MIfsQ=;
        b=OjsqYWIC9Cy1+puCfigRUTrf9NbF13fTIR44Gtq87xE1/naaZIb2ZQlH2AVx1n0k5B
         uHXjLYJaSsdCgren29c4U2iVoT1vhlgaWwzIXAjRckOFlquwoK7iod6hzJw6ss0NS+LK
         lg4tMgXHp1U9C6LglvO3EiN7Nym8Z9u+8QOdKSkF3tz6dPv94h9/lHqZ6fP3OyB23Bjw
         PnVSW1YC5i/RCa2oNTc20CRhNJZO++AbQ4laO1al9g9j2/pZ0KySwgo4X5z/CqF1vFcI
         9mxDvp1rvso9FIL/9BwbOMKjE168cTKToyf9OnyDp86PiN4DcOw6VNxHweocivoUz4Tb
         dFxg==
X-Gm-Message-State: AO0yUKXUFFW97aA9/MgxaOE9789KXKw40E6h5JtGUoNTG+jXF/IGZMO4
        loPHcSACvHGxZbN5TZkyAoh4ytNcFGj1p8Aa1qUOuw==
X-Google-Smtp-Source: AK7set/k9LYrq4F79+CfwR37KcO/dGw0uGJD+RWrrt3WVGT1Gzrn8inC8JFjZZHusi+KPhGcj6jfhrM8+eKadELmi/8=
X-Received: by 2002:a81:fd12:0:b0:4f0:64a3:725a with SMTP id
 g18-20020a81fd12000000b004f064a3725amr820885ywn.229.1676561183526; Thu, 16
 Feb 2023 07:26:23 -0800 (PST)
MIME-Version: 1.0
From:   Mary John <maryjohn@conferencedatalist.com>
Date:   Thu, 16 Feb 2023 09:28:19 -0600
Message-ID: <CAJxfvDYFv7uxt8CWjfUpOuVm5V7incUxv0W5DGpOJwa42gNLQQ@mail.gmail.com>
Subject: RE: NAB Show Attendees Data Lists-2023
To:     Mary John <maryjohn@conferencedatalist.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,
        FILL_THIS_FORM_LONG,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi,

I hope you=E2=80=99re doing well!

Would you be interested in acquiring NAB Show attendees Data Lists 2023?

List Includes:- Clinic/Org Name, First Name, Last Name, Full Name,
Contact Job Title, Verified Email Address, Website URL, Mailing
address, Phone number, Industry and many more=E2=80=A6

Number of Contacts    :-       45,724 Opt-in Contacts.
Cost                             :-      $1,479

Interested? Email me Back, I would love to provide more information on the =
list.

Kind Regards,
Mary John
Marketing Coordinator

If you do not wish to receive future emails from us, please reply as 'leave=
 out
