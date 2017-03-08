// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation
import XCTest

@testable import ReadingListModel
import Foundation

class AuthorTests: XCTestCase
{
    func testAuthorFullName() {
        let unnamedAuthor = Author(dictionary: [:])
        let firstNameOnly = Author(dictionary: [Author.firstNameKey: "Fred"])
        let lastNameOnly = Author(dictionary: [Author.lastNameKey: "Smith"])
        let namedAuthor = Author(dictionary: [Author.firstNameKey: "Fred", Author.lastNameKey: "Smith"])
        
        XCTAssertEqual(Author.unknown, unnamedAuthor.fullName)
        XCTAssertEqual("Fred", firstNameOnly.fullName)
        XCTAssertEqual("Smith", lastNameOnly.fullName)
        XCTAssertEqual("Fred Smith", namedAuthor.fullName)
    }
}
