from Bio import SeqIO

First_number = 1

input_file_name = input('输入需要更改ID名称的文件名：')
output_file_name = input('输入输出文件名：')
your_seq_name = input ('输入需要更改的ID前缀：')



files = open(file = output_file_name, mode='w', encoding = 'utf-8')

for pb in SeqIO.parse(input_file_name,'fasta'):
    pb.id = '>' + your_seq_name + f'{First_number}'
    First_number += 1
    ID = pb.id
    files.write(ID+ '\n' )
    Seq = pb.seq
    files.write(str(Seq) + '\n')


