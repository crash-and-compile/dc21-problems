#!C:\strawberry\perl\bin\perl

my $test = shift;
unless($test =~ /^\d+$/){
	print "USAGE: ./gentestcase.pl <TESTCASE#>\n";
	exit;
}
my @things = qw(
Roses
Hackers
PIZZA
J._Edgar_Hoover
12345
The_end_of_the_world
Too_many_secrets
Teachers
Martial_Arts
Apples
BEES_
Brian
Mystery_Challenge!_
Dungeons
Liquor_
Meatloaf_
Maids_
Nepal
Nitrogen_
Thoughts_
LARPing!
Music
PunkAB
Krux
Fish
Treacherous_Leachers
);
open(FILE,">in$test.txt");
for($i = 0; $i < int(rand(10)) + 3; $i++){
	my $select = $things[int(rand(@things))];
	$select =~ s/_/ /g;
	print FILE "$select\n";
}
	
