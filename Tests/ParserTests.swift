import XCTest
import SlackAPI

class ParserTests: XCTestCase {
  func testParseFile() {
    let id = "id"
    let json = ["id": id]
    let file = Parser.parse(json)
    XCTAssertEqual(file.id, id)
  }
}