#!/usr/bin/perl

my $test = shift;
chomp($test);
open(INS,">inputs/in$test");
open(OUTS,">outputs/out$test");
for(my $i = 0; $i < int(rand(20)); $i++){
	my $num = int(rand(10000));
	my $tcnt = 0;
	print "$num\n";
	for(my $j = 0; $j <= $num; $j++){
		my $tmp = $j;
		#print "\t$j -> ";
		$tmp =~ s/[023456789]//g;
		#print "$tmp -> ";
		my @num = split(//,$tmp);
		if($num[0] eq ""){ next; }
		if($num[1] eq ""){
			#print "1\n";
			$tcnt++;
			next;
		}
		my $eq = join("+",@num);
		my $cnt = eval $eq;
		#print "$cnt\n";
		$tcnt += $cnt;
	}
	#print "TOTAL: $tcnt\n";
	print INS "$num\n";
	print OUTS "$tcnt\n";


}
