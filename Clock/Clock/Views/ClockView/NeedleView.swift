//
//  NeedleView.swift
//  Clock
//
//  Created by chams on 23/01/2021.
//

import SwiftUI

struct NeedleView: View {
    let proxy: GeometryProxy
    let angle: Angle
    let size: CGSize
    let color: Color
    
    
    var body: some View {
        let radius = min(proxy.size.width / 2, proxy.size.height / 2)
        return Rectangle()
            .fill(color)
            .frame(width: size.width, height: size.height)
            .offset(y: -(radius/2))
            .rotationEffect(angle)
    }
}
struct NeedleView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            NeedleView(proxy: proxy,
                       angle: .degrees(20),
                       size: CGSize(width: 5, height: 20),
                       color: .black)
        }
    }
}
