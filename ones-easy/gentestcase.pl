#!/usr/bin/perl

my $test = shift;
chomp($test);
open(INS,">inputs/in$test");
open(OUTS,">outputs/out$test");
for(my $i = 0; $i < int(rand(20)); $i++){
	my $num = int(rand(10000));
	my $bin = dec2bin($num);
	print "$num -> $bin ->";
	$bin =~ s/0//g;
	my $cnt = length $bin;
	print "$cnt\n";
	print INS "$num\n";
	print OUTS "$cnt\n";


}


sub dec2bin {
    my $str = unpack("B32", pack("N", shift));
    $str =~ s/^0+(?=\d)//;   # otherwise you'll get leading zeros
    return $str;
}
