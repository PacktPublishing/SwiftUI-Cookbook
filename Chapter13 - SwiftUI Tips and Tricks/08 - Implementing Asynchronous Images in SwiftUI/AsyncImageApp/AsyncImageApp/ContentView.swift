//
//  ContentView.swift
//  AsyncImageApp
//
//  Created by giordano scalzo on 07/06/2020.
//  Copyright © 2020 Giordano Scalzo. All rights reserved.
//

import SwiftUI
import Combine

struct Spinner: UIViewRepresentable {
    @Binding
    var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<Spinner>)
        -> UIActivityIndicatorView {
            return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: UIViewRepresentableContext<Spinner>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct AsyncImage: View {
    @ObservedObject
    private var fetcher: ImageFetcher
    private let spinner = Spinner(isAnimating: .constant(true),
                                  style: .large)
    
    init(url: URL) {
        fetcher = ImageFetcher(url: url)
    }
    
    var body: some View {
        image
            .onAppear(perform: fetcher.start)
            .onDisappear(perform: fetcher.stop)
    }
    
    private var image: some View {
        Group {
            if fetcher.image != nil {
                Image(uiImage: fetcher.image!)
                    .resizable()
            } else {
                spinner
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity,
               alignment: .center)
    }
}

class ImageFetcher: ObservableObject {
    @Published
    private(set) var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    func start() {
        cancellable = URLSession(configuration: .default)
            .dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func stop() {
        cancellable?.cancel()
    }
    
    deinit {
        cancellable?.cancel()
    }
}

struct ContentView: View {
    let urls = [
        "Ace-Frehley",
        "Paul-Stanley",
        "Gene-Simmons",
        "Peter-Criss"]
            .map {
                URL(string: "https://www.marshallofrock.com/wp-content/uploads/2011/09/KISS-\($0)-solo-album-cover.jpg")!
    }
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: urls[0])
                    .aspectRatio(contentMode: .fit)
                AsyncImage(url: urls[1])
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                AsyncImage(url: urls[2])
                    .aspectRatio(contentMode: .fit)
                AsyncImage(url: urls[3])
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
