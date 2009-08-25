use strict;
use warnings;

package Search::GIN::Extract::AttributeIndexes;

use Moose;

# ABSTRACT: Automatically collect index metadata from MooseX::AttributeIndexes consuming models.

use Scalar::Util qw(blessed reftype);
use Carp;
extends 'Search::GIN::Extract::Callback';
use namespace::autoclean;

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
=cut

has '+extract' => (
  default => sub {
    sub {
      my ( $object, $self, @args ) = @_;
      return {} unless blessed $object;
      return {} unless $object->can('does');
      return {} unless $object->does('MooseX::AttributeIndexes::Provider');
      my $result = $object->attribute_indexes;
      if ( reftype $result ne 'HASH' ) {
        Carp::croak( 'the method \'attribute_indexes\' on the class ' . $object->meta->name . ' Does not return an array ref.' );
        return {};
      }
      return $result;
      }
  }
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

