// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest
@testable import ReadingListModel

private let authorDict1: [String: Any] = [Author.Keys.firstName: "Fred",
                                          Author.Keys.lastName: "Smith"]
private let authorDict2: [String: Any] = [Author.Keys.firstName: "Fred",
                                          Author.Keys.lastName: NSNull()]

class AuthorTests: XCTestCase
{
    func testAuthorFullName() {
        let unnamedAuthor = Author(dictionary: [:])
        let firstNameOnly = Author(dictionary: [Author.Keys.firstName: "Fred"])
        let lastNameOnly = Author(dictionary: [Author.Keys.lastName: "Smith"])
        let namedAuthor = Author(dictionary: [Author.Keys.firstName: "Fred", Author.Keys.lastName: "Smith"])
        
        XCTAssertEqual(unnamedAuthor.fullName, Author.unknown)
        XCTAssertEqual(firstNameOnly.fullName, "Fred")
        XCTAssertEqual(lastNameOnly.fullName, "Smith")
        XCTAssertEqual(namedAuthor.fullName, "Fred Smith")
    }
}
