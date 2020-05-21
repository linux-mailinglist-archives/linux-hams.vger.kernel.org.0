Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C67F1DC7FA
	for <lists+linux-hams@lfdr.de>; Thu, 21 May 2020 09:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgEUHtH (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 21 May 2020 03:49:07 -0400
Received: from mx1.riseup.net ([198.252.153.129]:57442 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgEUHtH (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Thu, 21 May 2020 03:49:07 -0400
Received: from bell.riseup.net (bell-pn.riseup.net [10.0.1.178])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 49SMFZ5RJWzFfvt;
        Thu, 21 May 2020 00:49:06 -0700 (PDT)
X-Riseup-User-ID: 9414E9A4931EBACE942780CE0E0E7B02FDAF8049E08456FB12357BAC3D9C4329
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by bell.riseup.net (Postfix) with ESMTPSA id 49SMFY6yxczJmq8;
        Thu, 21 May 2020 00:49:01 -0700 (PDT)
Subject: Fwd: [Int-area] draft-learmonth-intarea-rfc1226-bis-00
References: <90e3bce1-cd60-b45b-d4d9-11da99ee2093@hambsd.org>
To:     linux-hams@vger.kernel.org, 44net@mailman.ampr.org
Reply-To: Int-area@ietf.org, irl@hambsd.org
From:   "Iain R. Learmonth" <irl@hambsd.org>
Organization: HamBSD Project
X-Forwarded-Message-Id: <90e3bce1-cd60-b45b-d4d9-11da99ee2093@hambsd.org>
Message-ID: <d9fad05a-feb9-5f38-e1ff-9978a3931076@hambsd.org>
Date:   Thu, 21 May 2020 08:49:00 +0100
MIME-Version: 1.0
In-Reply-To: <90e3bce1-cd60-b45b-d4d9-11da99ee2093@hambsd.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi All,

I am working on updating the spec for "AX.25 over IP" at the IETF. I'd
be happy to receive any reviews and/or comments of the latest draft,
details in the message forwarded below.

You can email me directly, or on the intarea mailing list at the IETF.

Thanks,
Iain.


-------- Forwarded Message --------
Subject: 	[Int-area] draft-learmonth-intarea-rfc1226-bis-00
Date: 	Thu, 21 May 2020 08:25:11 +0100
From: 	Iain R. Learmonth <irl@hambsd.org>
Organization: 	HamBSD Project
To: 	Int-area@ietf.org



Hi All,

I have just submitted a draft containing a refresh for RFC1226, "AX.25
over IP".

URL:
https://www.ietf.org/internet-drafts/draft-learmonth-intarea-rfc1226-bis-00.txt
Status:
https://datatracker.ietf.org/doc/draft-learmonth-intarea-rfc1226-bis/
Htmlized:
https://tools.ietf.org/html/draft-learmonth-intarea-rfc1226-bis-00
Htmlized:
https://datatracker.ietf.org/doc/html/draft-learmonth-intarea-rfc1226-bis

I am happy to receive any comments you may have. This draft has been
discussed within the TAPR APRSSIG mailing list, and that thread can be
found here:

http://lists.tapr.org/pipermail/aprssig_lists.tapr.org/2020-May/048579.html

I plan to survey existing implementations to see whether or not they are
currently interoperable, and will be producing an implementation for
HamBSD (https://hambsd.org/).

Currently this is specified for unicast IP, however I can see benefits
to enabling multicast use. I would like to have multicast use covered in
this update.

There is also the question of UDP encapsulated AX.25 which currently
seems to have been made up by every implementation. I will include that
in my survey, and see if there can be some consensus drawn there. I'm
not sure if it is appropriate to add the UDP encapsulation details to
this draft, or if it would be preferred to make that a separate draft,
maybe even in a different area/WG.

Thanks,
Iain.


-------- Forwarded Message --------
Subject: New Version Notification for
draft-learmonth-intarea-rfc1226-bis-00.txt
Date: Thu, 21 May 2020 00:14:45 -0700
From: internet-drafts@ietf.org
To: Iain Learmonth <irl@hambsd.org>, Iain R. Learmonth <irl@hambsd.org>


A new version of I-D, draft-learmonth-intarea-rfc1226-bis-00.txt
has been successfully submitted by Iain R. Learmonth and posted to the
IETF repository.

Name: draft-learmonth-intarea-rfc1226-bis
Revision: 00
Title: Internet Protocol Encapsulation of AX.25 Frames
Document date: 2020-05-21
Group: Individual Submission
Pages: 6



Abstract:
This document describes a method for the encapsulation of AX.25 Link
Access Protocol for Amateur Packet Radio frames within IPv4 and IPv6
packets. Obsoletes RFC1226.

Note

Comments are solicited and should be addressed to the author(s).

The sources for this draft are at:

https://github.com/irl/draft-rfc1226-bis




Please note that it may take a couple of minutes from the time of submission
until the htmlized version and diff are available at tools.ietf.org.

The IETF Secretariat


_______________________________________________
Int-area mailing list
Int-area@ietf.org
https://www.ietf.org/mailman/listinfo/int-area
