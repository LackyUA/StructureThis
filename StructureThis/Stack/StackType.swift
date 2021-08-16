//
//  StackType.swift
//  StructureThis
//
//  Created by Dmytro Dobrovolskyy on 16.08.2021.
//

import Foundation

protocol StackType {
    associatedtype Element

    /**
     Return top element without mutating collection.

     # Complexity
     `O(1)`
     */
    var peak: Element? { get }

    /**
     Return `true` if there is no elements inside `Stack`.

     # Complexity
     `O(1)`
     */
    var isEmpty: Bool { get }

    /**
     Method for adding new element to the top of `Stack`.
     - Parameter element: Element which will be added on the top of `Stack`.

     # Complexity
     O(n) in worst case and O(1) in common case. Underneath the hood, Swift arrays are allocated with a predetermined amount of space for its elements. If you try to add new elements to an array that is already at maximum capacity, the Array must restructure itself to make more room for more elements. This is done by copying all the current elements of the array in a new and bigger container in memory. However, this comes at a cost; Each element of the array has to be visited and copied. This means that any insertion, even at the end, could take n steps to complete if a copy is made.
     */
    mutating func push(_ element: Element)

    /**
     Method for getting element from the top of `Stack`. Removing last added element from collection.
     - Returns: Last added element.

     # Complexity
     `O(1)`
     */

    mutating func pop() -> Element?
}
