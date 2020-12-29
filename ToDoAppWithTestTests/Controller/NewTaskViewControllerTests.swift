//
//  NewTaskViewControllerTests.swift
//  ToDoAppWithTestTests
//
//  Created by Rotach Roman on 26.12.2020.
//

import XCTest
import CoreLocation
@testable import ToDoAppWithTest

class NewTaskViewControllerTests: XCTestCase {
    
    var sut: NewTaskViewController!
    var placemark: MockCLPlacemark!

    override func setUpWithError() throws {
        sut = NewTaskViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
    }
    
    func testTitleTextFieldNotNil(){
        XCTAssertNotNil(sut.titleTextField)
    }
    
    func testHasTitleTextField(){
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.view))
    }
    
    func testLocationTextFieldNotNil(){
        XCTAssertNotNil(sut.locationTextField)
    }
    
    func testHasLocationTextField(){
        XCTAssertTrue(sut.locationTextField.isDescendant(of: sut.view))
    }
    
    func testDateTextFieldNotNil(){
        XCTAssertNotNil(sut.dateTextField)
    }
    
    func testHasDateTextField(){
        XCTAssertTrue(sut.dateTextField.isDescendant(of: sut.view))
    }
    
    func testAdressTextFieldNotNil(){
        XCTAssertNotNil(sut.adressTextField)
    }
    
    func testHasAdressTextFieldNotNil(){
        XCTAssertTrue(sut.adressTextField.isDescendant(of: sut.view))
    }
    
    func testDescriptionTextFieldNotNil(){
        XCTAssertNotNil(sut.descriptionTextField)
    }
    
    func testHasDescriptionTextFieldNotNil(){
        XCTAssertTrue(sut.descriptionTextField.isDescendant(of: sut.view))
    }
    
    func testSaveButtondNotNil(){
        XCTAssertNotNil(sut.saveButton)
        }
        
    func testHasSaveButtonNotNil(){
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func testSaveUsesGeocoderToConvertCoordinateFromAdress() {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = df.date(from: "01.10.19")
        
        sut.titleTextField.text = "Foo"
        sut.locationTextField.text = "Bar"
        sut.dateTextField.text = "01.10.19"
        sut.adressTextField.text =  "Moscow"
        sut.descriptionTextField.text = "Baz"
        
        sut.taskManager = TaskManager()
        let mockGeocoder = MockCLGeocoder()
        sut.geocoder = mockGeocoder
        sut.save()
        
        let coordinate = CLLocationCoordinate2D(latitude: 55.755, longitude: 37.6173)
        let location = Location(name: "Bar", coordinate: coordinate)
        let generatedTask = Task(title: "Foo", description: "Baz", date: date, location: location)
        
        placemark = MockCLPlacemark()
        placemark.mockCoordinate = coordinate
        mockGeocoder.completionHandler?([placemark], nil)
        
        let task = sut.taskManager.task(at: 0)
        
        XCTAssertEqual(task, generatedTask) 
    }
    
    func testSaveButtonHasSaveMethod() {
        let saveButton = sut.saveButton
        guard let action = saveButton?.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail()
            return
        }
        XCTAssertTrue(action.contains("save"))
    }
    
    func testGeocoderFetchesCorrectCoordinate() {
        let geocoderAnswer = expectation(description: "Geocoder answer")
        let addressString = "Москва"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            let placemark = placemarks?.first
            let location = placemark?.location
            guard
                let latitude = location?.coordinate.latitude,
                let longitude  = location?.coordinate.longitude
            else {
                XCTFail()
                return
            }
            XCTAssertEqual(latitude, 55.7615902)
            XCTAssertEqual(longitude, 37.60946)
            geocoderAnswer.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}

extension NewTaskViewControllerTests {
    class MockCLGeocoder: CLGeocoder {
        
        var completionHandler: CLGeocodeCompletionHandler?
        
        override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler
        }
    }
    
    class MockCLPlacemark: CLPlacemark {
        
        var mockCoordinate : CLLocationCoordinate2D!
        
        override var location: CLLocation? {
            return CLLocation(latitude: mockCoordinate.latitude, longitude: mockCoordinate.longitude)
        }
    }
}
