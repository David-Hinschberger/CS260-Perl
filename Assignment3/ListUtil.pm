#!/usr/bin/perl
# David Hinschberger 1126026
# CS260 Perl Fall 2018
# Assignment 3: Perl Module 
package ListUtil;
use strict;
use Exporter;
our $version = 0.01;
our @ISA = qw/Exporter/;
our @EXPORT = qw (&name &addItem &removeItem &isInList &saveToFile &loadFromFile &count &list $version);

my @list;
my $listName = 'aa';

sub name{
    my $arg = shift;
    defined $arg? $listName = $arg : return $listName;
    return;
}

sub addItem{
    my $arg = shift;
    (defined $arg and not isInList($arg)) ? return ((push @list, $arg) + 1 - scalar @list) : return 0;
}

sub removeItem{
    my $arg = shift;
    my $index = 0;
    $index++ until $list[$index] eq $arg or $index == scalar @list;
    return defined((splice(@list, $index, 1)));
}

sub isInList{
    my $arg = shift;
    return grep{$arg eq $_} @list;
}

sub saveToFile{
    my $fileName = shift;
    unless(defined $fileName){
        return 0;
    }
    open (SAVEFILE, '>', "$fileName") or die "could not save to $fileName!";
    print SAVEFILE "$listName\n";
    foreach my $i (0..@list-1){
        print SAVEFILE "$list[$i]\n";
    }
    print SAVEFILE @list[-1];
    close SAVEFILE;
    return 1;
}

sub loadFromFile{
    my $fileName = shift;
    unless (defined $fileName){
        return 0;
    }
    open (LOADFILE, "$fileName") or die "could not load from $fileName!";
    my $line = <LOADFILE>;
    $listName = $line;
    undef @list;
    while($line = <LOADFILE>){
        chomp $line;
        push @list, $line;
    }
    return 1;
}

sub count{
    return scalar @list;
}

sub list{
    my $arg = shift;
    unless(defined $arg){
        return \@list;
    }
    if($arg eq '-type'){
        my $typeToReturn = shift;
        if($typeToReturn eq 'array'){
            return @list;
        }
        if($typeToReturn eq 'ref'){
            return \@list;
        }
    }
    return 0;
}

return 1