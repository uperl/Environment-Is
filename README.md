# Environment::Is ![static](https://github.com/uperl/Environment-Is/workflows/static/badge.svg) ![linux](https://github.com/uperl/Environment-Is/workflows/linux/badge.svg)

Detect environments like Docker or WSL

# SYNOPSIS

```perl
use Environment::Is qw( is_docker is_wsl );

if(is_docker()) {
  ...
}

if(is_wsl()) {
  ...
}
```

# DESCRIPTION

This module provides some `is_` prefixed functions for detecting certain environments.
Additional environments may be added in the future.

# FUNCTIONS

## is\_docker

Returns true if the current process is running inside a docker container.

## is\_interactive

Return true if the current process is interactive.

## is\_wsl

Returns true if the current process is running inside Windows Subsystem for Linux (WSL).

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2024 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
