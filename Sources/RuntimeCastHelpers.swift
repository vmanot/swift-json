//
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation
import Swift

internal func cast<T, U>(_ value: T, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) throws -> U {
    return try (value as? U).unwrapOrThrow(JSONRuntimeError.invalidTypeCast(from: type(of: value), to: U.self))
}

internal func castIfNotNil<T, U>(_ value: T?, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) throws -> U? {
    guard let value = value else {
        return nil
    }
    return try (value as? U).unwrapOrThrow(JSONRuntimeError.invalidTypeCast(from: type(of: value), to: U.self))
}

internal func castIfNotNil<T, U>(_ value: T??, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) throws -> U? {
    guard let value = value.flatMap({ $0 }) else {
        return nil
    }
    return try (value as? U).unwrapOrThrow(JSONRuntimeError.invalidTypeCast(from: type(of: value), to: U.self))
}
