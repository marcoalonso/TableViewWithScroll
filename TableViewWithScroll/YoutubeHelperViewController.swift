//
//  YoutubeHelperViewController.swift
//  TableViewWithScroll
//
//  Created by marco rodriguez on 24/07/22.
//

import UIKit
import youtube_ios_player_helper

class YoutubeHelperViewController: UIViewController, YTPlayerViewDelegate {
    @IBOutlet weak var YTPlayer: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        YTPlayer.delegate = self
        YTPlayer.load(withVideoId: "VVr3wPF5ifY")
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        YTPlayer.playVideo()
    }
    

}
