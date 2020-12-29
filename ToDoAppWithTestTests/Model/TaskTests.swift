//
//  TaskTests.swift
//  ToDoAppWithTestTests
//
//  Created by Rotach Roman on 12.12.2020.
//

import XCTest
@testable import ToDoAppWithTest

class TaskTests: XCTestCase {
    
    func testInitTaskWithTitle(){
        let task = Task(title: "Foo")
        
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAnddescription() {
        let task = Task(title: "Foo", description: "Bar")
        XCTAssertNotNil(task)
    }
    
    func testWhenGivenTitleSetsTitle(){
        let task = Task(title: "Foo")
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testWhenGivenDescriptionSetsDescription() {
        let task = Task(title: "Foo", description: "Bar")
        XCTAssertEqual(task.description, "Bar")
    }
    
    func testWhenGivenNilDescriptionSetsTitle(){
        let task = Task(title: "Foo")
        XCTAssertNil(task.description)
    }
    
    func testTaskInitWithDate() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task.date)
    }
    
    func testWhenGivenLocationSetsLocation(){
        let location = Location(name: "Foo")
        let task = Task(title: "Bar", description: "Baz", location: location)
        XCTAssertEqual(location, task.location)
    }
    
    func testWhenGivenNilLocationSetsLocation(){
        let task = Task(title: "Bar", description: "Baz")
        XCTAssertNil(task.location)
    }
    
}
