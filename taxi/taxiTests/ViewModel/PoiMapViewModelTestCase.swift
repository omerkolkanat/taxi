//
//  PoiMapViewModelTestCase.swift
//  taxiTests
//
//  Created by OMER YASIN KOLKANAT on 9.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

import XCTest
@testable import taxi

class PoiMapViewModelTestCase: XCTestCase {
    var viewModel: PoiMapViewModel?
    var expectation: XCTestExpectation?
    
    func testReloadPois() {
        expectation = self.expectation(description: "fetchPois")
        viewModel = PoiMapViewModel()

        viewModel?.stateChangeHandler = handleStateChange
        viewModel?.errorHandler = handleError
        
        let point1 = CLLocationCoordinate2DMake(53.694865, 9.757589)
        let point2 = CLLocationCoordinate2DMake(53.394655, 10.099891)
        
        self.viewModel?.fetchPois(point1: point1, point2: point2)
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Timeout after 5 seconds")
        }
    }
    func handleStateChange(change: PoiListState.Change) {
        switch change {
        case .poiListReloaded:
            XCTAssert(((viewModel?.state.pois) != nil), "poi list must not be nil")
            expectation?.fulfill()
        }
    }
    func handleError(error: PoiListState.Exception) {
        switch error {
        case .fetchFailed:
            XCTAssertNil(error)
            expectation?.fulfill()
        }
    }

}
