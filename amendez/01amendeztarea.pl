#!perl
use warnings;
use strict;
=pod

=head1 Descripcion
     
El script obtiene un parametro del usuario mediante una entrada estandar y se alojara en un contexto escalar. 
Para posteriormente realizar una validacion en donse si el resultado del modulo del escalar es 0 entonces nos imprime la leyenda es par.
De lo contrario saltara al ELSE donde imprimira que es NON.

ejemplo:
my $a=1;
1/2 =0.5
Entonces imprime:
ES NON
     
=cut
my $a=();

$a=<STDIN>;

	if ($a%2==0){
		print 'ES PAR',"\n";
	}
	else{
		print 'ES NON',"\n";		
	}
print  'Un Pragma establece como se comportará el compilador frente a una circunstancia, la ejecución del Pragma estará definida dentro del bloque o paquete, pero no afectará la ejecución lineal, en otras palabras, nos permitirá establecer condiciones especiales en nuestro código en cuanto a nuestras necesidades, dentro de una sección de nuestro programa.',"\n";		


