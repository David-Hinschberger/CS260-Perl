use strict;
use warnings; 

my (%honorPoints, $key, $value);
%honorPoints = ('A', 4, B => 3, C => 2, D => 1, F => 0);

foreach my $val (sort {$honorPoints{$a} <=> $honorPoints{$b} or $a cmp $b} keys %honorPoints){
    printf "%-8s %s\n", $val, $honorPoints{$val};
}