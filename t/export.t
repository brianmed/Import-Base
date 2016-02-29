use strict;
use warnings;
use lib 't/lib';
use Test::More;

subtest 'import and export' => sub {
    my $warn;
    local $SIG{__WARN__} = sub { $warn = $_[0] };
    eval q{
        package runtime::export;
        use MyExport;
        warn $joy;
    };
    ok !$@ or diag $@;
    like $warn, qr/weee/;
};

subtest 'import and export and inheritance' => sub {
    my $warn;
    local $SIG{__WARN__} = sub { $warn = $_[0] };
    eval q{
        package runtime::export::inheritance;

        use MyExportInherited;

        warn $joy;
    };
    ok !$@ or diag $@;
    like $warn, qr/weee/;
};

done_testing;
