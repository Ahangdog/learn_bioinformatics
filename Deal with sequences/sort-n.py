import pandas as pd


df = pd.read_table('nowtie_result.sam',header = None)

df_bowtie = df.sort_values(by = [0,2,3])

df_bowtie.to_csv("df_bowtie.txt",sep = "\t",header = None,index = None)


