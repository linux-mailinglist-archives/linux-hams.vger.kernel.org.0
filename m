Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE06784599
	for <lists+linux-hams@lfdr.de>; Tue, 22 Aug 2023 17:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbjHVPby (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 22 Aug 2023 11:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237135AbjHVPbx (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 22 Aug 2023 11:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50FFCD6
        for <linux-hams@vger.kernel.org>; Tue, 22 Aug 2023 08:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692718265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PqLO2V0ZPwoCiwmUHn1tH4GQt5T66HZTGlrG692z+68=;
        b=aYKzkPcraQdyd3dRkilZeE2wdwT7f1+dM/Wyd6HxzfDQ0NGAZq54uxz/TWlUazMxFJldUW
        hbTE7y6XoO3Ov25anIFFmEOTmsB4r24y1CvYhR2kkazbvoya1h/ucelrTVHBd2vUw3MhkE
        fqKIJrsW1raEPCOMQYH0Ellzgt8uurA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-OYxZBfeIMM-cZKkLRpRdiQ-1; Tue, 22 Aug 2023 11:31:04 -0400
X-MC-Unique: OYxZBfeIMM-cZKkLRpRdiQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99e168f4f38so57778766b.0
        for <linux-hams@vger.kernel.org>; Tue, 22 Aug 2023 08:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692718263; x=1693323063;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqLO2V0ZPwoCiwmUHn1tH4GQt5T66HZTGlrG692z+68=;
        b=loVXG42+RLx22ziO3RqivypaQ6dNTYOoQmcYYDXmTSvDKlMAUP2iJyEaBlsqgDvkj+
         w6TO8WKyeHKQZv1PxAahEOVYlIsOAmSjkKeFrFPDGlAJO/3G0dCzum2L2zQKfEbr+zUe
         RYSrc4GzJx8NhYan3oqIKGpGCy2I42SDtEcbq4CxxORjDmNbGayhbtJYuAedgav4E/+M
         WFjj1P+fqUiqxgG8OM5T1Nl1bS6lRfBUBi0q5LoWLR+diRFxl7pIuOduyyVGuL3XLkxo
         YhrsLMUVI4Alx3uKJWvC5DIUFcPc1zTL5uzgskPLArpbaQdjs3smeRqznvDfq4Fw0D16
         hUtg==
X-Gm-Message-State: AOJu0Yyiz/eiUsfs+9MQvpes2C7pWGNUTzH2wM+Quo4jtV73zreUorwz
        ZmN9cRd/T3KeNmIbWA9QvVZQTml28bksXYjqfUcCu0srd49vNqXXwOEDVd27u4MjZMdg2uizSwf
        b+RhYDQMB+l15VPEb8fOmhw==
X-Received: by 2002:a17:906:51ce:b0:9a1:b4f9:b1db with SMTP id v14-20020a17090651ce00b009a1b4f9b1dbmr1930714ejk.1.1692718263253;
        Tue, 22 Aug 2023 08:31:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4qLldO9SHriB/biC2xhIUus+4dimS51pERtZRGR9Vw2TOIqYiK47v/foUI/IPbMNkxI46ig==
X-Received: by 2002:a17:906:51ce:b0:9a1:b4f9:b1db with SMTP id v14-20020a17090651ce00b009a1b4f9b1dbmr1930697ejk.1.1692718262982;
        Tue, 22 Aug 2023 08:31:02 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-241-4.dyn.eolo.it. [146.241.241.4])
        by smtp.gmail.com with ESMTPSA id c25-20020a170906529900b0099cf840527csm8299419ejm.153.2023.08.22.08.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 08:31:02 -0700 (PDT)
Message-ID: <f80fcd476a230c354bf9758762250c43a1f3d5cc.camel@redhat.com>
Subject: Re: [PATCH] sock: Fix sk_sleep return invalid pointer
From:   Paolo Abeni <pabeni@redhat.com>
To:     eadavis@sina.com,
        syzbot+666c97e4686410e79649@syzkaller.appspotmail.com
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, ralf@linux-mips.org,
        syzkaller-bugs@googlegroups.com, hdanton@sina.com
Date:   Tue, 22 Aug 2023 17:31:00 +0200
In-Reply-To: <20230822124419.1838055-1-eadavis@sina.com>
References: <000000000000e6c05806033522d3@google.com>
         <20230822124419.1838055-1-eadavis@sina.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Tue, 2023-08-22 at 20:44 +0800, eadavis@sina.com wrote:
> From: Edward AD <eadavis@sina.com>
>=20
> The parameter sk_sleep(sk) passed in when calling prepare_to_wait may=20
> return an invalid pointer due to nr-release reclaiming the sock.
> Here, schedule_timeout_interruptible is used to replace the combination=
=20
> of 'prepare_to_wait, schedule, finish_wait' to solve the problem.
>=20
> Reported-and-tested-by: syzbot+666c97e4686410e79649@syzkaller.appspotmail=
.com
> Signed-off-by: Edward AD <eadavis@sina.com>

This looks wrong. No syscall should race with sock_release(). It looks
like you are papering over the real issue.

As the reproducer shows a disconnect on an connected socket, I'm wild
guessing something alike 4faeee0cf8a5d88d63cdbc3bab124fb0e6aed08c
should be more appropriate.

Cheers,

Paolo

