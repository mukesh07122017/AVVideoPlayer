//
//  VideoPlayer.swift
//  videoplayer
//
//  Created by mahi  on 15/03/22.
//

import UIKit
import AVKit

class VideoPlayer: UIView {
    
    @IBOutlet weak var vwPlayer: UIView!
        var player: AVPlayer?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }

    fileprivate func commonInit() {
           let viewFromXib = Bundle.main.loadNibNamed("VideoPlayer", owner: self, options: nil)![0] as! UIView
           viewFromXib.frame = self.bounds
           addSubview(viewFromXib)
           addPlayerToView(self.vwPlayer)
       }
       
       fileprivate func addPlayerToView(_ view: UIView) {
           player = AVPlayer()
           let playerLayer = AVPlayerLayer(player: player)
           playerLayer.frame = self.bounds
           playerLayer.videoGravity = .resizeAspectFill
           view.layer.addSublayer(playerLayer)
           NotificationCenter.default.addObserver(self, selector: #selector(playerEndPlay), name: .AVPlayerItemDidPlayToEndTime, object: nil)
       }
       
       func playVideoWithFileName(_ fileName: String, ofType type:String) {
           guard let filePath = Bundle.main.path(forResource: fileName, ofType: type) else { return }
           let videoURL = URL(fileURLWithPath: filePath)
           let playerItem = AVPlayerItem(url: videoURL)
           player?.replaceCurrentItem(with: playerItem)
           player?.play()
       }
       
       @objc func playerEndPlay() {
           print("Player ends playing video")
       }
    
  
    
    
    

}
