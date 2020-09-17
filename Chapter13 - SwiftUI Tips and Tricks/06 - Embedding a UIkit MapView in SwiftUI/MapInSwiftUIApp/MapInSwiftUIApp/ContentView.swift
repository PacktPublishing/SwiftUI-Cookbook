//
//  ContentView.swift
//  MapInSwiftUIApp
//
//  Created by giordano scalzo on 06/06/2020.
//  Copyright © 2020 Giordano Scalzo. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding
    var center: CLLocationCoordinate2D
    var favorites: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if favorites.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(favorites)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(mapView: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var mapView: MapView
        
        init(mapView: MapView) {
            self.mapView = mapView
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            self.mapView.center = mapView.centerCoordinate
        }
    }
}

struct ContentView: View {
    @State
    private var center = CLLocationCoordinate2D()
    @State
    private var favorites = [MKPointAnnotation]()
    
    private func addFavorite() {
        let place = MKPointAnnotation()
        place.coordinate = center
        favorites.append(place)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                MapView(center: $center, favorites: favorites)
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
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
