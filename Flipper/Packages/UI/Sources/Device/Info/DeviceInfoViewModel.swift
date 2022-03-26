import Core
import Inject
import Combine
import Bluetooth
import Foundation

@MainActor
class DeviceInfoViewModel: ObservableObject {
    let appState: AppState = .shared
    var disposeBag = DisposeBag()

    @Published var device: Peripheral?
    @Published var deviceInfo: [String: String] = [:]

    init() {
        appState.$device
            .receive(on: DispatchQueue.main)
            .assign(to: \.device, on: self)
            .store(in: &disposeBag)
    }

    func getDeviceInfo() {
        Task {
            deviceInfo = try await RPC.shared.deviceInfo()
        }
    }
}
