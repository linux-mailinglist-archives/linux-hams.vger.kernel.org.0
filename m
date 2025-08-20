Return-Path: <linux-hams+bounces-569-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36321B2D710
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 10:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB6925A6E79
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 08:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873162D9ED5;
	Wed, 20 Aug 2025 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="dbS5rnzJ"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3DC2D979F;
	Wed, 20 Aug 2025 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755679832; cv=none; b=tu89OhxCa5Sb5PSulwBpH6wQLx2tX/jHMfdcoE8xDo77sss4M5zeHrkd3LPWLArHPd3+gLyvts47YhCtXlAILx8mbdf2IoOuZnNcm0bcRRzp4Kb9FIko9nlcnhXTmZ0dhDPTNMorb3/qOw38D2ErC3Awj5vpoSaeCm2htrpKVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755679832; c=relaxed/simple;
	bh=bsBTzh7CFA6FK/Obva841yhuCSQBcVsRUbVv9X82xQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyPf6GE27/Mj5iOZBJWuxq9areX74iewySFmk1IJGgH2Qh5A6Qxpp710eItMopmfnJP3hU1dqsSosT25oSvZDZ+53GQjN2QkFibUyCwc3O/INFYHdn8FWWmSUArQQFIytEXewHF5AzA0wcWUi4ruyE0KCNwmq86tbQfye1hImck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=dbS5rnzJ; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 614C819F734;
	Wed, 20 Aug 2025 10:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1755679821;
	bh=bsBTzh7CFA6FK/Obva841yhuCSQBcVsRUbVv9X82xQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dbS5rnzJKUthY6oWY7hGIH1eWTwtEyDxfbuGWATTnHlohPhyDsFyESI8hOQHVY1CN
	 DGrQEbwOHcqZ04YPoNrDjibX0b+YXWNTCVXRLHAijg7MfPD/LlSIH4tvyp+uVvv0qL
	 7Rh4YnehFRLhxZZH87UWm0AuPyhBIVf/Vguf1yfWf7lF7iqeAmycuaFs2zm0MUzGHJ
	 EQIVzGmU1i99qOprFEtXdMYd4iyiPKgc8plyEazc036RWaUS/vhACBf3Ht+rSdFHio
	 LuZ2DVoDkiUOmbXIFhYVobrzBz8Y6oHBQXLI7kM5/xYnY/9pXm905ZK7pZ5hOH1vFT
	 /VDlQK859k97g==
Message-ID: <847a7cd7-c17c-4aa7-824d-22768ff9775d@free.fr>
Date: Wed, 20 Aug 2025 10:50:16 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: Dan Cross <crossd@gmail.com>, Bernard Pidoux <bernard.pidoux@free.fr>
Cc: David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org,
 netdev <netdev@vger.kernel.org>
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr>
 <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
 <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
 <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

As linux-6.15.1 came with the same Oops kernel panic I jummped into 6.14 
branch resulting in no issue up to 6.14.4

I observed that kworker/u16 was always cited in the panic report.

Grep -r kworker/u16 found the following report in

~.drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt

I am not sure if it is relevant to our present problem.
.....................

# Whole machine hangs
kms_cursor_legacy@all-pipes-torture-move

# Skip driver specific tests
^amdgpu.*
nouveau_.*
^panfrost.*
^v3d.*
^vc4.*
^vmwgfx*

# Skip intel specific tests
gem_.*
i915_.*
tools_test.*

# Currently fails and causes coverage loss for other tests
# since core_getversion also fails.
core_hotunplug.*

# gpu fault
# [IGT] msm_mapping: executing
# [IGT] msm_mapping: starting subtest shadow
# *** gpu fault: ttbr0=00000001030ea000 iova=0000000001074000 dir=WRITE 
type=PERMISSION source=1f030000 (0,0,0,0)
# msm_mdp 901000.display-controller: RBBM | ME master split | 
status=0x701000B0
# watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [kworker/u16:3:46]
msm/msm_mapping@shadow
.........................


Bernard


