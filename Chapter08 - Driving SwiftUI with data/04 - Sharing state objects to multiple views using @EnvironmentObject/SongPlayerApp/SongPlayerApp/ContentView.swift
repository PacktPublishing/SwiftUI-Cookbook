//
//  ContentView.swift
//  SongPlayerApp
//
//  Created by giordano scalzo on 30/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct Song: Identifiable, Equatable {
    let id = UUID()
    let artist: String
    let name: String
    let cover: String
}

extension MusicPlayer {
    func buttonImage(for song: Song) -> some View {
        Image(systemName: isPlaying(song) ? "stop" : "play")
        .font(.system(.largeTitle))
        .foregroundColor(.black)
    }
}

struct ContentView: View {
    private let songs: [Song] = [
        .init(artist: "Luke", name: "99", cover: "cover0"),
        .init(artist: "Foxing", name: "No Trespassing", cover: "cover1"),
        .init(artist: "Breaking Benjamin", name: "Phobia", cover: "cover2"),
        .init(artist: "J2", name: "Solenoid", cover: "cover3"),
        .init(artist: "Wildflower Clothing", name: "Lightning Bottles", cover: "cover4"),
        .init(artist: "The Broken Spirits", name: "Rubble", cover: "cover5"),
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                ScrollView {
                    ForEach(self.songs) { song in
                        SongView(song: song)
                    }
                }
                .padding(.horizontal, 24)
                .navigationBarTitle("Music Player")
            }
            
            MiniPlayerView()
                .background(Color.gray)
            .offset(y: 44)
        }
    }
}

struct MiniPlayerView: View {
    @EnvironmentObject
    private var musicPlayer: MusicPlayer
    
    var body: some View {
        VStack {
            if musicPlayer.thereIsASong {
                SongView(song: musicPlayer.currentSong!)
                    .padding(.all, 24)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
    }
}
struct SongView: View {
    @EnvironmentObject
    private var musicPlayer: MusicPlayer
    let song: Song

    var body: some View {
        HStack {
            NavigationLink(destination: PlayerView(song: song)) {
                Image(song.cover)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
            }
            
            VStack(alignment: .leading) {
                Text(song.name)
                Text(song.artist).italic()
            }
            Spacer()
            Button(action: {
                musicPlayer.pressButton(song: song)
            }) {
                musicPlayer.buttonImage(for: song)
            }
        }
    }
}

struct PlayerView: View {
    @EnvironmentObject
    private var musicPlayer: MusicPlayer
    let song: Song
        
    var body: some View {
        VStack {
            Image(song.cover).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
            HStack {
                Text(song.name)
                Text(song.artist).italic()
            }
            Button(action: {
                musicPlayer.pressButton(song: song)
            }) {
                musicPlayer.buttonImage(for: song)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MusicPlayer())
    }
}
