//
//  UILabel+Timer.swift
//  TimeLabel
//
//  Created by Ganesh Waje on 7/4/23.
//

import UIKit

protocol TimerDisplayable {
    var timer: Timer? { get set }
    var startTime: TimeInterval { get set }
    func startTimer()
    func pauseTimer()
    func resumeTimer()
}

extension UILabel: TimerDisplayable {
    var timer: Timer? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.timer) as? Timer }
        set { objc_setAssociatedObject(self, &AssociatedKeys.timer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var startTime: TimeInterval {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.startTime) as? TimeInterval ?? 0 }
        set { objc_setAssociatedObject(self, &AssociatedKeys.startTime, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func startTimer() {
        startTime = Date().timeIntervalSinceReferenceDate
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let currentTime = Date().timeIntervalSinceReferenceDate
            let elapsedTime = currentTime - self.startTime
            let hours = Int(elapsedTime / 3600)
            let minutes = Int((elapsedTime / 60).truncatingRemainder(dividingBy: 60))
            let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
            self.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func resumeTimer() {
        startTimer()
    }
}

private struct AssociatedKeys {
    static var timer = "timer"
    static var startTime = "startTime"
}
