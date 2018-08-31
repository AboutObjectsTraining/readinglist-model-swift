// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest

@testable import ReadingListModel


private let authorDict: JsonDictionary = [Author.Keys.firstName: NSNull(),
                                          Author.Keys.lastName: "Homer"]

private let bookDict: JsonDictionary = [Book.Keys.title: "My Title",
                                        Book.Keys.year: NSNull(),
                                        Book.Keys.author: authorDict]

class BookTests: XCTestCase
{
    func testInitializeBookWithDictionaryContainingNSNulls() {
        print(bookDict)
        let book = Book(dictionary: bookDict)
        print(book)
        
        XCTAssertEqual(book.title, bookDict[Book.Keys.title] as? String)
        XCTAssertEqual(book.year, bookDict[Book.Keys.year] as? String)
        XCTAssertEqual(book.author?.firstName, authorDict[Author.Keys.firstName] as? String)
        XCTAssertEqual(book.author?.lastName, authorDict[Author.Keys.lastName] as? String)
    }
}
