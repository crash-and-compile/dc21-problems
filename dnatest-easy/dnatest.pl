#!C:\perl\strawberry\bin\perl


my @left = "";
my @right = "";

my $incnt = 0;
my $ok = 0;
while(<>){
	my $line = $_;
	chomp($line);
	$line =~ s/\r//g;
	#print "[$line]\n";
	if($line eq ""){ next; }
	$l = $line;
	$r = $line;
	$l =~ s/^(.*)([atgc])(.*)$/\2/g;
	$r =~ s/^(.*)([ATGC])(.*)$/\2/g;
	if(($l =~ /g/i)&&($r =~ /c/i)){
		next;
	} elsif(($r =~ /g/i)&&($l =~ /c/i)){
		next;
	} elsif(($l =~ /a/i)&&($r =~ /t/i)){
		next;
	} elsif(($r =~ /a/i)&&($l =~ /t/i)){
		next;
	} else {
		print "NOT OK\n";
		exit;
	}
}	
print "OK\n";
