
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Search-GIN-Extract-AttributeIndexes',
  NAME      => 'Search::GIN::Extract::AttributeIndexes',
  AUTHOR    => 'Kent\ Fredric\ \<kentnl\@cpan\.org\>',
  ABSTRACT  => 'Automatically\ collect\ index\ metadata\ from\ MooseX\:\:AttributeIndexes\ consuming\ models\.',
  VERSION   => '0.01000011',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::More" => '0.92',
    "MooseX::Types::Moose" => '0',
    "namespace::autoclean" => '0.08',
    "Test::use::ok" => '0.02',
    "MooseX::AttributeIndexes" => '0.01000300',
    "Moose" => '0.89',
    "Search::GIN" => '0.03',
  },
);
