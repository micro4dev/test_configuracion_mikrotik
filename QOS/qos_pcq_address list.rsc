# jan/02/1970 22:58:46 by RouterOS 6.47.9
# software id = 5KBU-DJKJ
#
# model = RB750Gr3
# serial number = D5030E6D5C6C
/interface bridge
add name=bridge1
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether4
add bridge=bridge1 interface=ether5
/ip address
add address=192.168.10.8/24 interface=ether1 network=192.168.10.0
/ip dns
set allow-remote-requests=yes cache-size=8000KiB servers=1.0.0.1,8.8.8.8
/ip firewall address-list
add address=3.7.35.0/25 list=Zoom
add address=3.21.137.128/25 list=Zoom
add address=3.22.11.0/24 list=Zoom
add address=3.23.93.0/24 list=Zoom
add address=3.25.41.128/25 list=Zoom
add address=3.25.42.0/25 list=Zoom
add address=3.25.49.0/24 list=Zoom
add address=3.80.20.128/25 list=Zoom
add address=3.96.19.0/24 list=Zoom
add address=3.101.32.128/25 list=Zoom
add address=3.101.52.0/25 list=Zoom
add address=3.104.34.128/25 list=Zoom
add address=3.120.121.0/25 list=Zoom
add address=3.127.194.128/25 list=Zoom
add address=3.208.72.0/25 list=Zoom
add address=3.211.241.0/25 list=Zoom
add address=3.235.69.0/25 list=Zoom
add address=3.235.82.0/23 list=Zoom
add address=3.235.71.128/25 list=Zoom
add address=3.235.72.128/25 list=Zoom
add address=3.235.73.0/25 list=Zoom
add address=3.235.96.0/23 list=Zoom
add address=4.34.125.128/25 list=Zoom
add address=4.35.64.128/25 list=Zoom
add address=8.5.128.0/23 list=Zoom
add address=13.52.6.128/25 list=Zoom
add address=13.52.146.0/25 list=Zoom
add address=13.114.106.166 list=Zoom
add address=18.157.88.0/24 list=Zoom
add address=18.205.93.128/25 list=Zoom
add address=50.239.202.0/23 list=Zoom
add address=50.239.204.0/24 list=Zoom
add address=52.61.100.128/25 list=Zoom
add address=52.81.151.128/25 list=Zoom
add address=52.81.215.0/24 list=Zoom
add address=52.197.97.21 list=Zoom
add address=52.202.62.192/26 list=Zoom
add address=52.215.168.0/25 list=Zoom
add address=64.69.74.0/24 list=Zoom
add address=64.125.62.0/24 list=Zoom
add address=64.211.144.0/24 list=Zoom
add address=65.39.152.0/24 list=Zoom
add address=69.174.57.0/24 list=Zoom
add address=69.174.108.0/22 list=Zoom
add address=99.79.20.0/25 list=Zoom
add address=103.122.166.0/23 list=Zoom
add address=109.94.160.0/22 list=Zoom
add address=109.244.18.0/25 list=Zoom
add address=109.244.19.0/24 list=Zoom
add address=111.33.181.0/25 list=Zoom
add address=115.110.154.192/26 list=Zoom
add address=115.114.56.192/26 list=Zoom
add address=115.114.115.0/26 list=Zoom
add address=115.114.131.0/26 list=Zoom
add address=120.29.148.0/24 list=Zoom
add address=140.238.128.0/24 list=Zoom
add address=147.124.96.0/19 list=Zoom
add address=149.137.0.0/17 list=Zoom
add address=152.67.20.0/24 list=Zoom
add address=152.67.118.0/24 list=Zoom
add address=152.67.180.0/24 list=Zoom
add address=158.101.64.0/24 list=Zoom
add address=160.1.56.128/25 list=Zoom
add address=161.189.199.0/25 list=Zoom
add address=161.199.136.0/22 list=Zoom
add address=162.12.232.0/22 list=Zoom
add address=162.255.36.0/22 list=Zoom
add address=165.254.88.0/23 list=Zoom
add address=168.138.16.0/24 list=Zoom
add address=168.138.48.0/24 list=Zoom
add address=168.138.72.0/24 list=Zoom
add address=168.138.244.0/24 list=Zoom
add address=173.231.80.0/20 list=Zoom
add address=192.204.12.0/22 list=Zoom
add address=193.122.32.0/22 list=Zoom
add address=193.123.0.0/19 list=Zoom
add address=193.123.40.0/22 list=Zoom
add address=193.123.128.0/19 list=Zoom
add address=198.251.128.0/17 list=Zoom
add address=202.177.207.128/27 list=Zoom
add address=202.177.213.96/27 list=Zoom
add address=204.80.104.0/21 list=Zoom
add address=204.141.28.0/22 list=Zoom
add address=207.226.132.0/24 list=Zoom
add address=209.9.211.0/24 list=Zoom
add address=209.9.215.0/24 list=Zoom
add address=210.57.55.0/24 list=Zoom
add address=213.19.144.0/24 list=Zoom
add address=213.19.153.0/24 list=Zoom
add address=213.244.140.0/24 list=Zoom
add address=221.122.88.64/27 list=Zoom
add address=221.122.88.128/25 list=Zoom
add address=221.122.89.128/25 list=Zoom
add address=221.123.139.192/27 list=Zoom
add address=8.5.128.0/24 list=Zoom
/ip firewall mangle
add action=mark-connection chain=forward comment="Mark ICMP" \
    new-connection-mark=icmp_conn passthrough=yes protocol=icmp
add action=mark-packet chain=prerouting connection-mark=icmp_conn \
    new-packet-mark=icmp_pkt passthrough=no
add action=mark-connection chain=prerouting comment="Mark DNS" dst-port=53 \
    new-connection-mark=dns_conn passthrough=yes protocol=udp
add action=mark-packet chain=prerouting connection-mark=dns_conn \
    new-packet-mark=dns_pkt passthrough=no
add action=add-dst-to-address-list address-list=Zoom address-list-timeout=4d \
    chain=prerouting comment="add zoom IPs to the address list Zoom" \
    dst-port=3478,3479,5090,5091,8801-8810 protocol=tcp
add action=add-dst-to-address-list address-list=Zoom address-list-timeout=4d \
    chain=prerouting dst-port=3478,3479,5090,5091,8801-8810 protocol=udp
add action=mark-connection chain=prerouting dst-address-list=Zoom dst-port=\
    3478,3479,5090,5091,8801-8810 new-connection-mark=zoom_conn passthrough=\
    yes protocol=tcp
add action=mark-connection chain=prerouting dst-address-list=Zoom dst-port=\
    3478,3479,5090,5091,8801-8810 new-connection-mark=zoom_conn passthrough=\
    yes protocol=udp
add action=mark-connection chain=prerouting dst-address-list=Zoom dst-port=\
    80,443 new-connection-mark=zoom_conn passthrough=yes protocol=tcp
add action=mark-packet chain=prerouting connection-mark=zoom_conn \
    new-packet-mark=zoom_pkt passthrough=no
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=redirect chain=dstnat dst-port=53 protocol=udp to-ports=53
/ip route
add distance=1 gateway=192.168.10.1
/system clock
set time-zone-name=America/Lima
/system ntp client
set enabled=yes primary-ntp=216.239.35.0 secondary-ntp=216.239.35.4
/tool graphing interface
add
/tool graphing queue
add
/tool graphing resource
add
