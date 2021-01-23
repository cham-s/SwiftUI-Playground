//
//  ClockView.swift
//  Clock
//
//  Created by chams on 23/01/2021.
//

import SwiftUI


struct ClockView: View {
    
    @Clamping(maximum: 12) var hour: Int
    @Clamping(maximum: 60) var minute: Int
    @Clamping(maximum: 60) var second: Int
    
    private var hourAngle: Angle {
        Angle(degrees: 360.0 / Double(Self.maxHour) * Double(hour))
    }
    
    private var minuteAngle: Angle {
        Angle(degrees: 360.0 / Double(Self.maxMinute) * Double(minute))
    }
    
    private var secondAngle: Angle {
        Angle(degrees: 360.0 / Double(Self.maxSecond) * Double(second))
    }
    
    var body: some View {
        GeometryReader { proxy in
            let radius = min(proxy.size.width / 2, proxy.size.height / 2)
            ZStack {
                Circle()
                MinuteBar(proxy: proxy, rotations: 60,
                        size: CGSize(width: 3, height: 10),
                        color: .red)
                HourBar(proxy: proxy, rotations: 12,
                        size: CGSize(width: 5, height: 20),
                        color: .blue)
                // hour: type alias instead?
                HourNeedle(proxy: proxy,
                       angle: hourAngle,
                       size: CGSize(width: 8, height: radius),
                       color: .black)
                    .scaleEffect(y: 0.70)
                
                // seconds
                SecondNeedle(proxy: proxy,
                       angle: secondAngle,
                       size: CGSize(width: 3, height: radius),
                       color: .red)
                    .scaleEffect(y: 0.90)
                
                // minutes
                MinuteNeedle(proxy: proxy,
                       angle: minuteAngle,
                       size: CGSize(width: 5, height: radius),
                       color: .blue)
            }
        }
        .padding()
    }
    
    static private var maxHour = 12
    static private var maxMinute = 60
    static private var maxSecond = 60
    
   
}

extension ClockView {
    @propertyWrapper struct Clamping {
        private var maximum: Int
        private var number: Int
        
        var wrappedValue: Int {
            get { return number }
            set { number = min(newValue, maximum) }
        }
        
        init(wrappedValue: Int, maximum: Int) {
            self.maximum = maximum
            number = min(wrappedValue, maximum)
        }
        
        init(maximum: Int) {
            number = 0
            self.maximum = maximum
        }
    }
}

extension ClockView {
    typealias HourNeedle = NeedleView
    typealias MinuteNeedle = NeedleView
    typealias SecondNeedle = NeedleView
    
    typealias MinuteBar = BarView
    typealias HourBar = BarView
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
