#!/usr/bin/perl -w

use Socket;

$host = $ARGV[0];
$port = $ARGV[1];
$time = $ARGV[2];

$iaddr = inet_aton($host) or die "cannot resolve $host";
$sock_addr = pack_sockaddr_in($port, $iaddr);
socket(SOCKET, PF_INET, SOCK_STREAM, 0) or die "cannot create socket";

connect(SOCKET, $sock_addr) or die "cannot connect";

# no buffer
select(SOCKET); $|=1; select(STDOUT);

for($i=0;$i<$time;$i++){
    print SOCKET "client_send:", `date +%s`;
    while(<SOCKET>){
        print_as_ping($_);
        last;
    }
    sleep 1;
}

close(SOCKET);

sub print_as_ping{
    my ($msg) = @_;
    $msg =~ /server_send:(\d+) client_send:(\d+)/;
    print "[$1] client_send: $2\n";
}
