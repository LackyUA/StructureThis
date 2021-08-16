//
//  ThreadSafeStack.swift
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
public class ThreadSafeStack<Element>: StackType {

    // MARK: - Private properties

    private var storage: [Element]
    private let queue: DispatchQueue = .init(label: "thread.safe.stack.queue", attributes: .concurrent)

    // MARK: - Public properties

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

    public func push(_ element: Element) {
        queue.async(flags: .barrier) { [unowned self] in
            self.storage.append(element)
        }
    }

    public func pop() -> Element? {
        queue.sync(flags: .barrier) { [unowned self] in
            self.storage.popLast()
        }
    }

}
