// The Swift Programming Language
// https://docs.swift.org/swift-book

import Dependencies
import MyClient

extension MyClient: DependencyKey {
  public static var liveValue: MyClient {
    MyClient {
      print("live value!")
    }
  }
}
