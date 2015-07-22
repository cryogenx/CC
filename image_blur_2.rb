class Image
	attr_accessor :image
	def initialize(image)
		@image = image
	end

	def output_image
		@image.each do |row|
			row.each do |column|
				print column, ' '
			end
			print "\n"
		end
	end

	def transform
		ones = find_ones
		@image.each_with_index do |row, i|
			row.each_with_index do |column, j|
				if ones.include?([i, j])
					@image[i-1][j] = 1 unless i == 0
					@image[i+1][j] = 1 unless i == (@image.length - 1)
					@image[i][j-1] = 1 unless j == 0
					@image[i][j+1] = 1 unless j == (row.length - 1)
				end
			end
		end
	end

	def find_ones
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
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.transform
image.output_image