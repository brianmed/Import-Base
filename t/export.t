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

        joy;
    };
    ok !$@ or diag $@;
};

subtest 'import and export and inheritance' => sub {
    my $warn;
    local $SIG{__WARN__} = sub { $warn = $_[0] };
    eval q{
        package runtime::export::inheritance;

        use MyExportInherited;

        joy;
    };
    ok !$@ or diag $@;
};

done_testing;
