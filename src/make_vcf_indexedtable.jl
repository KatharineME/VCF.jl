using CodecZlib: GzipDecompressorStream

using CSV

using Dates

using JuliaDB

using IndexedTables


function make_vcf_indexedtable(vcf_gz_file_path)

    start_time = now()
    
    vcf_file_path = string(Array(split(vcf_gz_file_path, ".gz"))[1])

    if isfile(vcf_file_path) == false
        
        io_gz = open(vcf_gz_file_path)

        io = GzipDecompressorStream(io_gz)

        file = CSV.File(io, comment="##", delim='\t', header=1)

        CSV.write(vcf_file_path, delim='\t', file)

        close(io)

    end
    
    # Check for Dagger file to load
    
    vcf_dagger_file_path = vcf_file_path * ".dagger"
    
    if isfile(vcf_dagger_file_path) == true

        println("Loading Dagger file...\n")
        
        vcf_table = load(vcf_dagger_file_path)
   
        println("Dagger file loaded.")

    # Create table if Dagger file doesn't exist
        
    else

        println("No Dagger file, loading table...\n")
    
        vcf_table = loadtable(
            vcf_file_path,
            delim='\t',
            header_exists=false, 
            colnames=[:CHROM, :POS, :ID, :REF, :ALT, :QUAL, :FILTER, :INFO, :FORMAT, :GERM],
            indexcols=[:CHROM],
        )

        # Remove header row

        n_rows = length(rows(vcf_table))

        vcf_table = vcf_table[2:n_rows]

        # Convert chromosome strings to chromosome numbers

#        chromosomes_string = Array(columns(vcf_table)[1])
#
#        chromosomes_numeric = []
#
#        for item in chromosomes_string
#
#            if 
#
#            parts = split(item, "")
#
#            chromosome_number = parts[length(parts)]
#
#            push!(chromosomes_numeric, parse(Int, chromosome_number))
#
#        end
#
#        vcf_table = IndexedTables.transform(vcf_table, :CHROM => chromosomes_numeric)

        # Convert positions to numbers

        positions_string = Array(columns(vcf_table)[2])

        positions_numeric = []

        for item in positions_string

            push!(positions_numeric, parse(Int, item))

        end

        vcf_table = IndexedTables.transform(vcf_table, :POS => positions_numeric)

        # Reindex

        vcf_table = reindex(vcf_table, (:CHROM, :POS))
        
        # Save Dagger file
        
        save(vcf_table, vcf_dagger_file_path)

        println("Table loaded.")

    end
    
    return vcf_table

    end_time = now()

    println("\nTook $(canonicalize(Dates.CompoundPeriod(end_time - start_time))).\n")

end


export make_vcf_indexedtable
