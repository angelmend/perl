#!/usr/bin/perl
use warnings;
use 5.014;
use strict;

=head1 TAREA 02
=cut

=head1 CONTEO DE PATRONES
=cut
=head1 DESCRIPCION
Lee un archivo y por medio de expresiones regulares busca los siguientes patrones:
	- Nombres de dominio (ej. www.este-es-un.nombrede.dominio.org.mx)
	- Direcciones IP (ej. 1.2.3.4, 255.255.255.255)
	- Direcciones de correo electronico (ej. usuario@nombre.de-dominio.com.mx)
	- URLs (ej. http://www.esta.es-una.url.com.mx/archivo.php?arg1=5&arg2=23
=cut
=head1 EJEMPLO
Ejemplo:  Perl 02amendez.pl datos.txt(Podra ser cualquier archivo)
7	|	www.google.com
6	|	www.yahoo.com.mx
Los dominios encontrados:11
=cut
=head1 Autor
Angel Mendez - <https://github.com/angelmend>
=cut
open my $FLOG,">>",'log.txt'||die "NO SE PUDO CREAR EL LOG";# Apertura de Log
open(STDERR ,">>&=",$FLOG);
my $num_args = $#ARGV ; 
my $arg1 = $ARGV[0];
if($#ARGV != 0){ 
	print ("Error de Argumentos: \n");
	die $FLOG,"perl mi_programa.pl archivo_entrada.txt\n";
	exit;
}else{
	print ("Espere un momento: \n");
}


 
if (not -e $arg1 ) {
	print ("Archivo no existe!!! \n");
}
#Declaracion de variables
my $direccion = 0; 
my $mail = 0;
my $dominio = 0;
my $url = 0;
my $sumatoria = 0;
my $clv = 0;
#Declaracion de Hashes
my %sumaip=();
my %sumamail=();
my %sumaDominio=();
my %sumaUrl=();
#Archivo donde devolvera los datos
my $archivo = "02amendez.txt";

open(FI, "<", $arg1) or die "Error de lectura\n";#Apertura de arvhido de lectura, en caso de no poder marcara error.

while(<FjI>){
	chomp;			
			if(/https?:\/\/[a-zA-Z0-9-]+[a-zA-Z0-9](\.[a-zA-Z]{2,})+/){#Busqueda de URL 
				$url++;
					if(defined $sumaUrl{$&}){
						$sumaUrl{$&} = $sumaUrl{$&} + 1;
					}else{
						$sumaUrl{$&}=1;
					}
			}
			elsif(/([_a-z0-9-])+(\.[_a-z0-9-]+){2,}@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})/){ #Busqueda de e-mails
				$mail++;
				if(defined $sumamail{$&}){
						$sumamail{$&} = $sumamail{$&} + 1;
					}else{
						$sumamail{$&}=1;
					}
			}elsif(/(([A-Za-z]{3,50}\.){2,})([A-Za-z0-9]*)/){ #Busqueda de Dominios
				$dominio++;
				if(defined $sumaDominio{$&}){
						$sumaDominio{$&} = $sumaDominio{$&} + 1;
					}else{
						$sumaDominio{$&}=1;
					}
				
			}elsif(/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})/){ #busqueda de Direcciones IP
				$direccion++;
				if(defined $sumaip{$&}){
						$sumaip{$&} = $sumaip{$&} + 1;
					}else{
						$sumaip{$&}=1;
					}
			}
	}
close(FI);#Cierre de Archivo


open(FO,">", $archivo) or die "Error de Escritura \n";#Apertura de archivo de escritura, en caso de no poder marcara error.


print (FO "----------Correos---------\n");
print (FO "Total   |  Correos\n");
for $clv (sort keys %sumamail){#Ordenacion de los resultados
	
	print(FO "",$sumamail{$clv}, "   |   ", "   $clv\n");
}
print(FO "Los correos encontrados: $mail\n");#Listado e impresion de la busq


print (FO "----------Ip's----------\n");
print (FO "Total   |  Ip's\n");
for $clv (sort keys %sumaip){#Ordenacion de los resultados
	
	print(FO "",$sumaip{$clv}, "  |   ", "   $clv\n");
}
print (FO "Las ip encontradas: $direccion\n");

print (FO "----------Dominios----------\n");
print (FO "Total   |  Dominio\n");
for $clv (sort keys %sumaDominio){#Ordenacion de los resultados
	
	print(FO "",$sumaDominio{$clv}, "   |   ", "   $clv\n");
}
print(FO "Los dominios encontrados: $dominio\n");

print (FO "----------Url's----------\n");
print (FO "Total   |  URL\n");
for $clv (sort keys %sumaUrl){#Ordenacion de los resultados
	
	print(FO "",$sumaUrl{$clv}, "   |  ", "   $clv\n");
}
print(FO "Las URL encontradas: $url\n");
print (FO "==========================================================================================================\n");
print(FO "Resumen Total:\n");
print(FO "Los correos encontrados: $mail\n");#impresion de coincidencias por e-mails
print (FO "Las ip encontradas: $direccion\n");#impresion de coincidencias por direcciones
print(FO "Los dominios encontrados: $dominio\n");#impresion de coincidencias por dominios
print(FO "Las URL encontradas: $url\n");#impresion de coincidencias por URL
$sumatoria=$url+$dominio+$mail+$direccion;
print (FO "==========================================================================================================\n");
print(FO "Total patrones coincidentes: $sumatoria\n");#Sumatoria total de coincidencias
close(FO);#cierre de archivo
close($FLOG);#cierre de Log
