use strict;

sub inputchomp(){
    chomp ($_ = <STDIN>);
    return $_;
}

print "Enter the student's name: ";
my $name = inputchomp;
my (@credits, @grades, @passed, $honorPts);

while(1){
    print "\nEnter a class: ";
    inputchomp eq '' ? last : print "Enter the number of credits: ";
    (push @credits, inputchomp) > 0 ? print "Enter the grade received: " : 0;
    push @passed, @grades[(push @grades, uc(inputchomp))-1] =~ /[A-D]/ ? @grades[-1] eq 'A'? $credits[-1] + $honorPts + 4 - ($honorPts += 4) : @grades[-1] eq 'B' ? $credits[-1] + $honorPts + 3 - ($honorPts += 3) : @grades[-1] eq 'C' ? $credits[-1] + $honorPts + 2 - ($honorPts += 2) : @grades[-1] eq 'D'? $credits[-1] + $honorPts - $honorPts++: 0 : 0;
}

printf "\nTranscript for $name\nCredits Taken: %11d\nCredits Passed: %10d\nSemester GPA: %12.2f", (eval join '+', @credits), (eval join '+', @passed), (scalar @grades) == 0? 0 : $honorPts / scalar @grades;