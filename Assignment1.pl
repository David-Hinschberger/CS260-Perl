# David Hinschberger
# David.Hinschberger@und.edu
# Program 1
# Part 1: Working with Text
# Allow the user to enter their first name, last name, address, city, state and zip code. The
# program should ask for one input at a time. Print out a mailing label as follows:
# First Last
# Address
# City STATE, Zip code

use strict;

my($input, @vals, $currMoney);

sub inputchomp(){
    $input = <STDIN>;
    chomp $input;
    return $input;
}

print "Mailing Label Creation (Part 1)\nEnter first name: ";
@vals[0] = inputchomp();
print "Enter last name: ";
@vals[1] = inputchomp();
print "Enter street address: ";
@vals[2] = inputchomp();
print "Enter city: ";
@vals[3] = inputchomp();
print "Enter state: ";
@vals[4] = uc(inputchomp());
print "Enter zip code: ";
@vals[5] = inputchomp();

if(length(@vals[4]) > 2){
    @vals[4] = substr(@vals[4], 0, 2);
}

print "\n\n", @vals[0], " ", @vals[1], "\n", @vals[2], "\n", @vals[3], " ", @vals[4]. ", ", @vals[5];

# Part 2: Making Change
# Get user input for product name, price, and tendered money
# print out change counting each amount of dollars, quarters, dimes, nickels, and pennies.

print "Enter product name: ";
@vals[6] = inputchomp();
print "Enter price of the ", lc(@vals[6]), ": ";
@vals[7] = inputchomp();
print "Enter the amount of cash offered: ";
$currMoney = int(inputchomp() * 100) - int(@vals[7] * 100);
print "\nChange returned from purhcase of: ", @vals[6], "\nDollars  ", int($currMoney / 100), "\nQuarters ", int($currMoney/250),
 "\nDimes    ", int($currMoney % 25 / 10), "\nNickels  ", int($currMoney % 25 % 10 / 5), "\nPennies  ", int($currMoney % 25 % 10 % 5);


