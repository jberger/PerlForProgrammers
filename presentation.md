## Perl for Programmers

Joel Berger

---

### Perl is:

* dynamic
* weakly typed
* optimized for developer's
  - speed
  - brevity
  - creativity

---

### Borrows from:

* shell
* sed
* awk
* C
* others

---

Whether you want to believe it or not, Perl has been an influence on many other languages

Especially Javascript <!-- .element: class="fragment" data-fragment-index="1" -->

---

### Topics:

* Misconceptions
  - Perl 6?
  - Line Noise
  - Object Oriented

---

### Topics:

* Syntax
  - Sigils and Data Structures
  - Scoping
  - Context
  - Types and Operators
  - Implicit Variables
  - Statement Modifiers

---

### Topics:

* Why Perl?
  - CPAN / CPANTesters
  - Object Systems
  - Mojolicious

---

# Misconceptions

---

## Perl 6?

* Announced in 2000
* Became a new language ~ 2005
  - Not replacement to Perl 5
  - "Sister Language"
* Released in 2015
* Renamed "Raku" in 2019

---

## Line Noise

You've probably seen things like these

---

```
/;{}def/#{def}def/$_={/Times-Bold exch selectfont}#/_{rmoveto}#/"{dup}#/*/!/$
;/q{exch}#/x ; {/J q #}#/.{/T q #}#{stringwidth}#{}#{}# 14 string dup dup dup
260 40 moveto 90 rotate ; %/}};$0='"\e[7m \e[0m"';@ARGV=split//,reverse
q(ThePerl). q(Journal) x 220 ; q ; 0 T putinterval exch 7 J putinterval ;
 ; $_= q /m$ pop T($*!$"=!$ " )pop " * true% ? $ " $!" "  !!  !! % !" !"    !
! charpath {!"""}pop $ pop{""!}pop ! neg{!#}pop 220 ! neg _{!!}pop J false %T
charpath  clip " pop 0 " moveto 6{!!}pop $_= 105{!!}pop {$ ! $ " !  #! ##}
pop{dup dup $ ! " pop pop q{"}pop 22{dup show}repeat {"}pop q 22 mul{$ "} pop
neg{!#! $ "}pop ! 8 .65 mul{$ # # $}pop ! neg{"}pop  _ pop{"}pop } repeat pop
" {  $ " ! ! ! $ " ! !" "#"  #"!"""""! #" " # "m/;@ARGV=(@ARGV[-14..-1])x50;q}
 0 "%};s/m[ou]|[-\dA-ln-z.\n_{}]|\$_=//gx;s/(.)(?{$*=''})/('$*.='.(++$#
%2?'':"$0;").'pop;')x(ord($1)-31).'$*'/gee;s/((.(\e\[.m)*|.){77})/$1\n/g;print
; sub showpage {}
```

* The Perl Journal - Obfuscated Perl Contest
* Runs as Perl AND Postscript
* Deemed "best ever" by some

---

```
#!/bin/perl -sp0777i<X+d*lMLa^*lN%0]dsXx++lMlN/dsM0<j]dsj
$/=unpack('H*',$_);$_=`echo 16dio\U$k"SK$/SM$n\EsN0p[lN*1
lK[d2%Sa2/d0$^Ixp"|dc`;s/\W//g;$_=pack('H*',/((..)*)$/)
```

* RSA variant
* deemed illegal as "munitions"
* became a free speech argument
* people tattooed it in protest

---

```
#!/usr/bin/perl -w
use strict;

     my$f=           $[;my
   $ch=0;sub       l{length}
 sub r{join"",   reverse split
("",$_[$[])}sub ss{substr($_[0]
,$_[1],$_[2])}sub be{$_=$_[0];p
 (ss($_,$f,1));$f+=l()/2;$f%=l
  ();$f++if$ch%2;$ch++}my$q=r
   ("\ntfgpfdfal,thg?bngbj".
    "naxfcixz");$_=$q; $q=~
      tr/f[a-z]/ [l-za-k]
        /;my@ever=1..&l
          ;my$mine=$q
            ;sub p{
             print
              @_;
               }

       be $mine for @ever
```

Proposal on a Perl message board

---

# THESE ARE NOT GOOD PERL!

---

# THEY ARE SUPPOSED TO BE FUN!

---

# ARGH!

---

## Object Oriented

* Perl predates widespread OO
* Perl is not deeply OO
  - Doesn't use object in core (much)
* Can do OO just fine
* Python stole Perl's OO model!

---

* Native OO is
  - low level
  - repetitve
  - building block
* Perl has amazing Object Systems on CPAN

---

# Syntax

---

## Sigils and Data Structures

"Perl is just line noise"

---

* The name is the container
* The sigil is both
  - what it contains
  - what you want from it
* Sigil also helps with string interpolation

---

### Storage:

* `$scalar` - one item
* `@array` - many items numerically indexed
* `%hash` - many items string indexed

---

### Retrieving one item:

* `$scalar`
* `$array[0]`
* `$hash{key}`

<p class="fragment" data-fragment-index="1">
  Note each one is `$`, you're getting one item, a scalar!
</p>

---

### Aside: String Interpolation

```perl
my $name  = 'Joel';
my $greet = "Hello $name";
```

<div class="fragment" data-fragment-index="1">
But another way to use a variable is `${name}` so ...

<div class="fragment" data-fragment-index="2">
<pre><code class="lang-perl hljs">my $greet = "Hello ${name}";</code></pre>

... looks familiar?
</div>

---

### Retrieving lists of items:

* `@array[1,2,4]`
* `@hash{'this', 'that'}`

<p class="fragment" data-fragment-index="1">
  Note each one is `@`, you're getting multiple items, a list!
</p>

---

### Aside: List

List is an "ephemeral type", it is the:

* constructor for arrays and hashes
  - `@array = ('hi', 'bye')`
  - `%hash = (key => 'value')`
* return from functions
* return from data structures
* can't store it on its own

---

### Slicing

```perl
my ($one, $three) = @array[1,3];

my ($foo, $bar) = @hash{'foo', 'bar'};
```

"Destructuring" <!-- .element class="fragment" -->

---

### Recent Feature - Hashy Slice

Slice a hash with a `%` sigil, get keys and values

```perl
my %smaller = %bigger{@keys};
```

---

## Scoping

* Who can see it
* Who can find it

---

### Perl has two primary scopes

* Global (`our`)
* Lexical (`my`)

<div class="fragment">
Global is the default, turn that off: <br> `use strict`
</div>

Yes, that should look familiar too! <!-- .element class="fragment" -->

---

### Global (Package) Variables

Stored in a global symbol table hash

```perl
package My::Package::Name;
our $thing = 'what';

# elsewhere use
$My::Package::Name::thing
```

Note&#8203;: packages are more commonly used for functions

---

### Lexical Variables

```perl
{
  my $thing = 'what';
  print $thing;
}

print $thing; # BOOM, no $thing
```

---

## Context

One of the stranger features of Perl

---

> How you use the results of an operation can affect the operation itself.

---

### Contexts

* List
* Scalar
  - Boolean
* Void

---

### Functions

```perl
# list context
my ($sec,$min,$hour,$mday,$mon,$year,
    $wday,$yday,$isdst) = localtime();

# scalar context
my $string = localtime(); # Tue Apr  7 09:30:06 2020
```

---

### User-defined Functions

Functions can inspect the caller's context.

```perl
sub weird { wantarray ? ("this", "that") : 1 }
```

You almost never want to do this. <!-- .element class="fragment" data-fragment-index="1" -->

---

### Size/Length of Array

```perl
my $size = @things;

if (@array) {
  # do something if @array has items
}
```

---

## Types and Operators

Kinda <!-- .element class="fragment" data-fragment-index="1" -->

---

### Perl's "Types"

* String
* Number (Int or Float as needed)
* `undef`
* Reference
  - Object

---

### Perl's "Booleans"

Falsey Values:
  - `0`
  - `()`
  - `""`
  - `undef`

Basically everything else is "truthy"

---

### Type Conversions

Perl's types are very loose, they try to

* Do what you mean
* Do the right thing

You should `use warnings` to get notified if an unusual conversion is happening.

---

### How does that work?

The operations are typed not the data  <!-- .element class="fragment" data-fragment-index="1" -->

---

### Operators

| Operation    | String     | Number       |
|--------------|------------|--------------|
| Equality     | eq         | ==           |
| Not Equal    | ne         | !=           |
| Greater Than | gt         | >            |
| Less Than    | lt         | <            |
| "Addition"   | . (concat) | + (addition) |

---

Rather than casting (e.g. python):

```python
if str(foo) == str(bar):
  # do something with equal strings

if float(foo) == float(bar):
  # do something with equal numbers
```

Use the appropriate comparator:

```perl
if ($foo eq $bar) {
  # do something with equal strings
}

if ($foo == $bar) {
  # do something with equal numbers
}
```

---

## Implicit Variables

"So terse we don't even use variables"

---

### Topic Variable

* special variable `$_`
* some constructs set it by default
* some functions and built-ins use it by default

```perl
my @upper = map { uc } @words;

for (@words) {
  say if /^\w+$/;
}
```

---

### Aside: One Liners

Much of this terseness is driven by<br>one-off command-line use

```
perl -n -E 'say if /^\w+$/' *
```

---

### Argument Stack

* functions receive arguments in `@_`.
* some array operations use it by default.

```perl
sub doit {
  my $first  = shift;
  my $second = shift;
  # do something with $first and $second
}
```

---

### Aside: Function Signatures

New feature

```perl

use experimental 'signatures';

sub ($self, $foo, $bar) {
  ...
}
```

---

## Statement Modifers


```perl
# Normal Form
if ($test) {
  doit();
}

# Statement Modifer
doit() if $test;
```

---

### Control structures

* if
* unless
* for
* while
* until
* (a few other esoteric ones)

---

### Why?

* Clarity
* Brevity
* Variable Scoping

```perl
if (my $foo = get_thing()) {
  # $foo is here
}
# but not here

doit() if my $thing = get_thing();

```

---

### Inline validation

```perl
die 'Could not get lock'
  unless my $lock = get_lock();

for my $id (@ids) {
  next unless my $user = get_user($id);
}
```

---

# Why Perl?

---

## CPAN / CPANTesters

---

### CPAN

* Large mature collection of libraries
* Volunteer run
* Network of mirrors
* Community emphasis on
  - documentation
  - testing

---

### CPANTesters

* Volunteer testers
  - report after installation
  - dedicated test servers
* Report:
  - module version
  - pass/fail
  - OS
  - Perl version
* Website aggregates data

---

### CPANTesters

* authors find bugs
* users pick libraries

---

## Object Systems

---

Because native OO is so spartan, but Perl is so flexible, there are great 3rd party OO systems

---

## Moose and Moo

* Moose started the "modern Perl" movement
* Moo slimmed it down to "just right"

---

### Declarative Object System

```perl
package Person;
use Moo;
use Types::Standard 'Str', 'Num';

has name => (
  is => 'ro',
  required => 1,
  isa => Str,
);

has age => (
  is => 'ro',
  required => 1,
  isa => Num,
);

has can_drink => (
  is => 'rw',
  lazy => 1,
  builder => '_build_can_drink',
);

sub _build_can_drink {
  my $self = shift;
  return $self->age >= 21;
}
```

---

### Features of `has`

* is - ro vs rw
* isa - "type" checking / validation
* required - does contructor require value
* default - simple builder
* builder - call method when building
* lazy - defer builder until needed

---

* predicate / clearer - "is it set" / "unset"
* coerce - alter value when setting
* trigger - do other work when setting
* handles - delegate methods to attribute's object
* reader / writer - change method name for getter / setter


and more

---

### Method Modifiers

Alter behavior of methods from parent class

* before
* after
* around

---

### Other Object Systems

Many other object systems exist including:

* Class::Anonymous
* Dios
* Mojo::Base

---

## Mojo / Mojolicious

* Batteries included web toolkit
* Non-blocking, real time web frame work
* Actively developed, active community
* Amazingly consistent API
* Modern features

<https://mojolicious.org>

---

### Modern Features

* WebSockets are a first class feature
* JSON, DOM parsers
* Content Negotiation
* Non-blocking user agent
* Built-in testing library
* Promises/A+
* Async/Await

---

### Example

```perl
use Mojolicious::Lite;
use Mojo::Pg;

helper pg => sub { state $pg = Mojo::Pg->new('postgresql://postgres@/test') };

get '/' => 'chat';

websocket '/channel' => sub {
  my $c = shift;

  $c->inactivity_timeout(3600);

  # Forward messages from the browser to PostgreSQL
  $c->on(message => sub { shift->pg->pubsub->notify(mojochat => shift) });

  # Forward messages from PostgreSQL to the browser
  my $cb = $c->pg->pubsub->listen(mojochat => sub { $c->send(pop) });
  $c->on(finish => sub { shift->pg->pubsub->unlisten(mojochat => $cb) });
};

app->start;
__DATA__

@@ chat.html.ep
<form onsubmit="sendChat(this.children[0]); return false"><input></form>
<div id="log"></div>
<script>
  var ws  = new WebSocket('<%= url_for('channel')->to_abs %>');
  ws.onmessage = function (e) {
    document.getElementById('log').innerHTML += '<p>' + e.data + '</p>';
  };
  function sendChat(input) { ws.send(input.value); input.value = '' }
</script>
```

---

### Testing

```perl
my $t = Test::Mojo->new($app);

$t->get_ok('/')
  ->status_is(200)
  ->text_is('.users:first-child .name', 'joel');

$t->get_ok('/.json')
  ->status_is(200)
  ->json_is('/users/0/name');
```

---

### Object System

Mojo::Base

* Plays nicely with Moo(se)
* Very fast
* Always rw/lazy
* No `isa` validation
* Chainable setters

---

```perl
package Person;
use Mojo::Base -signatures;

has name => sub { die 'name is required' };

has age => sub { die 'age is required' };

has can_drink => sub ($self) { $self->age >= 21 };
```

---

# Questions?

