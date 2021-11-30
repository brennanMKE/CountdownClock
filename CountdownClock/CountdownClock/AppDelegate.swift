import Cocoa
import SwiftUI

/*
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var countdownClock = CountdownClock()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = CountdownClockView().environmentObject(countdownClock)

        let styleMask: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView, .borderless]
        let contentRect = NSRect(x: 0, y: 0, width: countdownClock.windowWidth, height: countdownClock.windowHeight)

        // Create the window and set the content view.
        window = NSWindow(contentRect: contentRect,
                          styleMask: styleMask,
                          backing: .buffered,
                          defer: false)
        window.delegate = countdownClock
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }

    @IBAction func toggleCountdown(sender: Any) {
        countdownClock.toggleCountdown()
    }
}
*/
