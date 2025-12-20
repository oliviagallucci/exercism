=begin
Write your code for the 'Book Store' exercise in this file. Make the tests in
`book_store_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/book-store` directory.
=end

class BookStore
	PRICE_PER_BOOK = 8.0
	DISCOUNTS = {
		1 => 0.00,
		2 => 0.05,
		3 => 0.10,
		4 => 0.20,
		5 => 0.25
	}.freeze

	def self.calculate_price(basket)
		counts = counts_from(basket)
		memo = {}
		minimal_price(counts, memo)
	end

	class << self
		private

		def counts_from(basket)
			return [] if basket.nil? || basket.empty?

			# Count occurrences of each book id (1..5). Titles beyond 5 are ignored.
			tally = Array.new(5, 0)
			basket.each do |id|
				idx = id.to_i - 1
				tally[idx] += 1 if idx.between?(0, 4)
			end
			# Remove zeros and sort descending to canonicalize the state
			tally.reject(&:zero?).sort.reverse
		end

		def group_price(size)
			discount = DISCOUNTS[size] || 0.0
			size * PRICE_PER_BOOK * (1.0 - discount)
		end

		def minimal_price(counts, memo)
			# Canonical form: remove zeros and sort descending
			state = counts.reject(&:zero?).sort.reverse
			return 0.0 if state.empty?

			key = state.freeze
			return memo[key] if memo.key?(key)

			max_set = [state.length, 5].min
			best = Float::INFINITY

			# Try building a set of size s (1..max_set). Explore all to find global optimum.
			1.upto(max_set) do |s|
				next_state = state.dup
				# Decrement the s largest counts (canonical choice among symmetric titles)
				s.times { |i| next_state[i] -= 1 }
				cost = group_price(s) + minimal_price(next_state, memo)
				best = cost if cost < best
			end

			memo[key] = best
		end
	end
end
