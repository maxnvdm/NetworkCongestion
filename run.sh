#!/bin/bash

time=200
bwnet=2

delay=5

qsize=100
dir=reno-q$qsize
python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize
python plot_queue.py -f $dir/q.txt -o $dir/q.png
python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png

qsize=20
dir=reno-q$qsize
python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize
python plot_queue.py -f $dir/q.txt -o $dir/q.png
python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png

qsize=100
dir=cubic-q$qsize
python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong cubic
python plot_queue.py -f $dir/q.txt -o $dir/q.png
python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png

qsize=20
dir=cubic-q$qsize
python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong cubic
python plot_queue.py -f $dir/q.txt -o $dir/q.png
python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png

qsize=100
dir=bbr-q$qsize
python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong bbr --qman fq
python plot_queue.py -f $dir/q.txt -o $dir/q.png
python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png

qsize=20
dir=bbr-q$qsize
python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong bbr --qman fq
python plot_queue.py -f $dir/q.txt -o $dir/q.png
python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png

qsize=100
dir=mbps-q$qsize
python tcp.py --bw-host 100--bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong bbr --qman fq
python plot_queue.py -f $dir/q.txt -o $dir/q.png
python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png
