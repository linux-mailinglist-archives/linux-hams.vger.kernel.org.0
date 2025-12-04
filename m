Return-Path: <linux-hams+bounces-720-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7ACCA23FE
	for <lists+linux-hams@lfdr.de>; Thu, 04 Dec 2025 04:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B79E30253ED
	for <lists+linux-hams@lfdr.de>; Thu,  4 Dec 2025 03:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1B42222D8;
	Thu,  4 Dec 2025 03:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDjzH1zg"
X-Original-To: linux-hams@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F31922F5
	for <linux-hams@vger.kernel.org>; Thu,  4 Dec 2025 03:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764818472; cv=none; b=n4WZY6ib5uHoLgbocwLT/WtO/9vUtusW/yBTrBQ5YKX3CBpQe0zozogsvpm/ansmDflFu5SiVtCb7jiidZILfKccJwhpl0a1NLFbgi1TU45vJwosLTok+ImqKr/xB5rpTXnYi3doRj5rE6RR/vZtn2XroHvoOxAi7+wvQtxFZas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764818472; c=relaxed/simple;
	bh=reqFikIDnoRHVNWjGlLMf6CGxEjlOpuiEof/xNMx8dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GGStCdLVVpl/7JtOMs76EU3n6XWKaFq1L5wL2QKgT/LkWRIS2JhTPGO4FL+vKMOzj4eZC18vmt3mc7mDTmVZ4epPaDozRu1cnduCTlWcBvkKI28UErv7NKIgM3H4uh1acDPrM0cLRkoANQcA+fKLpjGAIj0y6EMXFMHvSdSka1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDjzH1zg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764818470; x=1796354470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=reqFikIDnoRHVNWjGlLMf6CGxEjlOpuiEof/xNMx8dA=;
  b=FDjzH1zgirJgJqeSA0NeIhdBfbRARoHpj6R7xbBvjJMmbZQ2CkD54wCO
   EXMsF/7ozdJLbdk26zU+0UtI1yDJdJ8IZlaImU4/m8w6bJE1TqLs0Yr+k
   s26jkozVecIYEyqGpN3s/VqJKkmviRQ+W1iNQjXEAjnFHDhNnE9W0Xi/a
   QSvbF0u04w74HxGlMrgFsCn+J0eTQ7Vckgz4trkqqdnyi0fuu01AdE7HC
   YAtqNtyln6VlLQWuQLDXEIzCf35ELEa/Q3BEgU0RlSpTDHbvdlXybIdtX
   Ta6wuRytpe5s/as6i+TRFpEyZz7ca/GwYMbyrh3xuVvBj66U2lx3K6HXN
   g==;
X-CSE-ConnectionGUID: 64DeWG3GRs6gu82QePIefQ==
X-CSE-MsgGUID: GO0devrpROC2Z95FqiyEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66720987"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="66720987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 19:21:09 -0800
X-CSE-ConnectionGUID: i+Ox5V4eRhaCQE6vb5RheQ==
X-CSE-MsgGUID: DqKyJUWlS6KKdw6UXLP5FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="199812879"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 19:21:07 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-hams@vger.kernel.org
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
Date: Thu,  4 Dec 2025 11:21:28 +0800
Message-ID: <20251204032128.23306-1-junjie.cao@intel.com>
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

#syz test: https://github.com/Junjie650/linux.git v2-fix-netrom-deadlock

Hi,

Please test the NetROM deadlock fix on the above tree/branch.

Thanks,
Junjie

