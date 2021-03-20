using Dates
using JuliaDB


function get_genotype_of_vcf_ndsparse(chromosome_number::Integer, position::Integer)

    start_time = now()

    for value in vcf[chromosome_number, position]
        
        genotype = []
        
        allele_ref = value[:REF]
        
        allele_alt = value[:ALT]
        
        numeric_genotype = split(split(value[:GERM], ":")[1], "/")
        
        if occursin("|", numeric_genotype[1])
            
            numeric_genotype = split(numeric_genotype[1], "|")
            
        end
        
        counter = 1
        
            while counter < 3
            
                if "0" == numeric_genotype[counter]

                    push!(genotype, allele_ref)

                elseif "1" == numeric_genotype[counter]

                    push!(genotype, split(allele_alt, ",")[1])

                elseif "2" == numeric_genotype[counter]

                    push!(genotype, split(allele_alt, ",")[2])
            
                end    
        
            counter += 1
            
            end

        return genotype       
 
end_time = now()

println("\nTook $(canonicalize(Dates.CompoundPeriod(end_time - start_time))).\n")

end


export get_genotype_of_vcf_ndsparse

