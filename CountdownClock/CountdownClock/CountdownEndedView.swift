import SwiftUI

struct CountdownEndedView: View {
    @EnvironmentObject private var countdownClock: CountdownClock

    var emojiFontSize: CGFloat {
        let fontHeightRatio = Design.clockFontSize / Design.windowHeight
        let clockFontSize = countdownClock.windowHeight * fontHeightRatio
        return clockFontSize
    }

    var body: some View {
        Text("💥").font(.custom(Design.fontFace, size: emojiFontSize))
    }
}

struct CountdownEndedView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownEndedView().environmentObject(CountdownClock())
    }
}
