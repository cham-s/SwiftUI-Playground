//
//  ContentView.swift
//  Clock
//
//  Created by chams on 23/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var hour = 3
    @State private var minute = 17
    @State private var second = 38
    var body: some View {
        VStack {
            ClockView(hour: .init(wrappedValue: hour, maximum: 12) ,
                      minute: .init(wrappedValue: minute, maximum: 60),
                      second: .init(wrappedValue: second, maximum: 66))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
