require_relative './custom_matchers/array_matchers.rb'
require_relative '../quick_sort'

include QuickSort

RSpec.describe 'Quick sort' do
  context 'invalid input' do
    context 'input is nil' do
      let(:arr) { nil }

      it 'raise argument error exception' do
        expect { quick_sort(arr) }.to raise_error ArgumentError
      end
    end

    context 'input is not an array' do
      let(:arr) { 2 }

      it 'raise argument error exception' do
        expect { quick_sort(arr) }.to raise_error ArgumentError
      end
    end
  end

  context 'valid input' do
    context 'empty array' do
      let(:arr) { [] }

      it 'return an empty array' do
        expect(quick_sort(arr)).to eq []
      end
    end

    context 'array with 1 element' do
      let(:arr) { [1] }

      it 'return input array' do
        expect(quick_sort(arr)).to eq arr
      end
    end

    context 'array with 2 elements' do
      let(:arr) { [2, 1] }

      it 'return sorted array' do
        expect(quick_sort(arr)).to eq [1, 2]
      end
    end

    context 'array with more than 2 elements' do
      let(:arr) { [2, 1, 1] }

      it 'return sorted array' do
        expect(quick_sort(arr)).to eq [1, 1, 2]
      end
    end

    context 'increasing array' do
      let(:arr) { [1, 2, 3, 4, 5] }

      it 'return sorted array' do
        expect(quick_sort(arr)).to eq [1, 2, 3, 4, 5]
      end
    end

    context 'decreasing array' do
      let(:arr) { [5, 4, 3, 2, 1] }

      it 'return sorted array' do
        expect(quick_sort(arr)).to eq [1, 2, 3, 4, 5]
      end
    end

    context 'uniform array' do
      let(:arr) { [1, 1, 1, 1, 1] }

      it 'return sorted array' do
        expect(quick_sort(arr)).to eq [1, 1, 1, 1, 1]
      end
    end

    context 'big array' do
      let(:arr) { Array.new(10000) { rand(1..10000) } }

      it 'return sorted array' do
        expect(quick_sort(arr)).to be_monotonically_increasing
      end
    end
  end
end
