#use strict;

my ($perlFile);

$perlFile = $ARGV[0];

print "filename - $perlFile\n";
#my $foo = `perl -c $perlFile 2>&1 1>nul`;
open (PERLOUTPUT, "-|", "perl -c $perlFile 2>&1");
my $foo = <PERLOUTPUT>;
chomp $foo; 

print ">>$foo<<";

close PERLOUTPUT;