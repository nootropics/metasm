# temporarily put the current file directory in the ruby include path
metasmdir = File.dirname(__FILE__)
if $:.include? metasmdir
	metasmdir = nil
else
	$: << metasmdir
end

# cpu architectures
%w[ia32 mips].each { |f|
	require "metasm/#{f}/render"
	require "metasm/#{f}/parse"
	require "metasm/#{f}/encode"
	require "metasm/#{f}/decode"
}
# executable formats
%w[mz elf_encode elf_decode pe coff_encode coff_decode raw].each { |f|
	require "metasm/exe_format/#{f}"
}

$:.delete metasmdir if metasmdir
