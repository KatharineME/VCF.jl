using CodecZlib: GzipDecompressorStream
using CSV: File
using DataFrames: DataFrame, rename

function read_vcf(path::String)::DataFrame
    
    io = open(path)

    io2 = GzipDecompressorStream(io)

    df = DataFrame(File(io2; comment="##", delim='\t', header=1))
    
    rename(df, ("#CHROM" => "CHROM"))

    close(io)

    return df

end 

export read_vcf
