Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3447C58BC3E
	for <lists+linux-hams@lfdr.de>; Sun,  7 Aug 2022 20:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbiHGSNJ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 7 Aug 2022 14:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbiHGSNI (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 7 Aug 2022 14:13:08 -0400
X-Greylist: delayed 505 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 07 Aug 2022 11:13:06 PDT
Received: from shiva-su1.sorbonne-universite.fr (shiva-su1.sorbonne-universite.fr [134.157.0.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7882C63B6;
        Sun,  7 Aug 2022 11:13:06 -0700 (PDT)
Received: from nirriti.ent.upmc.fr (nirriti.dsi.upmc.fr [134.157.0.215])
        by shiva-su1.sorbonne-universite.fr (Postfix) with ESMTP id D5B99411B383;
        Sun,  7 Aug 2022 20:04:39 +0200 (CEST)
Received: from [44.168.19.21] (lfbn-idf1-1-596-24.w86-242.abo.wanadoo.fr [86.242.59.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pidoux)
        by nirriti.ent.upmc.fr (Postfix) with ESMTPSA id C0E2A13FF8FF9;
        Sun,  7 Aug 2022 20:04:39 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------5j3LeEt6YOMc3wYrUcuhwrvK"
Message-ID: <66c85963-fc9e-e8fa-2b82-32be5842173d@free.fr>
Date:   Sun, 7 Aug 2022 20:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH] AX25 rose_call - replacing carriage return by newlines
Content-Language: en-US
To:     linux-hams@vger.kernel.org
Cc:     Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>,
        netdev@vger.kernel.org, Francois Romieu <romieu@fr.zoreil.com>
References: <d5e93cc7-a91f-13d3-49a1-b50c11f0f811@free.fr>
 <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
 <A9A8A0B7-5009-4FB0-9317-5033DE17E701@osterried.de>
 <Yuf04XIsXrQMJuUy@electric-eye.fr.zoreil.com>
From:   f6bvp <f6bvp@free.fr>
In-Reply-To: <Yuf04XIsXrQMJuUy@electric-eye.fr.zoreil.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------5j3LeEt6YOMc3wYrUcuhwrvK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

[PATCH] AX25 rose_call - replacing carriage return by newlines

I have been using intensively rose_call application (part of 
ax25tools/user_call library) while debugging rose connect issue.

However once connected rose_call displays remote message without 
linefeed. Consequently it is impossible to read messages.

For example calling local node :

# rose_call rose0 f6bvp f6bvp-4 2080175524
Connecting to f6bvp-4 @ 2080175524 ...

*** Connected

F6BVP-4 (Commands = ?) : Aug  5 2022) for LINUX (help = h)


Then issuing command P to the connected local node, all answer
lines are superimposed.

F6BVP-4 (Commands = ?) : Switch Port


Now with the proposed patch is the complete info displayed:

# ./rose_call rose0 f6bvp f6bvp-4 2080175524

Connecting to f6bvp-4 @ 2080175524 ...

*** Connected

User call : F6BVP-0

Welcome to the last release of Fpac!

This file is fpac.hello and is displayed when

a user connects to the node.



FPAC-Node v 4.1.3 (built Aug  5 2022) for LINUX (help = h)

F6BVP-4 (Commands = ?) :


In file rose_call.c carriage returns are also replaced by newlines
in order to let error messages to be correctly displayed.

Cc: Thomas DL9SAU Osterried <thomas@osterried.de>
Cc: Francois Romieu <romieu@fr.zoreil.com>
Signed-off-by: Bernard Pidoux <f6bvp@free.fr>


--------------5j3LeEt6YOMc3wYrUcuhwrvK
Content-Type: text/x-patch; charset=UTF-8;
 name="replace_return-linefeed_in_rose_call.patch"
Content-Disposition: attachment;
 filename="replace_return-linefeed_in_rose_call.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2xpbnV4YXgyNS1tYXN0ZXItZjZidnAvYXgyNXRvb2xzL3VzZXJfY2Fs
bC91c2VyX2lvLmMgYi9saW51eGF4MjUtbWFzdGVyL2F4MjV0b29scy91c2VyX2NhbGwvdXNl
cl9pby5jCmluZGV4IDNiZDZhMjYuLjkyYzQ3YTYgMTAwNjQ0Ci0tLSBhL2xpbnV4YXgyNS1t
YXN0ZXIvYXgyNXRvb2xzL3VzZXJfY2FsbC91c2VyX2lvLmMKKysrIGIvbGludXhheDI1LW1h
c3Rlci9heDI1dG9vbHMvdXNlcl9jYWxsL3VzZXJfaW8uYwpAQCAtMTc0LDYgKzE3NCwxNiBA
QCBpbnQgdXNlcl9yZWFkKGludCBmZCwgdm9pZCAqYnVmLCBzaXplX3QgY291bnQpCiAjZW5k
aWYKIH0KIAordm9pZCBsaW5lZmVlZF9idWZmZXIoY2hhciAqYnVmLCBzaXplX3QgY291bnQp
Cit7CisJaW50IGk7CisKKwlmb3IgKGk9MCA7IGkgPCBjb3VudCA7IGkrKykgeworCQlpZihi
dWZbaV0gPT0gMHgwRCkKKwkJCWJ1ZltpXSA9IDB4MEE7CisJfQorfQorCiBpbnQgc2VsZWN0
X2xvb3AoaW50IHMpCiB7CiAJZmRfc2V0IHJlYWRfZmQ7CkBAIC0xOTksOCArMjA5LDEwIEBA
IGludCBzZWxlY3RfbG9vcChpbnQgcykKIAkJc2VsZWN0KHMgKyAxLCAmcmVhZF9mZCwgTlVM
TCwgTlVMTCwgTlVMTCk7CiAKIAkJaWYgKEZEX0lTU0VUKHMsICZyZWFkX2ZkKSkgewotCQkJ
d2hpbGUgKChuID0gdXNlcl9yZWFkKHMsIGJ1ZiwgQlVGTEVOKSkgPiAwKQorCQkJd2hpbGUg
KChuID0gdXNlcl9yZWFkKHMsIGJ1ZiwgQlVGTEVOKSkgPiAwKSB7CisJCQkJbGluZWZlZWRf
YnVmZmVyKGJ1ZiwgQlVGTEVOKTsKIAkJCQl1c2VyX3dyaXRlKFNURE9VVF9GSUxFTk8sIGJ1
Ziwgbik7CisJCQl9CiAJCQlpZiAobiA9PSAwIHx8IChuIDwgMCAmJiBlcnJubyAhPSBFQUdB
SU4pKSB7CiAJCQkJY2xvc2Uocyk7CiAJCQkJYnJlYWs7CgoKZGlmZiAtLWdpdCBhL2xpbnV4
YXgyNS1tYXN0ZXItZjZidnAvYXgyNXRvb2xzL3VzZXJfY2FsbC9yb3NlX2NhbGwuYyBiL2xp
bnV4YXgyNS1tYXN0ZXIvYXgyNXRvb2xzL3VzZXJfY2FsbC9yb3NlX2NhbGwuYwppbmRleCAw
M2JiYTA4Li43YTdkZWExIDEwMDY0NAotLS0gYS9saW51eGF4MjUtbWFzdGVyLWY2YnZwL2F4
MjV0b29scy91c2VyX2NhbGwvcm9zZV9jYWxsLmMKKysrIGIvbGludXhheDI1LW1hc3Rlci9h
eDI1dG9vbHMvdXNlcl9jYWxsL3Jvc2VfY2FsbC5jCkBAIC00NCwxMyArNDQsMTMgQEAgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQkJYnJlYWs7CiAJCWNhc2UgJzonOgog
CQljYXNlICc/JzoKLQkJCWVycigiRVJST1I6IGludmFsaWQgb3B0aW9uIHVzYWdlXG4iKTsK
KwkJCWVycigiRVJST1I6IGludmFsaWQgb3B0aW9uIHVzYWdlXHIiKTsKIAkJCXJldHVybiAx
OwogCQl9CiAJfQogCiAJaWYgKHBhY2xlbl9pbiA8IDEgfHwgcGFjbGVuX291dCA8IDEpIHsK
LQkJZXJyKCJFUlJPUjogaW52YWxpZCBwYWNsZW5cbiIpOworCQllcnIoIkVSUk9SOiBpbnZh
bGlkIHBhY2xlblxyIik7CiAJCXJldHVybiAxOwogCX0KIApAQCAtNTgsMTIgKzU4LDEyIEBA
IGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAkgKiBBcmd1bWVudHMgc2hvdWxk
IGJlICJyb3NlX2NhbGwgcG9ydCBteWNhbGwgcmVtY2FsbCByZW1hZGRyIgogCSAqLwogCWlm
ICgoYXJnYyAtIG9wdGluZCkgIT0gNCkgewotCQlzdHJjcHkoYnVmZmVyLCAiRVJST1I6IGlu
dmFsaWQgbnVtYmVyIG9mIHBhcmFtZXRlcnNcbiIpOworCQlzdHJjcHkoYnVmZmVyLCAiRVJS
T1I6IGludmFsaWQgbnVtYmVyIG9mIHBhcmFtZXRlcnNcciIpOwogCQllcnIoYnVmZmVyKTsK
IAl9CiAKIAlpZiAocnNfY29uZmlnX2xvYWRfcG9ydHMoKSA9PSAwKSB7Ci0JCXN0cmNweShi
dWZmZXIsICJFUlJPUjogcHJvYmxlbSB3aXRoIHJzcG9ydHMgZmlsZVxuIik7CisJCXN0cmNw
eShidWZmZXIsICJFUlJPUjogcHJvYmxlbSB3aXRoIHJzcG9ydHMgZmlsZVxyIik7CiAJCWVy
cihidWZmZXIpOwogCX0KIApAQCAtNzUsMjcgKzc1LDI3IEBAIGludCBtYWluKGludCBhcmdj
LCBjaGFyICoqYXJndikKIAogCWFkZHIgPSByc19jb25maWdfZ2V0X2FkZHIoYXJndltvcHRp
bmRdKTsKIAlpZiAoYWRkciA9PSBOVUxMKSB7Ci0JCXNwcmludGYoYnVmZmVyLCAiRVJST1I6
IGludmFsaWQgUm9zZSBwb3J0IG5hbWUgLSAlc1xuIiwgYXJndltvcHRpbmRdKTsKKwkJc3By
aW50ZihidWZmZXIsICJFUlJPUjogaW52YWxpZCBSb3NlIHBvcnQgbmFtZSAtICVzXHIiLCBh
cmd2W29wdGluZF0pOwogCQllcnIoYnVmZmVyKTsKIAl9CiAKIAlpZiAocm9zZV9hdG9uKGFk
ZHIsIHJvc2ViaW5kLnNyb3NlX2FkZHIucm9zZV9hZGRyKSA9PSAtMSkgewotCQlzcHJpbnRm
KGJ1ZmZlciwgIkVSUk9SOiBpbnZhbGlkIFJvc2UgcG9ydCBhZGRyZXNzIC0gJXNcbiIsIGFy
Z3Zbb3B0aW5kXSk7CisJCXNwcmludGYoYnVmZmVyLCAiRVJST1I6IGludmFsaWQgUm9zZSBw
b3J0IGFkZHJlc3MgLSAlc1xyIiwgYXJndltvcHRpbmRdKTsKIAkJZXJyKGJ1ZmZlcik7CiAJ
fQogCiAJaWYgKGF4MjVfYXRvbl9lbnRyeShhcmd2W29wdGluZCArIDFdLCByb3NlYmluZC5z
cm9zZV9jYWxsLmF4MjVfY2FsbCkgPT0gLTEpIHsKLQkJc3ByaW50ZihidWZmZXIsICJFUlJP
UjogaW52YWxpZCBjYWxsc2lnbiAtICVzXG4iLCBhcmd2W29wdGluZCArIDFdKTsKKwkJc3By
aW50ZihidWZmZXIsICJFUlJPUjogaW52YWxpZCBjYWxsc2lnbiAtICVzXHIiLCBhcmd2W29w
dGluZCArIDFdKTsKIAkJZXJyKGJ1ZmZlcik7CiAJfQogCiAJaWYgKGF4MjVfYXRvbl9lbnRy
eShhcmd2W29wdGluZCArIDJdLCByb3NlY29ubmVjdC5zcm9zZV9jYWxsLmF4MjVfY2FsbCkg
PT0gLTEpIHsKLQkJc3ByaW50ZihidWZmZXIsICJFUlJPUjogaW52YWxpZCBjYWxsc2lnbiAt
ICVzXG4iLCBhcmd2W29wdGluZCArIDJdKTsKKwkJc3ByaW50ZihidWZmZXIsICJFUlJPUjog
aW52YWxpZCBjYWxsc2lnbiAtICVzXHIiLCBhcmd2W29wdGluZCArIDJdKTsKIAkJZXJyKGJ1
ZmZlcik7CiAJfQogCiAJaWYgKHJvc2VfYXRvbihhcmd2W29wdGluZCArIDNdLCByb3NlY29u
bmVjdC5zcm9zZV9hZGRyLnJvc2VfYWRkcikgPT0gLTEpIHsKLQkJc3ByaW50ZihidWZmZXIs
ICJFUlJPUjogaW52YWxpZCBSb3NlIGFkZHJlc3MgLSAlc1xuIiwgYXJndltvcHRpbmQgKyAz
XSk7CisJCXNwcmludGYoYnVmZmVyLCAiRVJST1I6IGludmFsaWQgUm9zZSBhZGRyZXNzIC0g
JXNcciIsIGFyZ3Zbb3B0aW5kICsgM10pOwogCQllcnIoYnVmZmVyKTsKIAl9CiAKQEAgLTEw
NCw3ICsxMDQsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJICovCiAJ
cyA9IHNvY2tldChBRl9ST1NFLCBTT0NLX1NFUVBBQ0tFVCwgMCk7CiAJaWYgKHMgPCAwKSB7
Ci0JCXNwcmludGYoYnVmZmVyLCAiRVJST1I6IGNhbm5vdCBvcGVuIFJvc2Ugc29ja2V0LCAl
c1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKKwkJc3ByaW50ZihidWZmZXIsICJFUlJPUjogY2Fu
bm90IG9wZW4gUm9zZSBzb2NrZXQsICVzXHIiLCBzdHJlcnJvcihlcnJubykpOwogCQllcnIo
YnVmZmVyKTsKIAl9CiAKQEAgLTExMiwxMSArMTEyLDExIEBAIGludCBtYWluKGludCBhcmdj
LCBjaGFyICoqYXJndikKIAkgKiBTZXQgb3VyIEFYLjI1IGNhbGxzaWduIGFuZCBSb3NlIGFk
ZHJlc3MgYWNjb3JkaW5nbHkuCiAJICovCiAJaWYgKGJpbmQocywgKHN0cnVjdCBzb2NrYWRk
ciAqKSZyb3NlYmluZCwgYWRkcmxlbikgIT0gMCkgewotCQlzcHJpbnRmKGJ1ZmZlciwgIkVS
Uk9SOiBjYW5ub3QgYmluZCBSb3NlIHNvY2tldCwgJXNcbiIsIHN0cmVycm9yKGVycm5vKSk7
CisJCXNwcmludGYoYnVmZmVyLCAiRVJST1I6IGNhbm5vdCBiaW5kIFJvc2Ugc29ja2V0LCAl
c1xyIiwgc3RyZXJyb3IoZXJybm8pKTsKIAkJZXJyKGJ1ZmZlcik7CiAJfQogCi0Jc3ByaW50
ZihidWZmZXIsICJDb25uZWN0aW5nIHRvICVzIEAgJXMgLi4uXG4iLCBhcmd2W29wdGluZCAr
IDJdLCBhcmd2W29wdGluZCArIDNdKTsKKwlzcHJpbnRmKGJ1ZmZlciwgIkNvbm5lY3Rpbmcg
dG8gJXMgQCAlcyAuLi5cciIsIGFyZ3Zbb3B0aW5kICsgMl0sIGFyZ3Zbb3B0aW5kICsgM10p
OwogCXVzZXJfd3JpdGUoU1RET1VUX0ZJTEVOTywgYnVmZmVyLCBzdHJsZW4oYnVmZmVyKSk7
CiAKIAkvKgpAQCAtMTMyLDE2ICsxMzIsMTYgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
Kiphcmd2KQogCWlmIChjb25uZWN0KHMsIChzdHJ1Y3Qgc29ja2FkZHIgKikmcm9zZWNvbm5l
Y3QsIGFkZHJsZW4pICE9IDApIHsKIAkJc3dpdGNoIChlcnJubykgewogCQljYXNlIEVDT05O
UkVGVVNFRDoKLQkJCXN0cmNweShidWZmZXIsICIqKiogQ29ubmVjdGlvbiByZWZ1c2VkIC0g
YWJvcnRpbmdcbiIpOworCQkJc3RyY3B5KGJ1ZmZlciwgIioqKiBDb25uZWN0aW9uIHJlZnVz
ZWQgLSBhYm9ydGluZ1xyIik7CiAJCQlicmVhazsKIAkJY2FzZSBFTkVUVU5SRUFDSDoKLQkJ
CXN0cmNweShidWZmZXIsICIqKiogTm8ga25vd24gcm91dGUgLSBhYm9ydGluZ1xuIik7CisJ
CQlzdHJjcHkoYnVmZmVyLCAiKioqIE5vIGtub3duIHJvdXRlIC0gYWJvcnRpbmdcciIpOwog
CQkJYnJlYWs7CiAJCWNhc2UgRUlOVFI6Ci0JCQlzdHJjcHkoYnVmZmVyLCAiKioqIENvbm5l
Y3Rpb24gdGltZWQgb3V0IC0gYWJvcnRpbmdcbiIpOworCQkJc3RyY3B5KGJ1ZmZlciwgIioq
KiBDb25uZWN0aW9uIHRpbWVkIG91dCAtIGFib3J0aW5nXHIiKTsKIAkJCWJyZWFrOwogCQlk
ZWZhdWx0OgotCQkJc3ByaW50ZihidWZmZXIsICJFUlJPUjogY2Fubm90IGNvbm5lY3QgdG8g
Um9zZSBhZGRyZXNzLCAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKKwkJCXNwcmludGYoYnVm
ZmVyLCAiRVJST1I6IGNhbm5vdCBjb25uZWN0IHRvIFJvc2UgYWRkcmVzcywgJXNcciIsIHN0
cmVycm9yKGVycm5vKSk7CiAJCQlicmVhazsKIAkJfQogCkBAIC0xNTMsMTIgKzE1MywxMiBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJICovCiAJYWxhcm0oMCk7CiAK
LQlzdHJjcHkoYnVmZmVyLCAiKioqIENvbm5lY3RlZFxuIik7CisJc3RyY3B5KGJ1ZmZlciwg
IioqKiBDb25uZWN0ZWRcciIpOwogCXVzZXJfd3JpdGUoU1RET1VUX0ZJTEVOTywgYnVmZmVy
LCBzdHJsZW4oYnVmZmVyKSk7CiAKIAlzZWxlY3RfbG9vcChzKTsKIAotCXN0cmNweShidWZm
ZXIsICJcbioqKiBEaXNjb25uZWN0ZWRcbiIpOworCXN0cmNweShidWZmZXIsICJccioqKiBE
aXNjb25uZWN0ZWRcciIpOwogCXVzZXJfd3JpdGUoU1RET1VUX0ZJTEVOTywgYnVmZmVyLCBz
dHJsZW4oYnVmZmVyKSk7CiAKIAllbmRfY29tcHJlc3MoKTsK

--------------5j3LeEt6YOMc3wYrUcuhwrvK--
