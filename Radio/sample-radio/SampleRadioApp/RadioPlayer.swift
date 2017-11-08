//
//  RadioPlayer.swift
//  SampleRadioApp
//
//  Created by René Zelad  on 15.01.17.
//  Copyright (c) 2017. All rights reserved.
//

import Foundation
import AVFoundation

class RadioPlayer {
    static let sharedInstance = RadioPlayer()
    fileprivate var player = AVPlayer(url: URL(string: "http://209.126.148.205:8000/stereo100?type=.mp3")!)
    fileprivate var isPlaying = false
    
    func play() {
        player.play()
        isPlaying = true
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }

    func currentlyPlaying() -> Bool {
        return isPlaying
    }
}
