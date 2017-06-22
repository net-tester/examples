#!/usr/bin/env perl

use utf8;
use strict;
use warnings;

use Data::Dumper;

my @input = <STDIN>;
my (@input_before, @input_current);

my $input_file_flag = 0;
foreach (@input){
    if($_ =~ m/^$/){
        $input_file_flag ++;
    }
    elsif($input_file_flag == 0){
        push @input_before, $_;
    }
    elsif($input_file_flag == 1){
        push @input_current, $_;
    }
    else{
        die "input format error\n";
    }
}


my $before = [];
my $current = [];

# print Dumper (\@input_before, \@input_current);
parseflow(\@input_before, $before);
parseflow(\@input_current, $current);
# print Dumper ($before, $current);
diff($before, $current);

sub parseflow{
    my ($raw_ref, $array_ref) = @_;

    # check header
    if(!exists($raw_ref->[0])){
        die"dump-flows is empty\n";
    }
    elsif($raw_ref->[0] !~ m/^NXST_FLOW reply \(xid=0x4\):$/){
        die "unknown flow list header\n";
    }

    # parse list
    for(my $i = 1; $i < scalar(@$raw_ref); $i++){
        my $p = {};
        my $tmp = $raw_ref->[$i];
        while($tmp =~ s/(.+?=.+?),(.+=.+)/$1 $2/){}
        while($tmp =~ m/([a-z_]+)=([0-9a-z_\/\.,:]+)( |$)/ig){
            $p->{$1} = $2;
        }
        # delete useless keys
        foreach (qw/cookie table idle_age hard_age n_bytes duration n_packets/){
            delete $p->{$_};
        }
        push @$array_ref, $p;
    }
}

sub diff{
    my ($before, $after) = @_;

    foreach my $aa (@$after){
        my $exist = 0;
        foreach my $bb (@$before){
            my $cmp = 0;
            foreach (keys %$bb){
                if(!exists($aa->{$_}) || $bb->{$_} ne $aa->{$_}){
                    $cmp ++;
                }
            }
            if($cmp == 0){
                $exist++;
            }
        }
        if($exist == 0){
            # del-flows
            my $command = join(",", map{$_ . "=" . $aa->{$_}} grep(!m/(priority|actions)/, sort {$b cmp $a} keys %$aa));
            if($command){ # such as 'priority=0 actions=drop'
                print "$command\n";
            }
        }
    }
}
