// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest

@testable import ReadingListModel


private let authorDict: [String: Any] = [Author.firstNameKey: NSNull(),
                                         Author.lastNameKey: "Homer"]

private let bookDict: [String: Any] = [Book.titleKey: "My Title",
                                       Book.yearKey: NSNull(),
                                       Book.authorKey: authorDict]

class BookTests: XCTestCase
{
    func testInitializeBookWithDictionaryContainingNSNulls() {
        print(bookDict)
        let book = Book(dictionary: bookDict)
        print(book)
        
        XCTAssertEqual(book.title, bookDict[Book.titleKey] as? String)
        XCTAssertEqual(book.year, bookDict[Book.yearKey] as? String)
        XCTAssertEqual(book.author?.firstName, authorDict[Author.firstNameKey] as? String)
        XCTAssertEqual(book.author?.lastName, authorDict[Author.lastNameKey] as? String)
    }
}
