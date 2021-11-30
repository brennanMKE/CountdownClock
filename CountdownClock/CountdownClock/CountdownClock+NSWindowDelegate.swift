import Cocoa
import SwiftUI

extension CountdownClock: NSWindowDelegate {

    func windowWillResize(_ sender: NSWindow, to frameSize: NSSize) -> NSSize {
        let ratio = Design.windowWidth / Design.windowHeight
        let heightChanged = sender.frame.size.height != frameSize.height

        let outFrameSize: NSSize

        if heightChanged {
            outFrameSize = NSSize(width: frameSize.height * ratio, height: frameSize.height)
        } else {
            outFrameSize = NSSize(width: frameSize.width, height: frameSize.width / ratio)
        }

        windowWidth = outFrameSize.width
        windowHeight = outFrameSize.height

        return outFrameSize
    }

}
