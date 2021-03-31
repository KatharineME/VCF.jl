using JuliaDB

using Dates


function get_genotype(filtered_vcf_table)

    start_time = now()

    genotypes = []

    for row in filtered_vcf_table

        genotype = []

        allele_ref = row[:REF]

        allele_alt = row[:ALT]

        numeric_genotype = split(split(row[:GERM], ":")[1], "/")

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

        push!(genotypes, genotype)

    end
    
    return genotypes

    end_time = now()

    println("\nTook $(canonicalize(Dates.CompoundPeriod(end_time - start_time))).\n")

end


export get_genotype

