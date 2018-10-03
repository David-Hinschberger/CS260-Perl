#!/usr/bin/perl
# David Hinschberger 1126026
# CS260 Perl Fall 2018
# Assignment 3: Perl Module 
package ListUtil;
use strict;
use Exporter;
our $version = 0.02;
our @ISA = qw/Exporter/;
our @EXPORT = qw (&name &addItem &removeItem &isInList &saveToFile &loadFromFile &count &list $version);
my @list;
my $listName = '';
sub name{ defined @_[0]? ($listName = @_[0]) == @_[0]? return: print "something went wrong.": return $listName; }
sub addItem{ (defined @_[0] and not isInList(@_[0])) ? return ((push @list, @_[0]) + 1 - scalar @list) : return 0; }
sub removeItem{
    my $index = 0;
    $index++ until $list[$index] eq @_[0] or $index == scalar @list;
    return defined((splice(@list, $index, 1)));
}
sub isInList{ return grep{@_[0] eq $_} @list; }
sub saveToFile{
    defined @_[0] ? (open (SAVEFILE, '>', @_[0])) ? print SAVEFILE "$listName\n" : die "could not save to @_[0]!" : return 0;
    foreach my $i (0..@list-2){ print SAVEFILE "$list[$i]\n"; }
    return (print SAVEFILE @list[-1]) ? close SAVEFILE : close SAVEFILE;
}
sub loadFromFile{
    defined @_[0] ? ((open (LOADFILE, @_[0])) ? undef @list : die "could not load from @_[0]!") : return 0;    
    my $line = $listName = <LOADFILE>;
    while(chomp ($line = <LOADFILE>) >= 0 && $line){ push @list, $line; }
    return close LOADFILE;
}
sub count{ return scalar @list; }
sub list{ return scalar @_ > 1 ? @_[0] eq '-type' ? @_[1] eq 'array' ? @list : @_[1] eq 'ref' ? \@list : 0 : 0 : \@list; }
return 1