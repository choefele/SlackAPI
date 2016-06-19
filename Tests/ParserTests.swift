//
//  SlackAPITests.swift
//  SlackAPITests
//
//  Created by Claus Höfele on 18.06.16.
//  Copyright © 2016 Claus Höfele. All rights reserved.
//

import XCTest
import SlackAPI

class SlackAPITests: XCTestCase {
    var filesResponseJSON = [String: AnyObject]()
    
    override func setUp() {
        super.setUp()
        
        guard let path = Bundle(for: SlackAPITests.self).pathForResource("files", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let JSON = try? JSONSerialization.jsonObject(with: data),
            let filesResponseJSON = JSON as? [String: AnyObject]
            else {
                XCTFail()
                return
        }
        
        self.filesResponseJSON = filesResponseJSON
    }
    
    func testParseFile() {
        guard let filesJSON = filesResponseJSON["files"] as? [[String: AnyObject]] else {
            XCTFail()
            return
        }
        
        let file = Parser.parseFile(JSON: filesJSON[0])
        XCTAssertEqual(file?.id, "F1J2KA3PU")
        XCTAssertEqual(file?.name, "aryVNJLGQxPoI.gif")
        XCTAssertEqual(file?.title, "Xcode Extension")
        XCTAssertEqual(file?.userId, "U0G27AA7N")
//        XCTAssertEqual(file?.created, "F1J2KA3PU")
    }
    
    func testParseFiles() {
        guard let filesJSON = filesResponseJSON["files"] as? [[String: AnyObject]] else {
            XCTFail()
            return
        }
        
        let files = Parser.parseFiles(JSON: filesJSON)
        XCTAssertEqual(files?.count, 10)
    }

    func testParsePage() {
        guard let pageJSON = filesResponseJSON["paging"] as? [String: AnyObject] else {
            XCTFail()
            return
        }
        
        let page = Parser.parsePage(JSON: pageJSON)
        XCTAssertEqual(page?.count, 10)
        XCTAssertEqual(page?.total, 360)
        XCTAssertEqual(page?.currentPage, 1)
        XCTAssertEqual(page?.pages, 36)
    }
}
