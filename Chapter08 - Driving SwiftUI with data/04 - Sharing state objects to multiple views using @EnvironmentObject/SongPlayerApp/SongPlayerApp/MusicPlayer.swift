//
//  MusicPlayer.swift
//  SongPlayerApp
//
//  Created by giordano scalzo on 30/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

class MusicPlayer: ObservableObject {
    @Published
    var currentSong: Song?
    
    var thereIsASong: Bool {
        currentSong != nil
    }
    
    func pressButton(song: Song) {
        if currentSong == song {
            currentSong = nil
        } else {
            currentSong = song
        }
        
    }
    
    func isPlaying(_ song: Song) -> Bool {
        song == currentSong
    }
}
