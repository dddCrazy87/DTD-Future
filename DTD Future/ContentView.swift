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
                        if let filePath = Bundle.main.path(forResource: globalState.videoName, ofType: "mp4") {
                            let fileURL = URL(fileURLWithPath: filePath)
                            let video = Video(id: 1, url: fileURL, title: "Local Video")
                            player.loadVideo(video)
                            player.play()
                        } else {
                            print("Local video file not found.")
                            showAnimToggle(globalState)
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
            case "FloorB1_hobby":
                FloorB1_hobby()
                    .environmentObject(globalState)
            case "FloorB1_cross1":
                FloorB1_cross1()
                    .environmentObject(globalState)
            case "FloorB1_fail_door":
                FloorB1_fail_door()
                    .environmentObject(globalState)
            case "FloorB1_cross2":
                FloorB1_cross2()
                    .environmentObject(globalState)
            case "FloorB1_cross2_right":
                FloorB1_cross2_right()
                    .environmentObject(globalState)
            case "FloorB1_goal":
                FloorB1_goal()
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
