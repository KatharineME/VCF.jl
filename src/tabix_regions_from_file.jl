include("print_and_run_cmd.jl")

function tabix_regions_from_file(
        bed_file_path::String, 
        vcf_file_path::String,
        output_dir::String
    )
   
    bed_split_file_path = Array(split(bed_file_path, "/"))

    bed_name = split(bed_split_file_path[size(bed_split_file_path)[1]], ".")[1]
    
    output_file_path = joinpath(output_dir, bed_name)
    
    print_and_run_cmd(pipeline(`tabix -R $bed_file_path $vcf_file_path`, output_file_path))
    
end

export tabix_regions_from_file