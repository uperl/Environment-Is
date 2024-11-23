use warnings;
use 5.020;
use experimental qw( postderef signatures );

package Environment::Is {

  # ABSTRACT: Detect environments like Docker or WSL

=head1 SYNOPSIS

 use Environment::Is qw( is_docker is_wsl );
 
 if(is_docker()) {
   ...
 }

 if(is_wsl()) {
   ...
 }

=head1 DESCRIPTION

This module provides some C<is_> prefixed functions for detecting certain environments.
Additional environments may be added in the future.

=cut

  use FFI::Platypus 2.00;
  use Exporter qw( import );

  my $ffi = FFI::Platypus->new(
    api  => 2,
    lang => 'Rust',
  );
  $ffi->bundle;
  $ffi->mangler(sub ($name) { "iz_$name" });

=head1 FUNCTIONS

=head2 is_docker

Returns true if the current process is running inside a docker container.

=head2 is_interactive

Return true if the current process is interactive.

=head2 is_wsl

Returns true if the current process is running inside Windows Subsystem for Linux (WSL).

=cut

  $ffi->attach( is_docker => [] => 'bool' );
  $ffi->attach( is_interactive => [] => 'bool' );
  $ffi->attach( is_wsl => [] => 'bool' );

  our @EXPORT_OK = sort grep /^is_/, keys %Environment::Is::;

}

1;
