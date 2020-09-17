//
//  ContentView.swift
//  MapInSwiftUIApp
//
//  Created by giordano scalzo on 17/09/2020.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State
    private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 54.4609,
                                       longitude: -3.0886),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    @State private var locations: [Location] = []
    
    private func addFavorite() {
        locations.append(Location(coordinate: region.center))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region,
                    annotationItems: locations) {
                    MapPin(coordinate: $0.coordinate,
                           tint: .blue)
                }
                .edgesIgnoringSafeArea(.all)
                Image(systemName: "viewfinder")
                    .font(.system(size: 32, weight: .regular))
                    .foregroundColor(.blue)
            }
            .navigationBarTitle("My Favorite Places", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: addFavorite) {
                                        Image(systemName: "plus")
                                            .font(.headline)
                                    })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
