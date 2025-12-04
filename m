Return-Path: <linux-hams+bounces-722-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D12EACA2EB9
	for <lists+linux-hams@lfdr.de>; Thu, 04 Dec 2025 10:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A25D430C85DC
	for <lists+linux-hams@lfdr.de>; Thu,  4 Dec 2025 09:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2382F8BF4;
	Thu,  4 Dec 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfMMuOvS"
X-Original-To: linux-hams@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4623D2F7AD4;
	Thu,  4 Dec 2025 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839339; cv=none; b=IGXUPvRi3CZ00kc5Zlwwn9kzQA1JsZWV3kqmimdyJYguHIw538Gv9i3/mhUTI5wJbCziRKjFyZro21oqVTm9BowTOkmNPUGwn+Eoz/jIuzaEADKyjaBSAyavGFtlqNeASxFqehsZUvufj6U0XvA/iM7TUiqMlj7YdTbCVMHy+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839339; c=relaxed/simple;
	bh=H3vxv8jjSLG8JUp/NONt92/CO3vrhoCfbuIdrPwBiNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iKaznrQ1yZdZ5lC6H8uth01hg/PPAYGUOE0JAJyzQ2fmBxJYG7Qas7rzASmh4PpWidzEAHmzRYeuW4pTfR0n9b7RlgxkkU46rlqwnFZufupeG2TL/nPJi3VlgGa6bj3trZ2BAGC8d+sf+My29A7jAhHqARInAgs30ru/W40mYTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfMMuOvS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764839337; x=1796375337;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H3vxv8jjSLG8JUp/NONt92/CO3vrhoCfbuIdrPwBiNw=;
  b=kfMMuOvSXmfkZi+RD/mKWFUBLuoq+piHfJrUdc8A1R04QzVLvDYVE/0k
   d/QcNie0Agmn3PN6R8CKOciiaFPpJg1xBDzCCauosahVvIsM82gka+9Eg
   udjTIaD/LIsX4CzOHOz8mb71hz4q0JnwG5/8VFdddbUe2FzdhIBnq372E
   0I6G2Fxguuj6E71dZdpCfGoxGnVmwUQv75IY6STipDOFyjlEhVsIDqm5u
   iVn9cHmbhevi0PjOz3RQybmd73uN+DFiZZjYsZb6sysL+9rADi4aXApz3
   p2mO1dupxKApIdI6Ykx4SZZ1N+8oq7BcqceHpQodaveBwPDh7HklA1cuy
   w==;
X-CSE-ConnectionGUID: Z/dTlg8DTyCpy6Y+HdNv1g==
X-CSE-MsgGUID: SmiYn0IBSAapaEimbsEaCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="67014010"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="67014010"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 01:08:56 -0800
X-CSE-ConnectionGUID: IoDz3mC3RgGbgNRPiRHcyA==
X-CSE-MsgGUID: e4gL18YzTlqjvgtIQL2j8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195724249"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 01:08:53 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: horms@kernel.org,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	stable@vger.kernel.org,
	junjie.cao@intel.com
Subject: [PATCH v2 0/2] netrom: fix deadlock and refcount leak in nr_rt_device_down
Date: Thu,  4 Dec 2025 17:09:03 +0800
Message-ID: <20251204090905.28663-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

syzbot reported a circular locking dependency in the NET/ROM routing
code involving nr_neigh_list_lock, nr_node_list_lock and
nr_node->node_lock when nr_rt_device_down() interacts with the
ioctl path. This series fixes that deadlock and also addresses a
long-standing reference count leak found while auditing the same
code.

Patch 1/2 refactors nr_rt_device_down() to avoid nested locking
between nr_neigh_list_lock and nr_node_list_lock by doing two
separate passes over nodes and neighbours, and adjusts nr_rt_free()
to follow the same lock ordering.

Patch 2/2 fixes a per-route reference count leak by dropping
nr_neigh->count and calling nr_neigh_put() when removing routes
from nr_rt_device_down(), mirroring the behaviour of
nr_dec_obs()/nr_del_node().

[1] https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82

Thanks,
Junjie

