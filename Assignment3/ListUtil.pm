#!/usr/bin/perl
# David Hinschberger
# CS260 Perl Fall 2018
# Assignment 3: Perl Module 
package ListUtil;
use strict;

our $version = 0.01;
use Exporter;
our @ISA = qw/Exporter/;
our @EXPORT = qw (&name &addItem &removeItem &isInList &saveToFile &loadToFile &count &list $version);

my @list;
my $listName = '';

sub name{
    my $arg = shift;
    unless(defined($arg)){
        return $listName;
    }
    $listName = $arg;
    return;
}

sub addItem{
    my $arg = shift;
    unless (defined $arg xor grep{$_ eq $arg} @list){
        return 0;
    }
    push @list, $arg;
    return 1;
}

sub removeItem{
    my $arg = shift;
    return (defined(splice(@list, $arg, 1)));
}

sub isInList{

}

sub saveToFile{


}

sub loadToFile{

}
sub count{

}

sub list{
    return \@list;
}

return 1