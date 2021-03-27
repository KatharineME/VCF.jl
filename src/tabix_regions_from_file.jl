using DataFrames
using Dates
using CSV: File


function tabix_regions_from_file(
        bed_file_path::String, 
        vcf_file_path::String,
        output_dir::String
    )

    start_time = now()
    
    println("Checking variants in this file: $bed_file_path\n")
    
    bed_io = open(bed_file_path)

    bed = DataFrame(File(bed_io; delim='\t', header=false))

    println("bed file: \n")

    println(bed)

    println("\n")
    
    close(bed_io)
   
    bed_split_file_path = Array(split(bed_file_path, "/"))

    bed_name = split(bed_split_file_path[size(bed_split_file_path)[1]], ".")[1]
    
    output_file_path = joinpath(output_dir, bed_name)
    
    print_and_run_cmd(pipeline(`tabix -R $bed_file_path $vcf_file_path`, stdout="$output_file_path.tsv"))

    println("\nSaved output at: $output_file_path.tsv")

    end_time = now()
    
    println("\nTook $(canonicalize(Dates.CompoundPeriod(end_time - start_time))).\n")

end

export tabix_regions_from_file
