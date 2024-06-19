#!C:\perl\strawberry\bin\perl


my @left = "";
my @right = "";

my $incnt = 0;
while(<>){
	my $line = $_;
	chomp($line);
	$l = $line;
	$r = $line;
	$l =~ s/^(.*)([atgc])(.*)$/\2/g;
	$r =~ s/^(.*)([ATGC])(.*)$/\2/g;
	push(@left,$l);
	push(@right,$r);
}	
my $lf = join("",@left);
my $rf = join("",@right);
my $rlf = join("",reverse @left);
my $rrf = join("",reverse @right);
if(($lf =~ /ATTTAG/)||($rf =~ /ATTTAG/)||($rlf =~ /ATTTAG/)||($rrf =~ /ATTTAG/)||
($lf =~ /atttag/)||($rf =~ /atttag/)||($rlf =~ /atttag/)||($rrf =~ /atttag/)){
	print "THIS PERSON IS AN ASSHAT!\n";
} else {
	print "THIS PERSON IS NOT AN ASSHAT!\n";
}