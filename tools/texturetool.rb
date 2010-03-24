#!/usr/bin/env ruby

require 'fileutils'
include FileUtils

prefix = ARGV[0]
infile  = prefix + '.png'
#puts infile
#puts outfile

# 2 bit 
outfile = prefix + '_2.pvr'
todo = 'texturetool -e PVRTC --channel-weighting-perceptual --bits-per-pixel-2 -o' + ' ' + outfile + ' -f PVR ' + infile
puts todo
system("#{todo}")

# 4 bit 
outfile = prefix + '_4.pvr'
todo = 'texturetool -e PVRTC --channel-weighting-perceptual --bits-per-pixel-4 -o' + ' ' + outfile + ' -f PVR ' + infile
puts todo
system("#{todo}")

# 2 bit mipmap
outfile = prefix + '_mip_2.pvr'
todo = 'texturetool -m -e PVRTC --channel-weighting-perceptual --bits-per-pixel-2 -o' + ' ' + outfile + ' -f PVR ' + infile
puts todo
system("#{todo}")

# 4 bit mipmap
outfile = prefix + '_mip_4.pvr'
todo = 'texturetool -m -e PVRTC --channel-weighting-perceptual --bits-per-pixel-4 -o' + ' ' + outfile + ' -f PVR ' + infile
puts todo
system("#{todo}")












