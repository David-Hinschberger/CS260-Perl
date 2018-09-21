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
    #if the input is blank, exit loop, otherwise print prompt for credits
    inputchomp eq '' ? last : print "Enter the number of credits: ";
    #push into @credits the input, and if @credits has data, prompt for grade, otherwise print error message.
    (push @credits, inputchomp) > 0 ? print "Enter the grade received: " : print 'something went wrong, @credits is <= 0';
    #if the result of whether or not @grades's last index matches the REGEX [A-D] after pushing uppercase input to @grades is true, push into @passed @credits[-1] added with a sum of 0 (sum adds appropriate number to $honorPts).  if it's false then push into @passed the value 0.
    push @passed, @grades[(push @grades, uc inputchomp)-1] =~ /[A-D]/ ? @credits[-1] + $honorPts - (ord(@grades[-1]) - 69) - ($honorPts += (-1 * (ord(@grades[-1]) - 69))) : 0;
}
#if @credits has data, print the transcript with sum of credits taken, passed, and a GPA calculated by honorPts divided by the amount of grades received (classes taken), if it had no data, then print that $name took no classes.
(scalar @credits) != 0 ? printf "\nTranscript for $name\nCredits Taken: %11d\nCredits Passed: %10d\nSemester GPA: %12.2f\n", (eval join '+', @credits), (eval join '+', @passed), scalar @grades < 1 ? 0 : $honorPts / scalar @grades : print "$name did not take any classes.";
