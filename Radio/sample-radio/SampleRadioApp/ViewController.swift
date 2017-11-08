//
//  ViewController.swift
//  SampleRadioApp
//
//  Created by René Zelada on 15/01/17.
//  Copyright (c) 2017. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NSClassFromString("MPNowPlayingInfoCenter") != nil {
//            let image:UIImage = UIImage(named: "logo_player_background")!
//            let albumArt = MPMediaItemArtwork(image: image)
            let songInfo = [
                MPMediaItemPropertyTitle: "Radio Brasov",
                MPMediaItemPropertyArtist: "87,8fm",
//                MPMediaItemPropertyArtwork: albumArt
            ]
            MPNowPlayingInfoCenter.default().nowPlayingInfo = songInfo
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            UIApplication.shared.beginReceivingRemoteControlEvents()
            print("Receiving remote control events\n")
        } catch {
            print("Audio Session error.\n")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        toggle()
    }

    func toggle() {
        if RadioPlayer.sharedInstance.currentlyPlaying() {
            pauseRadio()
        } else {
            playRadio()
        }
    }
    
    func playRadio() {
        RadioPlayer.sharedInstance.play()
        playButton.setTitle("Pause radio", for: UIControlState())
    }
    
    func pauseRadio() {
        RadioPlayer.sharedInstance.pause()
        playButton.setTitle("Play radio", for: UIControlState())
    }
}

