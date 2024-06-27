import Foundation

class QuickSort {
    func quicksort<T: Comparable>(_ a: [T]) -> [T] { // O(n * logn)
      guard a.count > 1 else { return a }

      let pivot = a[a.count/2]
      let less = a.filter { $0 < pivot }
      let equal = a.filter { $0 == pivot }
      let greater = a.filter { $0 > pivot }

      return quicksort(less) + equal + quicksort(greater)
    }
}

let quickSort = QuickSort()
quickSort.quicksort([5, 4, 2, 6, 7, 8, 9, 1, 0])
