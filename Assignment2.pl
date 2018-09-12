#!/usr/bin/perl
# David Hinschberger
# CS260 Perl Fall 2018
# Assignment 2: GPA & Transcript 
use strict;

sub inputchomp(){
    chomp ($_ = <STDIN>) == 1 ? return $_ : print 'chomp removed more than 1 \n somehow';
}

print "Enter the student's name: ";
my $name = inputchomp;
my (@credits, @grades, @passed, $honorPts);
while(1){
    print "\nEnter a class: ";
    inputchomp eq '' ? last : print "Enter the number of credits: ";
    (push @credits, inputchomp) > 0 ? print "Enter the grade received: " : print 'something went wrong, @credits is <= 0';
    push @passed, @grades[(push @grades, uc inputchomp)-1] =~ /[A-D]/ ? @credits[-1] + $honorPts - (ord(@grades[-1]) - 69) - ($honorPts += (-1 * (ord(@grades[-1]) - 69))) : 0;
}
printf "\nTranscript for $name\nCredits Taken: %11d\nCredits Passed: %10d\nSemester GPA: %12.2f", (eval join '+', @credits), (eval join '+', @passed), scalar @grades < 1 ? 0 : $honorPts / scalar @grades;