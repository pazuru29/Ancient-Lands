//
//  AppConfiguration.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 02.04.2024.
//

import SwiftUI

public class Defaults: ObservableObject {
    @AppStorage("isFirstTime") public var isFirstTime = true
    
    public static let shared = Defaults()
}

@propertyWrapper
public struct AppConfiguration<T>: DynamicProperty {
    @ObservedObject private var defaults: Defaults
    private let keyPath: ReferenceWritableKeyPath<Defaults, T>
    public init(_ keyPath: ReferenceWritableKeyPath<Defaults, T>, defaults: Defaults = .shared) {
        self.keyPath = keyPath
        self.defaults = defaults
    }

    public var wrappedValue: T {
        get { defaults[keyPath: keyPath] }
        nonmutating set { defaults[keyPath: keyPath] = newValue }
    }

    public var projectedValue: Binding<T> {
        Binding(
            get: { defaults[keyPath: keyPath] },
            set: { value in
                defaults[keyPath: keyPath] = value
            }
        )
    }
}
