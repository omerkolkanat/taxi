//
//  MapViewModel.swift
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 9.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

import Foundation

struct PoiListState {
    var pois: [Poi]?
    
    enum Change {
        case poiListReloaded
    }
    
    enum Exception: Error {
        case fetchFailed
    }
}

fileprivate extension PoiListState {
    mutating func reload(with newPois: [Poi]) -> Change {
        pois = newPois
        
        return .poiListReloaded
    }
}

// MARK: - View Model
class PoiMapViewModel {
    var stateChangeHandler: ((PoiListState.Change) -> Void)?
    var errorHandler: ((PoiListState.Exception ) -> Void)?
    private(set) var state = PoiListState()
    
    /**
     Fetches all POIs with given coordinates.
     - Parameter point1: The point at the top-right corner of the map
     - Parameter point2: The point at the bottom-left corner of the map
     */
    func fetchPois(point1: CLLocationCoordinate2D, point2: CLLocationCoordinate2D) {
        NetworkManager.fetchPoiList(withPoint1: point1, point2: point2) { [weak self] (poiModel, success) in
            guard let strongSelf = self else { return }
            if let poiList = poiModel as? [Poi] {                
                strongSelf.stateChangeHandler?(strongSelf.state.reload(with: poiList))
            } else {
                strongSelf.errorHandler?(.fetchFailed)
            }
        }
    }
}
