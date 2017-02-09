#!/usr/bin/perl

=head1 TAREA 03
=cut

=head1 LECTURA DE PASSWD SOBRE HTML
=cut
=head1 DESCRIPCION
Se creara un Hash de Hash sobre una copia del archivo PASSWD y formatearemos la salida para devolver los datos sobre una plantilla HTML,
que podra ser visualizada sobre un fieldset para darle un formato de tabla ordenada.
=cut
=head1 EJEMPLO
=cut
=head1 Autor
Angel Mendez - <https://github.com/angelmend>
=cut
use strict;
use warnings;
use HTML::Template;


open FILE,">03amendez.html" or die "Error";
print FILE &Form();
close FILE;

sub Form{
		my $output;
		my $template = HTML::Template->new(filename => './plantilla.tmpl');
		my $info=&passwd;
		my @loop_data=();
		while(@{$info->[0]}){ 
				my %row_data;
				$row_data{key}=shift @{$info->[0]};
				$row_data{user}=shift @{$info->[1]};
				$row_data{pass}=shift @{$info->[2]};
				$row_data{uid}=shift @{$info->[3]};
				$row_data{gid}=shift @{$info->[4]};
				$row_data{desc}=shift @{$info->[5]};
				$row_data{home}=shift @{$info->[6]};
				$row_data{shell}=shift @{$info->[7]};
				push(@loop_data,\%row_data);
	
		}
		$template->param(entradas => \@loop_data);
		$output.=$template->output();
		return $output;
}


sub passwd()
{
	my %hash2;
	my $filename="copia";
	open FI,"<", $filename;
	my @file=(<FI>);
	for (@file){
		my %hash;
		if(m{(.*):(.*):(.*):(.*):(.*):(.*):(.*)}){
			$hash{"key"}=$&;
			$hash{"user"}=$1;
			$hash{"pass"}=$2;
			$hash{"uid"}=$3;
			$hash{"gid"}=$4;
			$hash{"desc"}=$5;
			$hash{"home"}=$6;			
			$hash{"shell"}=$7;
		}
		my $temp=$hash{"key"};
		$hash2{$temp}=\%hash;
	}

	my @key = sort keys %hash2;
	my @user;
	my @pass;
	my @uid;
	my @gid;
	my @desc;
	my @home;
	my @shell;

	for my $key(sort keys %hash2)
	{
		my @tmp=$hash2{$key}{user},"\n"||" ";
		push(@user,shift @tmp);
		@tmp=$hash2{$key}{pass},"\n"||" ";
		push(@pass,shift @tmp);
		@tmp=$hash2{$key}{uid},"\n"||" ";
		push(@uid,shift @tmp);
		@tmp=$hash2{$key}{gid},"\n"||" ";
		push(@gid,shift @tmp);
		@tmp=$hash2{$key}{desc},"\n"||" ";
		push(@desc,shift @tmp);
		@tmp=$hash2{$key}{home},"\n"||" ";
		push(@home,shift @tmp);
		@tmp=$hash2{$key}{shell},"\n"||" ";
		push(@shell,shift @tmp);
	}	
	my @info=(\@key,\@user,\@pass,\@uid,\@gid,\@desc,\@home,\@shell);
	return \@info;
}
close FI;
