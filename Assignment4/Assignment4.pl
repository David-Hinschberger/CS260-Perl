#!/usr/bin/perl
# David Hinschberger 1126026
# CS260 Perl Fall 2018
# Assignment 4: Regex Phone Contact Lookup
use strict;
sub inputchomp() {
    chomp ($_ = <STDIN>) == 1 ? return $_ : print 'chomp removed more than 1 \n somehow';
}
my (@data, $foo, @legend, @search, $searchstr);
my $fileName = ($ARGV[0] && print "Input file: $ARGV[0]\n") ? $ARGV[0] : (print "Input file: ") ? inputchomp : 0;
print "Could not read file: $fileName" and exit unless (defined open(INPUT, $fileName)); #fileName no longer used for filename after this point.
push @data, $_ while(chomp($_ = <INPUT>) >= 0 && $_);
while(($searchstr = (print "Search: ") ? '' : '') or (@legend = qw([0] [1] [2ABC] [3DEF] [4GHI] [5JKL] [6MNO] [7PQRS] [8TUV] [9WXYZ]))) {
    $searchstr .= (($foo = $_) && (@_ = grep(/$foo/i, @legend))[0] . '+.*') and (($fileName = -1) == -1) foreach (((@search = split (undef , inputchomp )) and (grep(/[^A-Z0-9]/i, @search)))? last : ((scalar @search == 0))? last : @search);
    (grep (/$searchstr/i, (split /:/,$data[$fileName]))) && (printf "%-20s%14s\n", (split (/:/,$data[$fileName]))[0], length($foo = join('', split /[^\d]/, ((split (/:/,$data[$fileName])))[1])) == 11? (substr($foo, 1, 0) = '-' && substr($foo, 4, 0) = '-' && substr($foo, 7, 0) = '-') ? $foo : 'err1' : (length($foo = join('', '1-', split /[^\d]/, ((split (/:/,$data[$fileName]))[1]))) == 12)? (substr($foo, 5, 0) = '-' && substr($foo, 8,0) = '-' ) ? $foo : 'err2' : (length($foo = join('', '1-701-', split /[^\d]/, (split (/:/,$data[$fileName]))[1])) == 13)? (substr($foo, 9, 0) = '-' )? $foo : 'err3' : 'INVALID/CORRUPT PHONE NUMBER') while(++$fileName < scalar(@data));
}
scalar @search == 0? print 'Terminated.': print 'Invalid phone key character entered';