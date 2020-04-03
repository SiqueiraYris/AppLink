//
//  Dynamic.swift
//  AppLinkExample
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

public final class Dynamic<T> {
    typealias Listener = (T) -> Void

    private(set) var listener: Listener?
    private(set) var observer: DynamicObserver<T>?

    public var value: T {
        didSet {
            observer?.addValue(value)
            callListener()
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?) {
        self.listener = listener
    }

    func bindAndFire(listener: Listener?) {
        self.listener = listener
        callListener()
    }

    func isBinded() -> Bool {
        return listener != nil
    }

    func setObserver(with observer: DynamicObserver<T>) {
        self.observer = observer
    }

    private func callListener() {
        //Jumping queues https://www.swiftbysundell.com/posts/reducing-flakiness-in-swift-tests
        if Thread.isMainThread {
            listener?(value)
        } else {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
}

public final class DynamicObserver<T> {
    private(set) var values: [T] = []

    func addValue(_ value: T) {
        values.append(value)
    }
}
