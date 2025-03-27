//
//  TimerModel.swift
//  watchers Watch App
//
//  Created by Cameron Slaughter on 3/26/25.
//

import Foundation

struct TimerModel {
    var timer: Int
    var timeTitle: String {
        return "\(timer)"
    }
    
    var unit: TimerUnit
    var unitTitle: String {
        if timer > 1 { return unit.plural() }
        return unit.rawValue
    }
    
    init(timer: Int, unit: TimerUnit) {
        if timer >= 60 {
            self.timer = timer / 60
            self.unit = .hr
        } else {
            self.timer = timer
            self.unit = unit
        }
    }
    
    static func allTimerValues() -> [TimerModel] {
        return [
            TimerModel(timer: 25, unit: .min),
            TimerModel(timer: 35, unit: .min),
            TimerModel(timer: 1, unit: .hr),
            TimerModel(timer: 2, unit: .hr)
        ]
    }
    enum TimerUnit: String {
        case min = "MIN"
        case hr = "HR"
        
        func plural() -> String {
            switch self {
            case .min:
                return "MINS"
            case .hr:
                return "HRS"
            }
        }
    }
}
