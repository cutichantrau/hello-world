#!/usr/bin/perl

use strict;
use DBI;

my $dbh = DBI->connect(
    "dbi:mysql:dbname=geocities;host=icectf_mariadb",
    "geocities",
    "geocities",
    { RaiseError => 1 },
) or die $DBI::errstr;

my $sth = $dbh->prepare("select * from information_schema.tables");
$sth->execute();

my $row;
while ($row = $sth->fetchrow_arrayref()) {
    print "@$row";
}

$sth->finish();
$dbh->disconnect();
