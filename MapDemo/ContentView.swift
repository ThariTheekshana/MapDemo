//
//  ContentView.swift
//  MapDemo
//
//  Created by Tharindu Theekshana on 2024-10-10.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    let mall = CLLocationCoordinate2D(
        latitude: 6.9273346036735095,
        longitude: 79.84469086808554)
    
    let kingsbury = CLLocationCoordinate2D(
        latitude: 6.933154336838785,
        longitude: 79.84198596817673)
    
    let portCity = CLLocationCoordinate2D(
        latitude: 6.938560735812872,
        longitude: 79.83641893452644)
    
    @State var camera: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $camera) {
            
            // can change annotation color, shape...., image
//            Marker("One Gall Face",
//                   systemImage: "building.2.crop.circle.fill",
//                   coordinate: mall).tint(.yellow)
            
            Annotation("One Gall Face Mall", coordinate: mall) {
                Image(systemName:
                    "building.fill")
                        .font(.title)
                        .foregroundColor(.yellow).background(.white).padding()
            }
            
            Annotation("Kingsbury Hotel", coordinate: kingsbury) {
                Image(systemName: "building.columns.fill")
                    .font(.title)
                    .foregroundColor(.red)
                    .background(.white)
                    .padding()
            }
            
            Annotation("Port City", coordinate: portCity) {
                Image(systemName: "beach.umbrella.fill")
                    .font(.title)
                    .foregroundColor(.blue)
                    .background(.white)
                    .padding()
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                Button {
                    // Center on OGF
                    camera = .region(
                        MKCoordinateRegion(
                            center: mall, latitudinalMeters: 200, longitudinalMeters: 200))
                } label : {
                    Text("OGF").fontWeight(Font.Weight.bold)
                }
                .padding(.horizontal)
                Spacer(minLength: 20)
                Button {
                    // Center on Kingsbury
                    camera = .region(
                        MKCoordinateRegion(
                            center: kingsbury, latitudinalMeters: 200, longitudinalMeters: 200))
                } label : {
                    Text("Kingsbury").fontWeight(Font.Weight.bold)
                }
                .padding(.horizontal)
                Spacer(minLength: 20)
                Button {
                    // Center on OGF
                    camera = .region(
                        MKCoordinateRegion(
                            center: portCity, latitudinalMeters: 200, longitudinalMeters: 200))
                } label : {
                    Text("Port City").fontWeight(Font.Weight.bold)
                }
                Spacer()
            }
            .padding(.top)
            .background(.thinMaterial)
        }
        .mapStyle(.standard)
    }
}

#Preview {
    ContentView()
}



