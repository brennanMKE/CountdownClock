import SwiftUI

@main
struct CountdownClockApp: App {
    var body: some Scene {
        WindowGroup {
            CountdownClockView().environmentObject(CountdownClock())
        }
    }
}
