=begin
Write your code for the 'Spiral Matrix' exercise in this file. Make the tests in
`spiraL_matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/spiral-matrix` directory.
=end
class SpiralMatrix
	def initialize(size)
		@size = size
		@matrix = build_matrix
	end

	def matrix
		@matrix
	end

	private

	def build_matrix
		return [] if @size.zero?

		m = Array.new(@size) { Array.new(@size) }

		top = 0
		bottom = @size - 1
		left = 0
		right = @size - 1
		num = 1

		while left <= right && top <= bottom
			(left..right).each do |col|
				m[top][col] = num
				num += 1
			end
			top += 1

			(top..bottom).each do |row|
				m[row][right] = num
				num += 1
			end
			right -= 1

			if top <= bottom
				right.downto(left).each do |col|
					m[bottom][col] = num
					num += 1
				end
				bottom -= 1
			end

			if left <= right
				bottom.downto(top).each do |row|
					m[row][left] = num
					num += 1
				end
				left += 1
			end
		end

		m
	end
end
