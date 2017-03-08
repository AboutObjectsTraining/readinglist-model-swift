// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest
@testable import ReadingListModel

class AuthorTests: XCTestCase
{
    func testAuthorFullName() {
        let unnamedAuthor = Author(dictionary: [:])
        let firstNameOnly = Author(dictionary: [Author.firstNameKey: "Fred"])
        let lastNameOnly = Author(dictionary: [Author.lastNameKey: "Smith"])
        let namedAuthor = Author(dictionary: [Author.firstNameKey: "Fred", Author.lastNameKey: "Smith"])
        
        XCTAssertEqual(unnamedAuthor.fullName, Author.unknown)
        XCTAssertEqual(firstNameOnly.fullName, "Fred")
        XCTAssertEqual(lastNameOnly.fullName, "Smith")
        XCTAssertEqual(namedAuthor.fullName, "Fred Smith")
    }
}
