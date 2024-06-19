#!C:\perl\strawberry\bin\perl


my @left = "";
my @right = "";

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
my %bin2char = reverse %char2binary;

my $incnt = 0;
my @binary = ();
while(<>){
	my $line = $_;
	chomp($line);
	if($line =~ /[at]/i){
		push(@binary,"0");
	} else {
		push(@binary,"1");
	}
}	
my $binary = join("",@binary);
$binary =~ s/([01][01][01][01][01])/$1 /g;
my @tokens = split(/ /,$binary);
my $answer = "";
foreach my $token (@tokens){
	$answer .= $bin2char{$token};
}
$answer =~ s/ //g;
$answer = uc $answer;
print "$answer\n";
