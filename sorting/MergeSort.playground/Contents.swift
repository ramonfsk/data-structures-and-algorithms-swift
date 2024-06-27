import Foundation

class MergeSort {
    func sort<T: Comparable>(_ array: [T]) -> [T] { // O(n * logn)
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = self.sort(Array(array[0..<middleIndex]))
        let rightArray = self.sort(Array(array[middleIndex..<array.count]))
        
        return self.merge(leftArray, rightArray)
    }
    
    func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray: [T] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
          }

          while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
          }
        
        return orderedArray
    }
}

let mergeSort = MergeSort()
mergeSort.sort([5, 4, 2, 6, 7, 8, 9, 1, 0])
