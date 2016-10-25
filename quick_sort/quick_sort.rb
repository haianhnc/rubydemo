module QuickSort
  def quick_sort(arr)
    throw ArgumentError unless arr.kind_of?(Array)
    return arr if arr.length < 2

    pivot = arr.sample

    # Not optimized in terms of performance but good for language demo
    arr1 = arr.select { |e| e < pivot }
    arr2 = arr.select { |e| e == pivot }
    arr3 = arr.select { |e| e > pivot }

    quick_sort(arr1) + arr2 + quick_sort(arr3)
  end
end
