# David Hinschberger
# David.Hinschberger@und.edu
# Program 1
#
# Part 1: Working with Text
# Allow the user to enter their first name, last name, address, city, state and zip code. The
# program should ask for one input at a time. Print out a mailing label as follows:
# First Last
# Address
# City STATE, Zip code

use strict;
use feature 'say';
use Term::ANSIColor;

my($input, @vals, $money);

sub inputchomp(){
    $input = <STDIN>;
    chomp $input;
    return $input;
}

print color('blink underline red on_blue'), "Mailing Label Creation (Part 1)\n", color('reset'), "Enter first name: ";
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

say "\n", @vals[0], " ", @vals[1], "\n", @vals[2], "\n", @vals[3], " ", length(@vals[4]) > 2? substr(@vals[4], 0, 2) : @vals[4], ", ", @vals[5], "\n";

# Part 2: Making Change
# Get user input for product name, price, and tendered money
# print out change counting each amount of dollars, quarters, dimes, nickels, and pennies.
print color('blink underline red on_blue'), "Making Change(Part 2):\n", color('reset'), "Enter product name: ";
@vals[6] = inputchomp();
print "Enter price of the ", lc(@vals[6]), ": ";
@vals[7] = inputchomp();
print "Enter the amount of cash offered: ";
$money = int(inputchomp() * 100) - int(@vals[7] * 100);
printf "Change returned from purchase of: %s\n%-9s%d\n%-9s%d\n%-9s%d\n%-9s%d\n%-9s%d\n", $vals[6], "Dollars", int($money / 100), "Quarters", int($money / 100 % 25), "Dimes", int($money % 25 / 10), "Nickels", int($money % 25 % 10 / 5), "Pennies", int($money % 25 % 10 % 5);