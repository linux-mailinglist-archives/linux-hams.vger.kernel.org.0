Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09F6185F8E
	for <lists+linux-hams@lfdr.de>; Sun, 15 Mar 2020 20:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgCOTWW (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 15 Mar 2020 15:22:22 -0400
Received: from ecuador.junglevision.com ([50.79.209.146]:45038 "EHLO
        ecuador.junglevision.junglevision.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728480AbgCOTWW (ORCPT
        <rfc822;linux-hams@vger.kernel.org>);
        Sun, 15 Mar 2020 15:22:22 -0400
X-Greylist: delayed 1439 seconds by postgrey-1.27 at vger.kernel.org; Sun, 15 Mar 2020 15:22:21 EDT
Received: from [50.79.209.151] (chile.junglevision.com [50.79.209.151])
        (authenticated bits=0)
        by ecuador.junglevision.junglevision.com (8.15.2/8.15.2) with ESMTPSA id 02FIwLBl006836
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO)
        for <linux-hams@vger.kernel.org>; Sun, 15 Mar 2020 14:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=junglevision.com;
        s=default; t=1584298702;
        bh=NOXX6AIZ44PER/OgfpZwjut45Mk3/lwkLgPo+MS1O+M=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=aQAESQnh7EH78ZT3fEBW5Fe9kctDCrS58Zln0JQF0nf/k/t9gQTvHjtOj2IyvkdLL
         VDV+hZFhyECldPFsECJ80J6O0vKOUknXb7/qayp5b2JTc1dVjhhcPZW8YjvyYsBkf6
         NQB25Ns+n8iPj78oLtMiTDVDQECLw369xacliJ5g=
Subject: Re: Quesion: AX.25 socket data corruption
To:     linux-hams@vger.kernel.org
References: <CAJ4MR4aaQPvoX4=qzzUShkM+Xr5FUjb8nt047mT1khWvABoZLA@mail.gmail.com>
From:   Cathryn Mataga <cathryn@junglevision.com>
Message-ID: <8d229b1d-ee6c-23b5-fd61-c6f04a4974e4@junglevision.com>
Date:   Sun, 15 Mar 2020 11:58:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ4MR4aaQPvoX4=qzzUShkM+Xr5FUjb8nt047mT1khWvABoZLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Believe duplicated packets are expected (just due to how this stuff 
works.)  but if the final stream was corrupted, that's something bad 
going on.  Interesting, that two are 80 bytes and one is 160 bytes 
long.  Is the bad data in the 80 byte one?

Btw, your sample code is clear and easy to understand.

On 2/24/2020 5:11 AM, Ivan Savitsky wrote:
> Hello,
>
> I was asking this question on
> https://github.com/ve7fet/linuxax25/issues but was directed to this
> mailing list for further investigation. I apologise for possible
> duplicates if you're reading the both discussions.
>
> I'm writing a proxy between a AX.25 VC socket and a TCP socket.
> It is needed for programmes like telnet to work directly over AX.25 VC.
> This allows full screen visual remote terminal access without using IP
> over AX.25.
>
> On the server side I'm creating a listening AX.25 socket. After
> accepting a AX.25 client, the TCP connection to the telnetd is
> created.
>
> On the client side a listening TCP socket is created. After accepting
> a telnet connection to the TCP socket, the AX.25 VC is created.
>
> The AX.25 link I am currently testing is created by ax25ipd over the
> Ethernet LAN between two linux PCs which reside in the same room. I've
> done a few tests over the real radio as well with same results.
>
> The problem is that the data passing between the two sockets (VC and
> TCP) is quite often became corrupted, duplicated or misplaced. In the
> packet dump with axlisten command there are "REJ" frames from the
> client side and duplicated "I" frames from the server side which are
> corresponding to the corrupted output in the telnet session (LORA3-8
> is a server and LORA4 is a client):
>
> axip: fm LORA3-8 to LORA4 ctl I76^ pid=F0(Text) len 64 12:08:23
> axip: fm LORA4 to LORA3-8 ctl REJ7v 12:08:23
> axip: fm LORA3-8 to LORA4 ctl I77+ pid=F0(Text) len 80 12:08:23
> axip: fm LORA4 to LORA3-8 ctl RR0- 12:08:23
> axip: fm LORA3-8 to LORA4 ctl I77+ pid=F0(Text) len 160 12:08:23
> axip: fm LORA4 to LORA3-8 ctl REJ0- 12:08:23
> axip: fm LORA3-8 to LORA4 ctl I77^ pid=F0(Text) len 80 12:08:23
> axip: fm LORA3-8 to LORA4 ctl I70+ pid=F0(Text) len 256 12:08:23
>
> The data forwarding routine is straightforward:
>
> /* Forward data between sockets */
> void forward_data(int source_sock, int destination_sock, const char* name) {
>      ssize_t n;
>      fd_set read_fd;
>      char buffer[BUF_SIZE];
>
>      if (fcntl(source_sock, F_SETFL, O_NONBLOCK) < 0) {
>          perror("socket");
>          close(source_sock);
>          return;
>      }
>
>      int paclen = ax25_config_get_paclen(ax25_port);
>
>      while (1) {
>          FD_ZERO(&read_fd);
>          FD_SET(source_sock, &read_fd);
>          select(source_sock + 1, &read_fd, NULL, NULL, NULL);
>          if (FD_ISSET(source_sock, &read_fd)) {
>              n = read(source_sock, buffer, BUF_SIZE);
>          }
>          if (n <=0 ) break;
>
>          int offset = 0;
>
>          while (offset != n) {
>              int len = (n-offset > paclen) ? paclen : n-offset;
>              int ret = write(destination_sock, buffer+offset, len); //
> send data to output socket
>              if (ret == -1) {
>                  printf("\n");
>                  if (errno == EWOULDBLOCK || errno == EAGAIN) {
>                      perror("write");
>                      usleep(100000);
>                      continue;
>                  }
>                  break;
>              }
>              offset += ret;
>          }
>      }
> …
>
> The question is: whether it is possible to pass the data reliably in
> such a manner between the VC and TCP sockets and, if so, what should
> be done from my side to eliminate the data corruption?
>
> Thanks,
> Ivan
