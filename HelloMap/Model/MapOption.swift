//
//  MapOption.swift
//  HelloMap
//
//  Created by Weerawut Chaiyasomboon on 01/04/2568.
//

import Foundation
import MapKit
import SwiftUI

enum MapOption: String, Identifiable, CaseIterable {
    case standard
    case hybrid
    case imagery
    
    var id: Self {
        self
    }
    
    var mapStyle: MapStyle {
        switch self {
        case .standard:
                .standard
        case .hybrid:
                .hybrid
        case .imagery:
                .imagery
        }
    }
}
