//
//  ViewController.swift
//  videoplayer
//
//  Created by mahi  on 15/03/22.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var player : AVPlayer!
    var avPlayerLayer : AVPlayerLayer!
    @IBOutlet weak var videoView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     

               let url = URL(string: "https://api-v2d.ptgenie.com/assets/exercise/Excercise-1642016424.mp4")!
               player = AVPlayer(url: url)
               avPlayerLayer = AVPlayerLayer(player: player)
               videoView.layer.addSublayer(avPlayerLayer)
               playVideo()


           }

           override func viewDidLayoutSubviews() {

               avPlayerLayer.frame = videoView.layer.bounds
           }

           private func playVideo() {
               player.play()

           }


}

