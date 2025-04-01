//
//  MKCoordinateRegion+Ext.swift
//  HelloMap
//
//  Created by Weerawut Chaiyasomboon on 01/04/2568.
//

import Foundation
import MapKit

extension MKCoordinateRegion: @retroactive Equatable {
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        if lhs.center.latitude == rhs.center.latitude &&
            lhs.span.latitudeDelta == rhs.span.latitudeDelta &&
            lhs.span.longitudeDelta == rhs.span.longitudeDelta {
            return true
        } else {
            return false
        }
    }
    
    static var coffee: MKCoordinateRegion {
        MKCoordinateRegion(center: .coffee, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
    static var restuarant: MKCoordinateRegion {
        MKCoordinateRegion(center: .restuarant, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}
