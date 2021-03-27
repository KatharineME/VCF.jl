using Dates
using JuliaDB


function filter_vcf_table(vcf_table, chromosome::Int64, start_position::Int64, end_position::Int64)
    
    start_time = now()
   
    filtered_vcf_table = filter(i -> (i.CHROM == chromosome) && (i.POS > start_position) && (i.POS < end_position), vcf_table) 
    
    return filtered_vcf_table
    
    end_time = now()
    
    println("\nTook $(canonicalize(Dates.CompoundPeriod(end_time - start_time))).\n")
    
end

export filter_vcf_table

