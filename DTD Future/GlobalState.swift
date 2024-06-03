
import Foundation
import Combine
import SwiftUI

class GlobalState: ObservableObject {
    static let shared = GlobalState()
    @Published var viewController = "Door"
    @Published var videoName = ""
    @Published var showAnim = false
    @Published var play1Xspeed = false
    private init() {}
}

func updateViewController(_ globalState: GlobalState, view: String, video: String) {
    globalState.viewController = view
    globalState.videoName = video
}

func showAnimToggle(_ globalState: GlobalState) {
    globalState.showAnim = !globalState.showAnim
}
