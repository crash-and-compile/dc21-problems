#!C:\strawberry\perl\bin\perl

my $testcase = shift;
unless($testcase =~ /^\d+$/){
	print "USAGE: ./gentestcase.pl <TESTCASE#>\n";
	exit;
}
open(FILE,">in$testcase.txt");
my $lref = 0;
my $rref = 7;
my $ldir = "r";
my $rdir = "l";
my %rtol = qw(
A	t
T	a
G	c
C	g
);
my @nuc = ("A","T","G","C");
my $result = "";
for(my $i = 0; $i < 100; $i++){
	my $rchoice = $nuc[int(rand(4))];
	my $lchoice = $rtol{$rchoice};
	#print "$lchoice <=> $rchoice\n";
	#print "$lref <=> $rref\n";
	my $l = 0;
	my $r = 0;
	my @line = ();
	for(my $j = 0; $j < 8; $j++){
		if($j == $rref){
			#print "$j] matches $rref\n";
			$line[$rref] = "".$rchoice."";
		}
	}
			if($rdir eq "l") {
				if($rref == 0){
					$rdir = "r";
				} else {
					#print "$rdir] $rref -> ";
					$rref -= 1;
					#print "$rref\n";
				}
			} else {
				if($rref == 7){
					$rdir = "l";
				} else {
					#print "$rdir] $rref -> ";
					$rref += 1;
					#print "$rref\n";
				}
			
			}
	for(my $j = 0; $j < 8; $j++){
		if($j == $lref){
			#print "$j] matches $lref\n";
			$line[$lref] = "". $lchoice ."";
		}
	}

			if($ldir eq "l") {
				if($lref == 0){
					$ldir = "r";
				} else {
					#print "$ldir] $lref -> ";
					$lref -= 1;
					#print "$lref\n";
				}
			} else {
				if($lref == 7){
					$ldir = "l";
				} else {
					#print "$ldir] $lref -> ";
					$lref += 1;
					#print "$lref\n";
				}
			
			}

	my $lineflag = 0;
	for(my $j = 0; $j < 8; $j++){
		if($line[$j] eq ""){
			if($lineflag > 0){
				$line[$j] = "-";
			} else {
				$line[$j] = " ";
			}
		} else {
			$lineflag = ($lineflag + 1) % 2;
		}
		
	}
	foreach my $slot (@line){
		$result .= "$slot";
	}
	$result .= "\n";
}
print FILE "$result\n";
close FILE;