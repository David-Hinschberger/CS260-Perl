#!/usr/bin/perl
# David Hinschberger 1126026
# CS260 Perl Fall 2018
# Assignment 5: MySQL database interface
use strict;
use DBI;

sub inputchomp(){
    chomp ($_ = <STDIN>) == 1 ? return $_ : print 'chomp removed more than 1 \n somehow';
}

sub promptSure(){
    print 'Are you sure (Y/N)? ';
    return (lc inputchomp eq 'y');
}

#pass in reference of array of hashes
sub printSongs{
    printf "%d songs: \n", scalar @{${@_[0]}};
    for my $song ( @ { $ { @_[0] } } ) {
        $song->{'songid'} ? printf "Songid: %3d Title: %-15s Artist: %-15s Album: %-15s Length: %-5s\n", $song->{'songid'}, $song->{'title'}, $song->{'artist'}, $song->{'album'}, $song->{'time'} : printf "Title: %-15s Artist: %-15s Album: %-15s Length: %-5s\n", $song->{'title'}, $song->{'artist'}, $song->{'album'}, $song->{'time'};
    }
}

sub listSongs{
    printSongs \@_[0]->selectall_arrayref("SELECT title, artist, album, time FROM songs ORDER BY title;", {Slice => {}});
}

sub addSong{
    my @data;
    print "**ADDING SONG**\nArtist Name (blank/0 to quit): ";
    return unless (@data[0] = inputchomp);
    print "Song Title (blank/0 to quit): ";
    return unless (@data[1] = inputchomp);
    print "Album Name (blank/0 to quit): ";
    return unless (@data[2] = inputchomp);
    do {
        print "Length of song format M:SS (blank/0 to quit): ";
        return unless (@data[3] = inputchomp);
    } while ($data[3] !~ /\d:([0-5]\d|60)/);
    @_[0]->do("INSERT INTO songs (artist, title, album, time) VALUES ('$data[0]', '$data[1]', '$data[2]', '$data[3]');");
}

sub updateSong{
    my $dbh = shift;
    printSongs \$dbh->selectall_arrayref("SELECT * FROM songs ORDER BY title;", {Slice => {}});
    print 'ID to update: ';
    my ($input, @data);
    while(1){
        $input = inputchomp;
        (print "Enter valid input\n") && continue unless($input !~ /d+/);
        my $id = $input;
        my $curr = $dbh->selectrow_hashref("SELECT * FROM songs WHERE songid = '$id'");
        my $artist = $curr->{'artist'};
        my $title  = $curr->{'title'};
        my $album  = $curr->{'album'};
        my $time   = $curr->{'time'};
        print "Artist Name (blank to keep same): ";
        $input = inputchomp;
        $artist = $input if ($input);
        print "Artist: $artist\n";
        print "Song Title (blank to keep same): ";
        $input = inputchomp;
        $title = $input if ($input);
        print "Album Name (blank to keep same): ";
        $input = inputchomp;
        $album = $input if ($input);
        do {
            print "Length of song format M:SS (blank to keep same): ";
            $input = inputchomp;
        } while ($input && $input !~ /\d:([0-5]\d|60)/);
        $time = $input if ($input);
        return $dbh->do("UPDATE songs SET artist='$artist', title='$title', album='$album', time='$time' WHERE songid = $id");
    }
}

sub deleteSong{
    printSongs \@_[0]->selectall_arrayref("SELECT * FROM songs ORDER BY title;", {Slice => {}});
    print 'ID to delete: ';
    my $input;
    while(1){
        $input = inputchomp;
        (print "Enter valid input\n") && continue unless($input !~ /d+/);
        return unless (promptSure);
        return @_[0]->do("DELETE FROM songs WHERE songid = '$input'")
    }
}

sub searchSong{
    my $dbh = shift;
    print "Search for \n(1) Artist/Song Title or \n(2) Album (blank to exit): ";
    my $input;
    while(1){
        $input = inputchomp;
        if($input == 1 || $input == 2) {
            $input == 1 ? print 'Search Artist/Song Title (blank to exit): ' : print 'Seach Album (blank to exit): ';
            $input = inputchomp;
            $input == 1 ? return printSongs \$dbh->selectall_arrayref("SELECT title, artist, album, time FROM songs WHERE artist LIKE '%$input%' OR title LIKE '%$input%' ORDER BY title", {Slice => {}}) : return printSongs \$dbh->selectall_arrayref("SELECT title, artist, album, time FROM songs WHERE ALBUM like '%$input%' ORDER BY title", {Slice => {}});
        }  elsif($input eq '') {
            return;
        }  else {print "Enter valid input\n"};
    }
}

my $dsn = "DBI:mysql:fall2018:localhost";
my $dbh = DBI->connect ($dsn, 'root', 'password', {PrintError => 0}) or die "Unable to connect to the database\n";
my $input;
while(1){
    print "1. List all songs\n2. Add New Song\n3. Update a song\n4. Delete a song\n5. Search for a song\n6. exit\n";
    $input = inputchomp;
    if($input == 1) {
        listSongs ($dbh) if(promptSure);
    }    elsif($input == 2) {
        addSong ($dbh) if(promptSure);
    }    elsif($input == 3) {
        updateSong($dbh) if (promptSure);
    }    elsif($input == 4) {
        deleteSong ($dbh) if(promptSure);
    }    elsif($input == 5) {
        searchSong ($dbh) if (promptSure);
    }    elsif($input == 6) {
        exit;
    }    else {print "Enter valid input\n"};
}