#!/usr/bin/perl

my %rules = qw(
S	A|B|C|D
A	a|b|c|d
B	aC|bD|test
C	D|De
D	weak
);
my $start = "S";
push(@toresolve,$start);
$complete = 0;
my @unique = ();
while($complete == 0){
	$complete = 1;
	my @newresolve = ();
	foreach my $toresolve (@toresolve){
		#print "Checking [$toresolve] for all lowercase...\n";
		if($toresolve =~ /^[a-z]+$/){
			#print "ADDING $toresolve to final strings list!\n";
			$unique{$toresolve} = 1;
			next;
		}
		#print "Resolving $toresolve...\n";
		my @subs = split(//,$toresolve);
		foreach my $sub (@subs){
			#print "\tChecking $sub...\n";
			foreach my $lrule (keys %rules){
				if($lrule eq $sub){
					#print "\t\t$sub matches rule: $lrule -> $rules{$lrule}\n";
					$complete = 0;
					my @rrules = split(/\|/,$rules{$lrule});
					foreach my $rrule (@rrules){
						#print "\t\t\tApplying rule $rrule...\n";
						my $tmp = $toresolve;
						$tmp =~ s/$sub/$rrule/;
						#print "\t\t\tPushing $tmp to new resolutions\n";
						push(@newresolve,$tmp);
					}
				}
			}
		}		
	}
	@toresolve = @newresolve;
}
#open(FILE,">all_strings.txt");
#foreach my $match (keys %unique){
#	print FILE "$match\n";
#}
#close FILE;
#exit;
while(<>){
	my $line = $_;
	chomp($line);
	if($unique{$line} ne ""){
		print "YES\n";
	} else {
		print "NO\n";
	}
}
