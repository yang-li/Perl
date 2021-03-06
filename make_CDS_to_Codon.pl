use warnings;  
use strict;  
my $dna='cgacgtcttcgtacgggactagctcgtgtcggtcgc';  
my $protein=' ';  
my $codon;  
=cut 
for(my $i=0; $i<(length($dna)-2);$i+=3)  
{  
    $codon=substr($dna,$i,3);  
    $protein.=codon2aa($codon);  
}  
print "I translated the DNA\n\n$dna\n\n into the protein\n\n$protein\n\n";  
exit;  
=cut
  
my	$out_out = "result.txt";
open  my $out, '>', $out_out or die  "failed open$!\n";

my	$in_in = "a&b_result.txt";
open  my $in, '<', $in_in or die "cannot open\n";
while(<$in>)
{
	chomp;
	my $line1=$_;
	my $dna=<$in>;
	chomp($dna);
	my $protein=' ';
	for (my $i=0;$i<(length($dna)-2);$i+=3)
	{
		my $codon=substr($dna,$i,3);
		my $a=codon2aa($codon);
		$protein="$protein"."$a";
	}
	print $out "$line1\n$protein\n";
}
close  $in;

close  $out;
  
#*****************************************************************************************8  
# codon2aa     
#     
# A subroutine to translate a DNA 3-character codon to an amino acid     
#   Version 3, using hash lookup     
     
sub codon2aa     
{     
    my($codon) = @_;     
     
    $codon = uc $codon;#uc=uppercase;lc=lowercase    
                   #也就是大小写转换，uc表示将所有的小写 转换为大写    
               #lc将所有的大写转换为小写    
      
    my(%genetic_code) = (     
         
    'TCA' => 'S',    # Serine     
    'TCC' => 'S',    # Serine     
    'TCG' => 'S',    # Serine     
    'TCT' => 'S',    # Serine     
    'TTC' => 'F',    # Phenylalanine     
    'TTT' => 'F',    # Phenylalanine     
    'TTA' => 'L',    # Leucine     
    'TTG' => 'L',    # Leucine     
    'TAC' => 'Y',    # Tyrosine      
    'TAT' => 'Y',    # Tyrosine     
    'TAA' => '_',    # Stop     
    'TAG' => '_',    # Stop     
    'TGC' => 'C',    # Cysteine     
    'TGT' => 'C',    # Cysteine     
    'TGA' => '_',    # Stop     
    'TGG' => 'W',    # Tryptophan     
    'CTA' => 'L',    # Leucine     
    'CTC' => 'L',    # Leucine     
    'CTG' => 'L',    # Leucine     
    'CTT' => 'L',    # Leucine     
    'CCA' => 'P',    # Proline     
    'CCC' => 'P',    # Proline     
    'CCG' => 'P',    # Proline     
    'CCT' => 'P',    # Proline     
    'CAC' => 'H',    # Histidine     
    'CAT' => 'H',    # Histidine     
    'CAA' => 'Q',    # Glutamine     
    'CAG' => 'Q',    # Glutamine     
    'CGA' => 'R',    # Arginine     
    'CGC' => 'R',    # Arginine     
    'CGG' => 'R',    # Arginine     
    'CGT' => 'R',    # Arginine     
    'ATA' => 'I',    # Isoleucine     
    'ATC' => 'I',    # Isoleucine     
    'ATT' => 'I',    # Isoleucine     
    'ATG' => 'M',    # Methionine     
    'ACA' => 'T',    # Threonine     
    'ACC' => 'T',    # Threonine     
    'ACG' => 'T',    # Threonine     
    'ACT' => 'T',    # Threonine     
    'AAC' => 'N',    # Asparagine     
    'AAT' => 'N',    # Asparagine     
    'AAA' => 'K',    # Lysine     
    'AAG' => 'K',    # Lysine     
    'AGC' => 'S',    # Serine     
    'AGT' => 'S',    # Serine     
    'AGA' => 'R',    # Arginine     
    'AGG' => 'R',    # Arginine     
    'GTA' => 'V',    # Valine     
    'GTC' => 'V',    # Valine     
    'GTG' => 'V',    # Valine     
    'GTT' => 'V',    # Valine     
    'GCA' => 'A',    # Alanine     
    'GCC' => 'A',    # Alanine     
    'GCG' => 'A',    # Alanine     
    'GCT' => 'A',    # Alanine         
    'GAC' => 'D',    # Aspartic Acid     
    'GAT' => 'D',    # Aspartic Acid     
    'GAA' => 'E',    # Glutamic Acid     
    'GAG' => 'E',    # Glutamic Acid     
    'GGA' => 'G',    # Glycine     
    'GGC' => 'G',    # Glycine     
    'GGG' => 'G',    # Glycine     
    'GGT' => 'G',    # Glycine     
    );     
     
    if(exists $genetic_code{$codon})     
    {     
        return $genetic_code{$codon};     
    }    
    else    
    {     
     
            print STDERR "Bad codon \"$codon\"!!\n";     
            exit;     
    }     
}   
  
#*****************************************************************************************  
