//
//  ContentView.swift
//  DependenciesTestCase
//
//  Created by Vid Tadel on 11/07/2023.
//

import Dependencies
import MyClient
import SwiftUI
import MyFeature

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
          Text("Hello, world!")
            .onTapGesture {
              Task {
                @Dependency(\.myClient) var client
                await client.call()
              }
            }
          
          withDependencies {
            $0.myClient.call = {
              print("overridden")
            }
          } operation: {
            MyFeature.Test(TestModel())
          }
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
struct ContentView_Preview: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
