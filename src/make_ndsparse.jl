using CodecZlib: GzipDecompressorStream
using CSV
using JuliaDB

function make_ndsparse(vcf_gz_file_path::String)
    
    vcf_file_path = string(Array(split(vcf_gz_file_path, ".gz"))[1])

    if isfile(vcf_file_path) == false
        
        io_gz = open(vcf_gz_file_path)

        io = GzipDecompressorStream(io_gz)

        file = CSV.File(io, comment="##", delim='\t', header=1)

        CSV.write(vcf_file_path, delim='\t', file)

        close(io)

    end
    
    vcf_ndsparse = loadndsparse(
        vcf_file_path,
        delim='\t',
        header_exists=false,  
        colnames=[:CHROM, :POS, :ID, :REF, :ALT, :QUAL, :FILTER, :INFO, :FORMAT, :GERM],
        indexcols=[:CHROM, :POS]
        )
    
    return vcf_ndsparse

end

export make_ndsparse 
