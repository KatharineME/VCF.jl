module VCFTool

include("filter_vcf_table.jl")

include("get_genotype.jl")

include("print_and_run_cmd.jl")

include("make_vcf_dataframe.jl")

include("make_vcf_indexedtable.jl")

include("make_vcf_ndsparse.jl")

include("search_region_with_julia.jl")

include("tabix_regions_from_file.jl")

include("query_regions.jl")

end
