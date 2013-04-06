
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.4004"
  },
  "configure_requires" => {
    "Module::Build" => "0.4004"
  },
  "dist_abstract" => "Automatically collect index metadata from MooseX::AttributeIndexes consuming models.",
  "dist_author" => [
    "Kent Fredric <kentnl\@cpan.org>"
  ],
  "dist_name" => "Search-GIN-Extract-AttributeIndexes",
  "dist_version" => "1.0.2",
  "license" => "perl",
  "module_name" => "Search::GIN::Extract::AttributeIndexes",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Moose" => 0,
    "Scalar::Util" => 0,
    "Search::GIN::Extract::Callback" => 0,
    "namespace::autoclean" => 0,
    "perl" => "5.010000",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Data::Dump" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "MooseX::AttributeIndexes" => 0,
    "MooseX::Types::Moose" => 0,
    "Test::More" => "0.98"
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
