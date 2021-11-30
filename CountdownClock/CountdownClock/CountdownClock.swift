import Foundation
import SwiftUI

class CountdownClock: NSObject, ObservableObject {
    static let DefaultMinutes = 5
    static let DefaultClockText = "05:00"

    @Published var clockText: String = DefaultClockText
    @Published var minutes: Int = DefaultMinutes
    @Published var windowWidth: CGFloat = Design.windowWidth
    @Published var windowHeight: CGFloat = Design.windowHeight
    @Published var message: String = "Starting Soon"
    @Published var running: Bool = false
    @Published var countdownEnded: Bool = false

    var range: ClosedRange<Int> = 1...60

    private var workItem: DispatchWorkItem? {
        didSet {
            running = workItem != nil
        }
    }
    private var endTime: Date?

    private var remainingSeconds: Int {
        guard let endTime = endTime else {
            return 0
        }
        let now = Date()
        let seconds = Int(endTime.timeIntervalSince(now))
        return seconds
    }

    func toggleCountdown() {
        if let workItem = workItem {
            workItem.cancel()
            self.workItem = nil
            countdownEnded = false
            resetClock()
        } else {
            let endTime = Date().addingTimeInterval(60.0 * Double(minutes))
            self.endTime = endTime
            tick()
        }
    }

    func incrementMinutes(value: Int = 1) {
        let newValue = minutes + value
        if newValue <= range.upperBound {
            minutes = newValue
        } else {
            minutes = range.upperBound
        }
        resetClock()
    }

    func decrementMinutes(value: Int = 1) {
        let newValue = minutes - value
        if newValue >= range.lowerBound {
            minutes = newValue
        } else {
            minutes = range.lowerBound
        }
        resetClock()
    }

    private func resetClock() {
        let remainingSeconds = 60 * minutes
        updateClock(remainingSeconds: remainingSeconds)
    }

    private func updateClock(remainingSeconds: Int) {
        clockText = formatClockText(remainingSeconds: remainingSeconds)
        debugPrint("tick: \(clockText)")
    }

    private func tick() {
        updateClock(remainingSeconds: remainingSeconds)

        if remainingSeconds > 0 {
            // schedule work item to run in 1 second to update clock
            let workItem = DispatchWorkItem {
                self.tick()
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: workItem)
            self.workItem = workItem
        } else {
            countdownEnded = true
        }
    }

    private func leftPad(_ value: Int) -> String {
        value < 10 ? "0\(value)" : "\(value)"
    }

    private func formatClockText(remainingSeconds: Int) -> String {
        // convert to minutes and seconds
        // format as mm:ss
        let minutes = leftPad(remainingSeconds / 60)
        let seconds = leftPad(remainingSeconds % 60)
        let formattedText = "\(minutes):\(seconds)"
        return formattedText
    }

}
