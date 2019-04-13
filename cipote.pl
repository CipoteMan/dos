#!/usr/bin/perl
use Socket;

#Creado 100% completamente por CipoteMan
use utf8;
my $tiempo = 0;
my $protocolo = getprotobyname('tcp');
my $ip;
my $puerto;

print "Inserte la ip: ";
$ip = <STDIN>;
print "Inserte el puerto: ";
$puerto = <STDIN>;
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
print "Conectado a $ip con el puerto $puerto";

for (;;){
	send(envio, pack("a1000","envio"), 0);
}
exit(0);

#bind(envio, pack_sockaddr_in($puerto, inet_aton($ip))) or die "No se puede conectarse a: $ip";
