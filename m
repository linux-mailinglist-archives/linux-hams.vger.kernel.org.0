Return-Path: <linux-hams+bounces-587-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B5B3304A
	for <lists+linux-hams@lfdr.de>; Sun, 24 Aug 2025 16:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0739B17A8C6
	for <lists+linux-hams@lfdr.de>; Sun, 24 Aug 2025 14:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE01C2652B2;
	Sun, 24 Aug 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="dZ0ipGiS"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E421D90DF;
	Sun, 24 Aug 2025 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756044297; cv=none; b=KoVtfzNsp3ykeaSlSvLoH5kkliK2MfkAjGf5NitkPZPjMW7jZqrAZSmfTajxZLUcHQEkD8EOlBwBpzyD2d9RRcq2DN25DxbsG0vtmqW5VwnkbDtiwvDFIrFNuesPAExNHTEY6MX3+qnS3+3qXzk24DqpI5p2mTE8cldwg1hE8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756044297; c=relaxed/simple;
	bh=A13fB2Ee3SXl8R+pZaQxFmInqJUHANagrNRefvt5RY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+c6bATJsyKFvbLE0S6Lxu7uuXbWU0sERY8/kTideIajfLWClu69fLggSszOvsfSaSsSLYh9foDGIKOlEwDQLUGScDiGNVmJgcdKymJ0UGmvcrNesY3UMyc+OqH/srqIbTx3b50nYQZi/ELmrhRRcMyfz2/nQ59N27/mW/8BTQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=dZ0ipGiS; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id DE3AA19F749;
	Sun, 24 Aug 2025 16:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1756044287;
	bh=A13fB2Ee3SXl8R+pZaQxFmInqJUHANagrNRefvt5RY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dZ0ipGiSdbEOmpT3erlJGhlaju0W3LTMPsiiL6QT0gxyk8WdLglX5/Xqr7gx0PW/F
	 M1tGJQnLVrQsvpIiuTH5dZWOt+OPacWW+FvDxF1qnIYe3mS5ztLpRonJrmRY9z/jfK
	 EiG0pbToZxQ20U3e/EC1UApPwH78B7xmTIe0ysqxa32lewA7xq0JSR4SSYbmowVhI6
	 HmzRIbtwJVFioZsX1Ip9jmMS5cZ8EeAktbEaD0R8kjkf9/Gebij5ut1eSjcoSrESfi
	 2nrgnGoiUoa3tuSdogVuk+U/RUsQMDL14G0xzCxtPgOOceIiVZLxk5ES5sSR527tzZ
	 4Ik9EVNW26kig==
Message-ID: <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>
Date: Sun, 24 Aug 2025 16:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>
Cc: Dan Cross <crossd@gmail.com>, David Ranch <dranch@trinnet.net>,
 Eric Dumazet <edumazet@google.com>,
 Folkert van Heusden <folkert@vanheusden.com>
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr>
 <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
 <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
 <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
 <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
 <d073ac34a39c02287be6d67622229a1e@vanheusden.com>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <d073ac34a39c02287be6d67622229a1e@vanheusden.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

I suspect I finally found the bug that triggered a kernel panic since 
linux-15.1 version up to net-next.

Actually I found a report from

syzbot+dca31068cff20d2ad44d@syzkaller.appspotmail.com

that directed me to the solution.

A pointer *p to a buffer was declared in tty_buffer_alloc() buf not 
initialized.

Explanation :
- Sometime AX25 can perform connexions via a kissattached Ethernet port.
- In that case when an application sends a connect request from a 
console, tty_port is used by mkiss.

All kernel panic reports I sent earlier show that mkiss_receive_buf was 
involved together with tty_port_default and tty_ldisc_receive_buf.

It was sysbot detailed reporting KMSAN uninit value in mkiss_receive_buf 
that led me to the solution. Although it took me a while to understand 
the report for this is totally new for me...

Looking at the code I found :

static struct tty_buffer *tty_buffer_alloc(struct tty_port *port, size_t 
size)
  {
  	struct llist_node *free;
	struct tty_buffer *p;

I first introduced a call to kmalloc in order to initialize pointer p 
like it is done elsewhere in the function.

This performed well and Oops disappeared.

Then I tried to first initialize *p to NULL when it is declared :

struct tty_buffer *p=NULL;

When added it also performed correctly.

And finally I removed the kmalloc early instruction and only kept the 
*p=NULL initialization.

Since then, I checked this simple initialization on both 6.15.2 and 
6.17-rc2 and there was no more Oops.

I will provide the following patch against net-next in due form if there 
is no objection.

diff --git a/drivers/tty/tty_buffer.c b/drivers/tty/tty_buffer.c
index 67271fc0b223..33e7f675b06d 100644
--- a/drivers/tty/tty_buffer.c
+++ b/drivers/tty/tty_buffer.c
@@ -159,7 +159,7 @@ void tty_buffer_free_all(struct tty_port *port)
  static struct tty_buffer *tty_buffer_alloc(struct tty_port *port, 
size_t size)
  {
  	struct llist_node *free;
-	struct tty_buffer *p;
+	struct tty_buffer *p=NULL;

  	/* Round the buffer size out */
  	size = __ALIGN_MASK(size, TTYB_ALIGN_MASK);


Bernard


Le 22/08/2025 à 05:10, Folkert van Heusden a écrit :
> Bernard,
> 
> I skimmed over the diff between the latest 6.14.y and latest 6.15.y tags 
> of the raspberry pi linux kernel and didn't saw anything relevant 
> changed. Altough changes in 'arch' could in theory affect everything.
> 
> 
> On 2025-08-22 00:39, F6BVP wrote:
>> As I already reported mkiss never triggered any Oops kernel panic up 
>> to linux-6.14.11.
>>
>> In that version I put a number of printk inside of mkiss.c in order to 
>> follow the normal behaviour and content outside and during FPAC 
>> functionning especially when issuing a connect request.
>>
>> On the opposite an FPAC connect request systematically triggers a 
>> kernel panic with linux-6.15.2 and following kernels.
>>
>> In 6.14.11 I observe that when mkiss runs core/dev is never activated 
>> i.e. neither __netif_receive_skb nor __netif_receive_skb_one_core.
>>
>> These functions appear in kernel 6.15.2 panics after mkiss_receive_buf.
>>
>> One can guess that mkiss_receive_buf() is triggering something wrong 
>> in kernel 6.15.2 and all following kernels up to net-next.
>>
>> The challenge to locate the bug is quite difficult as I did not find 
>> the way to find relevant code differences between both kernels in 
>> absence of inc patch...
>>
>> I sincerely regret not knowing how to go further.
>>
>> Bernard,
>> hamradio f6bvp /ai7bg
> 


