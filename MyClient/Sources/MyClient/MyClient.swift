// The Swift Programming Language
// https://docs.swift.org/swift-book

import Dependencies

public struct MyClient {
  public init(call: @escaping () async -> Void) {
    self.call = call
  }
  
  public var call: () async -> Void
}

extension MyClient: TestDependencyKey {
  public static var testValue: MyClient {
    MyClient {
      print("test value")
    }
  }

  public static var previewValue: MyClient {
    MyClient {
      print("preview value")
    }
  }
}

public extension DependencyValues {
  var myClient: MyClient {
    get { self[MyClient.self] }
    set { self[MyClient.self] = newValue }
  }
}
