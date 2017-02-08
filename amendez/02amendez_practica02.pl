#!/usr/bin/perl
use warnings;
use strict;
my $var1;
my $var2;
my $operacion;
my @arre=();
my $res;
my %HoF = (                           
    salir   =>  sub {print @arre; exit; },
    mod	    =>  sub {return $_[0]%$_[1]; },				
    suma    =>  \&suma,
    resta   =>  \&resta,
    multi   =>  \&multi,
    divi    =>  \&divi, 
    help    =>  \&help,
 
);


while(1){
print "Introduce el primer valor\n";
chomp ($var1 = <STDIN>);
print "Introduce el segunod valor\n";
chomp ($var2 = <STDIN>);
print "\nMenu:\n";
print "\n[1] Suma ";
print "\n[2] Resta ";
print "\n[3] Division ";
print "\n[4] Multiplicacion";
print "\n[5] Modulo";
print "\n[6] Salir";
print "\nIntroduce el nombre de la operacion\n";
chomp ($operacion = <STDIN>);
   if($HoF{lc $operacion}){
    $HoF{lc $operacion}->($var1,$var2);
    push(@arre,$res);
   }
   else {
    warn "Unknown command: `$operacion'; Try `help' next time\n";
   }
}
sub suma{
   $res=$_[0]+$_[1];
   print "Resultado es: ",$res,"\n";
}
sub resta{
 
   $res=$_[0]-$_[1];
   print "Resultado es: ", $res,"\n";
}
sub multi{
  
   $res=$_[0]*$_[1];
   print "Resultado es: ", $res,"\n";
}
sub divi{

   $res=$_[0]/$_[1];
   print "Resultado es: ", $res,"\n";
}

sub help{

   print "Esto te ayuda";
}

