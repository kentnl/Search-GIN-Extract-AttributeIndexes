use 5.006;    # our
use strict;
use warnings;

package Search::GIN::Extract::AttributeIndexes;

our $VERSION = '2.000000';

use Moose qw( has extends );

# ABSTRACT: Automatically collect index metadata from MooseX::AttributeIndexes consuming models.

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Scalar::Util qw(blessed reftype);
use Safe::Isa qw( $_does );
use Carp;
extends 'Search::GIN::Extract::Callback';
use namespace::autoclean;
















































has '+extract' => ( default => sub { return \&_extract_object }, );

no Moose;
__PACKAGE__->meta->make_immutable;

sub _extract_object {
  my ( $cache_object, ) = @_;
  return {} unless $cache_object->$_does('MooseX::AttributeIndexes::Provider');
  my $result = $cache_object->attribute_indexes;
  if ( reftype $result ne 'HASH' ) {
    Carp::croak(
      'the method \'attribute_indexes\' on the class ' . $cache_object->meta->name . ' Does not return an array ref.' );
    return {};
  }
  return $result;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Search::GIN::Extract::AttributeIndexes - Automatically collect index metadata from MooseX::AttributeIndexes consuming models.

=head1 VERSION

version 2.000000

=head1 SYNOPSIS

=head2 On your models

  use MooseX::Declare;

  class Model::Item {
    use MooseX::Types::Moose qw(:all ):
    use MooseX::AttributeIndexes;

    has 'attr' => (
      isa => Str,
      is => 'rw',
      indexed => 1
    );
    has 'attr_bar' => (
      isa => Str,
      is => 'rw',
      primary_index => 1
    );
  }

=head2 In KiokuX::Model extensions

  use MooseX::Declare;

  class Foo extends KiokuX::Model {
    use Search::GIN::Extract::AttributeIndexes;

    around _build_connect_args ( Any @args ) {

      my $args = $self->$orig( @args );
      push @{ $args }, extract => Search::GIN::Extract::AttributeIndexes->new();
      return $args;

    }
  }

=head2 In Instantiations of KiokuDB

  my $dir = KiouDB->new(
    backend => KiokuDB::Backend::BDB::GIN->new(
      extract => Search::GIN::Extract::AttributeIndexes->new()
    )
  );

=head1 AUTHOR

Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
