
import Foundation
import Combine
import SwiftUI

class GlobalState: ObservableObject {
    static let shared = GlobalState()
    @Published var viewController = "Door"
    @Published var showAnim = false
    private init() {}
}

func updateViewController(_ globalState: GlobalState, newValue: String) {
    globalState.viewController = newValue
}

func showAnimToggle(_ globalState: GlobalState) {
    globalState.showAnim = !globalState.showAnim
}
