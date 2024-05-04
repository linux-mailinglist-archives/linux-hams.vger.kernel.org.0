Return-Path: <linux-hams+bounces-213-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5828BBEBC
	for <lists+linux-hams@lfdr.de>; Sun,  5 May 2024 00:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66AAB1C20C04
	for <lists+linux-hams@lfdr.de>; Sat,  4 May 2024 22:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E08C84D10;
	Sat,  4 May 2024 22:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="XFmGwIQ4"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp86.iad3b.emailsrvr.com (smtp86.iad3b.emailsrvr.com [146.20.161.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F0A3BB24
	for <linux-hams@vger.kernel.org>; Sat,  4 May 2024 22:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714861926; cv=none; b=vEQrUNDfdoyU4FgF8woHCxHVMjyFDS1ahvO8ktpLvG6lRV3k2wT9E9ZaXanKPf5IYUdVrD8FIwe4Sq97d9FkHLTcNKNbkbndNTZuBg6Iq/JzMKNiz5oMuI0HrWHismeHmScoAchcBaDkRPG+AXApOrlqG0eER9Bhqr/KUa13GT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714861926; c=relaxed/simple;
	bh=PPCcGpsRM/AIy4kHnfjDp1sQI38mXWJkKA1YyYFoOyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZ9Bvrp4k+9p9uWIzDG95uOJOfWEOjV/On2Ht306jkTDwrhETmPuIqkrV4ebJjZPXWFDBCbHGLEQJGX1uFpf+uGwLaSdAVCiv9Q/PsHaeRqiKjYB8eZwULVv4uc5XGNZ2CUWvF4B/ReieYgFsNsT4oFnv58x9dOmVRopm/PhTRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=XFmGwIQ4; arc=none smtp.client-ip=146.20.161.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1714860974;
	bh=PPCcGpsRM/AIy4kHnfjDp1sQI38mXWJkKA1YyYFoOyU=;
	h=Date:From:To:Subject:From;
	b=XFmGwIQ4m6VSaXYgUb6UiMyrHBmDJuIqc0nD5QTORQD5oMn04FLZgv9uvaeaNowAd
	 T88yargU5PJSst6ZwVO/dffICKh3ukLanzR0JmJUDCFKUqAsWK1q/vMcHFPpBs+rXK
	 hh+2kkITxq/cn1aydrmFNmgV/Qw4DxR/YjCJmm8k=
X-Auth-ID: lars@oddbit.com
Received: by smtp3.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 6B75740232;
	Sat,  4 May 2024 18:16:14 -0400 (EDT)
Date: Sat, 4 May 2024 18:16:14 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org, 
	edumazet@google.com, davem@davemloft.net, jreuter@yaina.de
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <movur4qy7wwavdyw2ugwfsz6kvshrqlvx32ym3fyx5gg66llge@citxuw5ztgwc>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>
 <ekgwuycs3hioz6vve57e6z7igovpls6s644rvdxpxqqr7v7is6@u5lqegkuwcex>
 <1e14f4f1-29dd-4fe5-8010-de7df0866e93@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e14f4f1-29dd-4fe5-8010-de7df0866e93@moroto.mountain>
X-Classification-ID: f435f6e0-f2bb-4f3f-be42-b9529eaace03-1-1

On Sat, May 04, 2024 at 03:16:55PM +0300, Dan Carpenter wrote:
> Wait, which panic is this?  The NULL dereference introduce by the
> "ax25_dev" vs "res" typo?

Right, that one. Your diff was on top of Duoming's patches, which had
earlier introduced that kernel panic. Just confirming that things are
working (for some value of "working") with your latest change.

> >   refcount_t: decrement hit 0; leaking memory.
> >   refcount_t: underflow; use-after-free.
> 
> Hm...  Is there a missing netdev_hold() in ax25_bind() on the
> "User already set interface with SO_BINDTODEVICE" path?

There's a missing netdev_hold() in the path for *inbound* packets
(ax25_rcv -> ax25_accept).

I added some tracepoints [1] so that we can see calls to
netdev_{put,hold} in a function graph. Without my patches, the graph for
an incoming connections looks like [2]:

    # tracer: function_graph
    #
    # CPU  TASK/PID         DURATION                  FUNCTION CALLS
    # |     |    |           |   |                     |   |   |   |
    ------------------------------------------
    0)    <idle>-0    =>   kworker-29  
    ------------------------------------------

    0)   kworker-29   |               |  ax25_kiss_rcv() {
    0)   kworker-29   |               |    ax25_rcv.isra.0() {
    0)   kworker-29   |   0.168 us    |      ax25_addr_parse();
    0)   kworker-29   |   0.094 us    |      ax25_addr_size();
    0)   kworker-29   |   0.136 us    |      ax25cmp();
    0)   kworker-29   |   0.137 us    |      ax25_digi_invert();
    0)   kworker-29   |               |      ax25_find_cb() {
    0)   kworker-29   |   0.223 us    |        ax25cmp();
    0)   kworker-29   |   0.194 us    |        ax25cmp();
    0)   kworker-29   |   0.087 us    |        ax25cmp();
    0)   kworker-29   |   0.975 us    |      }
    0)   kworker-29   |               |      ax25_find_listener() {
    0)   kworker-29   |   0.092 us    |        ax25cmp();
    0)   kworker-29   |   0.084 us    |        ax25cmp();
    0)   kworker-29   |   0.526 us    |      }
    0)   kworker-29   |               |      ax25_make_new() {
    0)   kworker-29   |               |        ax25_create_cb() {
    0)   kworker-29   |   0.117 us    |          ax25_setup_timers();
    0)   kworker-29   |   0.478 us    |        }
    0)   kworker-29   |   1.813 us    |      }
    0)   kworker-29   |               |      ax25_send_control() {
    0)   kworker-29   |               |        ax25_transmit_buffer() {
    0)   kworker-29   |   0.086 us    |          ax25_addr_size();
    0)   kworker-29   |   0.094 us    |          ax25_addr_build();
    0)   kworker-29   |   0.081 us    |          ax25_fwd_dev();
    0)   kworker-29   |   4.854 us    |        }
    0)   kworker-29   |   5.604 us    |      }
    0)   kworker-29   |   0.108 us    |      ax25_cb_add();
    0)   kworker-29   |   0.410 us    |      ax25_start_heartbeat();
    0)   kworker-29   |   0.218 us    |      ax25_start_t3timer();
    0)   kworker-29   |   0.099 us    |      ax25_start_idletimer();
    0)   kworker-29   | + 14.957 us   |    }
    0)   kworker-29   | + 16.116 us   |  }
    ------------------------------------------
    1)   ax25ipd-63   =>    ax25d-77   
    ------------------------------------------

    1)    ax25d-77    |   1.580 us    |  ax25_accept();
    1)    ax25d-77    |   0.211 us    |  ax25_getname();
    1)    ax25d-77    |   0.275 us    |  ax25_getname();
    ------------------------------------------
    0)   kworker-29   =>   axwrapp-83  
    ------------------------------------------

    0)   axwrapp-83   |               |  ax25_sendmsg() {
    0)   axwrapp-83   |               |    ax25_output() {
    0)   axwrapp-83   |               |      ax25_kick.part.0() {
    0)   axwrapp-83   |               |        ax25_send_iframe() {
    0)   axwrapp-83   |   0.679 us    |          ax25_start_idletimer();
    0)   axwrapp-83   |               |          ax25_transmit_buffer() {
    0)   axwrapp-83   |   0.093 us    |            ax25_addr_size();
    0)   axwrapp-83   |   0.102 us    |            ax25_addr_build();
    0)   axwrapp-83   |   0.145 us    |            ax25_fwd_dev();
    0)   axwrapp-83   |   9.311 us    |          }
    0)   axwrapp-83   | + 10.464 us   |        }
    0)   axwrapp-83   |   0.096 us    |        ax25_t1timer_running();
    0)   axwrapp-83   |   0.332 us    |        ax25_stop_t3timer();
    0)   axwrapp-83   |   0.093 us    |        ax25_calculate_t1();
    0)   axwrapp-83   |   0.439 us    |        ax25_start_t1timer();
    0)   axwrapp-83   | + 18.839 us   |      }
    0)   axwrapp-83   | + 19.479 us   |    }
    0)   axwrapp-83   | + 22.647 us   |  }
    ------------------------------------------
    0)   ax25ipd-63   =>   axwrapp-83  
    ------------------------------------------

    0)   axwrapp-83   |               |  ax25_sendmsg() {
    0)   axwrapp-83   |               |    ax25_output() {
    0)   axwrapp-83   |               |      ax25_kick.part.0() {
    0)   axwrapp-83   |               |        ax25_send_iframe() {
    0)   axwrapp-83   |   0.339 us    |          ax25_start_idletimer();
    0)   axwrapp-83   |               |          ax25_transmit_buffer() {
    0)   axwrapp-83   |   0.092 us    |            ax25_addr_size();
    0)   axwrapp-83   |   0.097 us    |            ax25_addr_build();
    0)   axwrapp-83   |   0.136 us    |            ax25_fwd_dev();
    0)   axwrapp-83   |   9.116 us    |          }
    0)   axwrapp-83   |   9.908 us    |        }
    0)   axwrapp-83   |   0.091 us    |        ax25_t1timer_running();
    0)   axwrapp-83   | + 10.810 us   |      }
    0)   axwrapp-83   | + 11.168 us   |    }
    0)   axwrapp-83   | + 14.362 us   |  }
    ------------------------------------------
    0)   axwrapp-83   =>   kworker-10  
    ------------------------------------------

    0)   kworker-10   |               |  ax25_kiss_rcv() {
    0)   kworker-10   |               |    ax25_rcv.isra.0() {
    0)   kworker-10   |   0.116 us    |      ax25_addr_parse();
    0)   kworker-10   |   0.090 us    |      ax25_addr_size();
    0)   kworker-10   |   0.144 us    |      ax25cmp();
    0)   kworker-10   |   0.091 us    |      ax25_digi_invert();
    0)   kworker-10   |               |      ax25_find_cb() {
    0)   kworker-10   |   0.091 us    |        ax25cmp();
    0)   kworker-10   |   0.087 us    |        ax25cmp();
    0)   kworker-10   |   0.550 us    |      }
    0)   kworker-10   |               |      ax25_std_frame_in() {
    0)   kworker-10   |   0.105 us    |        ax25_decode();
    0)   kworker-10   |   0.117 us    |        ax25_validate_nr();
    0)   kworker-10   |               |        ax25_check_iframes_acked() {
    0)   kworker-10   |   0.670 us    |          ax25_frames_acked();
    0)   kworker-10   |               |          ax25_calculate_rtt() {
    0)   kworker-10   |   0.086 us    |            ax25_t1timer_running();
    0)   kworker-10   |   0.085 us    |            ax25_display_timer();
    0)   kworker-10   |   0.465 us    |          }
    0)   kworker-10   |   0.185 us    |          ax25_stop_t1timer();
    0)   kworker-10   |   0.358 us    |          ax25_start_t3timer();
    0)   kworker-10   |   2.186 us    |        }
    0)   kworker-10   |               |        ax25_kick() {
    0)   kworker-10   |   0.093 us    |          ax25_kick.part.0();
    0)   kworker-10   |   0.277 us    |        }
    0)   kworker-10   |   3.320 us    |      }
    0)   kworker-10   |   5.927 us    |    }
    0)   kworker-10   |   6.563 us    |  }
    ------------------------------------------
    0)   kworker-10   =>   axwrapp-83  
    ------------------------------------------

    0)   axwrapp-83   |               |  ax25_release() {
    0)   axwrapp-83   |   0.158 us    |    ax25_clear_queues();
    0)   axwrapp-83   |               |    ax25_send_control() {
    0)   axwrapp-83   |               |      ax25_transmit_buffer() {
    0)   axwrapp-83   |   0.086 us    |        ax25_addr_size();
    0)   axwrapp-83   |   0.086 us    |        ax25_addr_build();
    0)   axwrapp-83   |   0.085 us    |        ax25_fwd_dev();
    0)   axwrapp-83   |   3.972 us    |      }
    0)   axwrapp-83   |   4.356 us    |    }
    0)   axwrapp-83   |   0.142 us    |    ax25_stop_t2timer();
    0)   axwrapp-83   |   0.145 us    |    ax25_stop_t3timer();
    0)   axwrapp-83   |   0.094 us    |    ax25_stop_idletimer();
    0)   axwrapp-83   |   0.093 us    |    ax25_calculate_t1();
    0)   axwrapp-83   |   0.227 us    |    ax25_start_t1timer();
    0)   axwrapp-83   |               |  /* netdev_put: dev=ax0 */
    ------------------------------------------
    1)    ax25d-77    =>   kworker-10  
    ------------------------------------------

    1)   kworker-10   |               |  ax25_kiss_rcv() {
    1)   kworker-10   |               |    ax25_rcv.isra.0() {
    1)   kworker-10   |   0.188 us    |      ax25_addr_parse();
    1)   kworker-10   |   0.089 us    |      ax25_addr_size();
    1)   kworker-10   |   0.177 us    |      ax25cmp();
    1)   kworker-10   |   0.101 us    |      ax25_digi_invert();
    1)   kworker-10   |               |      ax25_find_cb() {
    1)   kworker-10   |   0.092 us    |        ax25cmp();
    1)   kworker-10   |   0.085 us    |        ax25cmp();
    1)   kworker-10   |   0.731 us    |      }
    1)   kworker-10   |               |      ax25_std_frame_in() {
    1)   kworker-10   |   0.098 us    |        ax25_decode();
    1)   kworker-10   |               |        ax25_disconnect() {
    1)   kworker-10   |   0.311 us    |          ax25_stop_t1timer();
    1)   kworker-10   |   0.093 us    |          ax25_stop_t2timer();
    1)   kworker-10   |   0.093 us    |          ax25_stop_t3timer();
    1)   kworker-10   |   0.086 us    |          ax25_stop_idletimer();
    1)   kworker-10   |   0.415 us    |          ax25_link_failed();
    1)   kworker-10   |   1.778 us    |        }
    1)   kworker-10   |   0.090 us    |        ax25_kick();
    1)   kworker-10   |   2.523 us    |      }
    1)   kworker-10   | + 10.078 us   |    }
    1)   kworker-10   | + 12.054 us   |  }
    0)   axwrapp-83   | * 13227.13 us |  }
    ------------------------------------------
    0)   axwrapp-83   =>    <idle>-0   
    ------------------------------------------

    0)    <idle>-0    |               |  ax25_heartbeat_expiry() {
    0)    <idle>-0    |               |    ax25_std_heartbeat_expiry() {
    0)    <idle>-0    |               |      ax25_destroy_socket() {
    0)    <idle>-0    |   0.249 us    |        ax25_cb_del();
    0)    <idle>-0    |   0.107 us    |        ax25_stop_heartbeat();
    0)    <idle>-0    |   0.140 us    |        ax25_stop_t1timer();
    0)    <idle>-0    |   0.090 us    |        ax25_stop_t2timer();
    0)    <idle>-0    |   0.146 us    |        ax25_stop_t3timer();
    0)    <idle>-0    |   0.089 us    |        ax25_stop_idletimer();
    0)    <idle>-0    |   0.740 us    |        ax25_clear_queues();
    0)    <idle>-0    |   2.703 us    |      }
    0)    <idle>-0    |   0.901 us    |      ax25_free_sock();
    0)    <idle>-0    |   5.219 us    |    }
    0)    <idle>-0    |   7.220 us    |  }

Note the call to netdev_put() in ax25_release(), and note that there is
never a corresponding call to netdev_hold(), which is why we end up with
a refcount problem.

My original patch corrected this by adding the call to netdev_hold()
right next to the ax25_cb_add() in ax25_rcv(), which solves this
problem. If it seems weird to have this login in ax25_rcv, we could move
it to ax25_accept, right around line 1430 [3]; that would look
something like:

    diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
    index 8df2b00526e..e1ce1eeed7d 100644
    --- a/net/ax25/af_ax25.c
    +++ b/net/ax25/af_ax25.c
    @@ -1383,6 +1383,8 @@ static int ax25_accept(struct socket *sock, struct socket *newsock, int flags,
            DEFINE_WAIT(wait);
            struct sock *sk;
            int err = 0;
    +       ax25_cb *ax25;
    +       ax25_dev *ax25_dev;

            if (sock->state != SS_UNCONNECTED)
                    return -EINVAL;
    @@ -1436,6 +1438,10 @@ static int ax25_accept(struct socket *sock, struct socket *newsock, int flags,
            kfree_skb(skb);
            sk_acceptq_removed(sk);
            newsock->state = SS_CONNECTED;
    +       ax25 = sk_to_ax25(newsk);
    +       ax25_dev = ax25->ax25_dev;
    +       netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
    +       ax25_dev_hold(ax25_dev);

    out:
            release_sock(sk);

This has the advantage that now ax25_accept() mirrors the behavior of
ax25_bind() in terms of declaring a reference on the ax25 device, which
makes a certain amount of sense.

This seems to work out just as well as the previous patch; both
eliminiate the refcount imbalance. With the above diff in place, the
function graph looks like [4], with the call to netdev_hold() in
ax25_accept:

    # tracer: function_graph
    #
    # CPU  TASK/PID         DURATION                  FUNCTION CALLS
    # |     |    |           |   |                     |   |   |   |
    ------------------------------------------
    1)    <idle>-0    =>   kworker-29  
    ------------------------------------------

    1)   kworker-29   |               |  ax25_kiss_rcv() {
    1)   kworker-29   |               |    ax25_rcv.isra.0() {
    1)   kworker-29   |   0.152 us    |      ax25_addr_parse();
    1)   kworker-29   |   0.111 us    |      ax25_addr_size();
    1)   kworker-29   |   0.149 us    |      ax25cmp();
    1)   kworker-29   |   0.139 us    |      ax25_digi_invert();
    1)   kworker-29   |               |      ax25_find_cb() {
    1)   kworker-29   |   0.229 us    |        ax25cmp();
    1)   kworker-29   |   0.243 us    |        ax25cmp();
    1)   kworker-29   |   0.088 us    |        ax25cmp();
    1)   kworker-29   |   1.076 us    |      }
    1)   kworker-29   |               |      ax25_find_listener() {
    1)   kworker-29   |   0.092 us    |        ax25cmp();
    1)   kworker-29   |   0.085 us    |        ax25cmp();
    1)   kworker-29   |   0.632 us    |      }
    1)   kworker-29   |               |      ax25_make_new() {
    1)   kworker-29   |               |        ax25_create_cb() {
    1)   kworker-29   |   0.132 us    |          ax25_setup_timers();
    1)   kworker-29   |   0.547 us    |        }
    1)   kworker-29   |   1.965 us    |      }
    1)   kworker-29   |               |      ax25_send_control() {
    1)   kworker-29   |               |        ax25_transmit_buffer() {
    1)   kworker-29   |   0.090 us    |          ax25_addr_size();
    1)   kworker-29   |   0.089 us    |          ax25_addr_build();
    1)   kworker-29   |   0.084 us    |          ax25_fwd_dev();
    1)   kworker-29   |   5.682 us    |        }
    1)   kworker-29   |   6.037 us    |      }
    1)   kworker-29   |   0.100 us    |      ax25_cb_add();
    1)   kworker-29   |   0.449 us    |      ax25_start_heartbeat();
    1)   kworker-29   |   0.200 us    |      ax25_start_t3timer();
    1)   kworker-29   |   0.104 us    |      ax25_start_idletimer();
    1)   kworker-29   | + 16.757 us   |    }
    1)   kworker-29   | + 18.240 us   |  }
    ------------------------------------------
    0)   ax25ipd-63   =>    ax25d-77   
    ------------------------------------------

    0)    ax25d-77    |               |  ax25_accept() {
    0)    ax25d-77    |               |  /* netdev_hold: dev=ax0 */
    0)    ax25d-77    |   2.067 us    |  }
    0)    ax25d-77    |   0.140 us    |  ax25_getname();
    0)    ax25d-77    |   0.189 us    |  ax25_getname();
    ------------------------------------------
    1)   kworker-29   =>   axwrapp-82  
    ------------------------------------------

    1)   axwrapp-82   |               |  ax25_sendmsg() {
    1)   axwrapp-82   |               |    ax25_output() {
    1)   axwrapp-82   |               |      ax25_kick.part.0() {
    1)   axwrapp-82   |               |        ax25_send_iframe() {
    1)   axwrapp-82   |   0.343 us    |          ax25_start_idletimer();
    1)   axwrapp-82   |               |          ax25_transmit_buffer() {
    1)   axwrapp-82   |   0.119 us    |            ax25_addr_size();
    1)   axwrapp-82   |   0.118 us    |            ax25_addr_build();
    1)   axwrapp-82   |   0.156 us    |            ax25_fwd_dev();
    1)   axwrapp-82   |   9.965 us    |          }
    1)   axwrapp-82   | + 10.844 us   |        }
    1)   axwrapp-82   |   0.107 us    |        ax25_t1timer_running();
    1)   axwrapp-82   |   0.345 us    |        ax25_stop_t3timer();
    1)   axwrapp-82   |   0.112 us    |        ax25_calculate_t1();
    1)   axwrapp-82   |   0.499 us    |        ax25_start_t1timer();
    1)   axwrapp-82   | + 21.187 us   |      }
    1)   axwrapp-82   | + 21.620 us   |    }
    1)   axwrapp-82   | + 25.665 us   |  }
    ------------------------------------------
    1)   ax25ipd-63   =>   axwrapp-82  
    ------------------------------------------

    1)   axwrapp-82   |               |  ax25_sendmsg() {
    1)   axwrapp-82   |               |    ax25_output() {
    1)   axwrapp-82   |               |      ax25_kick.part.0() {
    1)   axwrapp-82   |               |        ax25_send_iframe() {
    1)   axwrapp-82   |   1.027 us    |          ax25_start_idletimer();
    1)   axwrapp-82   |               |          ax25_transmit_buffer() {
    1)   axwrapp-82   |   0.505 us    |            ax25_addr_size();
    1)   axwrapp-82   |   0.522 us    |            ax25_addr_build();
    1)   axwrapp-82   |   0.550 us    |            ax25_fwd_dev();
    1)   axwrapp-82   | + 32.110 us   |          }
    1)   axwrapp-82   | + 35.118 us   |        }
    1)   axwrapp-82   |   0.526 us    |        ax25_t1timer_running();
    1)   axwrapp-82   | + 38.770 us   |      }
    1)   axwrapp-82   | + 40.359 us   |    }
    1)   axwrapp-82   | + 50.019 us   |  }
    ------------------------------------------
    0)    ax25d-77    =>   kworker-10  
    ------------------------------------------

    0)   kworker-10   |               |  ax25_kiss_rcv() {
    0)   kworker-10   |               |    ax25_rcv.isra.0() {
    0)   kworker-10   |   0.632 us    |      ax25_addr_parse();
    0)   kworker-10   |   0.467 us    |      ax25_addr_size();
    0)   kworker-10   |   0.600 us    |      ax25cmp();
    0)   kworker-10   |   0.506 us    |      ax25_digi_invert();
    0)   kworker-10   |               |      ax25_find_cb() {
    0)   kworker-10   |   0.572 us    |        ax25cmp();
    0)   kworker-10   |   0.484 us    |        ax25cmp();
    0)   kworker-10   |   2.737 us    |      }
    0)   kworker-10   |               |      ax25_std_frame_in() {
    0)   kworker-10   |   0.569 us    |        ax25_decode();
    0)   kworker-10   |   0.607 us    |        ax25_validate_nr();
    0)   kworker-10   |               |        ax25_check_iframes_acked() {
    0)   kworker-10   |   4.171 us    |          ax25_frames_acked();
    0)   kworker-10   |               |          ax25_calculate_rtt() {
    0)   kworker-10   |   0.442 us    |            ax25_t1timer_running();
    0)   kworker-10   |   0.500 us    |            ax25_display_timer();
    0)   kworker-10   |   2.463 us    |          }
    0)   kworker-10   |   0.889 us    |          ax25_stop_t1timer();
    0)   kworker-10   |   1.559 us    |          ax25_start_t3timer();
    0)   kworker-10   | + 11.534 us   |        }
    0)   kworker-10   |               |        ax25_kick() {
    0)   kworker-10   |   0.480 us    |          ax25_kick.part.0();
    0)   kworker-10   |   1.467 us    |        }
    0)   kworker-10   | + 16.917 us   |      }
    0)   kworker-10   | + 27.062 us   |    }
    0)   kworker-10   | + 30.583 us   |  }
    1)   axwrapp-82   |               |  ax25_release() {
    1)   axwrapp-82   |   0.932 us    |    ax25_clear_queues();
    1)   axwrapp-82   |               |    ax25_send_control() {
    1)   axwrapp-82   |               |      ax25_transmit_buffer() {
    1)   axwrapp-82   |   0.516 us    |        ax25_addr_size();
    1)   axwrapp-82   |   0.484 us    |        ax25_addr_build();
    1)   axwrapp-82   |   0.451 us    |        ax25_fwd_dev();
    1)   axwrapp-82   | + 91.128 us   |      }
    1)   axwrapp-82   | + 94.596 us   |    }
    1)   axwrapp-82   |   1.554 us    |    ax25_stop_t2timer();
    1)   axwrapp-82   |   1.151 us    |    ax25_stop_t3timer();
    1)   axwrapp-82   |   0.758 us    |    ax25_stop_idletimer();
    1)   axwrapp-82   |   0.676 us    |    ax25_calculate_t1();
    1)   axwrapp-82   |   1.642 us    |    ax25_start_t1timer();
    1)   axwrapp-82   |               |  /* netdev_put: dev=ax0 */
    1)   axwrapp-82   | ! 123.696 us  |  }
    ------------------------------------------
    1)   axwrapp-82   =>   kworker-10  
    ------------------------------------------

    1)   kworker-10   |               |  ax25_kiss_rcv() {
    1)   kworker-10   |               |    ax25_rcv.isra.0() {
    1)   kworker-10   |   0.568 us    |      ax25_addr_parse();
    1)   kworker-10   |   0.428 us    |      ax25_addr_size();
    1)   kworker-10   |   0.504 us    |      ax25cmp();
    1)   kworker-10   |   0.453 us    |      ax25_digi_invert();
    1)   kworker-10   |               |      ax25_find_cb() {
    1)   kworker-10   |   0.425 us    |        ax25cmp();
    1)   kworker-10   |   0.429 us    |        ax25cmp();
    1)   kworker-10   |   2.511 us    |      }
    1)   kworker-10   |               |      ax25_std_frame_in() {
    1)   kworker-10   |   0.518 us    |        ax25_decode();
    1)   kworker-10   |               |        ax25_disconnect() {
    1)   kworker-10   |   0.840 us    |          ax25_stop_t1timer();
    1)   kworker-10   |   0.459 us    |          ax25_stop_t2timer();
    1)   kworker-10   |   0.444 us    |          ax25_stop_t3timer();
    1)   kworker-10   |   0.413 us    |          ax25_stop_idletimer();
    1)   kworker-10   |   1.123 us    |          ax25_link_failed();
    1)   kworker-10   |   6.202 us    |        }
    1)   kworker-10   |   0.428 us    |        ax25_kick();
    1)   kworker-10   |   9.214 us    |      }
    1)   kworker-10   | + 18.606 us   |    }
    1)   kworker-10   | + 21.675 us   |  }
    ------------------------------------------
    0)   kworker-10   =>    <idle>-0   
    ------------------------------------------

    0)    <idle>-0    |               |  ax25_heartbeat_expiry() {
    0)    <idle>-0    |               |    ax25_std_heartbeat_expiry() {
    0)    <idle>-0    |               |      ax25_destroy_socket() {
    0)    <idle>-0    |   0.202 us    |        ax25_cb_del();
    0)    <idle>-0    |   0.116 us    |        ax25_stop_heartbeat();
    0)    <idle>-0    |   0.100 us    |        ax25_stop_t1timer();
    0)    <idle>-0    |   0.101 us    |        ax25_stop_t2timer();
    0)    <idle>-0    |   0.158 us    |        ax25_stop_t3timer();
    0)    <idle>-0    |   0.101 us    |        ax25_stop_idletimer();
    0)    <idle>-0    |   0.321 us    |        ax25_clear_queues();
    0)    <idle>-0    |   2.483 us    |      }
    0)    <idle>-0    |   0.531 us    |      ax25_free_sock();
    0)    <idle>-0    |   4.912 us    |    }
    0)    <idle>-0    |   6.545 us    |  }

[1]: https://gist.github.com/larsks/b658c0bd766648b16c31c8ed0fc1dc1f#file-0001-trace-netdev_hold-and-netdev_put-patch
[2]: https://gist.github.com/larsks/b658c0bd766648b16c31c8ed0fc1dc1f#file-trace1-inbound-txt
[3]: https://github.com/torvalds/linux/blob/7367539ad4b0f8f9b396baf02110962333719a48/net/ax25/af_ax25.c#L1430
[4]: https://gist.github.com/larsks/b658c0bd766648b16c31c8ed0fc1dc1f#file-trace2-inbound-txt

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

