use Test2::V0;
use Test::Alien;
use Alien::autoconf;

alien_ok 'Alien::autoconf';

my @cmd = ('autoconf', '--version');

run_ok(\@cmd)
  ->success
  ->note;

done_testing;
