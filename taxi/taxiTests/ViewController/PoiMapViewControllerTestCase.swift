//
//  PoiMapViewControllerTestCase.swift
//  taxiTests
//
//  Created by OMER YASIN KOLKANAT on 18.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

import XCTest
@testable import taxi


class PoiMapViewControllerTestCase: XCTestCase {

    var mapViewController: PoiMapViewController!
    var poi: Poi?
    
    override func setUp() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        poi = Poi(dictionary: ["id": 10, "coordinate": ["lat": 2212.000, "lon": 2212.000], "fleetType": "TAXI", "heading": 123])
        if let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController") as? PoiMapViewController {
            mapViewController = vc
            mapViewController.poi = poi
            mapViewController.loadView()
            mapViewController.viewDidLoad()
        }
    }
    
    func testMapViewModel() {
        XCTAssertNotNil(poi)
    }
    
    func testMapViewDelegateIsSet() {
        XCTAssertNotNil(mapViewController.mapView.delegate)
    }
    
    func testMapViewLocateMeButton() {
        mapViewController.locateMeButtonTapped(self)
        XCTAssertNotNil(mapViewController.mapView.region)
    }
    
    override func tearDown() {
        mapViewController.viewWillDisappear(true)
    }

}
