using CSV: File

using DataFrames

using Dates

using Query 


function query_regions(
    regions::Dict,
    vcf::DataFrame,
    output_dir::String,
    )
    
    start_time = now()
    
    for (key, value) in regions

        println(key)

        println(value)

        query = @from i in vcf begin
            @where i.CHROM==key
            @where i.POS==value
            @select {i.CHROM, i.POS, i.REF, i.ALT, i.FORMAT}
            @collect DataFrame

        end

        println("\n")

        println(query)

    end

    end_time = now()

    println("\nTook $(canonicalize(Dates.CompoundPeriod(end_time - start_time))).\n")
    
end

export query_regions
