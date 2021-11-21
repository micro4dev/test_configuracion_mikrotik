/ip firewall filter
add action=add-dst-to-address-list address-list=youtube address-list-timeout=12h chain=forward comment="Guarda las ip de youtube" content=youtube.com src-address-list=todos
add action=add-dst-to-address-list address-list=youtube address-list-timeout=12h chain=forward content=googlevideo.com src-address-list=todos
add action=add-dst-to-address-list address-list=youtube address-list-timeout=12h chain=forward content=youtu.be src-address-list=todos
add action=add-dst-to-address-list address-list=youtube address-list-timeout=12h chain=forward content=akamaihd.net src-address-list=todos
add action=add-dst-to-address-list address-list=instagram address-list-timeout=12h chain=forward comment="Guarda la ip de instagram" content=instagram.com src-address-list=todos
add action=add-dst-to-address-list address-list=classesroom address-list-timeout=12h chain=forward comment="Marcado classes room" content=classroom src-address-list=todos
add action=add-dst-to-address-list address-list=skype address-list-timeout=12h chain=forward comment="Marcado skype" content=skype src-address-list=todos
add action=add-dst-to-address-list address-list=zoom address-list-timeout=12h chain=forward comment="Marcado zoom" content=zoom.us src-address-list=todos
add action=add-dst-to-address-list address-list=zoom address-list-timeout=12h chain=forward comment="Marcado zoom" content=zoom src-address-list=todos


/ip firewall address-list
add address=172.16.3.0/24 list=todos

##aqui debes cambia ese rango de ip por el tuyo)####


/ip firewall layer7-protocol
add name=facebook regexp="^..+\\.(facebook.com|facebook.net|fbcdn.com|fbsbx.com|\
    fbcdn.net|fb.com|tfbnw.net).*\$"

/ip firewall mangle
add action=mark-connection chain=forward comment="Mark ICMP" new-connection-mark=icmp_conn passthrough=yes protocol=icmp src-address-list=todos
add action=mark-packet chain=prerouting connection-mark=icmp_conn new-packet-mark=icmp_pkt passthrough=no
add action=mark-connection chain=prerouting comment="Mark DNS" dst-port=53 new-connection-mark=dns_conn passthrough=yes protocol=udp
add action=mark-packet chain=prerouting connection-mark=dns_conn new-packet-mark=dns_pkt passthrough=no

add action=mark-connection chain=prerouting comment="Mark zoom" new-connection-mark=zoom_conn passthrough=yes src-address-list=zoom
add action=mark-packet chain=prerouting connection-mark=zoom_conn new-packet-mark=zoom_pkt passthrough=no

add action=mark-connection chain=prerouting comment="Mark classroom " new-connection-mark=classroom.conn passthrough=yes src-address-list=classesroom
add action=mark-packet chain=prerouting connection-mark=classroom.conn new-packet-mark=classroom.pkt passthrough=no
add action=mark-connection chain=prerouting comment="Marcado skype" new-connection-mark=skype.conn passthrough=yes src-address-list=skype
add action=mark-packet chain=prerouting connection-mark=skype.conn new-packet-mark=skype.pkt passthrough=no

add action=mark-connection chain=prerouting comment="Marcado de whatsapp" new-connection-mark=wahtsapp.conn passthrough=yes port=5222,5223,5228,4244,5242,50318,59234 protocol=tcp
add action=mark-connection chain=prerouting new-connection-mark=wahtsapp.conn passthrough=yes port=3478,54395,59234,50318 protocol=udp
add action=mark-packet chain=prerouting connection-mark=wahtsapp.conn new-packet-mark=whatsapp.pkt passthrough=no
add action=mark-connection chain=prerouting comment="Marcado de GAME" new-connection-mark=game.conn passthrough=yes port=10000-11008,7008,9000-9099,7700,1900,17000,65050 protocol=udp
add action=mark-connection chain=prerouting new-connection-mark=game.conn passthrough=yes port=7500,65010,8700,3013,7703,7520,7535,7752,20000-20099,12235,13748,13972,13894,11455 protocol=udp
add action=mark-connection chain=prerouting new-connection-mark=game.conn passthrough=yes port=88,500,3074,3544,4500,3075,4379-4380,27000-27031,27036,7542,7608 protocol=udp
add action=mark-connection chain=prerouting new-connection-mark=game.conn passthrough=yes port=14009-14030,42051-42052,40000-40050,13000-13080 protocol=udp
add action=mark-connection chain=prerouting new-connection-mark=game.conn passthrough=yes port=39190,27780,29000,22100,4300,15001,15002,7341 protocol=tcp
add action=mark-connection chain=prerouting new-connection-mark=game.conn passthrough=yes port=5340-5352,6000-6152,14009-14030,18901-18909 protocol=tcp
add action=mark-connection chain=prerouting new-connection-mark=game.conn passthrough=yes port=40000,9300,9400,9700,7342,8005-8010,37466,36567,8822 protocol=tcp
add action=mark-packet chain=prerouting connection-mark=game.conn new-packet-mark=game.pkt passthrough=no
add action=mark-connection chain=prerouting comment="Marcado de instagram" new-connection-mark=instagram.conn passthrough=yes src-address-list=instagram
add action=mark-packet chain=prerouting connection-mark=instagram.conn new-packet-mark=instagram.pkt passthrough=no
add action=mark-connection chain=prerouting comment="Macrado de Facebook" layer7-protocol=facebook new-connection-mark=facebook.conn passthrough=yes
add action=mark-packet chain=prerouting connection-mark=facebook.conn new-packet-mark=facebook.pkt passthrough=no
add action=mark-connection chain=prerouting comment="Marcado de youtube" new-connection-mark=youtube.conn passthrough=yes src-address-list=youtube
add action=mark-packet chain=prerouting connection-mark=youtube.conn new-packet-mark=youtube.pkt passthrough=no
add action=mark-connection chain=prerouting comment="Marcado de WWW" new-connection-mark=https.conn passthrough=yes port=443 protocol=udp
add action=mark-connection chain=prerouting new-connection-mark=https.conn passthrough=yes port=80,443 protocol=tcp
add action=mark-packet chain=prerouting connection-mark=https.conn new-packet-mark=https.pkt passthrough=no
add action=mark-connection chain=prerouting comment="Marcado resto del trafico" new-connection-mark=resto.conn passthrough=yes
add action=mark-packet chain=prerouting connection-mark=resto.conn new-packet-mark=resto.pkt passthrough=no


/queue type
add kind=pcq name=pcq-down pcq-classifier=dst-address pcq-dst-address6-mask=64 pcq-src-address6-mask=64
add kind=pcq name=pcq-up pcq-classifier=src-address pcq-dst-address6-mask=64 pcq-src-address6-mask=64


recuerda cambiar las interfaces por la tuya wan=aquie es ethe1 y lan=LAN 


/queue tree
add name=DOWNLOAD parent=LAN
add name=UPLOAD parent=ether1
add name="Icmp down" packet-mark=icmp_pkt parent=DOWNLOAD priority=1
add name="dns down" packet-mark=dns_pkt parent=DOWNLOAD priority=1
add name="REDES DOWN" parent=DOWNLOAD
add name="instagram down" packet-mark=instagram.pkt parent="REDES DOWN" priority=2
add name="facebook down" packet-mark=facebook.pkt parent="REDES DOWN" priority=2
add name="STREAMING " parent=DOWNLOAD
add name="youtube down" packet-mark=youtube.pkt parent="STREAMING " priority=4
add name="GAMES down" packet-mark=game.pkt parent=DOWNLOAD priority=3
add name="http/s down" packet-mark=https.pkt parent=DOWNLOAD priority=5
add name="Resto de trafico down" packet-mark=resto.pkt parent=DOWNLOAD
add name="Icmp UP" packet-mark=icmp_pkt parent=UPLOAD priority=1
add name="dns UP" packet-mark=dns_pkt parent=UPLOAD priority=1
add name="REDES UP" parent=UPLOAD
add name="instagram UP" packet-mark=instagram.pkt parent="REDES UP" priority=2
add name="facebook UP" packet-mark=facebook.pkt parent="REDES UP" priority=2
add name="GAMES UP" packet-mark=game.pkt parent=UPLOAD priority=3
add name="http/s UP" packet-mark=https.pkt parent=UPLOAD priority=5
add name="Resto de trafico UP" packet-mark=resto.pkt parent=UPLOAD
add name="CLASESS VIRTUALES" parent=DOWNLOAD priority=1 queue=pcq-down
add name="clasesromm down" packet-mark=classroom.pkt parent="CLASESS VIRTUALES" priority=1 queue=pcq-down
add name="skype down" packet-mark=skype.pkt parent="CLASESS VIRTUALES" priority=1 queue=pcq-down
add name="zoom down" packet-mark=zoom_pkt parent="CLASESS VIRTUALES" priority=1 queue=pcq-down
add name="CLASSES VIRTUALES UP" parent=UPLOAD priority=1 queue=pcq-up
add name="classesroom up" packet-mark=classroom.pkt parent="CLASSES VIRTUALES UP" priority=1 queue=pcq-up
add name="skype up" packet-mark=skype.pkt parent="CLASSES VIRTUALES UP" priority=1 queue=pcq-up
add name="zoom up" packet-mark=zoom_pkt parent="CLASSES VIRTUALES UP" priority=1 queue=pcq-up