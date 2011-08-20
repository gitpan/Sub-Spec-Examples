package Sub::Spec::Examples;

use 5.010;
use strict;
use warnings;

our $VERSION = '0.02'; # VERSION

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(delay dies err);
our %SPEC;

$SPEC{delay} = {
    summary => "Sleep, by default for 10 seconds",
    description => <<'_',

Can be used to test time_limit clause.

_
    args => {
        n => ['int*' => {
            summary => 'Number of seconds to sleep',
            arg_pos => 0,
            default => 10,
        }],
        per_second => ['bool*' => {
            summary => 'Whether to sleep(1) for n times instead of sleep(n)',
            default => 0,
        }],
    },
};
sub delay {
    my %args = @_;
    my $n = $args{n} // 10;

    if ($args{per_second}) {
        sleep 1 for 1..$n;
    } else {
        sleep $n;
    }
    [200, "OK", "Slept for $n sec(s)"];
}

$SPEC{dies} = {
    summary => "Dies tragically",
    description => <<'_',

Can be used to test exception handling.

_
    args => {
    },
};
sub dies {
    my %args = @_;
    die;
}

$SPEC{err} = {
    summary => "Return error response",
    description => <<'_',


_
    args => {
        code => ['int*' => {
            summary => 'Error code to return',
            default => 500,
        }],
    },
};
sub err {
    my %args = @_;
    my $code = int($args{code}) // 0;
    $code = 500 if $code < 100 || $code > 555;
    [$code, "Response $code"];
}

1;
# ABSTRACT: Various spec'ed functions, for examples and testing


=pod

=head1 NAME

Sub::Spec::Examples - Various spec'ed functions, for examples and testing

=head1 VERSION

version 0.02

=head1 SYNOPSIS

 use Sub::Spec::Examples qw(delay);
 delay();

=head1 DESCRIPTION

This module and its submodules contain an odd mix of various functions, mostly
simple ones, each with its L<Sub::Spec> spec. Mostly used for testing spec or
various Sub::Spec modules.

=head1 FUNCTIONS

None are exported by default, but they are exportable.

=head2 delay(%args) -> [STATUS_CODE, ERR_MSG, RESULT]


Sleep, by default for 10 seconds.

Can be used to test time_limit clause.

Returns a 3-element arrayref. STATUS_CODE is 200 on success, or an error code
between 3xx-5xx (just like in HTTP). ERR_MSG is a string containing error
message, RESULT is the actual result.

Arguments (C<*> denotes required arguments):

=over 4

=item * B<n>* => I<int> (default C<10>)

Number of seconds to sleep.

=item * B<per_second>* => I<bool> (default C<0>)

Whether to sleep(1) for n times instead of sleep(n).

=back

=head2 dies(%args) -> [STATUS_CODE, ERR_MSG, RESULT]


Dies tragically.

Can be used to test exception handling.

Returns a 3-element arrayref. STATUS_CODE is 200 on success, or an error code
between 3xx-5xx (just like in HTTP). ERR_MSG is a string containing error
message, RESULT is the actual result.

No known arguments at this time.

=head2 err(%args) -> [STATUS_CODE, ERR_MSG, RESULT]


Return error response.



Returns a 3-element arrayref. STATUS_CODE is 200 on success, or an error code
between 3xx-5xx (just like in HTTP). ERR_MSG is a string containing error
message, RESULT is the actual result.

Arguments (C<*> denotes required arguments):

=over 4

=item * B<code>* => I<int> (default C<500>)

Error code to return.

=back

=head1 SEE ALSO

L<Sub::Spec>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

