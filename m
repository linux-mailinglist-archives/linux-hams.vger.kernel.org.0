Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745544AB24D
	for <lists+linux-hams@lfdr.de>; Sun,  6 Feb 2022 22:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbiBFVUZ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 6 Feb 2022 16:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbiBFVUY (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 6 Feb 2022 16:20:24 -0500
X-Greylist: delayed 455 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 13:20:21 PST
Received: from shiva-su2.sorbonne-universite.fr (shiva-su2.sorbonne-universite.fr [134.157.0.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BAC10C06173B
        for <linux-hams@vger.kernel.org>; Sun,  6 Feb 2022 13:20:21 -0800 (PST)
Received: from nirriti.ent.upmc.fr (nirriti.dsi.upmc.fr [134.157.0.215])
        by shiva-su2.sorbonne-universite.fr (Postfix) with ESMTP id BADCA42422D4
        for <linux-hams@vger.kernel.org>; Sun,  6 Feb 2022 22:12:44 +0100 (CET)
Received: from [44.168.19.21] (lfbn-idf1-1-460-252.w86-242.abo.wanadoo.fr [86.242.166.252])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pidoux)
        by nirriti.ent.upmc.fr (Postfix) with ESMTPSA id C51B612A622A1
        for <linux-hams@vger.kernel.org>; Sun,  6 Feb 2022 22:12:44 +0100 (CET)
Content-Type: multipart/mixed; boundary="------------JTkl04c546C05jl2OsCMBznl"
Message-ID: <207b1242-dfb9-1832-c7f6-c4602ad2e9e6@free.fr>
Date:   Sun, 6 Feb 2022 22:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [AX25] unreleased sockets after disconnecting
Content-Language: fr
To:     linux-hams@vger.kernel.org
References: <4B2CD772.1030106@upmc.fr> <4B2D1025.1020106@gmail.com>
 <4B2E6729.1090102@free.fr> <4B507FAA.8010007@free.fr>
 <20100115203654.GA3084@del.dom.local> <4DFA6A59.2000709@free.fr>
 <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
From:   "Bernard Pidoux , f6bvp" <f6bvp@free.fr>
Organization: Dimension Parabole
In-Reply-To: <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
        SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------JTkl04c546C05jl2OsCMBznl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

For long time it as been reported by many AX.25 users that connexions 
were precluded after terminating a connexion with a remote station.

Some hamradio maintainers have been pretending not to be aware of such 
issue for lacking proofs.

I must restart my packet radio FPAC node (AX.25, ROSE and NetRom 
protocoles) every other hour in order to let connexions available again 
for neighbours.

Here are some evidence from cat  /proc/net/ax25 showing old remnants of 
connexions presumably there for ax25 sockets were not released.

73 de Bernard, f6bvp

http://radiotelescope-lavillette.fr/
http://f6bvp.org

--------------JTkl04c546C05jl2OsCMBznl
Content-Type: text/plain; charset=UTF-8; name="proc_net_ax25.txt"
Content-Disposition: attachment; filename="proc_net_ax25.txt"
Content-Transfer-Encoding: base64

77u/cGlARjZCVlAtODp+ICQgY2F0IC9wcm9jL25ldC9heDI1CjUwMDNjZWNlIGF4MCBGNkJW
UC0xNCBDVDFFTkktOCAzIDAgMCAwIDAgMTAgMCAzIDI4OSAzMDAgMCAwIDAgMTAgNSAyIDI1
NiAqICogKgo2Y2M0NDQzOSBheDAgRjZCVlAtOCogRjZCVlAtMSxGNkJWUC04KiAxIDAgMCAw
IDM0IDQwIDAgMyAwIDMwMCAwIDAgMyAxMCA1IDIgMjU2IDAgMCAxNDYzOTUKZjUxMzMzODkg
YXgwIEY2QlZQLTEgKiAwIDAgMCAwIDAgMTAgMCAzIDAgMzAwIDAgMCAwIDEwIDUgMiAyNTYg
MCAwIDE1MDczOApkNjZkMTcyYSBheDAgRjZCVlAtMSAqIDAgMCAwIDAgMCAxMCAwIDMgMCAz
MDAgMCAwIDAgMTAgNSAyIDI1NiAwIDAgMTUwMTc3CjY5MTI2NzE2IGF4MCBGNkJWUC05IEY2
QlZQLTcgMyA1IDYgNSAwIDcgMCAzIDIwOCAzMDAgMCAwIDAgMTAgMyAyIDI1NiAqICogKgpi
MzY5ZjAyOSBheDAgRjZCVlAtOSBWRTNYUEctOSAxIDAgMCAwIDQ2IDUwIDAgMyAwIDMwMCAw
IDAgNCAxMCA1IDIgMjU2ICogKiAqCjc2NmY4ZjllIGF4MCBGNkJWUC05IEs0R0JCLTkgMSAw
IDAgMCA0NiA1MCAwIDMgMCAzMDAgMCAwIDQgMTAgNSAyIDI1NiAqICogKgo2YTJiNzhlOCBh
eDAgRjZCVlAtOSBGNktLUi05IDMgMyA0IDMgMCA3IDAgMyAyMDQgMzAwIDAgMCAwIDEwIDMg
MiAyNTYgKiAqICoKYjQyMWZmZWQgYXgwIEY2QlZQLTkgRjZDTkItOSAxIDAgMCAwIDQ2IDUw
IDAgMyAwIDMwMCAwIDAgNCAxMCA1IDIgMjU2ICogKiAqCmE5YmNhYjczIGF4MCBGNkJWUC05
IEYzS1QtMTEgMyAzIDMgMyAwIDcgMCAzIDIwNCAzMDAgMCAwIDAgMTAgMyAyIDI1NiAqICog
KgpjZDNjYTJlMiBheDAgRjZCVlAtOSBGNUtUUi0xMSAzIDMgMyAzIDAgNyAwIDMgMjA0IDMw
MCAwIDAgMCAxMCAzIDIgMjU2ICogKiAqCmIyNzg2ZTE5IGF4MCBGNkJWUC05IEY2QlZQLTEx
IDMgNiA2IDYgMCA3IDAgMyAyMDggMzAwIDAgMCAwIDEwIDMgMiAyNTYgKiAqICoKZTc2YWNj
NjAgYXgwIEY2QlZQLTkgRjZDTkItMTEgMSAwIDAgMCA0NiA1MCAwIDMgMCAzMDAgMCAwIDQg
MTAgNSAyIDI1NiAqICogKgpiNzkxNmM0ZCBheDAgRjZCVlAtOSBGNkJWUC01IDEgMCAwIDAg
NDYgNTAgMCAzIDAgMzAwIDAgMCA0IDEwIDUgMiAyNTYgKiAqICoKYzUyNGU1ZTIgYXgwIEY2
QlZQLTkgU1YySFJULTkgMyAzIDQgMyAwIDcgMCAzIDIwNiAzMDAgMCAwIDAgMTAgMyAyIDI1
NiAqICogKgozN2U5ZGVjNSBheDAgRjZCVlAtOSBOQTdLUi05IDEgMCAwIDAgNDYgNTAgMCAz
IDAgMzAwIDAgMCA0IDEwIDUgMiAyNTYgKiAqICoKNWRmMTJjOTggPz8/IEY2QlZQLTE1KiAq
IDAgMCAwIDAgMCAxMCAwIDMgMCAzMDAgMCAwIDAgMTAgNSAyIDI1NiAwIDAgMTQ2Mjk3CjVj
MjJmMzk5ID8/PyBGNkJWUC0xNSAqIDAgMCAwIDAgMCAxMCAwIDMgMCAzMDAgMCAwIDAgMTAg
NSAyIDI1NiAwIDAgMTQ2Mjk2CjEyYjk5ZmFiID8/PyBGNkJWUC04ICogMCAwIDAgMCAwIDEw
IDAgMyAwIDMwMCAwIDAgMCAxMCA1IDIgMjU2IDAgMCAxNTAxMTgKZjgzOTA3MzIgPz8/IEY2
QlZQLTgqICogMCAwIDAgMCAwIDEwIDAgMyAwIDMwMCAwIDAgMCAxMCA1IDIgMjU2IDAgMCAx
NTAxMTcKZGE3MjY0M2YgPz8/IEY2QlZQLTkqICogMCAwIDAgMCAwIDEwIDAgMyAwIDMwMCAw
IDAgMCAxMCA1IDIgMjU2IDAgMCAxNTAxMTYKOGJjZGM2YWYgYXgwIEY2QlZQLTEgKiAwIDAg
MCAwIDAgMTAgMCAzIDAgMzAwIDAgMCAwIDEwIDUgMiAyNTYgMCAwIDE0NzIzNQoyZjQwMWQz
ZiA/Pz8gRjZCVlAtOSBGM0tULTExIDAgNyAzIDcgMCA0IDAgMyAwIDMwMCAwIDAgMCAxMCAy
IDIgMjU2ICogKiAqCjI1ZDFmYzI2ID8/PyBGNkJWUC0xNCBDVDFFTkktOCAwIDAgNSAwIDAg
MTAgMCAzIDAgMzAwIDAgMCAwIDEwIDUgMiAyNTYgKiAqICoKMmU5YTQwOTQgPz8/IEY2QlZQ
LTkgVkUzWFBHLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYg
KiAqICoKOWUzM2U4N2UgPz8/IEY2QlZQLTkgSzRHQkItOSAwIDAgMCAwIDAgMTEwIDAgMyAw
IDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgpiYjdmNTk2MSA/Pz8gRjZCVlAtOSBTVjJI
UlQtOSAwIDUgMiA1IDAgNSAwIDMgMCAzMDAgMCAwIDAgMTAgMiAyIDI1NiAqICogKgpmMWZm
ZGFiZCA/Pz8gRjZCVlAtOSBOQTdLUi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAx
MCAxMCA1IDIgMjU2ICogKiAqCmJjNDE4NTZjID8/PyBGNkJWUC05IEY2QlZQLTcgMCAwIDAg
MCAwIDUgMCAzIDAgMzAwIDAgMCAwIDEwIDIgMiAyNTYgKiAqICoKODE1ZmM5YTAgPz8/IEY2
QlZQLTkgRjZCVlAtMTEgMCAzIDIgMiAwIDQgMCAzIDAgMzAwIDAgMCAwIDEwIDIgMiAyNTYg
KiAqICoKZGI1YTVlY2QgPz8/IEY2QlZQLTE0IENUMUVOSS04IDAgMCA1IDAgMCAxMCAwIDMg
MCAzMDAgMCAwIDAgMTAgNSAyIDI1NiAqICogKgoyYjQ2MTJmOCA/Pz8gRjZCVlAtOSBGNkJW
UC03IDAgMiAxIDIgMCA0IDAgMyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCjBjMDFj
NWE2ID8/PyBGNkJWUC05IFZFM1hQRy05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAx
MCAxMCA1IDIgMjU2ICogKiAqCjE0NTRjMjVlID8/PyBGNkJWUC05IEs0R0JCLTkgMCAwIDAg
MCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKZWUwMzJiN2IgPz8/
IEY2QlZQLTkgRjZLS1ItOSAwIDUgNyA1IDAgNiAwIDMgMCAzMDAgMCAwIDAgMTAgMyAyIDI1
NiAqICogKgoyOWU0NzZlYyA/Pz8gRjZCVlAtOSBGNkNOQi05IDAgMCAwIDAgMCAxMTAgMCAz
IDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCmY2NGYwYzBhID8/PyBGNkJWUC05IEYz
S1QtMTEgMCA3IDMgNyAwIDMgMCAzIDAgMzAwIDAgMCAwIDEwIDEgMiAyNTYgKiAqICoKYTE0
MWM0MmIgPz8/IEY2QlZQLTkgRjVLVFItMTEgMCA3IDcgNyAwIDQgMCAzIDAgMzAwIDAgMCAw
IDEwIDIgMiAyNTYgKiAqICoKMjM2YmQwZTcgPz8/IEY2QlZQLTkgRjZCVlAtMTEgMCA3IDYg
NiAwIDcgMCAzIDAgMzAwIDAgMCAwIDEwIDMgMiAyNTYgKiAqICoKMWNkYWJkODggPz8/IEY2
QlZQLTkgRjZDTkItMTEgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAy
NTYgKiAqICoKMzI5YTI5NGIgPz8/IEY2QlZQLTkgRjZCVlAtNSAwIDAgMCAwIDAgMTEwIDAg
MyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgphZDdkNTgxNyA/Pz8gRjZCVlAtOSBT
VjJIUlQtOSAwIDEgMyAxIDAgNCAwIDMgMCAzMDAgMCAwIDAgMTAgMiAyIDI1NiAqICogKgoz
ZmFlZjgxZSA/Pz8gRjZCVlAtOSBOQTdLUi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAg
MCAxMCAxMCA1IDIgMjU2ICogKiAqCjJjMTIwMGY1ID8/PyBGNkJWUC0xNCBDVDFFTkktOCAw
IDAgNSAwIDAgMTAgMCAzIDAgMzAwIDAgMCAwIDEwIDUgMiAyNTYgKiAqICoKYTRlMDExODIg
Pz8/IEY2QlZQLTkgRjZCVlAtNyAwIDIgMSAyIDAgNCAwIDMgMCAzMDAgMCAwIDAgMTAgMiAy
IDI1NiAqICogKgo3YzhiZmRkZCA/Pz8gRjZCVlAtOSBWRTNYUEctOSAwIDAgMCAwIDAgMTEw
IDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgo5MWE2NTRiMCA/Pz8gRjZCVlAt
OSBLNEdCQi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICog
KiAqCmFhZThiM2MwID8/PyBGNkJWUC05IEY2S0tSLTkgMCA0IDYgNCAwIDcgMCAzIDAgMzAw
IDAgMCAwIDEwIDMgMiAyNTYgKiAqICoKYWMyYzBkMGIgPz8/IEY2QlZQLTkgRjZDTkItOSAw
IDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgo3MTAyNjA1
ZiA/Pz8gRjZCVlAtOSBGM0tULTExIDAgNiAxIDYgMCAzIDAgMyAwIDMwMCAwIDAgMCAxMCAx
IDIgMjU2ICogKiAqCjA5ZGE4YTg2ID8/PyBGNkJWUC05IEY1S1RSLTExIDAgNSA1IDUgMCA0
IDAgMyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCjMyZTgyMTY4ID8/PyBGNkJWUC05
IEY2QlZQLTExIDAgNyA2IDYgMCA3IDAgMyAwIDMwMCAwIDAgMCAxMCAzIDIgMjU2ICogKiAq
CmUyYWI1MDdkID8/PyBGNkJWUC05IEY2Q05CLTExIDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAw
IDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCjVmNWFiNjk3ID8/PyBGNkJWUC05IEY2QlZQLTUg
MCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKNGUxMWI2
ZDIgPz8/IEY2QlZQLTkgU1YySFJULTkgMCAwIDAgMCAwIDUgMCAzIDAgMzAwIDAgMCAwIDEw
IDIgMiAyNTYgKiAqICoKNTgwY2E1ZDggPz8/IEY2QlZQLTkgTkE3S1ItOSAwIDAgMCAwIDAg
MTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgpjNGZiNmQ4MCA/Pz8gRjZC
VlAtMTQgQ1QxRU5JLTggMCAwIDUgMCAwIDEwIDAgMyAwIDMwMCAwIDAgMCAxMCA1IDIgMjU2
ICogKiAqCmU1YjgyYzI2ID8/PyBGNkJWUC05IEY2QlZQLTcgMCAzIDIgMyAwIDMgMCAzIDAg
MzAwIDAgMCAwIDEwIDEgMiAyNTYgKiAqICoKNzg3ZjdkMmEgPz8/IEY2QlZQLTkgVkUzWFBH
LTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKZjRj
ZjUzYWYgPz8/IEY2QlZQLTkgSzRHQkItOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAg
MTAgMTAgNSAyIDI1NiAqICogKgpmYmM0NDhkOCA/Pz8gRjZCVlAtOSBGNktLUi05IDAgNCA2
IDQgMCA3IDAgMyAwIDMwMCAwIDAgMCAxMCAzIDIgMjU2ICogKiAqCjIwNWE0NTliID8/PyBG
NkJWUC05IEY2Q05CLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAy
NTYgKiAqICoKNzQyN2Y5MDMgPz8/IEY2QlZQLTkgRjNLVC0xMSAwIDAgMyAwIDAgMyAwIDMg
MCAzMDAgMCAwIDAgMTAgMSAyIDI1NiAqICogKgo2ZThmMmM3MCA/Pz8gRjZCVlAtOSBGNUtU
Ui0xMSAwIDYgNiA2IDAgNCAwIDMgMCAzMDAgMCAwIDAgMTAgMiAyIDI1NiAqICogKgozMzNi
MTY3MiA/Pz8gRjZCVlAtOSBGNkJWUC0xMSAwIDQgNCA0IDAgOCAwIDMgMCAzMDAgMCAwIDAg
MTAgNCAyIDI1NiAqICogKgo1N2E3MzFkNSA/Pz8gRjZCVlAtOSBGNkNOQi0xMSAwIDAgMCAw
IDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgo0YTYyZGQzMiA/Pz8g
RjZCVlAtOSBGNkJWUC01IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIg
MjU2ICogKiAqCjFhZDljNzFiID8/PyBGNkJWUC05IFNWMkhSVC05IDAgMSAzIDEgMCA0IDAg
MyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCmZlOGI4NzMyID8/PyBGNkJWUC05IE5B
N0tSLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoK
ZTQwYTIyODcgPz8/IEY2QlZQLTE0IENUMUVOSS04IDAgMCA1IDAgMCAxMCAwIDMgMCAzMDAg
MCAwIDAgMTAgNSAyIDI1NiAqICogKgo5ZjM5OWMwZSA/Pz8gRjZCVlAtOSBGNkJWUC03IDAg
MiAxIDIgMCA0IDAgMyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCjE3NjkxZTEyID8/
PyBGNkJWUC05IFZFM1hQRy05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1
IDIgMjU2ICogKiAqCmQwNTdlYTFmID8/PyBGNkJWUC05IEs0R0JCLTkgMCAwIDAgMCAwIDEx
MCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKN2ZkZGRhZjEgPz8/IEY2QlZQ
LTkgRjZLS1ItOSAwIDUgNyA1IDAgNiAwIDMgMCAzMDAgMCAwIDAgMTAgMyAyIDI1NiAqICog
KgowODM4ZDI3NiA/Pz8gRjZCVlAtOSBGNkNOQi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAw
IDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCjU2Zjk0ZDdjID8/PyBGNkJWUC05IEYzS1QtMTEg
MCA1IDEgNSAwIDMgMCAzIDAgMzAwIDAgMCAwIDEwIDEgMiAyNTYgKiAqICoKODdiZmQ3OTcg
Pz8/IEY2QlZQLTkgRjVLVFItMTEgMCAzIDMgMyAwIDQgMCAzIDAgMzAwIDAgMCAwIDEwIDIg
MiAyNTYgKiAqICoKOTJjMWRhYTYgPz8/IEY2QlZQLTkgRjZCVlAtMTEgMCA3IDYgNiAwIDcg
MCAzIDAgMzAwIDAgMCAwIDEwIDMgMiAyNTYgKiAqICoKOGU3YjY3ZDMgPz8/IEY2QlZQLTkg
RjZDTkItMTEgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAq
ICoKY2JkYTY0MjYgPz8/IEY2QlZQLTkgRjZCVlAtNSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMw
MCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgo0M2MzYmEwZiA/Pz8gRjZCVlAtOSBTVjJIUlQt
OSAwIDUgNiA1IDAgNCAwIDMgMCAzMDAgMCAwIDAgMTAgMiAyIDI1NiAqICogKgpmODQ5NmRm
NCA/Pz8gRjZCVlAtOSBOQTdLUi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAx
MCA1IDIgMjU2ICogKiAqCjE3OWFkOTdmID8/PyBGNkJWUC0xNCBDVDFFTkktOCAwIDAgNSAw
IDAgMTAgMCAzIDAgMzAwIDAgMCAwIDEwIDUgMiAyNTYgKiAqICoKMGRiNGViOGEgPz8/IEY2
QlZQLTkgRjZCVlAtNyAwIDIgMSAyIDAgNCAwIDMgMCAzMDAgMCAwIDAgMTAgMiAyIDI1NiAq
ICogKgoyYjI4NmFlZCA/Pz8gRjZCVlAtOSBWRTNYUEctOSAwIDAgMCAwIDAgMTEwIDAgMyAw
IDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgoyMmIyZThkMyA/Pz8gRjZCVlAtOSBLNEdC
Qi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCmM2
YTk3OTI1ID8/PyBGNkJWUC05IEY2S0tSLTkgMCA0IDYgNCAwIDYgMCAzIDAgMzAwIDAgMCAw
IDEwIDMgMiAyNTYgKiAqICoKODFiYjIwNzIgPz8/IEY2QlZQLTkgRjZDTkItOSAwIDAgMCAw
IDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgplMjRmZmUyNyA/Pz8g
RjZCVlAtOSBGM0tULTExIDAgNCAwIDQgMCAzIDAgMyAwIDMwMCAwIDAgMCAxMCAxIDIgMjU2
ICogKiAqCjAxMWZkYWM4ID8/PyBGNkJWUC05IEY1S1RSLTExIDAgNyA3IDcgMCA0IDAgMyAw
IDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCjJjMjMzYWNiID8/PyBGNkJWUC05IEY2QlZQ
LTExIDAgNyA2IDYgMCA3IDAgMyAwIDMwMCAwIDAgMCAxMCAzIDIgMjU2ICogKiAqCjI4ZjBl
ZWYwID8/PyBGNkJWUC05IEY2Q05CLTExIDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAx
MCAxMCA1IDIgMjU2ICogKiAqCmExM2RiYWUyID8/PyBGNkJWUC05IEY2QlZQLTUgMCAwIDAg
MCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKY2FhMTZmYTggPz8/
IEY2QlZQLTkgU1YySFJULTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUg
MiAyNTYgKiAqICoKMzgwMTQxNTIgPz8/IEY2QlZQLTkgTkE3S1ItOSAwIDAgMCAwIDAgMTEw
IDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgo5ODFkZjYzZCA/Pz8gRjZCVlAt
MTQgQ1QxRU5JLTggMCAwIDUgMCAwIDEwIDAgMyAwIDMwMCAwIDAgMCAxMCA1IDIgMjU2ICog
KiAqCmY1ZTAwZTBmID8/PyBGNkJWUC05IEY2QlZQLTcgMCAyIDEgMiAwIDQgMCAzIDAgMzAw
IDAgMCAwIDEwIDIgMiAyNTYgKiAqICoKZmMwZjI0MmYgPz8/IEY2QlZQLTkgVkUzWFBHLTkg
MCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKM2NjYThl
MzAgPz8/IEY2QlZQLTkgSzRHQkItOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAg
MTAgNSAyIDI1NiAqICogKgoxN2NiZDBiZSA/Pz8gRjZCVlAtOSBGNktLUi05IDAgNCA2IDQg
MCA3IDAgMyAwIDMwMCAwIDAgMCAxMCAzIDIgMjU2ICogKiAqCmM1MDg4YmExID8/PyBGNkJW
UC05IEY2Q05CLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYg
KiAqICoKOWJhYTMzZmMgPz8/IEY2QlZQLTkgRjNLVC0xMSAwIDMgMCAzIDAgMyAwIDMgMCAz
MDAgMCAwIDAgMTAgMSAyIDI1NiAqICogKgo4MTlkNGViOSA/Pz8gRjZCVlAtOSBGNUtUUi0x
MSAwIDMgMCAzIDAgMyAwIDMgMCAzMDAgMCAwIDAgMTAgMSAyIDI1NiAqICogKgpkMmI2OGUw
ZCA/Pz8gRjZCVlAtOSBGNkJWUC0xMSAwIDcgNiA2IDAgNyAwIDMgMCAzMDAgMCAwIDAgMTAg
MyAyIDI1NiAqICogKgpkZGZhNTQ2YyA/Pz8gRjZCVlAtOSBGNkNOQi0xMSAwIDAgMCAwIDAg
MTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgpiMGY5NTNiYyA/Pz8gRjZC
VlAtOSBGNkJWUC01IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2
ICogKiAqCmI4YTk0ZjBlID8/PyBGNkJWUC05IFNWMkhSVC05IDAgMCAwIDAgMCAxMTAgMCAz
IDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCmE4ZjI2N2ZiID8/PyBGNkJWUC05IE5B
N0tSLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoK
YjhiZjcwODEgPz8/IEY2QlZQLTE0IENUMUVOSS04IDAgMCA1IDAgMCAxMCAwIDMgMCAzMDAg
MCAwIDAgMTAgNSAyIDI1NiAqICogKgpjMTRlZWUyNyA/Pz8gRjZCVlAtOSBGNkJWUC03IDAg
MiAxIDIgMCA0IDAgMyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCjQxYmNkZTI3ID8/
PyBGNkJWUC05IFZFM1hQRy05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1
IDIgMjU2ICogKiAqCjM0MmI0OWU3ID8/PyBGNkJWUC05IEs0R0JCLTkgMCAwIDAgMCAwIDEx
MCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKMDgzMmRiZGYgPz8/IEY2QlZQ
LTkgRjZLS1ItOSAwIDUgNyA1IDAgNiAwIDMgMCAzMDAgMCAwIDAgMTAgMyAyIDI1NiAqICog
Kgo5NzM3NmI4OCA/Pz8gRjZCVlAtOSBGNkNOQi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAw
IDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCmE1M2IwYWMyID8/PyBGNkJWUC05IEYzS1QtMTEg
MCA1IDIgNSAwIDMgMCAzIDAgMzAwIDAgMCAwIDEwIDEgMiAyNTYgKiAqICoKNWU3N2QxZDAg
Pz8/IEY2QlZQLTkgRjVLVFItMTEgMCA3IDcgNyAwIDQgMCAzIDAgMzAwIDAgMCAwIDEwIDIg
MiAyNTYgKiAqICoKZjg5NTE5NWYgPz8/IEY2QlZQLTkgRjZCVlAtMTEgMCA3IDYgNiAwIDcg
MCAzIDAgMzAwIDAgMCAwIDEwIDMgMiAyNTYgKiAqICoKZDc2YjQ0NDMgPz8/IEY2QlZQLTkg
RjZDTkItMTEgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAq
ICoKYzIyNTgwN2IgPz8/IEY2QlZQLTkgRjZCVlAtNSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMw
MCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgpmZWQ4OGQyMCA/Pz8gRjZCVlAtOSBTVjJIUlQt
OSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgo5YWZm
NmE3MCA/Pz8gRjZCVlAtOSBOQTdLUi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAx
MCAxMCA1IDIgMjU2ICogKiAqCmY0YjA5ZjlmID8/PyBGNkJWUC05IEYzS1QtMTEgMCA1IDIg
NSAwIDQgMCAzIDAgMzAwIDAgMCAwIDEwIDIgMiAyNTYgKiAqICoKYTMyZDFlODggPz8/IEY2
QlZQLTE0IENUMUVOSS04IDAgMCA1IDAgMCAxMCAwIDMgMCAzMDAgMCAwIDAgMTAgNSAyIDI1
NiAqICogKgo2ZmJmNTk5OCA/Pz8gRjZCVlAtOSBWRTNYUEctOSAwIDAgMCAwIDAgMTEwIDAg
MyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgoxZWYzMGZmMiA/Pz8gRjZCVlAtOSBL
NEdCQi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAq
CjM0YTEyY2VhID8/PyBGNkJWUC05IFNWMkhSVC05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAw
IDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCjBhNDBjYmQ5ID8/PyBGNkJWUC05IE5BN0tSLTkg
MCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKZmMxYmE2
YWYgPz8/IEY2QlZQLTkgRjZCVlAtNyAwIDAgMCAwIDAgNSAwIDMgMCAzMDAgMCAwIDAgMTAg
MiAyIDI1NiAqICogKgozNDlmNDRlMSA/Pz8gRjZCVlAtOSBGNkJWUC0xMSAwIDMgMiAyIDAg
NCAwIDMgMCAzMDAgMCAwIDAgMTAgMiAyIDI1NiAqICogKgplNDFhYWI0NiA/Pz8gRjZCVlAt
MTQgQ1QxRU5JLTggMCAwIDUgMCAwIDEwIDAgMyAwIDMwMCAwIDAgMCAxMCA1IDIgMjU2ICog
KiAqCmUwZWNlMjA5ID8/PyBGNkJWUC05IEY2QlZQLTcgMCAzIDIgMyAwIDMgMCAzIDAgMzAw
IDAgMCAwIDEwIDEgMiAyNTYgKiAqICoKM2I3ZDlmMGMgPz8/IEY2QlZQLTkgVkUzWFBHLTkg
MCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKYjdmMjZk
ZjMgPz8/IEY2QlZQLTkgSzRHQkItOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAg
MTAgNSAyIDI1NiAqICogKgplYjcwYTUzZiA/Pz8gRjZCVlAtOSBGNktLUi05IDAgNSA3IDUg
MCA2IDAgMyAwIDMwMCAwIDAgMCAxMCAzIDIgMjU2ICogKiAqCmMwODcwNGM5ID8/PyBGNkJW
UC05IEY2Q05CLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYg
KiAqICoKZTAzODk1ODkgPz8/IEY2QlZQLTkgRjNLVC0xMSAwIDAgMyAwIDAgMyAwIDMgMCAz
MDAgMCAwIDAgMTAgMSAyIDI1NiAqICogKgozMmQ5YTE0OSA/Pz8gRjZCVlAtOSBGNUtUUi0x
MSAwIDAgNiAwIDAgMCAwIDMgMCAzMDAgMCAwIDAgMTAgMCAyIDI1NiAqICogKgo4MWIyM2Zh
MCA/Pz8gRjZCVlAtOSBGNkJWUC0xMSAwIDQgNCA0IDAgOSAwIDMgMCAzMDAgMCAwIDAgMTAg
NCAyIDI1NiAqICogKgo2MzA4ODRlMSA/Pz8gRjZCVlAtOSBGNkNOQi0xMSAwIDAgMCAwIDAg
MTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgpjYTM3MDIyMSA/Pz8gRjZC
VlAtOSBGNkJWUC01IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2
ICogKiAqCmJhN2JjMzEyID8/PyBGNkJWUC05IFNWMkhSVC05IDAgMCAwIDAgMCAxMTAgMCAz
IDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCmM1YmFkNDZkID8/PyBGNkJWUC05IE5B
N0tSLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoK
ZDlkYTc0OWYgPz8/IEY2QlZQLTkgRjNLVC0xMSAwIDYgMyA2IDAgNCAwIDMgMCAzMDAgMCAw
IDAgMTAgMiAyIDI1NiAqICogKgoxOGZhNmVkYiA/Pz8gRjZCVlAtMTQgQ1QxRU5JLTggMCAw
IDUgMCAwIDEwIDAgMyAwIDMwMCAwIDAgMCAxMCA1IDIgMjU2ICogKiAqCjlhNjY2MmMyID8/
PyBGNkJWUC05IFZFM1hQRy05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1
IDIgMjU2ICogKiAqCjE2MGNkZTQxID8/PyBGNkJWUC05IEs0R0JCLTkgMCAwIDAgMCAwIDEx
MCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKMjllZDVhNjMgPz8/IEY2QlZQ
LTkgU1YySFJULTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYg
KiAqICoKZGJiYjg1ZjMgPz8/IEY2QlZQLTkgTkE3S1ItOSAwIDAgMCAwIDAgMTEwIDAgMyAw
IDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgoxYjUyMDMyYyA/Pz8gRjZCVlAtOSBGNkJW
UC0xMSAwIDYgNiA2IDAgNiAwIDMgMCAzMDAgMCAwIDAgMTAgMyAyIDI1NiAqICogKgpkMmU4
OGY4MyA/Pz8gRjZCVlAtOSBGNkJWUC03IDAgMCA3IDAgMCA0IDAgMyAwIDMwMCAwIDAgMCAx
MCAyIDIgMjU2ICogKiAqCjEyNjFhYzYwID8/PyBGNkJWUC0xNCBGM0tULTEyIDAgMCAxIDAg
MCAxMCAwIDMgMCAzMDAgMCAwIDAgMTAgNSAyIDI1NiAqICogKgoyNjU2YjAyZCA/Pz8gRjZC
VlAtOSBTVjFIQ0MtOSAwIDAgMiAwIDAgMTAgMCAzIDAgMzAwIDAgMCAwIDEwIDUgMiAyNTYg
KiAqICoKYzZjMDk1YWIgPz8/IEY2QlZQLTE0IENUMUVOSS04IDAgMCA1IDAgMCAxMCAwIDMg
MCAzMDAgMCAwIDAgMTAgNSAyIDI1NiAqICogKgpkN2FlZDU4MCA/Pz8gRjZCVlAtOSBGNkJW
UC03IDAgMiAxIDIgMCA0IDAgMyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCjE0NjRi
MDdjID8/PyBGNkJWUC05IFZFM1hQRy05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAx
MCAxMCA1IDIgMjU2ICogKiAqCjYxNjhhODRmID8/PyBGNkJWUC05IEs0R0JCLTkgMCAwIDAg
MCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKZmQwNWYyNjQgPz8/
IEY2QlZQLTkgRjZLS1ItOSAwIDQgNiA0IDAgNyAwIDMgMCAzMDAgMCAwIDAgMTAgMyAyIDI1
NiAqICogKgo0MWUwNzEyNiA/Pz8gRjZCVlAtOSBGNkNOQi05IDAgMCAwIDAgMCAxMTAgMCAz
IDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCmI4NzAyYzM1ID8/PyBGNkJWUC05IEYz
S1QtMTEgMCA2IDcgNiAwIDIgMCAzIDAgMzAwIDAgMCAwIDEwIDEgMiAyNTYgKiAqICoKNjZj
NTRmN2QgPz8/IEY2QlZQLTkgRjVLVFItMTEgMCA2IDcgNiAwIDQgMCAzIDAgMzAwIDAgMCAw
IDEwIDIgMiAyNTYgKiAqICoKZjAxNmQ0ODUgPz8/IEY2QlZQLTkgRjZCVlAtMTEgMCA3IDYg
NiAwIDcgMCAzIDAgMzAwIDAgMCAwIDEwIDMgMiAyNTYgKiAqICoKODViNDIwNTggPz8/IEY2
QlZQLTkgRjZDTkItMTEgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAy
NTYgKiAqICoKZDRjZDJlYWEgPz8/IEY2QlZQLTkgRjZCVlAtNSAwIDAgMCAwIDAgMTEwIDAg
MyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgo3ZjM4OWMzYyA/Pz8gRjZCVlAtOSBT
VjJIUlQtOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICog
KgowMTA3YmU5NSA/Pz8gRjZCVlAtOSBOQTdLUi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAw
IDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCmQ4OGQzYjNlID8/PyBGNkJWUC05IEYzS1QtMTEg
MCA1IDIgNSAwIDQgMCAzIDAgMzAwIDAgMCAwIDEwIDIgMiAyNTYgKiAqICoKZDZkZDk4ZTYg
Pz8/IEY2QlZQLTE0IENUMUVOSS04IDAgMCA1IDAgMCAxMCAwIDMgMCAzMDAgMCAwIDAgMTAg
NSAyIDI1NiAqICogKgo2NzVhZDRhNSA/Pz8gRjZCVlAtOSBWRTNYUEctOSAwIDAgMCAwIDAg
MTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgoxMDUwOGM2OSA/Pz8gRjZC
VlAtOSBLNEdCQi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2
ICogKiAqCjNjYjY0ZTdmID8/PyBGNkJWUC05IFNWMkhSVC05IDAgMCAwIDAgMCAxMTAgMCAz
IDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCjA2NDQ4MzkwID8/PyBGNkJWUC05IE5B
N0tSLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoK
NzVmOTkwMjAgPz8/IEY2QlZQLTkgRjZCVlAtNyAwIDAgMCAwIDAgNSAwIDMgMCAzMDAgMCAw
IDAgMTAgMiAyIDI1NiAqICogKgpiMDlmYTA4YiA/Pz8gRjZCVlAtOSBGNkJWUC0xMSAwIDIg
MiAxIDAgNCAwIDMgMCAzMDAgMCAwIDAgMTAgMiAyIDI1NiAqICogKgo5MWFlNzI5MyA/Pz8g
RjZCVlAtOSBGM0tULTExIDAgNiAzIDYgMCA1IDAgMyAwIDMwMCAwIDAgMCAxMCAxIDIgMjU2
ICogKiAqCjg4OWJiNzcxID8/PyBGNkJWUC0xNCBDVDFFTkktOCAwIDAgNSAwIDAgMTAgMCAz
IDAgMzAwIDAgMCAwIDEwIDUgMiAyNTYgKiAqICoKZWIwMTFiZWUgPz8/IEY2QlZQLTkgVkUz
WFBHLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoK
NGIxZjgwN2UgPz8/IEY2QlZQLTkgSzRHQkItOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAw
IDAgMTAgMTAgNSAyIDI1NiAqICogKgo2MTI1ODkyZiA/Pz8gRjZCVlAtOSBTVjJIUlQtOSAw
IDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgo5NDFmNDdi
MCA/Pz8gRjZCVlAtOSBOQTdLUi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAx
MCA1IDIgMjU2ICogKiAqCmVjZDI3MzRkID8/PyBGNkJWUC05IEY2QlZQLTcgMCA3IDcgNyAw
IDEgMCAzIDAgMzAwIDAgMCAwIDEwIDAgMiAyNTYgKiAqICoKNTJjN2RjZjggPz8/IEY2QlZQ
LTkgRjZCVlAtMTEgMCAzIDIgMiAwIDQgMCAzIDAgMzAwIDAgMCAwIDEwIDIgMiAyNTYgKiAq
ICoKMDYwZjIxZDggPz8/IEY2QlZQLTkgRjNLVC0xMSAwIDUgMiA1IDAgNCAwIDMgMCAzMDAg
MCAwIDAgMTAgMiAyIDI1NiAqICogKgo0NGNhZmYwMSA/Pz8gRjZCVlAtMTQgQ1QxRU5JLTgg
MCAwIDUgMCAwIDEwIDAgMyAwIDMwMCAwIDAgMCAxMCA1IDIgMjU2ICogKiAqCjgwOTljNWY4
ID8/PyBGNkJWUC05IFZFM1hQRy05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAx
MCA1IDIgMjU2ICogKiAqCmYzNTliZWI4ID8/PyBGNkJWUC05IEs0R0JCLTkgMCAwIDAgMCAw
IDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKMTM0ZjhkNTAgPz8/IEY2
QlZQLTkgU1YySFJULTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAy
NTYgKiAqICoKN2ZlMzIxOTggPz8/IEY2QlZQLTkgTkE3S1ItOSAwIDAgMCAwIDAgMTEwIDAg
MyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgoxZWEyZWNiZSA/Pz8gRjZCVlAtOSBG
NkJWUC03IDAgMCAwIDAgMCA1IDAgMyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCjgz
NGZhM2QwID8/PyBGNkJWUC05IEY2QlZQLTExIDAgMiAyIDEgMCA0IDAgMyAwIDMwMCAwIDAg
MCAxMCAyIDIgMjU2ICogKiAqCjM0ZWNlNDZmID8/PyBGNkJWUC05IEYzS1QtMTEgMCA1IDIg
NSAwIDQgMCAzIDAgMzAwIDAgMCAwIDEwIDIgMiAyNTYgKiAqICoKMGRmYjMyNjYgPz8/IEY2
QlZQLTkgRjZLS1ItOSAwIDEgMSAxIDAgNiAwIDMgMCAzMDAgMCAwIDAgMTAgMyAyIDI1NiAq
ICogKgo5NGM5M2IwNyA/Pz8gRjZCVlAtMTQgQ1QxRU5JLTggMCAwIDUgMCAwIDEwIDAgMyAw
IDMwMCAwIDAgMCAxMCA1IDIgMjU2ICogKiAqCjQzMmY2MGZhID8/PyBGNkJWUC05IFZFM1hQ
Ry05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCmRi
MDBkMzBlID8/PyBGNkJWUC05IEs0R0JCLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAw
IDEwIDEwIDUgMiAyNTYgKiAqICoKMmU3NTFkZmUgPz8/IEY2QlZQLTkgU1YySFJULTkgMCAw
IDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKZGIzODY2ODQg
Pz8/IEY2QlZQLTkgTkE3S1ItOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAg
NSAyIDI1NiAqICogKgpiZjczN2RmZSA/Pz8gRjZCVlAtOSBGNkJWUC03IDAgMyA0IDMgMCA1
IDAgMyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCjgzNmQzZjQxID8/PyBGNkJWUC05
IEY2QlZQLTExIDAgMyAyIDIgMCA0IDAgMyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAq
CjZmYjI1Yjc5ID8/PyBGNkJWUC0xNCBDVDFFTkktOCAwIDAgNSAwIDAgMTAgMCAzIDAgMzAw
IDAgMCAwIDEwIDUgMiAyNTYgKiAqICoKNTM1NzA1MWIgPz8/IEY2QlZQLTkgRjZCVlAtNyAw
IDIgMSAyIDAgNCAwIDMgMCAzMDAgMCAwIDAgMTAgMiAyIDI1NiAqICogKgpjYTA5MjU0ZCA/
Pz8gRjZCVlAtOSBWRTNYUEctOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAg
NSAyIDI1NiAqICogKgpjYjgxYzAxNiA/Pz8gRjZCVlAtOSBLNEdCQi05IDAgMCAwIDAgMCAx
MTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCjliYjFiNTM4ID8/PyBGNkJW
UC05IEY2S0tSLTkgMCA1IDYgNSAwIDUgMCAzIDAgMzAwIDAgMCAwIDEwIDIgMiAyNTYgKiAq
ICoKOGI4OGMxYTEgPz8/IEY2QlZQLTkgRjZDTkItOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMw
MCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgowZjdkYmIyZSA/Pz8gRjZCVlAtOSBGM0tULTEx
IDAgNCAwIDQgMCAzIDAgMyAwIDMwMCAwIDAgMCAxMCAxIDIgMjU2ICogKiAqCjc0YzZlYTY1
ID8/PyBGNkJWUC05IEY1S1RSLTExIDAgNSA1IDUgMCA0IDAgMyAwIDMwMCAwIDAgMCAxMCAy
IDIgMjU2ICogKiAqCmZhN2UxMDI5ID8/PyBGNkJWUC05IEY2QlZQLTExIDAgNyA2IDYgMCA2
IDAgMyAwIDMwMCAwIDAgMCAxMCAzIDIgMjU2ICogKiAqCjIwMTY4MTEzID8/PyBGNkJWUC05
IEY2Q05CLTExIDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICog
KiAqCjgxNTZlZDZjID8/PyBGNkJWUC05IEY2QlZQLTUgMCAwIDAgMCAwIDExMCAwIDMgMCAz
MDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKNWQ2NTc3MDQgPz8/IEY2QlZQLTkgU1YySFJU
LTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKZGE1
YzNjYTggPz8/IEY2QlZQLTkgTkE3S1ItOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAg
MTAgMTAgNSAyIDI1NiAqICogKgo4ZTQ0N2ZlMiA/Pz8gRjZCVlAtMTQgRzFHWEItMTAgMCAw
IDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKZWU3MmJlYTQg
Pz8/IEY2QlZQLTE0IENUMUVOSS04IDAgMCA2IDAgMCAxMCAwIDMgMCAzMDAgMCAwIDAgMTAg
NSAyIDI1NiAqICogKgoxMTQ4MTZjZSA/Pz8gRjZCVlAtOSBGNkJWUC03IDAgMiAxIDIgMCA0
IDAgMyAwIDMwMCAwIDAgMCAxMCAyIDIgMjU2ICogKiAqCmFjYTNmMzdjID8/PyBGNkJWUC05
IFZFM1hQRy05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICog
KiAqCmUwMmM4MzM5ID8/PyBGNkJWUC05IEs0R0JCLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAz
MDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKMjgwMzA4YzYgPz8/IEY2QlZQLTkgRjZLS1It
OSAwIDUgNyA1IDAgNiAwIDMgMCAzMDAgMCAwIDAgMTAgMyAyIDI1NiAqICogKgo1NTM3MGYw
ZCA/Pz8gRjZCVlAtOSBGNkNOQi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAx
MCA1IDIgMjU2ICogKiAqCmRhMzY3ZGMyID8/PyBGNkJWUC05IEYzS1QtMTEgMCA1IDIgNSAw
IDQgMCAzIDAgMzAwIDAgMCAwIDEwIDIgMiAyNTYgKiAqICoKYWM2ZjAyNDggPz8/IEY2QlZQ
LTkgRjVLVFItMTEgMCA0IDUgNCAwIDQgMCAzIDAgMzAwIDAgMCAwIDEwIDIgMiAyNTYgKiAq
ICoKNTVlMTQwYWEgPz8/IEY2QlZQLTkgRjZCVlAtMTEgMCA3IDYgNiAwIDYgMCAzIDAgMzAw
IDAgMCAwIDEwIDMgMiAyNTYgKiAqICoKYjVlN2Q0OGMgPz8/IEY2QlZQLTkgRjZDTkItMTEg
MCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKZTE5NTc3
OWYgPz8/IEY2QlZQLTkgRjZCVlAtNSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAg
MTAgNSAyIDI1NiAqICogKgo5MWE4ZjFiMSA/Pz8gRjZCVlAtOSBTVjJIUlQtOSAwIDAgMCAw
IDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgo1Yzk5OGEzZSA/Pz8g
RjZCVlAtOSBOQTdLUi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIg
MjU2ICogKiAqCjlkOWMzNzk5ID8/PyBGNkJWUC05IEY2Q05CLTExIDAgMCAwIDAgMCAxMTAg
MCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCjQyN2U5MTJhID8/PyBGNkJWUC05
IEY1S1RSLTExIDAgNCA1IDQgMCA4IDAgMyAwIDMwMCAwIDAgMCAxMCA0IDIgMjU2ICogKiAq
CjU4ODUzNzRlID8/PyBGNkJWUC05IEYzS1QtMTEgMCA2IDQgNiAwIDUgMCAzIDAgMzAwIDAg
MCAwIDEwIDIgMiAyNTYgKiAqICoKYzdjZDg1MzQgPz8/IEY2QlZQLTE0IENUMUVOSS04IDAg
MCA1IDAgMCAxMCAwIDMgMCAzMDAgMCAwIDAgMTAgNSAyIDI1NiAqICogKgo0MGY3NDcwMyA/
Pz8gRjZCVlAtOSBWRTNYUEctOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAg
NSAyIDI1NiAqICogKgplZmZhYmNkOSA/Pz8gRjZCVlAtOSBLNEdCQi05IDAgMCAwIDAgMCAx
MTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2ICogKiAqCjIwZmVhNWQ1ID8/PyBGNkJW
UC05IFNWMkhSVC05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIgMjU2
ICogKiAqCjU5Y2JkODM5ID8/PyBGNkJWUC05IE5BN0tSLTkgMCAwIDAgMCAwIDExMCAwIDMg
MCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKMWE5MmVkYTggPz8/IEY2QlZQLTkgRjZC
VlAtNyAwIDAgNyAwIDAgMSAwIDMgMCAzMDAgMCAwIDAgMTAgMCAyIDI1NiAqICogKgozMDYy
YjJmYSA/Pz8gRjZCVlAtOSBGNkJWUC0xMSAwIDMgMiAyIDAgNCAwIDMgMCAzMDAgMCAwIDAg
MTAgMiAyIDI1NiAqICogKgpkOGEzZGNmZCA/Pz8gRjZCVlAtMTQgQ1QxRU5JLTggMCAwIDAg
MCAwIDkwIDAgMyAwIDMwMCAwIDAgOCAxMCA1IDIgMjU2ICogKiAqCjY1OGU3ZTMxID8/PyBG
NkJWUC05IFZFM1hQRy05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAgMCAxMCAxMCA1IDIg
MjU2ICogKiAqCjIyMjU4OWQwID8/PyBGNkJWUC05IEs0R0JCLTkgMCAwIDAgMCAwIDExMCAw
IDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKNzhjZWFlNmYgPz8/IEY2QlZQLTkg
RjZLS1ItOSAwIDYgNCA0IDAgNzcgMCAzIDAgMzAwIDAgMCAxMCAxMCAzIDIgMjU2ICogKiAq
CjFmNDZkMGY2ID8/PyBGNkJWUC05IEY2Q05CLTkgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAg
MCAwIDEwIDEwIDUgMiAyNTYgKiAqICoKOTBjZWVmZTcgPz8/IEY2QlZQLTkgRjNLVC0xMSAw
IDUgMSAzIDAgNjggMCAzIDAgMzAwIDAgMCAxMCAxMCAzIDIgMjU2ICogKiAqCjk0YjUzMmY3
ID8/PyBGNkJWUC05IEY1S1RSLTExIDAgNiA1IDQgMCA3NyAwIDMgMCAzMDAgMCAwIDEwIDEw
IDMgMiAyNTYgKiAqICoKODVlNzk5NTkgPz8/IEY2QlZQLTkgRjZCVlAtMTEgMCAzIDQgMyAw
IDYgMCAzIDAgMzAwIDAgMCAwIDEwIDMgMiAyNTYgKiAqICoKYWY1NjcxYjAgPz8/IEY2QlZQ
LTkgRjZDTkItMTEgMCAwIDAgMCAwIDExMCAwIDMgMCAzMDAgMCAwIDEwIDEwIDUgMiAyNTYg
KiAqICoKZTAzMDhmY2UgPz8/IEY2QlZQLTkgRjZCVlAtNSAwIDAgMCAwIDAgMTEwIDAgMyAw
IDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgozMjJhODQ3MCA/Pz8gRjZCVlAtOSBTVjJI
UlQtOSAwIDAgMCAwIDAgMTEwIDAgMyAwIDMwMCAwIDAgMTAgMTAgNSAyIDI1NiAqICogKgoz
OTU4Y2M1OSA/Pz8gRjZCVlAtOSBOQTdLUi05IDAgMCAwIDAgMCAxMTAgMCAzIDAgMzAwIDAg
MCAxMCAxMCA1IDIgMjU2ICogKiAqCg==

--------------JTkl04c546C05jl2OsCMBznl--
