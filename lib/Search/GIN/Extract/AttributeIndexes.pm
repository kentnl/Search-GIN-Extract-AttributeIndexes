use strict;
use warnings;

package Search::GIN::Extract::AttributeIndexes;

use Moose;
use Scalar::Util qw(blessed reftype);
use Carp;
extends 'Search::GIN::Extract::Callback';
use namespace::autoclean;

has 'extract' => (
  init_arg => '_extract',
  default => sub {
    my( $object, $self , @args ) = @_;
    return {} unless blessed $object;
    return {} unless $object->can('does');
    return {} unless $object->does('MooseX::AttributeIndexes::Provider');
    my $result = $object->attribute_indexes;
    if( reftype $result ne 'HASH' ){
      Carp::croak("the method 'attribute_indexes' on the class " . $object->meta->name .
        " Does not return an array ref.");
      return {};
    }
    return $result;
  }
);

1;

