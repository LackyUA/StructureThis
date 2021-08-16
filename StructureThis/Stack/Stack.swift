//
//  Stack.swift
//  StructureThis
//
//  Created by Dmytro Dobrovolskyy on 16.08.2021.
//

import Foundation

/**
 Abstract data type that serves as a collection of elements which stacked on top of each other.

 # Structure type
 Last in, last out. `(LIFO)`
 */
public struct Stack<Element>: StackType {

    // MARK: - Properties

    private var storage: [Element]

    public var peak: Element? {
        storage.last
    }

    public var isEmpty: Bool {
        peak == nil
    }

    // MARK: - Lifecycle

    public init(_ elements: [Element] = []) {
        storage = elements
    }

    // MARK: - Behaviour

    public mutating func push(_ element: Element) {
        storage.append(element)
    }

    public mutating func pop() -> Element? {
        storage.popLast()
    }

}
