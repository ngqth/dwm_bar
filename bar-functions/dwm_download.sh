#!/bin/sh
download () {
    printf "%s" "$SEP1"
    down1=$(ifstat -p -j | grep "rx_bytes" | sed '4,4!d' | awk '{print substr($2, 1, length($2) - 1)}')
    up1=$(ifstat -p -j | grep "tx_bytes" | sed '4,4!d' | awk '{print substr($2, 1, length($2) - 1)}')
    sleep 1s
    down2=$(ifstat -p -j | grep "rx_bytes" | sed '4,4!d' | awk '{print substr($2, 1, length($2) - 1)}')
    up2=$(ifstat -p -j | grep "tx_bytes" | sed '4,4!d' | awk '{print substr($2, 1, length($2) - 1)}')
    up=$(( $up2 - $up1 ))
    down=$(( $down2 - $down1 ))
    printf ": %4sB/s " "$(numfmt --to=iec "$down")"
    printf ": %4sB/s" "$(numfmt --to=iec "$up")"
    printf "%s\n" "$SEP2"
}

download
