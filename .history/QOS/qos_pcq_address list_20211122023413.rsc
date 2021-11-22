# nov/22/2021 02:33:27 by RouterOS 6.47.9
# software id = 5KBU-DJKJ
#
# model = RB750Gr3
# serial number = D5030E6D5C6C
/interface bridge
add name=bridge1
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/queue type
add kind=pcq name="Traffic Down" pcq-classifier=dst-address
add kind=pcq name="Traffic Up" pcq-classifier=src-address
/queue tree
add max-limit=250M name=T-Down parent=bridge1 queue="Traffic Down"
add max-limit=25M name=T-Up parent=ether1 queue="Traffic Up"
add name=icmp_down packet-mark=icmp_pkt parent=T-Down priority=2 queue=\
    "Traffic Down"
add name=dns_down packet-mark=dns_pkt parent=T-Down priority=3 queue=\
    "Traffic Down"
add name=zoom_down packet-mark=zoom_pkt parent=T-Down priority=4 queue=\
    "Traffic Down"
add name=google_service_down packet-mark=meet_pkt parent=T-Down priority=4 \
    queue="Traffic Down"
add name=facebook_down packet-mark=facebook_pkt parent=T-Down priority=5 \
    queue="Traffic Down"
add name=instagram_down packet-mark=instagram_pkt parent=T-Down priority=5 \
    queue="Traffic Down"
add name=whatsapp_down packet-mark=whatsapp_pkt parent=T-Down priority=5 \
    queue="Traffic Down"
add name=http_down packet-mark=https_pkt parent=T-Down priority=7 queue=\
    "Traffic Down"
add name=rest_down packet-mark=rest_pkt parent=T-Down queue="Traffic Down"
add name=dns_up packet-mark=dns_pkt parent=T-Up priority=3 queue="Traffic Up"
add name=facebook_up packet-mark=facebook_pkt parent=T-Up priority=5 queue=\
    "Traffic Up"
add name=google_service_up packet-mark=meet_pkt parent=T-Up priority=4 queue=\
    "Traffic Up"
add name=http_up packet-mark=https_pkt parent=T-Up priority=7 queue=\
    "Traffic Up"
add name=icmp_up packet-mark=icmp_pkt parent=T-Up priority=2 queue=\
    "Traffic Up"
add name=instagram_up packet-mark=instagram_pkt parent=T-Up priority=5 queue=\
    "Traffic Up"
add name=rest_up packet-mark=rest_pkt parent=T-Up queue="Traffic Up"
add name=whatsapp packet-mark=whatsapp_pkt parent=T-Up priority=5 queue=\
    "Traffic Up"
add name=zoom_up packet-mark=zoom_pkt parent=T-Up priority=4 queue=\
    "Traffic Up"
/interface bridge port
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether4
add bridge=bridge1 interface=ether5
/ip address
add address=192.168.4.2/24 interface=ether1 network=192.168.4.0
add address=10.10.10.1/24 interface=bridge1 network=10.10.10.0
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
add address=18.157.88.0/24 list=Zoom
add address=18.205.93.128/25 list=Zoom
add address=20.203.158.80/28 list=Zoom
add address=20.203.190.192/26 list=Zoom
add address=50.239.202.0/23 list=Zoom
add address=50.239.204.0/24 list=Zoom
add address=52.61.100.128/25 list=Zoom
add address=52.202.62.192/26 list=Zoom
add address=52.215.168.0/25 list=Zoom
add address=64.125.62.0/24 list=Zoom
add address=64.211.144.0/24 list=Zoom
add address=65.39.152.0/24 list=Zoom
add address=69.174.57.0/24 list=Zoom
add address=69.174.108.0/22 list=Zoom
add address=99.79.20.0/25 list=Zoom
add address=101.36.167.0/24 list=Zoom
add address=103.122.166.0/23 list=Zoom
add address=111.33.115.0/25 list=Zoom
add address=111.33.181.0/25 list=Zoom
add address=115.110.154.192/26 list=Zoom
add address=115.114.56.192/26 list=Zoom
add address=115.114.115.0/26 list=Zoom
add address=115.114.131.0/26 list=Zoom
add address=120.29.148.0/24 list=Zoom
add address=129.151.0.0/19 list=Zoom
add address=129.151.40.0/22 list=Zoom
add address=129.151.48.0/20 list=Zoom
add address=129.159.0.0/20 list=Zoom
add address=129.159.160.0/19 list=Zoom
add address=129.159.208.0/20 list=Zoom
add address=130.61.164.0/22 list=Zoom
add address=134.224.0.0/16 list=Zoom
add address=140.238.128.0/24 list=Zoom
add address=140.238.232.0/22 list=Zoom
add address=144.195.0.0/16 list=Zoom
add address=147.124.96.0/19 list=Zoom
add address=149.137.0.0/17 list=Zoom
add address=150.230.224.0/21 list=Zoom
add address=152.67.20.0/24 list=Zoom
add address=152.67.118.0/24 list=Zoom
add address=152.67.168.0/22 list=Zoom
add address=152.67.180.0/24 list=Zoom
add address=152.67.184.0/22 list=Zoom
add address=152.67.240.0/21 list=Zoom
add address=152.70.224.0/21 list=Zoom
add address=156.45.0.0/17 list=Zoom
add address=158.101.64.0/24 list=Zoom
add address=158.101.184.0/22 list=Zoom
add address=160.1.56.128/25 list=Zoom
add address=161.199.136.0/22 list=Zoom
add address=162.12.232.0/22 list=Zoom
add address=162.255.36.0/22 list=Zoom
add address=165.254.88.0/23 list=Zoom
add address=168.138.16.0/22 list=Zoom
add address=168.138.48.0/24 list=Zoom
add address=168.138.56.0/21 list=Zoom
add address=168.138.72.0/24 list=Zoom
add address=168.138.74.0/25 list=Zoom
add address=168.138.80.0/21 list=Zoom
add address=168.138.96.0/22 list=Zoom
add address=168.138.116.0/22 list=Zoom
add address=168.138.244.0/24 list=Zoom
add address=170.114.0.0/16 list=Zoom
add address=173.231.80.0/20 list=Zoom
add address=192.204.12.0/22 list=Zoom
add address=193.122.16.0/20 list=Zoom
add address=193.122.32.0/20 list=Zoom
add address=193.122.208.0/20 list=Zoom
add address=193.122.224.0/20 list=Zoom
add address=193.122.240.0/20 list=Zoom
add address=193.123.0.0/19 list=Zoom
add address=193.123.40.0/21 list=Zoom
add address=193.123.128.0/19 list=Zoom
add address=193.123.168.0/21 list=Zoom
add address=193.123.192.0/19 list=Zoom
add address=198.251.128.0/17 list=Zoom
add address=202.177.207.128/27 list=Zoom
add address=204.80.104.0/21 list=Zoom
add address=204.141.28.0/22 list=Zoom
add address=207.226.132.0/24 list=Zoom
add address=209.9.211.0/24 list=Zoom
add address=209.9.215.0/24 list=Zoom
add address=213.19.144.0/24 list=Zoom
add address=213.19.153.0/24 list=Zoom
add address=213.244.140.0/24 list=Zoom
add address=221.122.88.64/27 list=Zoom
add address=221.122.88.128/25 list=Zoom
add address=221.122.89.128/25 list=Zoom
add address=221.123.139.192/27 list=Zoom
add address=8.5.128.0/24 list=Zoom
add address=173.231.92.0/24 list=Zoom
add address=173.231.94.0/24 list=Zoom
/ip firewall filter
add action=add-dst-to-address-list address-list="Google Meet" \
    address-list-timeout=12h chain=forward comment="Google Meet" content=\
    .google.com
add action=add-dst-to-address-list address-list="Google Meet" \
    address-list-timeout=12h chain=forward content=.googleapis.com
add action=add-dst-to-address-list address-list="Google Meet" \
    address-list-timeout=12h chain=forward content=.gstatic.com
add action=add-dst-to-address-list address-list="Google Meet" \
    address-list-timeout=12h chain=forward content=.youtube-nocookie.com
add action=add-dst-to-address-list address-list="Google Meet" \
    address-list-timeout=12h chain=forward content=.googlevideo.com disabled=\
    yes
add action=add-dst-to-address-list address-list="Google Meet" \
    address-list-timeout=12h chain=forward content=.googleusercontent.com
add action=add-dst-to-address-list address-list="Google Meet" \
    address-list-timeout=12h chain=forward content=.ytimg.com
add action=add-dst-to-address-list address-list=Facebook \
    address-list-timeout=12h chain=forward comment=Facebook content=\
    .facebook.com
add action=add-dst-to-address-list address-list=Facebook \
    address-list-timeout=12h chain=forward content=.fbcdn.net
add action=add-dst-to-address-list address-list=Facebook \
    address-list-timeout=12h chain=forward content=.facebook.net
add action=add-dst-to-address-list address-list=Instagram \
    address-list-timeout=12h chain=forward comment=Instagram content=\
    .instagram.com
add action=add-dst-to-address-list address-list=Instagram \
    address-list-timeout=12h chain=forward content=.cdninstagram.com
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=12h chain=forward comment=Whatsapp content=whats.com
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=12h chain=forward content=whatsapp.net
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=12h chain=forward content=wa.me
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=12h chain=forward content=whatsapp
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=12h chain=forward content=.wa.me
/ip firewall mangle
add action=mark-connection chain=forward comment="Mark ICMP" \
    new-connection-mark=icmp_conn passthrough=yes protocol=icmp
add action=mark-packet chain=prerouting connection-mark=icmp_conn \
    new-packet-mark=icmp_pkt passthrough=no
add action=mark-connection chain=prerouting comment="Mark DNS" dst-port=53 \
    new-connection-mark=dns_conn passthrough=yes protocol=udp
add action=mark-packet chain=prerouting connection-mark=dns_conn \
    new-packet-mark=dns_pkt passthrough=no
add action=add-dst-to-address-list address-list=Zoom address-list-timeout=12h \
    chain=prerouting comment="Mark Zoom PC and Phone" dst-port=5091,8801,8802 \
    protocol=tcp
add action=add-dst-to-address-list address-list=Zoom address-list-timeout=12h \
    chain=prerouting dst-port=3478,3479,5091,8801-8810 protocol=udp
add action=mark-connection chain=prerouting dst-address-list=Zoom dst-port=\
    5091,8801,8802 new-connection-mark=zoom_conn passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-address-list=Zoom dst-port=\
    3478,3479,5091,8801-8810 new-connection-mark=zoom_conn passthrough=yes \
    protocol=udp
add action=mark-connection chain=prerouting dst-address-list=Zoom dst-port=\
    80,443 new-connection-mark=zoom_conn passthrough=yes protocol=tcp
add action=mark-packet chain=prerouting connection-mark=zoom_conn \
    new-packet-mark=zoom_pkt passthrough=no
add action=mark-connection chain=prerouting comment=\
    "Mark Google services(meet,classroom and apis)" dst-address-list=\
    "Google Meet" new-connection-mark=meet_conn passthrough=yes
add action=mark-packet chain=prerouting connection-mark=meet_conn \
    new-packet-mark=meet_pkt passthrough=no
add action=mark-connection chain=prerouting comment="Mark Facebook" \
    dst-address-list=Facebook new-connection-mark=facebook_conn passthrough=\
    yes
add action=mark-packet chain=prerouting connection-mark=facebook_conn \
    new-packet-mark=facebook_pkt passthrough=no
add action=mark-connection chain=prerouting comment="Mark Instagram" \
    dst-address-list=Instagram new-connection-mark=instagram_conn \
    passthrough=yes
add action=mark-packet chain=prerouting connection-mark=instagram_conn \
    new-packet-mark=instagram_pkt passthrough=no
add action=mark-connection chain=prerouting comment="Mark Whatsapp" \
    dst-address-list=Whatsapp new-connection-mark=whatsapp_conn passthrough=\
    yes
add action=mark-packet chain=prerouting connection-mark=whatsapp_conn \
    new-packet-mark=whatsapp_pkt passthrough=no
add action=mark-connection chain=prerouting comment="Mark WWW" \
    new-connection-mark=https_conn passthrough=yes port=443 protocol=udp
add action=mark-connection chain=prerouting new-connection-mark=https_conn \
    passthrough=yes port=80,443 protocol=tcp
add action=mark-packet chain=prerouting connection-mark=https_conn \
    new-packet-mark=https_pkt passthrough=no
add action=mark-connection chain=prerouting comment="Mark Rest" \
    new-connection-mark=rest_conn passthrough=yes
add action=mark-packet chain=prerouting connection-mark=rest_conn \
    new-packet-mark=rest_pkt passthrough=no
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=redirect chain=dstnat dst-port=53 protocol=udp to-ports=53
/ip route
add distance=1 gateway=192.168.4.1
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