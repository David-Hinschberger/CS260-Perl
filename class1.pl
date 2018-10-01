use strict;
use Data::Dumper;

my ($header, $line, @scores, $id, $name, %data1, %data2, %data3);
a"syntax OK"
my $result = open (CSVFILE, "Book11.csv");
if (!$result){
    print "unable to find data file.\n";
    exit();
}

chomp ($header = <CSVFILE>);
while(chomp ($line = <CSVFILE>)){
    my @scores;
    #print "$line\n";
    ($name, $id, @scores) = split (",", $line);
    #print "$name $id\n";
    #data1 associates the id with the scores
    unshift @scores, $name;
    $data1{$id} = \@scores;
    #data2 associates the id with the name and the scores
}

#print "Final score for student with id of 2 ", $data1{2}->[3];
print Dumper (\%data1), "\n";

close CSVFILE;
