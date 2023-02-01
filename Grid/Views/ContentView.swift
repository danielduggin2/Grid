//
//  ContentView.swift
//  Grid
//
//  Created by Daniel Wade Duggin on 2/1/23.
//
import SwiftUI
import AVKit

struct VideoPlayer: View {
    var videoName: String

    var body: some View {
        VideoPlayerRepresentable(videoName: videoName)
            .frame(width: 160, height: 250)
            .cornerRadius(30)
            //.background(Color("AccentColor"))
            .onTapGesture {
                let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: self.videoName, ofType: "mp4")!))
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                UIApplication.shared.windows.first?.rootViewController?.present(playerViewController, animated: true) {
                    player.play()
                }
            }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("AccentColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView(.horizontal) {
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        ForEach(1...2, id: \.self) { videoNumber in
                            VideoPlayer(videoName: "video\(videoNumber)")
                        }
                    }
                    HStack(spacing: 20) {
                        ForEach(3...4, id: \.self) { videoNumber in
                            VideoPlayer(videoName: "video\(videoNumber)")
                        }
                    }.padding(20)
                    HStack(spacing: 20) {
                        ForEach(5...6, id: \.self) { videoNumber in
                            VideoPlayer(videoName: "video\(videoNumber)")
                        }
                    }
                }
            }
        }
    }
}


struct VideoPlayerRepresentable: UIViewRepresentable {
    var videoName: String

    func makeUIView(context: Context) -> UIView {
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: videoName, ofType: "mp4")!))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: 160, height: 250)
        player.play()
        
        let wrapperView = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 250))
        wrapperView.layer.addSublayer(playerLayer)
        
        return wrapperView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
