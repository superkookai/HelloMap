//
//  ContentView.swift
//  HelloMap
//
//  Created by Weerawut Chaiyasomboon on 01/04/2568.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var locationManager: LocationManager = .shared
    @State private var selectedMapOption: MapOption = .standard
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $position) {
                Annotation("Coffee", coordinate: .coffee) {
                    Image(systemName: "cup.and.saucer.fill")
                        .imageScale(.large)
                        .foregroundStyle(.pink)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(.circle)
                }
                
                Annotation("Restaurant", coordinate: .restuarant) {
                    Image(systemName: "fork.knife.circle")
                        .imageScale(.large)
                        .foregroundStyle(.pink)
                }
                
                UserAnnotation()
            }
            .mapStyle(selectedMapOption.mapStyle)
            .onChange(of: locationManager.region) { oldValue, newValue in
                withAnimation {
                    self.position = .region(locationManager.region)
                }
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .mapControlVisibility(.visible)
            
            VStack {
                Spacer()
                
                HStack {
                    Button {
                        withAnimation {
                            self.position = .region(.coffee)
                        }
                    } label: {
                        Text("Coffee")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.brown)
                    
                    Button {
                        withAnimation {
                            self.position = .region(.restuarant)
                        }
                    } label: {
                        Text("Restuarant")
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Picker("Map Option", selection: $selectedMapOption) {
                    ForEach(MapOption.allCases) { option in
                        Text(option.rawValue.capitalized)
                            .tag(option)
                    }
                }
                .pickerStyle(.segmented)
                .background(.white)
                .padding()

            }
        }
    }
}

#Preview {
    ContentView()
}


//            Marker(coordinate: CLLocationCoordinate2D.coffee) {
//                Text("Another Coffee")
//            }
//
//            Marker("Somewhere Home Cafe", coordinate: CLLocationCoordinate2D.restuarant)
