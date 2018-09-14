use strict;
use Data::Dumper;

sub showText{
    my %params = (
        text => '',
        myFont => "Arial",
        ptSize => 10,
        bold => 0,
        italics => 0,
    );
    if (scalar(@_) == 0){ return; } #do we have at least one argument?
    $params{text} = shift; #remove the required positinal parameter
    #second positional parameter
    if (@_ && substr ($_[0], 0, 1) ne "-") { #is the first character of hte first index in @_ a '-'
        { $params {myFont} = shift }
    }
    while(@_) {
        my ($key, $value) = shift, shift;
        if (defined (%params{substr ($key, 1)})){
            $key = substr ($key, 1);
            $key = substr ($key, 1);
            if ($value) {$params {$key} = $value; }
        }
        else { print "Ukown key $key : ignoring value of $value\n" }
    }
    print Dumper (\%params), "\n";
}

showText("All default values for parameters");
showText("no arguments", "Courier");
showText("test1", -bold => 'True');
showText("test2", -ptSize => 12, -myFont => "Arial", );
showText("test2b", -myFont => "Arial", -ptSize => 12, -bold => 'True');
showText("test3", -myFont => "Courier", -ptSize => 12);
showText("test4", -ptSize => 20);
showText("test5", -ptSize => 20, -myFont => "Times New Roman", -italics => 'True');