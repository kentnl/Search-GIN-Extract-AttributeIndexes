
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'Data::Dump' => '0',
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'MooseX::AttributeIndexes' => '0',
    'MooseX::Types::Moose' => '0',
    'Test::More' => '0.96'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Automatically collect index metadata from MooseX::AttributeIndexes consuming models.',
  'dist_author' => [
    'Kent Fredric <kentnl@cpan.org>'
  ],
  'dist_name' => 'Search-GIN-Extract-AttributeIndexes',
  'dist_version' => '0.01059819',
  'license' => 'perl',
  'module_name' => 'Search::GIN::Extract::AttributeIndexes',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Carp' => '0',
    'Moose' => '0',
    'Scalar::Util' => '0',
    'Search::GIN::Extract::Callback' => '0',
    'namespace::autoclean' => '0'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
