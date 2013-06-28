#!/usr/bin/perl
use strict;
use warnings;

my $USUAGE = "USUAGE: perl $0 input_tex_file output_plain_file\n";
my $input = shift @ARGV or die $USUAGE;
my $output = shift @ARGV or die $USUAGE;

my @lines = `detex $input`;


my $content = "";
foreach(@lines) {
    chomp;
    if(/\S+/s) {
        $content .= $_;
        $content .= " ";
    } else {
        $content .= "\n";
    }
}
$content =~ s/\n+/\n\n/mg;
$content =~ s/ +/ /mg;
$content =~ s/^ +//mg;


open OUT, ">", $output or die "can not open $output for write\n";
print OUT $content;
close OUT;
