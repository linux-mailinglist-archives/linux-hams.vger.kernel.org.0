Return-Path: <linux-hams+bounces-710-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B23C8CA17
	for <lists+linux-hams@lfdr.de>; Thu, 27 Nov 2025 03:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D388351527
	for <lists+linux-hams@lfdr.de>; Thu, 27 Nov 2025 02:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A9E241691;
	Thu, 27 Nov 2025 02:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k69k62Ir"
X-Original-To: linux-hams@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90AF23FC49
	for <linux-hams@vger.kernel.org>; Thu, 27 Nov 2025 02:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764209078; cv=none; b=aiJnjxUkkKwkMZejf+oB6lP2MHQRNJ/PSyAiXSNACqb4eT7LSLkYGtiqyyuNs+yPCDQ7qwfihXHk7eRzdn7J4S6jqOxaEQFIjrDMoiwoIc9FH5rQJNdm2h1nqwjXZhvtcZuYnMorCEbkseQ5FmucuINixnWxmZ0d247WozOETno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764209078; c=relaxed/simple;
	bh=pzuk4D8xChoCtMC33I4B3UfE2cHrK87t2HZZxHOU47A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sGShYAxpvINj+YtSlX1u423TDcNRrTgz7VsYugUqjBa63sh0bNfAjSdr9QabY7igV5Wb1+wEMZHtv215r+affxqo0Y8xvk6dp7UbkgTc3x7b/oITeuXyjLnkBRZYxiVs6/tOYWonSA2BKugxUtDWNpczlFb5RhsVTHUM0eSh/MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k69k62Ir; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764209077; x=1795745077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pzuk4D8xChoCtMC33I4B3UfE2cHrK87t2HZZxHOU47A=;
  b=k69k62IromNGN5lX3SmCaJVXeaRZoe+h2Ao5VoiPuAeqKTobQEDmQCdd
   rOcH+pWk56k+AceiVIowgsHh2MOfdZrrrsKtN4e0Mc6hqNP9vP645UbmJ
   5BmOs+gOIHrR0hZdcfJdAbKPATxnJ++m12h9FyWBrtwaRz+/a2pr0Aju2
   qPEBolG6PYduwzJzTiLGRUs5+Hr5bn9LyFs8CIPJwhOVE5OfyVi0Wpvk2
   GcnZ9jcjARiQ3p+5EI2xlLuLd0Z7kyynYudLVrBeaXWIamyqqpzQNaLhC
   RnrGKwxrlYWkA85Hk8XcZlMkP8Aotk4YvZ14bD2HAcRSFIskbfayG09ZK
   A==;
X-CSE-ConnectionGUID: SUPahzW1T4yPJ7X2HL+3Cg==
X-CSE-MsgGUID: Cbe1a6CiQMSJFiIsSvk7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66146353"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66146353"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:04:36 -0800
X-CSE-ConnectionGUID: I3VQzQypRRis0mc17+ludA==
X-CSE-MsgGUID: z25QR8D1TrW32bgWtd/Gtg==
X-ExtLoop1: 1
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:04:34 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-hams@vger.kernel.org
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
Date: Thu, 27 Nov 2025 10:04:50 +0800
Message-ID: <20251127020450.118479-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <685d4c2a.a00a0220.2e5631.028c.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

#syz test: https://github.com/Junjie650/linux.git fix-netrom-deadlock

Hi,

Please test the NetROM deadlock fix on the above tree/branch.

Thanks,
Junjie

