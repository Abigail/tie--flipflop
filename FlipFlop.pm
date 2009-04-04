package Tie::FlipFlop;

#
# $Id: FlipFlop.pm,v 1.1 1999/07/19 22:07:22 abigail Exp abigail $
#
# $Log: FlipFlop.pm,v $
# Revision 1.1  1999/07/19 22:07:22  abigail
# Initial revision
#
#

use strict;

use vars qw /$VERSION/;

$VERSION = '$Revision: 1.1 $' =~ /([\d.]+)/;


sub TIESCALAR {
    my $class = shift;
    do {require Carp;
        Carp::croak ("Incorrect number of arguments");
    } unless 2 == @_;
    bless [reverse @_] => $class;
}

sub FETCH     {
    my $state = shift;
     (@$state = reverse @$state) [0]
}

sub STORE     {
    require Carp;
    Carp::croak ("Cannot modify read only variable");
}


"End of Tie::FlipFlop";


__END__

=pod

=head1 NAME

Tie::FlipFlop - Alternate between two values.

=head1 SYNOPSIS

    use Tie::FlipFlop;

    tie my $flipflop => Tie::FlipFlop => qw /Red Green/;

    print  $flipflop;      # Prints 'Red'.
    print  $flipflop;      # Prints 'Green'.
    print  $flipflop;      # Prints 'Red'.

=head1 DESCRIPTION

C<Tie::FlipFlop> allows you to tie a scalar in such a way that refering to
the scalar alternates between two values. When tying the scalar, exactly
two extra arguments have to be given, the values to be alternated between.

Assigning to the scalar leads to a fatal, but trappable, error.

=head1 REVISION HISTORY

    $Log: FlipFlop.pm,v $
    Revision 1.1  1999/07/19 22:07:22  abigail
    Initial revision


=head1 AUTHOR

This package was written by Abigail.

=head1 COPYRIGHT and LICENSE

This package is copyright 1999 by Abigail.

This program is free and open software. You may use, copy, modify,
distribute and sell this program (and any modified variants) in any way
you wish, provided you do not restrict others to do the same.

=cut
