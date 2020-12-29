//
//  TaskCellTests.swift
//  ToDoAppWithTestTests
//
//  Created by Rotach Roman on 21.12.2020.
//

import XCTest
@testable import ToDoAppWithTest

class TaskCellTests: XCTestCase {
    
    var cell: TaskCell!
    
    override func setUpWithError() throws {
        let sut = TaskListViewController()
        sut.loadViewIfNeeded()

        let tableView = sut.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as? TaskCell
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
    }
    
    func testCellHasTitleLable() {
        XCTAssertNotNil(cell.titleLabel)
    }
    
//    func testCellHasTitleLabelInContentView() {
//        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
//    }
    
    func testCellHasLocationLable() {
        XCTAssertNotNil(cell.locationLabel)
    }
    
    //    func testCellHasLocationLabelInContentView() {
    //
    //        XCTAssertTrue(cell.location.isDescendant(of: cell.contentView))
    //    }
    
    func testCellHasDateLable() {
        XCTAssertNotNil(cell.dateLabel)
    }
    
//        func testCellHasLocationLabelInContentView() {
//
//            XCTAssertTrue(cell.location.isDescendant(of: cell.contentView))
//        }
//
    func testConfigureSetsTitle() {
        let title = "Foo"
        let task = Task(title: title)
        
        cell.configure(withTask: task)
        
        XCTAssertEqual(cell.titleLabel.text, title)
    }
    
    func testConfigureSetsLocation() {
        let location = Location(name: "Foo")
        let task = Task(title: "Bar", location: location)
        cell.configure(withTask: task)

        XCTAssertEqual(cell.locationLabel.text, location.name)
    }
    
    func testConfigureSetsDate() {
        let task = Task(title: "Foo")
        
        cell.configure(withTask: task)
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = task.date
        let dateString = df.string(from: date)
        
        XCTAssertEqual(cell.dateLabel.text, dateString)
    }
    
    func configureCellWithTask() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task, done: true)
    }
    
    func testDoneTaskSholdStrikeThrough() {
        configureCellWithTask()
        
        let attributedString = NSAttributedString(string: "Foo", attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
    
        XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
    }
    
    func testDoneTaskDateLabelEqualsNil() {
        configureCellWithTask()
        XCTAssertNil(cell.dateLabel)
    }
    
    func testDoneTaskLocationLabelEqualsNil() {
        configureCellWithTask()
        XCTAssertNil(cell.locationLabel)
    }
}

extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
