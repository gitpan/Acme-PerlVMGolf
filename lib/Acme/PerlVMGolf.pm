package Acme::PerlVMGolf;
use strict;
use warnings;
use 5.00800;
our $VERSION = '0.01';
use XSLoader;
XSLoader::load 'Acme::PerlVMGolf', $VERSION;

sub import {
    _setup();
}

1;
__END__

=encoding utf8

=head1 NAME

Acme::PerlVMGolf - perl5 vm golf

=head1 SYNOPSIS

  perl -MAcme::PerlVMGolf -e '0'
  hit: 177op
  hit: 174op
  hit: 178op
  Your perl is : 5.8.8
  Your score is : 529op

=head1 DESCRIPTION

Perl op code golf!

=head1 FOUNDER

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 THANKS TO

Kazuhiro Osawa
id:TAKESAKO
lestrrat
and #coderepos@freenode members

=head1 SEE ALSO

L<Acme::NabeAtzz>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
