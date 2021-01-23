//
//  BarView.swift
//  Clock
//
//  Created by chams on 23/01/2021.
//

import SwiftUI

struct BarView: View {
    var proxy: GeometryProxy
    var rotations: Int
    var size: CGSize
    var color: Color
    
    var body: some View {
        let radius = min(proxy.size.width / 2, proxy.size.height / 2)
        return ForEach(0..<rotations) { i in
            
            Rectangle()
                .fill(color)
                .frame(width: size.width, height: size.height)
                .offset(y: -(radius))
                .rotationEffect(.degrees((360.0 / Double(rotations)) * Double(i)))
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            BarView(proxy: proxy,
                    rotations: 12,
                    size: CGSize(width: 5, height: 20),
                    color: .black)
        }
    }
}
