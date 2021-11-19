/interface ethernet
set [ find default-name=ether1 ] comment=Linea1
set [ find default-name=ether2 ] comment=Linea2
set [ find default-name=ether3 ] comment=Linea3
set [ find default-name=ether4 ] comment=Linea4
set [ find default-name=ether5 ] comment=Linea5
set [ find default-name=ether10 ] comment=LAN
/ip address
add address=192.168.1.2/24 interface=ether1 network=192.168.1.0
add address=192.168.2.2/24 interface=ether2 network=192.168.2.0
add address=192.168.3.2/24 interface=ether3 network=192.168.3.0
add address=192.168.4.2/24 interface=ether4 network=192.168.4.0
add address=192.168.5.2/24 interface=ether5 network=192.168.5.0
add address=192.168.10.1/24 interface=ether10 network=192.168.10.0

/ip dns
set allow-remote-requests=yes cache-size=5048KiB servers=1.0.0.1,8.8.8.8
/ip firewall filter
add action=accept chain=input connection-state=established
add action=accept chain=input connection-state=related
add action=drop chain=input connection-state=invalid
add action=accept chain=forward connection-state=established
add action=accept chain=forward connection-state=related
add action=drop chain=forward connection-state=invalid

/ip firewall mangle
add action=accept chain=prerouting dst-address=192.168.1.0/24
add action=accept chain=prerouting dst-address=192.168.2.0/24
add action=accept chain=prerouting dst-address=192.168.3.0/24
add action=accept chain=prerouting dst-address=192.168.4.0/24
add action=accept chain=prerouting dst-address=192.168.5.0/24

add action=mark-connection chain=prerouting in-interface=ether1 \
    new-connection-mark=isp1_con passthrough=yes
add action=mark-connection chain=prerouting in-interface=ether2 \
    new-connection-mark=isp2_con passthrough=yes
add action=mark-connection chain=prerouting in-interface=ether3 \
    new-connection-mark=isp3_con passthrough=yes
add action=mark-connection chain=prerouting in-interface=ether4 \
    new-connection-mark=isp4_con passthrough=yes
add action=mark-connection chain=prerouting in-interface=ether5 \
    new-connection-mark=isp5_con passthrough=yes

add action=mark-connection chain=prerouting dst-address-type=!local \
    in-interface=ether10 new-connection-mark=isp1_con passthrough=yes \
    per-connection-classifier=both-addresses:5/0
add action=mark-connection chain=prerouting dst-address-type=!local \
    in-interface=ether10 new-connection-mark=isp2_con passthrough=yes \
    per-connection-classifier=both-addresses:5/1
add action=mark-connection chain=prerouting dst-address-type=!local \
    in-interface=ether10 new-connection-mark=isp3_con passthrough=yes \
    per-connection-classifier=both-addresses:5/2
add action=mark-connection chain=prerouting dst-address-type=!local \
    in-interface=ether10 new-connection-mark=isp4_con passthrough=yes \
    per-connection-classifier=both-addresses:5/3
add action=mark-connection chain=prerouting dst-address-type=!local \
    in-interface=ether10 new-connection-mark=isp5_con passthrough=yes \
    per-connection-classifier=both-addresses:5/4

add action=mark-routing chain=prerouting connection-mark=isp1_con \
    in-interface=ether10 new-routing-mark=to_isp1 passthrough=yes
add action=mark-routing chain=prerouting connection-mark=isp2_con \
    in-interface=ether10 new-routing-mark=to_isp2 passthrough=yes
add action=mark-routing chain=prerouting connection-mark=isp3_con \
    in-interface=ether10 new-routing-mark=to_isp3 passthrough=yes
add action=mark-routing chain=prerouting connection-mark=isp4_con \
    in-interface=ether10 new-routing-mark=to_isp4 passthrough=yes
add action=mark-routing chain=prerouting connection-mark=isp5_con \
    in-interface=ether10 new-routing-mark=to_isp5 passthrough=yes

add action=mark-routing chain=output connection-mark=isp1_con \
    new-routing-mark=to_isp1 passthrough=no
add action=mark-routing chain=output connection-mark=isp2_con \
    new-routing-mark=to_isp2 passthrough=no
add action=mark-routing chain=output connection-mark=isp3_con \
    new-routing-mark=to_isp3 passthrough=no
add action=mark-routing chain=output connection-mark=isp4_con \
    new-routing-mark=to_isp4 passthrough=no
add action=mark-routing chain=output connection-mark=isp5_con \
    new-routing-mark=to_isp5 passthrough=no

/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat out-interface=ether2
add action=masquerade chain=srcnat out-interface=ether3
add action=masquerade chain=srcnat out-interface=ether4
add action=masquerade chain=srcnat out-interface=ether5
/ip route
add check-gateway=ping distance=1 gateway=9.9.9.9 routing-mark=to_isp1
add check-gateway=ping distance=2 gateway=208.67.222.222 routing-mark=to_isp1
add check-gateway=ping distance=3 gateway=199.85.127.20 routing-mark=to_isp1
add check-gateway=ping distance=4 gateway=199.85.126.20  routing-mark=to_isp1
add check-gateway=ping distance=5 gateway=149.112.112.112  routing-mark=to_isp1

add check-gateway=ping distance=1 gateway=149.112.112.112 routing-mark=to_isp2
add check-gateway=ping distance=2 gateway=9.9.9.9 routing-mark=to_isp2
add check-gateway=ping distance=3 gateway=208.67.222.222 routing-mark=to_isp2
add check-gateway=ping distance=4 gateway=199.85.127.20 routing-mark=to_isp2
add check-gateway=ping distance=5 gateway=199.85.126.20 routing-mark=to_isp2


add check-gateway=ping distance=1 gateway=199.85.126.20 routing-mark=to_isp3
add check-gateway=ping distance=2 gateway=149.112.112.112 routing-mark=to_isp3
add check-gateway=ping distance=3 gateway=9.9.9.9 routing-mark=to_isp3
add check-gateway=ping distance=4 gateway=208.67.222.222 routing-mark=to_isp3
add check-gateway=ping distance=5 gateway=199.85.127.20 routing-mark=to_isp3

add check-gateway=ping distance=1 gateway=199.85.127.20 routing-mark=to_isp4
add check-gateway=ping distance=2 gateway=199.85.126.20  routing-mark=to_isp4
add check-gateway=ping distance=3 gateway=149.112.112.112 routing-mark=to_isp4
add check-gateway=ping distance=4 gateway=9.9.9.9 routing-mark=to_isp4
add check-gateway=ping distance=5 gateway=208.67.222.222 routing-mark=to_isp4

add check-gateway=ping distance=1 gateway=208.67.222.222 routing-mark=to_isp5
add check-gateway=ping distance=2 gateway=199.85.127.20  routing-mark=to_isp5
add check-gateway=ping distance=3 gateway=199.85.126.20 routing-mark=to_isp5
add check-gateway=ping distance=4 gateway=149.112.112.112 routing-mark=to_isp5
add check-gateway=ping distance=5 gateway=9.9.9.9 routing-mark=to_isp5


add check-gateway=ping distance=1 dst-address=208.67.222.222/32 gateway=192.168.5.1 \
    scope=10
add check-gateway=ping distance=1 dst-address=199.85.127.20/32 gateway=192.168.4.1 \
    scope=10
add check-gateway=ping distance=1 dst-address=199.85.126.20/32 gateway=192.168.3.1 \
    scope=10
add check-gateway=ping distance=1 dst-address=149.112.112.112/32 gateway=192.168.2.1 \
    scope=10
add check-gateway=ping distance=1 dst-address=9.9.9.9/32 gateway=192.168.1.1 \
    scope=10

/system clock
set time-zone-name=America/Lima
/system ntp client
set enabled=yes primary-ntp=129.6.15.28 secondary-ntp=129.6.15.28
