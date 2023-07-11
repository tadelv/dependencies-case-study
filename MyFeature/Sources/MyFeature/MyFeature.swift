// The Swift Programming Language
// https://docs.swift.org/swift-book

import Dependencies
import SwiftUI
import MyClient

public class TestModel: ObservableObject {
  public init() {}
  
  @Dependency(\.myClient) var client
  
  func test() async {
    await client.call()
  }
}

public struct Test: View {
  @ObservedObject private var model: TestModel
  public init(_ model: TestModel) {
    self._model = ObservedObject(initialValue: model)
  }
  
  public var body: some View {
    Text("Hello")
      .onTapGesture {
        Task {
          await model.test()
        }
      }
  }
}

struct TestProvider: PreviewProvider {
  static var previews: some View {
    Test(TestModel())
  }
}
