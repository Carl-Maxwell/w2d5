require 'rspec'
require "rspec_exercises"

describe Array do

  describe "#my_uniq" do
    subject(:test_array) { [1, 2, 1, 3, 3] }

    it "returns the unique elements, in the order they first appeared" do
      expect(test_array.my_uniq).to eq([1, 2, 3])
    end
  end

  subject(:two_sum_test_arr) { [-1, 0, 2, -2, 1] }
  describe "#two_sum" do
    it "finds all pairs of positions where the elements at those positions sum to zero" do
      expect(two_sum_test_arr.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  subject(:median_arr) { [1, 2, 3, 4, 5, 6, 7] }
  describe "#median" do
    it "finds the median of a given array of integers" do
      expect(median_arr.median).to eq(4)
    end

  end



end
