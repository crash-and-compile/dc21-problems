#!C:\strawberry\perl\bin\perl

my $testcase = shift;
my $word = shift;
unless($testcase =~ /^\d+$/){
	print "USAGE: ./gentestcase.pl <TESTCASE#>\n";
	exit;
}

my %char2binary = qw(
a	00001
b	00010
c	00011
d	00100
e	00101
f	00110
g	00111
h	01000
i	01001
j	01010
k	01011
l	01100
m	01101
n	01110
o	01111
p	10000
q	10001
r	10010
s	10011
t	10100
u	10101
v	10110
w	10111
x	11000
y	11001
z	11010	
);

open(FILE,">inputs/in$testcase");
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
my @one = ("G","C");
my @zero = ("A","T");
my $result = "";
my @word = split(//,$word);
my $binary = "";
foreach my $letter (@word){
	$letter = lc $letter;
	my $bin = $char2binary{$letter};
	$binary .= $bin;
	print "$letter -> $bin\n";
}
print $binary;
print "\n" ;
my @binary = split(//,$binary);

foreach my $binary (@binary){

	my $rchoice = $zero[int(rand(2))];
	if($binary == 1){
		$rchoice = $one[int(rand(2))];
	}
	my $lchoice = $rtol{$rchoice};
	print "$binary   $lchoice <=> $rchoice\n";
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
print "________________________________\n$result\n";
print FILE "$result\n";
close FILE;


