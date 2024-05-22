Return-Path: <linux-hams+bounces-311-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7D8CC7A9
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 22:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE07A281C81
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 20:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FE27CF34;
	Wed, 22 May 2024 20:23:37 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mailsec211.isp.belgacom.be (mailsec211.isp.belgacom.be [195.238.22.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8379628F0
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.238.22.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716409416; cv=none; b=Jjj3yUDwbcFmHrOuC4in1M56QgL5OpkeTeTGx9jcn37V6PgfIk9gkM/X1KM0zUy4m1WS6Qmu1yL0UBN01T6yCZA93+aRgsDo74UuVVSCq33QwCutIydiPHFFcelhTUYlnbtZvMz1pyDaVGTo6mxECR7QgugmTwQQsI6XaBqRDWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716409416; c=relaxed/simple;
	bh=hPWM8Zl8Rtq1rrbNiYoh4qP02tqXlwsqJBWLZWPp6og=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=Q4/jLpln1JCDU5nYmsqeNGMVYLNqwCTfC4xozA7bCc/u43Ou3oWv8U4W1jYJ0NwhZvSqjSc4sMobzTGX4GFHlqbAUdKeO3v48r+OLGHBEvu7wNFC3nyjAlVfjY1mZLEl7kO4NtNE160431VXbP64uQbXrAG1ediZnioR6oO/s78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skypro.be; spf=pass smtp.mailfrom=skypro.be; arc=none smtp.client-ip=195.238.22.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skypro.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skypro.be
X-CSE-ConnectionGUID: apXtpw+XSkiIMdBlhhYF8g==
X-CSE-MsgGUID: 4ovo9fheQeKMcazZiBl7mQ==
X-ExtLoop: 1
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2GSEwC7U05m/4rchW0NTRwBAQE8AQEEBAEBAgEBBwEBF?=
 =?us-ascii?q?QmBRgKCGoEkgWSEVoNPjW4thD6ZY4EsFigPAQEBAQEBAQEBCRQCAQIBHwsEA?=
 =?us-ascii?q?QEDAQOCC4NFAQEUh2EnNwYOAQIEAQEBAQMCAwEBAQEBAQEBBgEBAQUBAQEBA?=
 =?us-ascii?q?QEGBAEBAQKBGYUvRYIrEQEwGCNrYwIGAzcBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBEQIHBiMUaAYPAQUwRgImAnMBARABghNYAYJ4BrAFeoEygQGDHIFf2?=
 =?us-ascii?q?TaBZgaBGi4BiC0BhgWENzUNgUhFgRUngkODSBcBAQEBgRYKhBmCaQSFB499h?=
 =?us-ascii?q?HSENlkPgmqBWoh2gVEcA1khEQFVExcLPgkWAhYDGxQEMA8JCyYqBjYCEgwGB?=
 =?us-ascii?q?gZZNAkEIwMIBANCAyBxEQMEGgQLB3WDHQEHBBNHN4EAiXOFW4QfS4EAAYNxg?=
 =?us-ascii?q?XYOYYoOgUeBSR1AAgELbT01CQsbBiIepQWEQxcMFgITPRYrByoYbgKTAwiPV?=
 =?us-ascii?q?I4FlEg7hB2BbYIPiBKVIwYPBC+EBYMeg2+FcpkxmGOJcoElCYJWlRYuhVCBe?=
 =?us-ascii?q?4IATSAYO4JnUihXjVYWg1iFFIJBwXF2OwIHAQoBAQMJiH8jgUgBAQ?=
IronPort-PHdr: A9a23:15gTARZHH5MIsqvy+22KGhT/LTE014qcDmcuAnoPtbtCf+yZ8oj4O
 wSHvLMx1g6PB9uHoKwaw8Pt8IneGkU4qa6bt34DdJEeHzQksu4x2yEGPouuJHa/EsTXaTcnF
 t9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFRrlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+M
 hG7oR/PusQXjoZuJac8xxrUqXZUZupawn9lKl2Ukxvg/Mm74YRt8z5Xu/Iv9s5AVbv1cqElR
 rFGDzooLn446tTzuRfMVQWA6WIQX3sZnBRVGwTK4w30UZn3sivhq+pywzKaMtHsTbA1Qjut8
 aFmQwL1hSgdNj459GbXitFsjK9evRmsqQBzz5LSbYqIMvd1Y6HTcs4ARWdZXchfWSNODY28Y
 YUSEeQOIelWopLhp1YNtxayGRWgCP3txzJOm3T43bc60+MkEQze2QIgBdMOsG/IrNXyOqcSX
 /2+wa7LzTXZbvNWwiv96I/GchAvuvyMRrFwcMrJyUk1EAPJlE6fppL8Mj6Ty+8CvHSV4fB6W
 uKzl24otRtxoj63y8swi4TEmp4Zx03H+Chl3Yo5ONO1RUF4bNOkDJZetyOXOYV5TM4iTG9lt
 iY3x7wGtJKmYSQG1YkrywLDZvGab4WF5A/oWuiWITd9nn1lebS/ig6y8Ue61uL8Vde70ExSr
 ipYidbMsnEN2ADJ6sedV/R9/0Ch1SyI1wDJ5eFIOVs0lbLFJJE93r4wjIcTsUHaEiDqn0X2i
 qGWeVs++ue27eTofqvpqoWbN49uhQHyKqUuldalAeQlKwQORXWX9f671L358k31WLBKgectk
 qnFt5DVOMMbpqijDw9PyIks9he/DzC+3NQdh3YHMEhFeBOIjoTzJ1HOJ+j0DeuxglStjDdr2
 +7JPqf7DprRKXjDlbHsdqt+5U5E0Ac/0MxT6pZOBr0cLv/+VFX9uMLGAhMlKQC43ujqBdZ72
 4gDQ2yAGLWZP7nXsVKQ4+IvJPSDa5ENtTbmLvgl++bujXgkmV8BZaWp3YUYaHS/Hvl+J0qVf
 H7hjskbHWsXvwczT/bmhEOYXTNSe3q9Wbow5jA9CI24EYfOXp2hjKCF0SuhA5FbaG5LBkqSH
 Xv2a4mIQeoAZSyRL8N5lzwLT7mhS4sv1RG0sw/6zqJqLunO+i0ZrpLjyN915+PdlRwp7jx0D
 MSc03mXT2FzhG8HXCE50Lh5oUNm0liDy7R3g+REFdxP4PNESho2OYbGz+NmE9DyRh7BftCRR
 VaiQ9WmBywxT90oz98OeUl9Hs6igwvd3yqlHbAVjaaHBJ8q/aLG2Xj+OcJ9x2zB1Kk7gFkqW
 tZANW6nhq567wXdH4HHnEuHmai2aakS2jbB9HybzWqApExWSBd+X73KU3wHfUvWtdr56VvCT
 7CwDbQnNRNMx9abJKVSZdO6xWlBEfPiPsnOJmK4nnyYGxmF3PWPYZDsdmFb2z/SW2YelAVG3
 myHLhQ5CCnp92HEDSdyElzhS1jv4PFkrzWxQxlnnEmxc0R92u/tqVYujvuGRqZLto8=
IronPort-Data: A9a23:D9AR5a/ug8rPy4GJdhD3DrUD2n+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GMZXjiDPvmNa2H2eop1aNyw8R8HsJfTmt8xSwNtqyExFiIbosfsO4+Ufxz6V8+wwm0vb67GA
 +E2MISowBUcFyKEzvuVGuG86yE6jOfQHeKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCmthg
 /uryyHkEAHjg24c3l48sfrZ9Esy5q6q5Vv0g3RnDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5m8AH+v1T2Mw0MBkI1GrTxo4ZJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUR4tZrGX4Nx
 ccbKREoYjqHh+KH7uK0H7wEasQLdKEHPass4yA6i2iHXbB8B86bds0m5/cBhGZ235sVW6yEP
 4xAMmoHgBfoOnWjPn8UEpMlgOCmiFHkcCxAslXTr6dfD237kVAvgOGxbIu9ltqiGcJLmReWp
 m//8kfcCRgIBt21zWWAyyf57gPItWahMG4IL5W89/h3kBiTz2kIIAMZWEH9ovSjjEO6HdVFJ
 CQpFjEG9PNishbxFpykBEb9+SbV+BcQQN4VH/w8rgCW0uze7gKWD2MDS3hLZbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltfkd9+1eX544PPie/ogDbpO+Xenbw=
IronPort-HdrOrdr: A9a23:Ao0V+KyreXSqGyS/9OoOKrPwIr1zdoMgy1knxilNYDRIb8qTjN
 C2gZ0gpHzJYUUqOE3I/urwXZVoIEmsl6KdjrN6AV7PZmbbUQiTQb2Kj7GI/9SIIUSXygc378
 ldmsZFaeEYQWIXsfrH
X-Talos-CUID: 9a23:FiA4rmC9SrBmVcb6EyB/xFIMBYMVSX7c7VLcCUu4CVdHGLLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AZzn6KgwR3HmCEifT2rCzpc8uWKaaqPipFkdcn5U?=
 =?us-ascii?q?LgsSnECd5KQWcpjDoR7Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from 138.220-133-109.adsl-dyn.isp.belgacom.be (HELO [192.168.2.60]) ([109.133.220.138])
  by relay.proximus.be with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 22:23:28 +0200
Message-ID: <467900c3-48f3-4d1f-b253-97e1a30a08a2@skypro.be>
Date: Wed, 22 May 2024 22:23:27 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kristoff <kristoff@skypro.be>
Subject: spectrum24 .. new hamradio conference for open source and amateur
 radio
To: linux-hams@vger.kernel.org
Content-Language: nl
Autocrypt: addr=kristoff@skypro.be; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,


Just one single message to announce that on the 14th and 15th of 
September, we will be organizing a new conference for amateurradio, open 
source and new developments.

As this list is called "linux-hams" I think it should fit in here. :-)


We aim to create a conference, based on the model of the 
SDR-and-amateurradio devroom earlier this year, to promote open source 
software and hardware for amateurradio and all public accessible 
radio-spectrum (hence its name :-) )

The conference has an open format with a lot of time in-between the 
talks. We did not want to create a conference with just talks back to 
back where people do not have time to breath.
The goal of spectrum24 is to have a space of cooperation, where people 
have more then enough time to talk to each other, seek cooperation or 
even hack together on some projects.

Please find below the announcement, including the Call-for-Presentation.

You can also apply for an infostand.



Announcing the spectrum24 conference
------------------------------------

spectrum24

"Making Waves"
The Conference for Creative Use of the Radio Spectrum in Open Systems


On the 14th and 15th of September 2024, the first ever "spectrum"
conference, dedicated to amateur radio, will be held.

The spectrum24 conference is the result of the "amateur radio and SDR"
devroom at the FOSDEM conference[1] earlier this year in Brussels.
Seeing its great success, it was obvious that there is quite some
interest in open source development in the amateur radio community. This
led to the conclusion that a dedicated conference on these topics surely
had its place, and - to make the conference even more interesting - we
decided to expand the scope of the conference into other amateur radio
related fields.


* Spectrum24 has three main fields of interest:

- Amateur radio developments: ranging across SDR receiver and
transmitter hardware and software, novel antenna-design, amateur radio
infrastructure, new modes of communication, alternative ways of
accessing amateur radio spectrum, etc.

- Amateur radio non-technical aspects: spectrum-use, promotion, bridging
amateur radio and other technical communities such as the maker
community, FOSS[2] and OSH[3] developer communities, amateur radio
IT-infrastructure, etc.

- Open source applications and access to non-amateur radio-spectrum:
SRD-band[4] users (such as 433 MHz, 862-870 MHz, 2.4 GHz and 5.8 GHz),
radio-astronomy, amateur satellite spectrum-users.

As the name of the conference implies, spectrum24 is aimed at anybody
interested in fostering open systems that provide access to all
available radio spectrum.


* Background information and Conference format

You can find an interview with two of the conference organisers on the
goals and background of spectrum24 in this episode of hacker[5] public
radio: https://hackerpublicradio.org/eps/hpr4122/index.html

The spectrum24 conference is the ideal platform to promote your project
that will further amateur radio and open access to radio-spectrum and
show it to a large international audience.

The open format of the conference, with plenty of time between
presentations, is aimed to allow you to talk to other people with
similar interests, set up cooperation, or even hack together on your
project while you are there.



* Spectrum24 has opened a Call for Presentation.

If you are interested in presenting at the conference, or set up an
info-booth at spectrum24, you can make a proposal via this link:
https://spectrum-conference.org/24/cfp

The deadline for proposals for presentations is the 15th of July.

The deadline for proposals for info-booth is the 15th of August.



* Fees, Location and Sponsorship

The conference is held at SmartCity Campus in an old radio factory in
Rambouillet near Paris.

Access to the conference is free.

The Spectrum24 conference is supported by the IARU-region 1.
https://www.iaru-r1.org/events/spectrum24-making-waves/



* Social media

You can follow spectrum24 on mastodon:
https://mastodon.radio/@spectrumconf

Or join the discussion on matrix:
https://matrix.to/#/#spectrum-conference:matrix.org

You can follow spectrum24 on X: https://twitter.com/SpectrumConf24


See you in Rambouillet!

[1] FOSDEM or Free and Open source Software Developers' European Meeting
is a non-commercial, volunteer-organised European event centred on free
and open-source software development. It is aimed at developers and
anyone interested in the free and open-source software movement.

[2] Free and Open Source Software

[3] Open Source Hardware

[4] Short Range Device-band

[5] Hacker Public Radio is a podcasting platform that allows anybody to
distribute podcast content related to hacking-culture. The term "hacker"
relates to the original meaning of the word: somebody interested in
technology beyond being a “mere” user. More info:
https://hackerpublicradio.org



