#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Net::IPCalc' ) || print "Bail out!
";
}

diag( "Testing Net::IPCalc $Net::IPCalc::VERSION, Perl $], $^X" );
