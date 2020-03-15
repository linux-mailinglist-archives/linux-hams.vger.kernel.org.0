Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F59C185E86
	for <lists+linux-hams@lfdr.de>; Sun, 15 Mar 2020 17:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgCOQm7 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 15 Mar 2020 12:42:59 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:38258 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbgCOQm6 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 15 Mar 2020 12:42:58 -0400
Received: by mail-wm1-f45.google.com with SMTP id t13so9069724wmi.3
        for <linux-hams@vger.kernel.org>; Sun, 15 Mar 2020 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=P4lNRbBw/zOfneiN3cCzj1oIP1ruIuUL04TBx8txt44=;
        b=CkTVUx2J+vF+tV6l8jt+fwCmN912r/BadHlY/2kORVkwK+EzKRKmcSaWN/AIl51TBR
         7243OnIo1dCoCFCXZY/YSeQg3b+j5HSiIcVs56bIX1HsF8AeZq4ppXH7302eRyapvaIl
         NUEifmy0bX3c05DSU5009T8T2dMLaOKUmqpO6U2J/PmYnZzsky7yBG6sw5A3VXEY32/g
         EP6F4MRXLr6VBgBdS1bN4xVQrRKm7wc9M+NQR0v+37q1/NT416SJi9MyHnG7ln3C0FUA
         fRFw8qnqYHkK/1E859REFPIJTrsbsXKQh90AMgOrUqUZN2cDrjauuAyUBpbEjVaIbgPS
         JE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=P4lNRbBw/zOfneiN3cCzj1oIP1ruIuUL04TBx8txt44=;
        b=L+12szoxu0ZBrggk9+VsVrgufnJ39XmJ6BCcEwXUeI41LZF6jGTLrItPKJbjJMTNfs
         XjSS9DjQMFHMUGFxwNGWqPxV1ZGyJ4SReqlwgx3c+jh424+l25uQNhXLzRLivkE8duHj
         Rwb/aqKBlyCIUxUIz4WuoT2jMuNljXQgLHVWG9rGdJ86j5dC+mo0NLUqr4bbkzEVPKoS
         sr/Yf9T6UxZHC5HoZ2G9emWUg/zg5MIblrH91Hb9XQ3Rmh8wrL/GW70KL3pxYZ1vGZlb
         sVIbnUrimNpY0tcqfewJL1IvbF6oAI3EILHWEcYAQy5HbQAyf4V3Yo4RC0XKVW6EIsiM
         wRww==
X-Gm-Message-State: ANhLgQ0X5uOQwWBNJuOAZtvwrA8kaAbmvTFNyvSFYw+ezdWFOzNUHuL5
        sGC1CaY4wQvd4z3Hfcvadb3wT3urrzgzXhy/kCWxdmDn438=
X-Google-Smtp-Source: ADFU+vt26PvK7sN5sT45IGH0Pp6F6vUpQOy+f9f93PpU+0Ac6jjjTHHg9YvJN7B0ScR4ITT9iyrhFG0I4kj1e+neEEo=
X-Received: by 2002:a7b:c62a:: with SMTP id p10mr20914527wmk.46.1584290576174;
 Sun, 15 Mar 2020 09:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ4MR4Z=DQQ=cZoKb=7vS+5nx0u9AhTxjeApsmKW2K2WRx-bhw@mail.gmail.com>
In-Reply-To: <CAJ4MR4Z=DQQ=cZoKb=7vS+5nx0u9AhTxjeApsmKW2K2WRx-bhw@mail.gmail.com>
From:   Ivan Savitsky <jcuken321@gmail.com>
Date:   Sun, 15 Mar 2020 18:42:45 +0200
Message-ID: <CAJ4MR4bWV4FyiyyUmRLVgn84fq_uTyJRchwHYx2=rmBzL1KhDQ@mail.gmail.com>
Subject: Re: Quesion: AX.25 socket data corruption
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Now I ran out of ideas while debugging my proxy.c.
It really looks like indeed there is a system buffer corruption during
the write() into SOCK_SEQPACKET socket.

Today I did what I had to do in the first place before anything else =E2=80=
=94
tried something that worked before for years.
I log in into the remote system via AX.25 SVC  by using the 'call'
utility and see if the in/out data is consistent.
What I found: there is a data corruption there as well. I recorded a
short video where hexdump output misalignment
is shown. Here is the YouTube link if anyone interested:
https://youtu.be/K4vhCXLK1b0

With best regards,
Ivan
