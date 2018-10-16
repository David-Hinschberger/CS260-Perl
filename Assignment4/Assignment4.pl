#!/usr/bin/perl
# David Hinschberger 1126026
# CS260 Perl Fall 2018
# Assignment 4: Regex Phone Number Matching
use strict;
sub inputchomp(){
    chomp ($_ = <STDIN>) == 1 ? return $_ : print 'chomp removed more than 1 \n somehow';
}

my $fileName = shift or print "Input file name: ";
open(INPUT, $fileName) or die "Cannot read file: $fileName";
