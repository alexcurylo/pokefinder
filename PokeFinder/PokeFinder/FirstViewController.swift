//
//  FirstViewController.swift
//  PokeFinder
//
//  Created by Alex Curylo on 2016-07-19.
//  Copyright © 2016 Trollwerks Inc. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class FirstViewController: UIViewController, AVAudioPlayerDelegate {

    var backgroundAudioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupSound()
        playSound()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        launchPokemonGo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Sound Stuff
    
    func setupSound() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            // options: AVAudioSessionCategoryOptionMixWithOthers?
        } catch let error as NSError {
            print(error)
        }
        
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "silent", withExtension: "mp3")
        backgroundAudioPlayer = try? AVAudioPlayer(contentsOf: url!)
        backgroundAudioPlayer?.numberOfLoops = -1
    
        backgroundAudioPlayer?.play()
    }
    
    func stopSound() {
        backgroundAudioPlayer?.stop()
        backgroundAudioPlayer = nil
    }
    
    // MARK: - Actions
    
    func launchPokemonGo() {
        let scheme = "com.googleusercontent.apps.848232511240-dmrj3gba506c9svge2p9gq35p1fg654p://"
        let url = URL(string: scheme)

        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.openURL(url!)
        }
    }
    
}

