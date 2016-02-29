package MyExport;

use base 'Import::Base';

our @EXPORT_OK = qw($joy);

our @IMPORT_MODULES = (
    'strict',
    'warnings',
    feature => [qw( :5.14 )],
    MyExport => [qw( $joy )],
);

our $joy = "weee";

1;
