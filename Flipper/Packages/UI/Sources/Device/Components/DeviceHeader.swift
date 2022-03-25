import Core
import SwiftUI

struct DeviceHeader: View {
    var device: Peripheral?

    var body: some View {
        VStack {
            if let device = device {
                DeviceInfoHeader(device: device)
                    .padding(.top, 4)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 14)
            } else {
                NoDeviceHeader()
                    .padding(.top, 4)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 14)
            }
        }
        .frame(height: 116)
        .frame(maxWidth: .infinity)
        .background(Color.a1)
    }
}

struct NoDeviceHeader: View {
    var body: some View {
        HStack(spacing: 18) {
            Image("FlipperNoDevice")
                .resizable()
                .scaledToFit()

            VStack(alignment: .center, spacing: 6) {
                Text("No Device")
                    .font(.system(size: 16, weight: .bold))
            }
        }
    }
}

struct DeviceInfoHeader: View {
    let device: Peripheral

    var flipperImage: String {
        device.color == .black
            ? "FlipperBlack"
            : "FlipperWhite"
    }

    var batteryColor: Color {
        guard let battery = device.battery else {
            return .clear
        }
        switch battery.decimalValue * 100 {
        case 0..<20: return .sRed
        case 20..<50: return .sYellow
        case 50...100: return .sGreen
        default: return .clear
        }
    }

    var body: some View {
        HStack(spacing: 18) {
            Image(flipperImage)
                .resizable()
                .scaledToFit()

            VStack(alignment: .center, spacing: 6) {
                Text(device.name)
                    .font(.system(size: 16, weight: .bold))

                Text("Flipper Zero")
                    .font(.system(size: 12, weight: .medium))

                HStack(alignment: .top, spacing: 5.5) {
                    if let battery = device.battery {
                        ZStack(alignment: .topLeading) {
                            Image("Battery")

                            RoundedRectangle(cornerRadius: 1)
                                .frame(
                                    width: 23.96 * battery.decimalValue,
                                    height: 8.87)
                                .padding(.top, 2.53)
                                .padding(.leading, 2.66)
                                .foregroundColor(batteryColor)
                        }
                    }

                    Text("\(device.battery?.level ?? 0)%")
                        .font(.system(size: 12, weight: .medium))
                        .opacity(device.battery == nil ? 0 : 1)
                }
                .padding(.top, 3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}