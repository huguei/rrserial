#!/usr/bin/perl
#
# Prototype script for EDNS option RRSERIAL towards a patched
# NSD server, for early implementation tests.
#
# Use:
#       test-rrserial.pl QNAME QTYPE
#
# $ ./test-rrserial.pl dateserial.example.com txt
# RCODE:    NOERROR
# RRSERIAL: 2018081401
# ANSWER:   incserial.example.com.	43200	IN	TXT	"Test zone for RRSERIAL record"
#
# Author: hugo@nic.cl
#
use strict;
use warnings;

use feature 'say';
use Net::DNS;

my $OPT_RRSERIAL = 65024; # Temporary draft number

my $qname = shift;
my $qtype = shift;

my $resolver = Net::DNS::Resolver->new(
    nameservers => [ '200.1.122.30' ],
    recurse     => 0,
);

my $query = Net::DNS::Packet->new( $qname, $qtype, 'IN' );
$query->edns->option( $OPT_RRSERIAL, '' );

my $reply = $resolver->send( $query );

my %data = $reply->edns->option($OPT_RRSERIAL);
say 'RCODE:    ', $reply->header->rcode;
my ($flag, $len, $rrserial) = unpack('cnN*', $data{'OPTION-DATA'}) if defined($data{'OPTION-DATA'});
say 'RRSERIAL: ', (defined($rrserial) ? $rrserial : 'undefined');
foreach my $ans ($reply->answer) {
    say 'ANSWER:   ', $ans->string;
}

