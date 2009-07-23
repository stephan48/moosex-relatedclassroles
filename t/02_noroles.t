use strict;
use warnings;
use Test::More tests => 2;

{ package Bar; use Moose; }

{
  package Foo;
  use Moose;
  has bar_class => (is => 'rw', isa => 'ClassName', default => 'Bar');

  with 'MooseX::RelatedClassRoles' => { name => 'bar' };
}

can_ok('Foo', 'apply_bar_class_roles');
my $foo = Foo->new;

is($foo->apply_bar_class_roles(),0,"no crash when applying no roles");

