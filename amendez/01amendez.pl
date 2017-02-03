#!perl
use warnings;
use strict;
my @a=(1..10);

my @par=();


for (@a){

	if ($_%2==0){
	push (@par,$_);	
		print "$_\n"
	}
	}
	
print @par,"\n";
