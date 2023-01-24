#!/usr/bin/perl 

# 地一个文件是基因组文件  第二个是bowtie 输出结果
# 将基因组保存为哈希
%genome = ();

open REF,"<$ARGV[0]";
open INFO,"<$ARGV[1]";
open OUT,">$ARGV[2]";


while ($id = <REF>){
    chomp($id);
    chomp($seq = <REF>);
    $genome{$id} = $seq;
};

@key = sort keys %genome;
@value = values %genome;

# print "@key\n";


# 读取bowtie结果
while (<INFO>){
    chomp;
    @line = split /\s+/,$_;
    push @miR_name,">".$line[0];
    push @chrome,">". $line[2];
    push @start,$line[3];
};

#print "@chrome\n";
#print "@start\n";


# 提取miRNA上下150bp

$fir = 0;
$st = 150;

# $ while (){
foreach(@chrome){
    if (exists $genome{$chrome[$fir]}){
        $beg = $start[$fir]-$st;
        $fra = substr($genome{$chrome[$fir]},$beg,300);   
        print OUT "$miR_name[$fir]\n";
        print OUT "$fra\n";
    }else{
        print "false\n";
    }
    $fir += 1;
}









