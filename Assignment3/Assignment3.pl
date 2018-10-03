#!/usr/bin/perl
# David Hinschberger 1126026
# CS260 Perl Fall 2018
# Assignment 3: Perl Module 
use strict;
use lib '.';
use ListUtil;
use Data::Dumper;

print name("names"), "\n";
print name(), "\n";
print "add Bob: ", addItem("Bob"), "\n";
print "add Cory:", addItem("Cory"), "\n";
print "add AJ:", addItem("AJ"), "\n";
print "add Sam:", addItem("Sam"), "\n";
print "add Pam:", addItem("Pam"), "\n";
print "add Bob:", addItem("Bob"), "\n";

print Dumper list();

print 'remove Bob: ', removeItem("Bob"), "\n";
print 'remove Bob: ', removeItem("Bob"), "\n";

isInList("Bob") ? print "bob in list\n" : print "bob not in list\n";

isInList("Pam") ? print "pam in list\n" : print 'pam not in list', "\n";

print 'save to file "liststuff.txt": ', saveToFile("liststuff.txt"), "\n";

print 'load from file "liststuff.txt": ', loadFromFile("liststuff.txt"), "\n";

print Dumper list();

print 'count: ', count(), "\n";

print list('-type', 'array');