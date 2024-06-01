import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(PlayerModel.self) private var player
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        if globalState.showAnim {
            VStack {
                Spacer()
                PlayerView()
                    .onAppear() {
                        if let filePath = Bundle.main.path(forResource: "test", ofType: "mp4") {
                            let fileURL = URL(fileURLWithPath: filePath)
                            let video = Video(id: 1, url: fileURL, title: "Local Video")
                            player.loadVideo(video)
                            player.play()
                        } else {
                            print("Local video file not found.")
                        }
                        
                    }
                Spacer()
            }
        }
        else {
            switch globalState.viewController {
            case "Door":
                DoorView()
                    .environmentObject(globalState)
            case "FloorG":
                FloorGView()
                    .environmentObject(globalState)
            default:
                Text(globalState.viewController)
            }
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(PlayerModel())
        .environmentObject(GlobalState.shared)
}
