#!/usr/bin/perl
# David Hinschberger 1126026
# CS260 Perl Fall 2018
# Assignment 4: Regex Phone Contact Lookup
use strict;
sub inputchomp() {
    chomp ($_ = <STDIN>) == 1 ? return $_ : print 'chomp removed more than 1 \n somehow';
}
print "Input file: $ARGV[0]"; 
my $fileName = $ARGV[0]? $ARGV[0] : inputchomp;
print "Could not read file: $fileName" and exit unless ($ARGV[0]? (print "\n") && (defined open(INPUT, $fileName)) : defined open(INPUT, $fileName));
my (@data, $foo, $i, @legend, @search);
push @data, $_ while(chomp($_ = <INPUT>) >= 0 && $_);
while(@legend = qw([0] [1] [2ABC] [3DEF] [4GHI] [5JKL] [6MNO] [7PQRS] [8TUV] [9WXYZ])) {
    my $searchstr = (print "Search: ")? '' : '';
    (@search = split undef , inputchomp )? grep(/[^A-Z0-9]/i, @search) ? last : ($i = (scalar @search == 0))? last : 0 : ($i = (scalar @search == 0))? last : 0;
    $searchstr .= (($foo = $search[$i++]) && (@_ = grep(/$foo/i, @legend))[0] . '+.*') foreach (@search);
    for my $curr (@data) {
        my @tmp = split /:/, $foo = $curr;
        printf "%-20s%14s\n", $tmp[0], length ($foo = join('', split /[^\d]/, $tmp[1])) == 11? (substr($foo, 1, 0) = '-' && substr($foo, 4, 0) = '-' && substr($foo, 7, 0) = '-') ? $foo : 'something went wrong' : length ($foo = join('', '1-', split /[^\d]/, $tmp[1])) == 12? (substr($foo, 5, 0) = '-' && substr($foo, 8,0) = '-' ) ? $foo : 'something went wrong #2' : length ($foo = join('', '1-701-', split /[^\d]/, $tmp[1])) == 13? (substr($foo, 9, 0) = '-' )? $foo : 'something went wrong #3' : 'INVALID/CORRUPT PHONE NUMBER' if (grep (/$searchstr/i, @tmp));
    }
}
scalar @search == 0? print 'Terminated.': print 'Invalid phone key character entered';