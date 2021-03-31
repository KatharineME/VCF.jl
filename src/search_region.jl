using JuliaDB

using Dates

include("get_genotype.jl")

include("filter_vcf_table.jl")


function search_region(vcf_dagger_file_path, chromosome, start_position::Int64, end_position::Int64)
    
    start_time = now()
    
    if isfile(vcf_dagger_file_path) == false
        
        println("Dagger file doesnt exist, fist make_vcf_indexedtable.")
    
    elseif isfile(vcf_dagger_file_path) == true

        vcf_table = load(vcf_dagger_file_path)
   
        println("Dagger file loaded.")
        
    end
    
    vcf_table_filtered = filter_vcf_table(vcf_table, chromosome, start_position, end_position)
    
    genotypes = get_genotype(vcf_table_filtered)
    
    vcf_table_filtered_gt = transform(vcf_table_filtered, :GT => genotypes)
    
    cols = columns(vcf_table_filtered_gt)

    vcf_table_filtered_gt_cut = table(cols[1], cols[2], cols[4], cols[5], cols[11], names = [:CHROM, :POS, :REF, :ALT, :GT])

    return vcf_table_filtered_gt_cut
    
    end_time = now()

    println("\nTook $(canonicalize(Dates.CompoundPeriod(end_time - start_time))).\n")

end


export search_region
