Return-Path: <linux-hams+bounces-595-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C62DB384B7
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 16:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04083B1E7C
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 14:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66FA21ADA4;
	Wed, 27 Aug 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="gBtIQi1D"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910F14A0B5;
	Wed, 27 Aug 2025 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756304211; cv=none; b=kKaVDBATWqUUspt+rdP8kZskztH7VQGDg6DJ0QbOYsMJXxgG4O5oP1pTxdSaP4tLRNAI5nlVgBUmqEJsUW0i2isLrq8i4znv1yZN9PvlAV5whWAIIAXhAvlzHL6zRciyn3WDSkPRSihRFJZS44VsTwn8KvC4xqUixwVds349I0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756304211; c=relaxed/simple;
	bh=lFwsZPPn7KdWVd/+c/xrLzrUqP6ZV9qJt/wadlyUDC8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=bQ/quV74pcBqzTcjU4RkIeINTx5LLfF74KAAi601DWH69esYihgJpUmJFAtGaF3HknSz02FYmwmshWRtEpfQr3ocBqnZCagjzTmh6pswaDEATb0wlYqSYeOtwnEAgisRzsKQGMpF7bcr4KwkFy18H67PnKfYY1/BGuS5vFL2cYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=gBtIQi1D; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 375A219F775;
	Wed, 27 Aug 2025 16:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1756304200;
	bh=lFwsZPPn7KdWVd/+c/xrLzrUqP6ZV9qJt/wadlyUDC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gBtIQi1DJdY5MkpqC/1onWIGVAIsL4rKMc1CkMwxpqym6Ks3OLX6jBogmgqqbiqRO
	 gsCuw8Kqu/LYY01p/FCxIbr7Oag+lhwJwTCCM848aGQ42RtfLtyVgvHLOU60v4j2Q6
	 sEo9/+hV/3ZL5PgipaWFUwFrSGlLYJKKMvcA/6fTKpFgPFMD/m9y634xkqrLVWFheU
	 zBOMnFppXhOIt/bwSRqvadqb6Jde4MBCEpn346DJaDBzAljIjB+n78Tr8jBXdT5EVk
	 ds4MGzJupUtuvqv35nWLLopOE3YkclxFZCUKsZjUoj50H2qPxPbxqVhuS0R8Bu5L2l
	 mz9x2hwHuSpiQ==
Content-Type: multipart/mixed; boundary="------------RJBeJ3TOcgg0xkQivEaIjTqK"
Message-ID: <4542b595-2398-4219-b643-4eda70a487f3@free.fr>
Date: Wed, 27 Aug 2025 16:16:31 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: Eric Dumazet <edumazet@google.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-hams@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, Dan Cross <crossd@gmail.com>,
 David Ranch <dranch@trinnet.net>,
 Folkert van Heusden <folkert@vanheusden.com>
References: <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com>
 <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
 <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
 <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
 <d073ac34a39c02287be6d67622229a1e@vanheusden.com>
 <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>
 <aKxZy7XVRhYiHu7c@stanley.mountain>
 <0c694353-2904-40c2-bf65-181fe4841ea0@free.fr>
 <CANn89iJ6QYYXhzuF1Z3nUP=7+u_-GhKmCbBb4yr15q-it4rrUA@mail.gmail.com>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <CANn89iJ6QYYXhzuF1Z3nUP=7+u_-GhKmCbBb4yr15q-it4rrUA@mail.gmail.com>

This is a multi-part message in MIME format.
--------------RJBeJ3TOcgg0xkQivEaIjTqK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eric,

I finally found the instruction triggering the bug in 
tty_ldisc_receive_buf()

Being absolutely new in kernel debugging, I read 
Documentation/admin-guide/bug-hunting.rst in order to see what I needed 
to do :
./scripts/config -d COMPILE_TEST -e DEBUG_KERNEL -e DEBUG_INFO

I also installed netconsole driver to capture Oops and received it on a 
local RaspBerry Pi with socat :
nohup socat -u udp-recv:6666 ./netconsole.log < /dev/null > /dev/null 2>&1 &

In function tty_ldisc_receive_buf() , call to receive_buf() goes well as 
long as count is small whereas with large number of bytes there is a 
kernel BUG NULL pointer dereference.

Included is the last netconsole log I captured and only kept last pages.

If with analyze netconsole.log from 4,19279,15377986 we see three 
sequences from tty_port_default_receive_buf to tty_ldisc_receive_buf 
giving the number of bytes processed.

If we concentrate on sequence __tty_insert_flip_string_flags that gives 
the number of copied bytes we see that just before the BUG something 
goes differently when bytes number is relatively high i.e. 272 in our case.
There is yet another tty_ldisc_deref after flush_to_ldisc and before 
receive_buf.

In netconsole.log (4,19284,1537778017) call to receive_buf() is fine 
with count value equal 18 bytes.

With line sequence (see below) 411, line 416, line 427 everything goes 
well when byte count is <=28 in our report.
On the contrary the sequence line 416, line 421, if bytes count is 
bigger (272), line 427 is not reached which means that

ld->ops->receive_buf(ld->tty, p, f, count);

never returns.

As a proof I commented this line of code and the BUG dissapeared... Of 
course the application did not achieved the AX25 connexion, waiting for 
a reply.

Here I am. Next step is probably to discover why the call to 
receive_buf() fails when bytes are not small and tty_ldisc_deref() is 
acting after flush_to_ldisc probably leading to an error. What value is 
wrong ? ld->tty , p, f ?

Regards,

Bernard


Here here tty_ldisc_receive_buf() with line numbers added to printk() lines:

size_t tty_ldisc_receive_buf(struct tty_ldisc *ld, const u8 *p, const u8 *f,
			     size_t count)
{

	if (ld->ops->receive_buf2)
	{
		count = ld->ops->receive_buf2(ld->tty, p, f, count);
		
L411		printk("Here I am: %s:%d count:%ld bytes 
buf2\n",__FUNCTION__,__LINE__,count);
	}
	else {
		count = min_t(size_t, count, ld->tty->receive_room);
	
L416		printk("Here I am: %s:%d count:%ld bytes tty 
receive_room\n",__FUNCTION__,__LINE__,count);

		if (count && ld->ops->receive_buf)
		{

L421			printk("Here I am: %s:%d count:%ld bytes ---> 
receive_buf\n",__FUNCTION__,__LINE__,count);
	
			ld->ops->receive_buf(ld->tty, p, f, count);
		}
	}
	
L427	printk("Here I am: %s:%d count:%ld bytes 
processed\n",__FUNCTION__,__LINE__,count);

	
	return count;
}
EXPORT_SYMBOL_GPL(tty_ldisc_receive_buf);


Le 26/08/2025 à 15:36, Eric Dumazet a écrit :
> 
> Make sure to add symbols to these logs, otherwise we can not really help.
> 
> cat CRASH | scripts/decode_stacktrace.sh ./vmlinux

--------------RJBeJ3TOcgg0xkQivEaIjTqK
Content-Type: text/plain; charset=UTF-8; name="netconsole.log"
Content-Disposition: attachment; filename="netconsole.log"
Content-Transfer-Encoding: base64

77u/CjQsMTkyNzgsMTUzNzc3OTgxLC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfcmVjZWl2ZV9i
dWY6NDI3IGNvdW50OjE4IGJ5dGVzIHByb2Nlc3NlZAo0LDE5Mjc5LDE1Mzc3Nzk4NiwtO0hl
cmUgSSBhbTogdHR5X3BvcnRfZGVmYXVsdF9yZWNlaXZlX2J1Zjo0NiBjb3VudDoxOAo0LDE5
MjgwLDE1Mzc3Nzk5MSwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQs
MTkyODEsMTUzNzc3OTk2LC07SGVyZSBJIGFtOiBfX3R0eV9pbnNlcnRfZmxpcF9zdHJpbmdf
ZmxhZ3M6MzUxIDE0IGNvcGllZAo0LDE5MjgyLDE1Mzc3ODAwOSwtO0hlcmUgSSBhbTogdHR5
X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkyODMsMTUzNzc4MDEwLC07SGVyZSBJIGFtOiBm
bHVzaF90b19sZGlzYzo1MDYKNCwxOTI4NCwxNTM3NzgwMTcsLTtIZXJlIEkgYW06IHJlY2Vp
dmVfYnVmOjQ3OQo0LDE5Mjg1LDE1Mzc3ODAyMywtO0hlcmUgSSBhbTogbl90dHlfcmVjZWl2
ZV9idWZfY29tbW9uOjE2ODYKNCwxOTI4NiwxNTM3NzgwMjgsLTtIZXJlIEkgYW06IHR0eV9s
ZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5Mjg3LDE1Mzc3ODAzNywtO0hlcmUgSSBhbTogdHR5
X2xkaXNjX3JlY2VpdmVfYnVmOjQxMSBjb3VudDoxNCBieXRlcyBidWYyCjQsMTkyODgsMTUz
Nzc4MDQzLC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfcmVjZWl2ZV9idWY6NDI3IGNvdW50OjE0
IGJ5dGVzIHByb2Nlc3NlZAo0LDE5Mjg5LDE1Mzc3ODA0OCwtO0hlcmUgSSBhbTogdHR5X3Bv
cnRfZGVmYXVsdF9yZWNlaXZlX2J1Zjo0NiBjb3VudDoxNAo0LDE5MjkwLDE1Mzc3ODA1Mywt
O0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkyOTEsMTUzNzc4MDY3
LC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVyZWY6MjgzICF0dHkKNCwxOTI5MiwxNTM3Nzgw
NzIsLTtIZXJlIEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5MjkzLDE1Mzc3
ODA5MywtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkyOTQsMTUz
Nzc4MTA1LC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVyZWY6MjgzICF0dHkKNCwxOTI5NSwx
NTM3NzgxMDksLTtIZXJlIEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5Mjk2
LDE1Mzc3ODExMiwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTky
OTcsMTUzNzc4MTI2LC07SGVyZSBJIGFtOiBfX3R0eV9pbnNlcnRfZmxpcF9zdHJpbmdfZmxh
Z3M6MzUxIDE0IGNvcGllZAo0LDE5Mjk4LDE1Mzc3ODEzMCwtO0hlcmUgSSBhbTogdHR5X2xk
aXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkyOTksMTUzNzc4MTM0LC07SGVyZSBJIGFtOiBmbHVz
aF90b19sZGlzYzo1MDYKNCwxOTMwMCwxNTM3NzgxMzYsLTtIZXJlIEkgYW06IHJlY2VpdmVf
YnVmOjQ3OQo0LDE5MzAxLDE1Mzc3ODEzOCwtO0hlcmUgSSBhbTogbl90dHlfcmVjZWl2ZV9i
dWZfY29tbW9uOjE2ODYKNCwxOTMwMiwxNTM3NzgxNDcsLTtIZXJlIEkgYW06IHR0eV9sZGlz
Y19yZWNlaXZlX2J1Zjo0MTEgY291bnQ6MTQgYnl0ZXMgYnVmMgo0LDE5MzAzLDE1Mzc3ODE1
MiwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX3JlY2VpdmVfYnVmOjQyNyBjb3VudDoxNCBieXRl
cyBwcm9jZXNzZWQKNCwxOTMwNCwxNTM3NzgxNTcsLTtIZXJlIEkgYW06IHR0eV9wb3J0X2Rl
ZmF1bHRfcmVjZWl2ZV9idWY6NDYgY291bnQ6MTQKNCwxOTMwNSwxNTM3NzgxNjEsLTtIZXJl
IEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5MzA2LDE1Mzc3ODE2MiwtO0hl
cmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkzMDcsMTUzNzc4MTY5LC07
SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVyZWY6MjgzICF0dHkKNCwxOTMwOCwxNTM3Nzg0MjUs
LTtIZXJlIEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5MzA5LDE1Mzc3ODQ1
MCwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkzMTAsMTUzNzc4
NDU3LC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVyZWY6MjgzICF0dHkKNCwxOTMxMSwxNTM3
Nzg0NjksLTtIZXJlIEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5MzEyLDE1
Mzc3ODQ4MCwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjYsMTkzMTMs
MTUzNzc4NTA3LC07bWtpc3M6IGF4MDogVHJ5aW5nIGNyYy1mbGV4bmV0CjQsMTkzMTQsMTUz
Nzc4NTE4LC07SGVyZSBJIGFtOiBfX3R0eV9pbnNlcnRfZmxpcF9zdHJpbmdfZmxhZ3M6MzUx
IDI4IGNvcGllZAo0LDE5MzE1LDE1Mzc3ODU1MSwtO0hlcmUgSSBhbTogZmx1c2hfdG9fbGRp
c2M6NTA2CjQsMTkzMTYsMTUzNzc4NTU3LC07SGVyZSBJIGFtOiByZWNlaXZlX2J1Zjo0NzkK
NCwxOTMxNywxNTM3Nzg1NjYsLTtIZXJlIEkgYW06IG5fdHR5X3JlY2VpdmVfYnVmX2NvbW1v
bjoxNjg2CjQsMTkzMTgsMTUzNzc4NTc5LC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfcmVjZWl2
ZV9idWY6NDExIGNvdW50OjI4IGJ5dGVzIGJ1ZjIKNCwxOTMxOSwxNTM3Nzg1ODQsLTtIZXJl
IEkgYW06IHR0eV9sZGlzY19yZWNlaXZlX2J1Zjo0MjcgY291bnQ6MjggYnl0ZXMgcHJvY2Vz
c2VkCjQsMTkzMjAsMTUzNzc4NTkyLC07SGVyZSBJIGFtOiB0dHlfcG9ydF9kZWZhdWx0X3Jl
Y2VpdmVfYnVmOjQ2IGNvdW50OjI4CjQsMTkzMjEsMTUzNzc4NjAwLC07SGVyZSBJIGFtOiB0
dHlfbGRpc2NfZGVyZWY6MjgzICF0dHkKNCwxOTMyMiwxNTM3Nzg2MTUsLTtIZXJlIEkgYW06
IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5MzIzLDE1Mzc3ODYzNywtO0hlcmUgSSBh
bTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkzMjQsMTUzNzc4NjQzLC07SGVyZSBJ
IGFtOiB0dHlfbGRpc2NfZGVyZWY6MjgzICF0dHkKNCwxOTMyNSwxNTM3Nzg4NzksLTtIZXJl
IEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5MzI2LDE1Mzc3OTI4MywtO0hl
cmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkzMjcsMTUzNzc5MzI4LC07
SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVyZWY6MjgzICF0dHkKNCwxOTMyOCwxNTM3ODY4NDks
LTtIZXJlIEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5MzI5LDE1Mzc4Njg3
NSwtO0hlcmUgSSBhbTogX190dHlfaW5zZXJ0X2ZsaXBfc3RyaW5nX2ZsYWdzOjM1MSAyNzIg
Y29waWVkCjQsMTkzMzAsMTUzNzg2ODgyLC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVyZWY6
MjgzICF0dHkKNCwxOTMzMSwxNTM3ODY4ODgsLTtIZXJlIEkgYW06IGZsdXNoX3RvX2xkaXNj
OjUwNgo0LDE5MzMyLDE1Mzc4Njg5MSwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4
MyAhdHR5CjQsMTkzMzMsMTUzNzg2ODk3LC07SGVyZSBJIGFtOiByZWNlaXZlX2J1Zjo0NzkK
NCwxOTMzNCwxNTM3ODY5MDIsLTtIZXJlIEkgYW06IHR0eV9sZGlzY19yZWNlaXZlX2J1Zjo0
MTYgY291bnQ6MjcyIGJ5dGVzIHR0eSByZWNlaXZlX3Jvb20KNCwxOTMzNSwxNTM3ODY5MDYs
LTtIZXJlIEkgYW06IHR0eV9sZGlzY19yZWNlaXZlX2J1Zjo0MjEgY291bnQ6MjcyIGJ5dGVz
IC0tLT4gcmVjZWl2ZV9idWYKMSwxOTMzNiwxNTM3ODY5MzIsLTtCVUc6IGtlcm5lbCBOVUxM
IHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwZDAKMSwxOTMz
NywxNTM3ODY5MzcsLTsjUEY6IHN1cGVydmlzb3IgcmVhZCBhY2Nlc3MgaW4ga2VybmVsIG1v
ZGUKMSwxOTMzOCwxNTM3ODY5NTUsLTsjUEY6IGVycm9yX2NvZGUoMHgwMDAwKSAtIG5vdC1w
cmVzZW50IHBhZ2UKNiwxOTMzOSwxNTM3ODY5NjAsLTtQR0QgMCAKNCwxOTM0MCwxNTM3ODY5
NjAsLTtIZXJlIEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5MzQxLDE1Mzc4
Njk2NyxjO1A0RCAwIAo0LDE5MzQyLDE1Mzc4Njk3MiwtO09vcHM6IE9vcHM6IDAwMDAgWyMx
XSBTTVAgUFRJCjQsMTkzNDMsMTUzNzg2OTcyLC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVy
ZWY6MjgzICF0dHkKNCwxOTM0NCwxNTM3ODY5ODEsLTtDUFU6IDMgVUlEOiAwIFBJRDogNDgg
Q29tbToga3dvcmtlci91MTY6MiBOb3QgdGFpbnRlZCA2LjE3LjAtcmMyLWY2YnZwKyAjMjUg
UFJFRU1QVCh2b2x1bnRhcnkpIAo0LDE5MzQ1LDE1Mzc4Njk4NiwtO0hlcmUgSSBhbTogX190
dHlfaW5zZXJ0X2ZsaXBfc3RyaW5nX2ZsYWdzOjM1MSAyMTUgY29waWVkCjQsMTkzNDYsMTUz
Nzg2OTg4LC07SGFyZHdhcmUgbmFtZTogVG8gYmUgZmlsbGVkIGJ5IE8uRS5NLiBUbyBiZSBm
aWxsZWQgYnkgTy5FLk0uL0NLMywgQklPUyA1LjAxMSAwOS8xNi8yMDIwCjQsMTkzNDcsMTUz
Nzg2OTkwLC07V29ya3F1ZXVlOiBldmVudHNfdW5ib3VuZCBmbHVzaF90b19sZGlzYwo0LDE5
MzQ4LDE1Mzc4Njk5OCwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQs
MTkzNDksMTUzNzg3MDAzLC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVyZWY6MjgzICF0dHkK
NCwxOTM1MCwxNTM3ODcwMDUsLTtSSVA6IDAwMTA6X19uZXRpZl9yZWNlaXZlX3NrYl9jb3Jl
LmNvbnN0cHJvcC4wKzB4ZmU1LzB4MTJkMAo0LDE5MzUxLDE1Mzc4NzAwOSwtO0hlcmUgSSBh
bTogX190dHlfYnVmZmVyX3JlcXVlc3Rfcm9vbTozMDQgc2l6ZToyNTMKNCwxOTM1MiwxNTM3
ODcwMTEsLTtDb2RlOiA2YyAwZiA4MiAyNCAwMSAwMCAwMCA0OCAwMSA5MyBjMCAwMCAwMCAw
MCBlOSA1MiBmNSBmZiBmZiA0OCA4OSBkZiA0ZCA4OSBmNSBlOCBlNyBiNCBmZCBmZiBlOSBj
OSBmZCBmZiBmZiA0YyA4ZCA4OCBkMCAwMCAwMCAwMCA8NDg+IDhiIDgwIGQwIDAwIDAwIDAw
IDRjIDhkIDc4IGM4IDQ5IDM5IGMxIDBmIDg0IDZjIGZhIGZmIGZmIDQ0IDg4CjQsMTkzNTMs
MTUzNzg3MDE1LC07UlNQOiAwMDE4OmZmZmZkMTMwNDAxODRjOTggRUZMQUdTOiAwMDAxMDI4
Ngo0LDE5Mzc5LDE1Mzc4NzEyMSwtO0NSMjogMDAwMDAwMDAwMDAwMDBkMCBDUjM6IDAwMDAw
MDAxYTU0NDAwMDIgQ1I0OiAwMDAwMDAwMDAwMTcyNmYwCjQsMTkzODAsMTUzNzg3MTI0LC07
Q2FsbCBUcmFjZToKNCwxOTM4MSwxNTM3ODcxMjgsLTtIZXJlIEkgYW06IF9fdHR5X2luc2Vy
dF9mbGlwX3N0cmluZ19mbGFnczozNTEgMjUzIGNvcGllZAo0LDE5MzgyLDE1Mzc4NzEzMSwt
O0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkzODMsMTUzNzg3MTMz
LC07SGVyZSBJIGFtOiBmbHVzaF90b19sZGlzYzo1MDYKNCwxOTM4NCwxNTM3ODcxMzUsLTtI
ZXJlIEkgYW06IHJlY2VpdmVfYnVmOjQ3OQo0LDE5Mzg1LDE1Mzc4NzEzNywtO0hlcmUgSSBh
bTogbl90dHlfcmVjZWl2ZV9idWZfY29tbW9uOjE2ODYKNCwxOTM4NiwxNTM3ODcxNDAsLTtI
ZXJlIEkgYW06IHR0eV9sZGlzY19yZWNlaXZlX2J1Zjo0MTEgY291bnQ6MjUzIGJ5dGVzIGJ1
ZjIKNCwxOTM4NywxNTM3ODcxNDIsLTtIZXJlIEkgYW06IHR0eV9sZGlzY19yZWNlaXZlX2J1
Zjo0MjcgY291bnQ6MjUzIGJ5dGVzIHByb2Nlc3NlZAo0LDE5Mzg4LDE1Mzc4NzE0NCwtO0hl
cmUgSSBhbTogdHR5X3BvcnRfZGVmYXVsdF9yZWNlaXZlX2J1Zjo0NiBjb3VudDoyNTMKNCwx
OTM4OSwxNTM3ODcxNDUsLTtIZXJlIEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0
LDE5MzkwLDE1Mzc4NzE0OSwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5
CjQsMTkzOTEsMTUzNzg3MTY0LC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVyZWY6MjgzICF0
dHkKNCwxOTM5MiwxNTM3ODcxNjcsLTtIZXJlIEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMg
IXR0eQo0LDE5MzkzLDE1Mzc4NzE3NiwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4
MyAhdHR5CjQsMTkzOTQsMTUzNzg3MTgzLC07SGVyZSBJIGFtOiB0dHlfbGRpc2NfZGVyZWY6
MjgzICF0dHkKNCwxOTM5NSwxNTM3ODcxODksLTsgPElSUT4KNCwxOTM5NiwxNTM3ODcyNTcs
LTtIZXJlIEkgYW06IHR0eV9sZGlzY19kZXJlZjoyODMgIXR0eQo0LDE5Mzk3LDE1Mzc4NzI1
OSwtO0hlcmUgSSBhbTogdHR5X2xkaXNjX2RlcmVmOjI4MyAhdHR5CjQsMTkzOTgsMTUzNzg3
MjY1LC07IF9fbmV0aWZfcmVjZWl2ZV9za2Jfb25lX2NvcmUrMHgzZC8weGEwCjQsMTkzOTks
MTUzNzg3NDA3LC07IF9fbmV0aWZfcmVjZWl2ZV9za2IrMHgxNS8weDYwCjQsMTk0MDAsMTUz
Nzg3NDE0LC07IHByb2Nlc3NfYmFja2xvZysweDkwLzB4MTYwCjQsMTk0MDEsMTUzNzg3NDIx
LC07IF9fbmFwaV9wb2xsKzB4MzMvMHgyMzAKNCwxOTQwMiwxNTM3ODc0ODUsLTsgbmV0X3J4
X2FjdGlvbisweDIwYi8weDNmMAo0LDE5NDAzLDE1Mzc4NzQ5MywtOyA/IHVwZGF0ZV9wcm9j
ZXNzX3RpbWVzKzB4ODkvMHhkMAo0LDE5NDA0LDE1Mzc4NzUwNCwtOyBoYW5kbGVfc29mdGly
cXMrMHhlNy8weDM0MAo0LDE5NDA1LDE1Mzc4NzUxMiwtOyBfX2RvX3NvZnRpcnErMHgxMC8w
eDE4CjQsMTk0MDYsMTUzNzg3NTE5LC07IGRvX3NvZnRpcnEucGFydC4wKzB4M2YvMHg4MAo0
LDE5NDA3LDE1Mzc4NzUyNiwtOyA8L0lSUT4KNCwxOTQwOCwxNTM3ODc1MzAsLTsgPFRBU0s+
CjQsMTk0MDksMTUzNzg3NTM1LC07IF9fbG9jYWxfYmhfZW5hYmxlX2lwKzB4NmUvMHg3MAo0
LDE5NDEwLDE1Mzc4NzU0MiwtOyBfcmF3X3NwaW5fdW5sb2NrX2JoKzB4MWQvMHgzMAo0LDE5
NDExLDE1Mzc4NzU1MywtOyBta2lzc19yZWNlaXZlX2J1ZisweDM2Yi8weDRiMCBbbWtpc3Nd
CjQsMTk0MTIsMTUzNzg3NTYyLC07IHR0eV9sZGlzY19yZWNlaXZlX2J1ZisweGVkLzB4MTAw
CjQsMTk0MTMsMTUzNzg3NTY5LC07IHR0eV9wb3J0X2RlZmF1bHRfcmVjZWl2ZV9idWYrMHg0
My8weGQwCjQsMTk0MTQsMTUzNzg3NTc2LC07IGZsdXNoX3RvX2xkaXNjKzB4ZjkvMHgxZjAK
NCwxOTQxNSwxNTM3ODc1ODIsLTsgPyBxdWV1ZV9kZWxheWVkX3dvcmtfb24rMHg4MS8weDkw
CjQsMTk0MTYsMTUzNzg3NjAzLC07IHByb2Nlc3Nfb25lX3dvcmsrMHgxOTEvMHgzZTAKNCwx
OTQxNywxNTM3ODc2MDksLTsgd29ya2VyX3RocmVhZCsweDJlMy8weDQyMAo0LDE5NDE4LDE1
Mzc4NzYxNSwtOyA/IF9fcGZ4X3dvcmtlcl90aHJlYWQrMHgxMC8weDEwCjQsMTk0MTksMTUz
Nzg3NjIxLC07IGt0aHJlYWQrMHgxMGQvMHgyMzAKNCwxOTQyMCwxNTM3ODc2MjcsLTsgPyBf
X3BmeF9rdGhyZWFkKzB4MTAvMHgxMAozLDE5NDI5LDE1Mzg3MTI4OSwtO3BzdG9yZTogYmFj
a2VuZCAoZWZpX3BzdG9yZSkgd3JpdGluZyBlcnJvciAoLTUpCjQsMTk0MzAsMTUzODcxMjk2
LC07UklQOiAwMDEwOl9fbmV0aWZfcmVjZWl2ZV9za2JfY29yZS5jb25zdHByb3AuMCsweGZl
NS8weDEyZDAKNCwxOTQzMSwxNTM4NzEzMDIsLTtDb2RlOiA2YyAwZiA4MiAyNCAwMSAwMCAw
MCA0OCAwMSA5MyBjMCAwMCAwMCAwMCBlOSA1MiBmNSBmZiBmZiA0OCA4OSBkZiA0ZCA4OSBm
NSBlOCBlNyBiNCBmZCBmZiBlOSBjOSBmZCBmZiBmZiA0YyA4ZCA4OCBkMCAwMCAwMCAwMCA8
NDg+IDhiIDgwIGQwIDAwIDAwIDAwIDRjIDhkIDc4IGM4IDQ5IDM5IGMxIDBmIDg0IDZjIGZh
IGZmIGZmIDQ0IDg4CjQsMTk0MzIsMTUzODcxMzA2LC07UlNQOiAwMDE4OmZmZmZkMTMwNDAx
ODRjOTggRUZMQUdTOiAwMDAxMDI4Ngo0LDE5NDMzLDE1Mzg3MTMxMSwtO1JBWDogMDAwMDAw
MDAwMDAwMDAwMCBSQlg6IGZmZmY4ZDY0NjgzZjg5MDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAw
CjQsMTk0MzQsMTUzODcxMzE0LC07UkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAw
MDAwMDAwMDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDAKNCwxOTQzNSwxNTM4NzEzMTcsLTtS
QlA6IGZmZmZkMTMwNDAxODRkYTggUjA4OiAwMDAwMDAwMDAwMDAwMjAwIFIwOTogMDAwMDAw
MDAwMDAwMDBkMAo0LDE5NDM2LDE1Mzg3MTM3NCwtO1IxMDogMDAwMDAwMDAwMDAwMDAwMCBS
MTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEyOiBmZmZmOGQ2NDY4MWIzNTQwCjQsMTk0MzcsMTUz
ODcxMzc3LC07UjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDIwMCBS
MTU6IGZmZmY4ZDY0NTlkMTcwZDAKNCwxOTQzOCwxNTM4NzEzODEsLTtGUzogIDAwMDAwMDAw
MDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjhkNjVmNWEzYjAwMCgwMDAwKSBrbmxHUzowMDAwMDAw
MDAwMDAwMDAwCjQsMTk0MzksMTUzODcxMzg1LC07Q1M6ICAwMDEwIERTOiAwMDAwIEVTOiAw
MDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo0LDE5NDQwLDE1Mzg3MTM4OCwtO0NSMjogMDAw
MDAwMDAwMDAwMDBkMCBDUjM6IDAwMDAwMDAxYTU0NDAwMDIgQ1I0OiAwMDAwMDAwMDAwMTcy
NmYwCjAsMTk0NDEsMTUzODcxMzkxLC07S2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEZh
dGFsIGV4Y2VwdGlvbiBpbiBpbnRlcnJ1cHQKMCwxOTQ0MiwxNTM4NzE0MDcsLTtLZXJuZWwg
T2Zmc2V0OiAweDE2MDAwMDAwIGZyb20gMHhmZmZmZmZmZjgxMDAwMDAwIChyZWxvY2F0aW9u
IHJhbmdlOiAweGZmZmZmZmZmODAwMDAwMDAtMHhmZmZmZmZmZmJmZmZmZmZmKQowLDE5NDQz
LDE1Mzk1MTU2MiwtO1JlYm9vdGluZyBpbiAzMCBzZWNvbmRzLi4KDQo=

--------------RJBeJ3TOcgg0xkQivEaIjTqK--

