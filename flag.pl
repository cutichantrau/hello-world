#!/usr/bin/perl

use strict;
use DBI;

my $dbh = DBI->connect(
    "dbi:mysql:dbname=geocities;host=icectf_mariadb",
    "geocities",
    "geocities",
    { RaiseError => 1 },
) or die $DBI::errstr;

my $sth = $dbh->prepare("select * from 47a6fd2ca39d2b0d6eea1c30008dd889");
$sth->execute();

my $row;
while ($row = $sth->fetchrow_arrayref()) {
    print "@$row";
}

$sth->finish();
$dbh->disconnect();
