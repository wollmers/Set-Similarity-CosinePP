package Set::Similarity::CosinePP;

use strict;
use warnings;

use parent 'Set::Similarity';

our $VERSION = '0.011';

sub from_sets {
  my ($self, $set1, $set2) = @_;
  my $cosine = $self->cosine( 
	$self->normalize($self->make_vector( $set1 )), 
	$self->normalize($self->make_vector( $set2 )) 
  );
  return $cosine;
}

sub make_vector {			
  my ( $self, $tokens ) = @_;
  my %elements;  
  do { $_++ } for @elements{@$tokens};
  return \%elements;
}	

# Assumes both incoming vectors are normalized
sub cosine { shift->dot( @_ ) }

sub norm {
  my $self = shift;
  my $vector = shift;
  my $sum = 0;
  for my $key (keys %$vector) {
    $sum += $vector->{$key} ** 2;
  }
  return sqrt $sum;
}

sub normalize {
  my $self = shift;
  my $vector = shift;

  return $self->div(
    $vector,
    $self->norm($vector)
  );
}

sub dot {
  my $self = shift;
  my $vector1 = shift;
  my $vector2 = shift;

  my $dotprod = 0;

  for my $key (keys %$vector1) {
    $dotprod += $vector1->{$key} * $vector2->{$key} if ($vector2->{$key});
  }
  return $dotprod;
}


# divides each vector entry by a given divisor
sub div {
  my $self = shift;
  my $vector = shift;
  my $divisor = shift;

  my $vector2 =  {};
  for my $key (keys %$vector) {
    $vector2->{$key} = $vector->{$key} / $divisor;
  }
  return $vector2;
}


1;


__END__

=head1 NAME

Set::Similarity::CosinePP - Cosine similarity for sets pure Perl vector implementation

=for html
<a href="https://travis-ci.org/wollmers/Set-Similarity-CosinePP"><img src="https://travis-ci.org/wollmers/Set-Similarity-CosinePP.png" alt="Set-Similarity-CosinePP"></a>
<a href='https://coveralls.io/r/wollmers/Set-Similarity-CosinePP?branch=master'><img src='https://coveralls.io/repos/wollmers/Set-Similarity-CosinePP/badge.png?branch=master' alt='Coverage Status' /></a>

=head1 SYNOPSIS

 use Set::Similarity::CosinePP;
 
 # object method
 my $cosine = Set::Similarity::CosinePP->new;
 my $similarity = $cosine->similarity('Photographer','Fotograf');
 
=head1 DESCRIPTION

=head2 Cosine similarity

A intersection B / (sqrt(A) * sqrt(B))


=head1 METHODS

L<Set::Similarity::CosinePP> inherits all methods from L<Set::Similarity> and implements the
following new ones.

=head2 from_sets

  my $similarity = $object->from_sets(['a'],['b']);
 
This method expects two arrayrefs of strings as parameters. The parameters are not checked, thus can lead to funny results or uncatched divisions by zero.
 
If you want to use this method directly, you should take care that the elements are unique. Also you should catch the situation where one of the arrayrefs is empty (similarity is 0), or both are empty (similarity is 1).

=head1 SOURCE REPOSITORY

L<http://github.com/wollmers/Set-Similarity-CosinePP>

=head1 AUTHOR

Helmut Wollmersdorfer, E<lt>helmut.wollmersdorfer@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013-2014 by Helmut Wollmersdorfer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

