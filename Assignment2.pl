use strict;

sub inputchomp(){
    chomp ($_ = <STDIN>);
    return $_;
}

print "Enter the student's name: ";
my $name = inputchomp;
my (@credits, @grades, @passed);

while(1){
    print "\nEnter a class: ";
    inputchomp eq '' ? last : print "Enter the number of credits: ";
    push @credits, inputchomp;
    print "Enter the grade received: ";
    push @passed, @grades[(push @grades, inputchomp)-1] =~ /[ABCDabcd]/ ? $credits[-1] : 0;
}

printf "Transcript for $name\nCredits Taken: %9d\nCredits Passed: %8d\nSemester GPA: %9.2f", (eval join '+', @credits), (eval join '+', @passed), ;