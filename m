Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA1A461634
	for <lists+linux-hams@lfdr.de>; Mon, 29 Nov 2021 14:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377844AbhK2N1U (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 29 Nov 2021 08:27:20 -0500
Received: from ham.blackspace.at ([78.46.20.155]:52174 "EHLO
        mail.blackspace.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234541AbhK2NZS (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 29 Nov 2021 08:25:18 -0500
Received: from [192.168.178.20] (90-152-197-123.static.highway.a1.net [90.152.197.123])
        by mail.blackspace.at (Postfix) with ESMTPSA id D67C41F72050;
        Mon, 29 Nov 2021 14:21:59 +0100 (CET)
To:     linux-hams@vger.kernel.org
References: <208413a5-c061-2008-0760-f4d4ed55fcdb@blackspace.at>
 <09fdc26a-0db0-4545-b655-9e4c9d5f56a0@www.fastmail.com>
From:   Roland Schwarz <roland.schwarz@blackspace.at>
Subject: Re: soundmodem bit rot prevention
Message-ID: <4ec2cf0a-387b-775f-cd9e-4dce19bef1cf@blackspace.at>
Date:   Mon, 29 Nov 2021 14:21:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <09fdc26a-0db0-4545-b655-9e4c9d5f56a0@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org



On 29.11.21 at 12:59 Dave Hibberd wrote:
> ... what's the benefit of the feature?

The idea is to improve 9600 Bd operation for transceivers that have a 
bad low frequency response. The BLR should not get in your way if the 
transceiver already shows good performance.

Put it another way: You should see improvement on some equipment but no 
degradation on any.

Roland

-- 
__________________________________________
   _  _  | Roland Schwarz
  |_)(_  |
  | \__) | mailto:roland.schwarz@blackspace.at
________| http://www.blackspace.at
