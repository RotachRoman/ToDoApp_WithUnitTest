//
//  LocationTests.swift
//  ToDoAppWithTestTests
//
//  Created by Rotach Roman on 15.12.2020.
//

import XCTest
import CoreLocation
@testable import ToDoAppWithTest

class LocationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitSetsLocationWithName(){
        let name = "Foo"
        let location = Location(name: name)
        
        XCTAssertEqual(location.name, name)
    }
    
    func testInitSetsCoordinateLatitude(){
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "Foo", coordinate: coordinate)
        XCTAssertEqual(coordinate.latitude, location.coordinate?.latitude)
    }
    
    func testInitSetsCoordinateLongitude(){
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "Foo", coordinate: coordinate)
        XCTAssertEqual(coordinate.longitude, location.coordinate?.longitude)
    }

}
