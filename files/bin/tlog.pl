#!/usr/bin/perl
use strict;
use CGI qw(:html);
my $FILENAME = "/var/log/kern.log";
my $TAILING  = 16;
my $URGENT = 5;     # this many seconds stays white
my $OLD    = 55;    # this many seconds after urgent is dark
my @data;
use POE qw(Component::Server::HTTP Wheel::FollowTail);
POE::Component::Server::HTTP->new(
  Port           => 42042,
  ContentHandler => {
    "/" => sub {
      my ($request, $response) = @_;
      $response->code(RC_OK);
      $response->content_type("text/html");
      $response->content(
        join "",
        start_html(
          -title   => "web tail on $FILENAME",
          -bgcolor => 'black',
          -head    => ["<meta http-equiv=refresh content='5; URL=#bottom'>"],
        ),
        table(
          map {
            my ($stamp, $message) = @$_;
            my $age = time - $stamp;
            my $color;
            if ($age < $URGENT) {
              $color = 'white';
            }
            else {
              $age -= $URGENT;
              $age = $OLD if $age > $OLD;
              my $c = 255 * (1 - $age / $OLD);
              $color = sprintf '#%02x%02x%02x', $c, 255, $c;
            }
            Tr(
              td(
                {valign => 'top'},
                font(
                  {color => 'cyan'},
                  sprintf "%02d:%02d:%02d",
                  (localtime $stamp)[2, 1, 0]
                )
              ),
              td(
                font(
                  {color => $color, face => 'courier'}, escapeHTML($message)
                )
              )
            );
            } @data
        ),
        a({name => "bottom"}),
        end_html,
      );
      return RC_OK;
      }
  },
);
POE::Session->create(
  inline_states => {
    _start => sub {
      $_[HEAP]{wheel} = POE::Wheel::FollowTail->new(
        Filename   => $FILENAME,
        InputEvent => 'got_line',
        SeekBack   => 8192,
      );
    },
    got_line => sub {
      push @data, [time, $_[ARG0]];
      splice @data, 0, -$TAILING if @data > $TAILING;
    },
  },
);
$poe_kernel->run();
