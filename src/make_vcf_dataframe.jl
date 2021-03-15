using CodecZlib: GzipDecompressorStream
using CSV: File
using DataFrames: DataFrame, rename

function make_vcf_dataframe(path::String)::DataFrame
    
    io = open(path)

    io2 = GzipDecompressorStream(io)

    df = DataFrame(File(io2; comment="##", delim='\t', header=1))
    
    df = rename(df, ("#CHROM" => "CHROM"))

    close(io)

    return df

end 

export vcf_dataframe 
