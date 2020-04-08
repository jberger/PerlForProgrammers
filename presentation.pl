use Mojolicious::Lite;

plugin 'RevealJS';

any '/' => sub {
  my $c = shift;
  $c->res->headers->cache_control('no-store')
    if $c->app->mode eq 'development';
  $c->render(layout => 'revealjs', template => 'shell', title => 'Perl For Programmers');
};

app->start;

__DATA__

@@ shell.html.ep

<section data-markdown="presentation.md"></section>

