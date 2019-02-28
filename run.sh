#!/bin/bash

time=120
bwnet=2

delay=5

qsize=100
dir=dataplots
python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize
python plot_queue.py -f $dir/q.txt -o $dir/qreno1.png
python plot_ping.py -f $dir/ping.txt -o $dir/rttreno1.png

python tcp.py --bw-host 100 --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize
python plot_queue.py -f $dir/q.txt -o $dir/renoq.png
python plot_ping.py -f $dir/ping.txt -o $dir/renortt.png

qsize=20

python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize
python plot_queue.py -f $dir/q.txt -o $dir/qreno2.png
python plot_ping.py -f $dir/ping.txt -o $dir/rttreno2.png

qsize=100

python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong cubic
python plot_queue.py -f $dir/q.txt -o $dir/qcubic1.png
python plot_ping.py -f $dir/ping.txt -o $dir/rttcubic1.png

python tcp.py --bw-host 100 --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong cubic
python plot_queue.py -f $dir/q.txt -o $dir/cubicq.png
python plot_ping.py -f $dir/ping.txt -o $dir/cubicrtt.png

qsize=20

python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong cubic
python plot_queue.py -f $dir/q.txt -o $dir/qcubic2.png
python plot_ping.py -f $dir/ping.txt -o $dir/rttcubic2.png

qsize=100

python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong bbr --qman fq
python plot_queue.py -f $dir/q.txt -o $dir/qbbr1.png
python plot_ping.py -f $dir/ping.txt -o $dir/rttbbr1.png

python tcp.py --bw-host 100 --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong bbr --qman fq
python plot_queue.py -f $dir/q.txt -o $dir/bbrq.png
python plot_ping.py -f $dir/ping.txt -o $dir/bbrrtt.png

qsize=20

python tcp.py --bw-net $bwnet --delay $delay --dir $dir --time $time --maxq $qsize --cong bbr --qman fq
python plot_queue.py -f $dir/q.txt -o $dir/qbbr2.png
python plot_ping.py -f $dir/ping.txt -o $dir/rttbbr2.png

