package Sub::Spec::Examples::NoSpec;

# This is a sample of a "traditional" Perl module, with no spec or full response
# sub return.

use 5.010;
use strict;
use warnings;

sub pyth($$) {
    my ($a, $b) = @_;
    ($a*$a + $b*$b)**0.5;
}

sub gen_array {
    my ($len) = @_;
    $len //= 10;
    my @res;
    for (1..$len) { push @res, int($len)+1 }
    \@res;
}

our $VERSION = '0.04'; # VERSION

1;
#ABSTRACT: Example of module without spec

__END__
=pod

=head1 NAME

Sub::Spec::Examples::NoSpec - Example of module without spec

=head1 VERSION

version 0.04

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

