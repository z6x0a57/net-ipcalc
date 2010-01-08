use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Net::IPCalc',
    AUTHOR              => q{z6x0a57 <z6x0a57@gmail.com>},
    VERSION_FROM        => 'lib/Net/IPCalc.pm',
    ABSTRACT_FROM       => 'lib/Net/IPCalc.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Socket'     => 0,
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Net-IPCalc-*' },
);
