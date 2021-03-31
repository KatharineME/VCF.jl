using CodecZlib: GzipDecompressorStream

using CSV

using JuliaDB

using IndexedTables


function make_vcf_ndsparse(vcf_gz_file_path::String)
    
    start_time = now()

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
        )

    n_rows = length(rows(vcf_ndsparse))

    vcf_ndsparse = vcf_ndsparse[2:n_rows]

    return vcf_ndsparse

    end_time = now()

    println("\nTook $(canonicalize(Dates.CompoundPeriod(end_time - start_time))).\n")

end


export make_vcf_ndsparse 
