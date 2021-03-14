using CodecZlib: GzipDecompressorStream
using CSV: File




function make_ndsparse(vcf_gz_file_path::String)

    vcf_ndsparse = loadndsparse(
        joinpath(input_dir, "738_variants.vcf"),
        delim='\t',
        skiplines_begin=261,
        header_exists=false, 
        colnames=[:CHROM, :POS, :ID, :REF, :ALT, :QUAL, :FILTER, :INFO, :FORMAT, :GERM],
        indexcols=[:CHROM, :POS]
        )



end 

export make_ndsparse 
