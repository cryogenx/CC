class Image
	attr_accessor :image

	def initialize(array)
		@image = array
	end

	def output_image
		@image.each do |row|
			row.each do |column|
			print column, ' '
		end
			puts "\n"
		end
	end

	def blur(distance)
		# loop through it times distance
		# get the new ones for each loop
		# this surrounds the ones at each loop with new ones
		distance.times do
			ones = get_ones
			@image.each_with_index do |row, i|
				row.each_with_index do |cell, j|
					if ones.include?([i, j])
						@image[i-1][j] = 1 unless i == 0
						@image[i+1][j] = 1 unless i == (@image.length - 1)
						@image[i][j-1] = 1 unless j == 0
						@image[i][j+1] = 1 unless j == (row.length - 1)
					end
				end
			end
		end
	end

	def get_ones
		ones = []
		@image.each_with_index do |row, i|
			row.each_with_index do |cell, j|
				if cell == 1
					ones << [i, j]				
				end
			end
		end
		ones
	end
end

image = Image.new([
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
])

# ENTER BLUR DISTANCE BELOW
image.blur(2)
puts "---"
image.output_image
puts "---"
