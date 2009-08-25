
use strict;
use warnings;

use Module::Build;

my $build = Module::Build->new(
  module_name   => 'Search::GIN::Extract::AttributeIndexes',
  license       => 'perl',
  dist_abstract => "Automatically\ collect\ index\ metadata\ from\ MooseX\:\:AttributeIndexes\ consuming\ models\.",
  dist_name     => "Search\-GIN\-Extract\-AttributeIndexes",
  dist_author   => [
"Kent\ Fredric\ \<kentnl\@cpan\.org\>",
  ],
  requires      => {
    "Test::More" => '0.92',
    "MooseX::Types::Moose" => '0',
    "namespace::autoclean" => '0.08',
    "Test::use::ok" => '0.02',
    "MooseX::AttributeIndexes" => '0.01000300',
    "Moose" => '0.89',
    "Search::GIN" => '0.03',
  },
  script_files => [ qw() ],
);

$build->create_build_script;
