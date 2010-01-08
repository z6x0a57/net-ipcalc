package Net::IPCalc;

use warnings;
use strict;

use Socket;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(is_ip ip2long long2ip
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(is_ip ip2long long2ip
	
);


=head1 NAME

Net::IPCalc - perl version of ip2long() and long2ip().

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Net::IPCalc;

    my $foo = Net::IPCalc->new();
    ...

=head1 EXPORT


A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 is_ip

return true(1) if $_[0] is an ip address otherwise return false(0).


=cut

sub is_ip { 
    my ($one, $two, $three, $four) = split /\./, $_[0], 4;
    if (($one   =~ /\D/) ||
        ($two   =~ /\D/) ||
        ($three =~ /\D/) ||
        ($four  =~ /\D/))  {
        return 0;
    }

    if (    ($one   < 256) && ($one     >   0) &&
            ($two   < 256) && ($two     >=  0) &&
            ($three < 256) && ($three   >=  0) &&
            ($four  < 256) && ($four    >   0)) {
        return 1;
    }

    return 0;
}

=head2 ip2long

Converts a string containing an (IPv4) Internet Protocol dotted address into a proper address.

=cut

sub ip2long {
    my $ip_address = shift;

    return -1 if (!is_ip($ip_address));

    my (@octets, $octet, $ip_number, $number_convert);

    chomp ($ip_address);

    @octets = split(/\./, $ip_address);
    $ip_number = 0;

    foreach $octet (@octets) {
        $ip_number <<= 8;
        $ip_number |= $octet;
    }

    return $ip_number;
}

=head2 long2ip

Converts an (IPv4) Internet network address into a string in Internet standard dotted format.

=cut

sub long2ip 
{
    return inet_ntoa(pack("N*", shift));
}


=head1 AUTHOR

z6x0a57, C<< <z6x0a57 at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-net-ipcalc at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-IPCalc>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::IPCalc


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-IPCalc>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Net-IPCalc>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Net-IPCalc>

=item * Search CPAN

L<http://search.cpan.org/dist/Net-IPCalc/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 z6x0a57.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Net::IPCalc
