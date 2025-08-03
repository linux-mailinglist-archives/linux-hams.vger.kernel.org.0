Return-Path: <linux-hams+bounces-547-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05903B19679
	for <lists+linux-hams@lfdr.de>; Sun,  3 Aug 2025 23:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8340189412C
	for <lists+linux-hams@lfdr.de>; Sun,  3 Aug 2025 21:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBF2347DD;
	Sun,  3 Aug 2025 21:30:28 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from vps001.vanheusden.com (fatelectron.soleus.nu [94.142.246.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B631373
	for <linux-hams@vger.kernel.org>; Sun,  3 Aug 2025 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.246.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754256628; cv=none; b=PF1FuZOZEsqUDmW2HFU94bwvnwG3WiiY/1Yelk6Bq4V1wKNVNoJEHdjQHsNAi01VWPr6ryrcLWll58jm5uPVnYWXJ/ao2lqK+uGS90gi2BMtD8+YfUqQY+LmDA5hdIHW55u0WaGsqOny0OOr3qfL7bCj6EyOAqHlZl9D9GdzD/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754256628; c=relaxed/simple;
	bh=n7uh49CtCnNLVgxPfpcTgP4jU0VaBWvAM1z/ekUdRdk=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=RjecDVQxxGYDR5waMB/LJucHVzjKgz7jjsZTH1NuhMbS12RD/J0UfgRRQGncnvcYF/uh2e2JAFx9E6g7qG6e1gZWurikx0B9w6+roskzxUzGmyQeUoOclWakVnjiAhmugGphOwh7F+sWcpsXGsQK6NfaBCmUTrZm2GZIFi9ptPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanheusden.com; spf=pass smtp.mailfrom=vanheusden.com; arc=none smtp.client-ip=94.142.246.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanheusden.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vanheusden.com
Received: from webmail.vanheusden.com (unknown [172.29.0.1])
	by vps001.vanheusden.com (Postfix) with ESMTPA id AEC0D50065B
	for <linux-hams@vger.kernel.org>; Sun,  3 Aug 2025 23:30:21 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 03 Aug 2025 23:30:21 +0200
From: Folkert van Heusden <folkert@vanheusden.com>
To: linux-hams@vger.kernel.org
Subject: ax.25 & linux, 4th send attempt
Message-ID: <018e5e9f979d1c2076b198b1ec970c6b@vanheusden.com>
X-Sender: folkert@vanheusden.com
Organization: www.vanheusden.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to setup an ax.25 bbs. A few things work like setting up a 
kiss-session, sending beacons and sending ip-over-ax.25 icmp packets.

But as soon as someone tries to axcall to my bbs, the whole system (a 
raspberry pi 5) resets. This is with a remote connection (kiss over 
socat to a location a few km away). But if I on the other hand run 
direwolf and send a few packets, the system reboots as well.

I tried to check the linux-ax25.in-berin.de website (as mentioned in the 
kernel docs), but that website is not responsive.

regards

-- 
www.vanheusden.com

