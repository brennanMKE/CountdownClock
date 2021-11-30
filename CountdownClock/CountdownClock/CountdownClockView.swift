import SwiftUI

struct CountdownClockView: View {
    @EnvironmentObject private var countdownClock: CountdownClock

    var minutes: String {
        return "\(countdownClock.minutes)"
    }

    var backgroundColor: Color {
        Color("Background")
    }

    var textColor: Color {
        Color("Text")
    }

    var transparent: Color {
        Color("Transparent")
    }

    var clockFontSize: CGFloat {
        let fontHeightRatio = Design.clockFontSize / Design.windowHeight
        let clockFontSize = countdownClock.windowHeight * fontHeightRatio
        return clockFontSize
    }

    var messageFontSize: CGFloat {
        let fontHeightRatio = Design.messageFontSize / Design.windowHeight
        let clockFontSize = countdownClock.windowHeight * fontHeightRatio
        return clockFontSize
    }

    let frameWidth: CGFloat = Design.windowWidth
    let frameHeight: CGFloat = Design.windowHeight
    let padding: CGFloat = Design.padding

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(transparent)
                    .background(backgroundColor)
                Text(countdownClock.clockText)
                    .fontWeight(.bold)
                    .font(.custom(Design.fontFace, size: clockFontSize))
                    .padding(40)
                    .minimumScaleFactor(0.3)
                    .foregroundColor(textColor)
                    .background(transparent)

                if !countdownClock.running {
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                self.countdownClock.incrementMinutes(value: 5)
                            }) {
                                Text("⬆ ⬆")
                            }
                            Button(action: {
                                self.countdownClock.incrementMinutes()
                            }) {
                                Text(" ⬆ ")
                            }
                            Button(action: {
                                self.countdownClock.decrementMinutes()
                            }) {
                                Text(" ⬇ ")
                            }
                            Button(action: {
                                self.countdownClock.decrementMinutes(value: 5)
                            }) {
                                Text("⬇ ⬇")
                            }
                        }
                        .padding()
                    }
                    VStack {
                        Spacer()
                        TextField("countdown message", text: $countdownClock.message)
                            .frame(width: countdownClock.windowWidth * 0.8)
                            .multilineTextAlignment(.center)
                        Text("Tap to Start and Stop")
                    }
                    .padding()
                } else {
                    VStack {
                        Spacer()
                        Text(countdownClock.message)
                            .font(.custom(Design.fontFace, size: messageFontSize))
                            .minimumScaleFactor(0.3)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }

                if countdownClock.countdownEnded {
                    CountdownEndedView().environmentObject(countdownClock)
                }
            }
            .onTapGesture {
                self.countdownClock.toggleCountdown()
            }
        }
    }
}

struct CountdownClockView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownClockView().environmentObject(CountdownClock())
    }
}
