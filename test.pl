use Data::Dumper;

sub printGoodGrades{
    %hash = (@_[0]);
    print Dumper(\%hash);
}

%grades = ('Luke' => 100,
            'Adam' => 60,
            'Bob' => 70,
            'Sam' => 80,
            'Cory' => 90,
            'AJ' => 50);

printGoodGrades \%grades;

