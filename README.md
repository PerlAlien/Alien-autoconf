# Alien::autoconf ![linux](https://github.com/PerlAlien/Alien-autoconf/workflows/linux/badge.svg) ![macos](https://github.com/PerlAlien/Alien-autoconf/workflows/macos/badge.svg) ![windows](https://github.com/PerlAlien/Alien-autoconf/workflows/windows/badge.svg)

Build or find autoconf

# SYNOPSIS

From your script or module:

```perl
use Alien::autoconf;
use Env qw( @PATH );

unshift @PATH, Alien::autoconf->bin_dir;
```

From your alienfile:

```perl
use alienfile;

share {
  # Alien::Autotools will pull in:
  #  - Alien::autoconf
  #  - Alien::automake
  #  - Alien::m4
  #  - Alien::libtool
  # all of which you will likely need.
  requires 'Alien::Autotools';
  plugin 'Build::Autoconf';
  build [
    'autoreconf -vfi',
    '%{configure}',
    '%{make}',
    '%{make} install',
  ];
};
```

# DESCRIPTION

This distribution provides autoconf so that it can be used by other Perl distributions that are on CPAN.  This is most commonly necessary when creating
other [Alien](https://metacpan.org/pod/Alien)s that target a autoconf project that does not ship with a `configure` script.  Ideally you should complain to the upstream developers,
but if you are not able to convince them then you have this option.  There are currently two such Aliens: [Alien::libuv](https://metacpan.org/pod/Alien::libuv) and [Alien::Hunspell](https://metacpan.org/pod/Alien::Hunspell).

# METHODS

## bin\_dir

```perl
my @dirs = Alien::autoconf->bin_dir;
```

Returns a list of directories that need to be added to the `PATH` in order to use `autoconf`.

# CAVEATS

This module is currently configured to _always_ do a share install.  This is because `system` installs for this alien are not reliable.  Please see
this issue for details: [https://github.com/plicease/Alien-autoconf/issues/2](https://github.com/plicease/Alien-autoconf/issues/2).  The good news is that most of the time you shouldn't need this module
_unless_ you are building another alien from source.  If your system provides the package that is targeted by the upstream alien I recommend using
that.  If you are packaging system packages for your platform then I recommend making sure the upstream alien uses the system library so you won't need
to install this module.

# SEE ALSO

- [alienfile](https://metacpan.org/pod/alienfile)
- [Alien::Build](https://metacpan.org/pod/Alien::Build)
- [Alien::Build](https://metacpan.org/pod/Alien::Build)
- [Alien::Autotools](https://metacpan.org/pod/Alien::Autotools)

# AUTHOR

Author: Graham Ollis <plicease@cpan.org>

Contributors:

Mark Jensen (MAJENSEN)

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
