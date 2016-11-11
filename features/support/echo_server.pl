#!/usr/bin/perl -w

use strict;
use warnings;
use Socket;

my $port = ($ARGV[0] ? $ARGV[0] : 5000);

socket(CLIENT_WAITING, PF_INET, SOCK_STREAM, 0) or die "cannot create socket";
setsockopt(CLIENT_WAITING, SOL_SOCKET, SO_REUSEADDR, 1);
bind(CLIENT_WAITING, pack_sockaddr_in($port, INADDR_ANY)) or die "cannot bind";

listen(CLIENT_WAITING, SOMAXCONN) or die "cannot listen";

print "listen port; $port\n";

my $paddr = accept(CLIENT, CLIENT_WAITING);

my ($client_port, $client_iaddr) = unpack_sockaddr_in($paddr);
# my $client_hostname = gethostbyaddr($client_iaddr, AF_INET) || "";
my $client_ip = inet_ntoa($client_iaddr);

# print "connected: $client_hostname ($client_ip): $client_port\n";
print "connected: $client_ip: $client_port\n";

# no buffer
select(CLIENT); $|=1; select(STDOUT);

while (<CLIENT>){
    print "recv: $_";
    my $date = `date +%s`;
    chomp($date);
    
    print CLIENT "server_send:$date ", $_;
    print "send: ", "server_send:$date ", $_;
}
close(CLIENT);

print "connection closed.\n";

