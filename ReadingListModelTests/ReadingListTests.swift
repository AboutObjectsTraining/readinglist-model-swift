// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest
@testable import ReadingListModel

private let authorDict = [Author.Keys.firstName: "Fred",
                          Author.Keys.lastName: "Smith"]

private let book1Dict: [String: Any] = [Book.Keys.title: "Book One",
                                    Book.Keys.year: "1999",
                                    Book.Keys.author: authorDict]
private let book2Dict: [String: Any] = [Book.Keys.title: "Book Two",
                                    Book.Keys.year: "2001",
                                    Book.Keys.author: authorDict]
private let bookDicts: [[String: Any]] = [book1Dict, book2Dict]

private let readingListDict: [String: Any] = [ReadingList.Keys.title: "Test",
                                              ReadingList.Keys.books: bookDicts]

class ReadingListTests: XCTestCase
{
    func testLoadReadingList() {
        let readingList = ReadingList(dictionary: readingListDict)
        
        XCTAssertEqual(readingListDict[ReadingList.Keys.title] as! String, readingList.title)
        XCTAssertEqual(bookDicts.count, readingList.books.count)
        
        let book1 = readingList.books[0]
        XCTAssertEqual(book1.title, book1Dict[Book.Keys.title] as? String)
        
        let author = book1.author!
        XCTAssertEqual(author.firstName, authorDict[Author.Keys.firstName])
    }
    
    func testDictionaryRepresentation() {
        let readingList = ReadingList(dictionary: readingListDict)
        let rlDict = readingList.dictionaryRepresentation()
        
        let bDicts = rlDict[ReadingList.Keys.books] as? [[String: Any]]
        XCTAssertEqual(bDicts!.count, bookDicts.count)
    }
}
