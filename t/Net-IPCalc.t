use Net::IPCalc;
use Test::More tests => 2;

ok(is_ip('1.1.1.1'));
ok(is_ip('1.1.1.1.1.1') == 0);

1;
