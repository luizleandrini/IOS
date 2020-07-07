//
//  TrailerViewController.swift
//  TrailerFlix
//
//  Created by Luiz Guilherme on 07/07/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit
import AVKit

class TrailerViewController: UIViewController {
    @IBOutlet weak var imageViewTrailer: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var viTrailer: UIView!
    
    var trailer: Trailer!
    var player: AVPlayer!
    var playerController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        preparePlayer()

    }
    
    func prepareView(){
        lbTitle.text = trailer.title
        lbYear.text = "\(trailer.year)"
        var rating = "Ainda nao avaliado"
        if trailer.rating > 0 {
            rating = ""
            for _ in 1...trailer.rating{
                rating += "☆"
            }
        }
        lbRating.text = rating
        imageViewTrailer.image = UIImage(named: trailer.poster + "-large")
    }
    func preparePlayer(){
        let url = URL(fileURLWithPath: trailer.url)
        player = AVPlayer(url: url)
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = true
        playerController.player?.play()
        playerController.view.frame = viTrailer.bounds
        viTrailer.addSubview(playerController.view)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
