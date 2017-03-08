// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest
@testable import ReadingListModel

private let authorDict = [Author.firstNameKey: "Fred",
                          Author.lastNameKey: "Smith"]

private let book1Dict: [String: Any] = [Book.titleKey: "Book One",
                                    Book.yearKey: "1999",
                                    Book.authorKey: authorDict]
private let book2Dict: [String: Any] = [Book.titleKey: "Book Two",
                                    Book.yearKey: "2001",
                                    Book.authorKey: authorDict]
private let bookDicts: [[String: Any]] = [book1Dict, book2Dict]

private let readingListDict: [String: Any] = [ReadingList.titleKey: "Test",
                                              ReadingList.booksKey: bookDicts]

class ReadingListTests: XCTestCase
{
    func testLoadReadingList() {
        let readingList = ReadingList(dictionary: readingListDict)
        
        XCTAssertEqual(readingListDict[ReadingList.titleKey] as! String, readingList.title)
        XCTAssertEqual(bookDicts.count, readingList.books.count)
        
        let book1 = readingList.books[0]
        XCTAssertEqual(book1.title, book1Dict[Book.titleKey] as? String)
        
        let author = book1.author!
        XCTAssertEqual(author.firstName, authorDict[Author.firstNameKey])
    }
    
    func testDictionaryRepresentation() {
        let readingList = ReadingList(dictionary: readingListDict)
        let rlDict = readingList.dictionaryRepresentation()
        
        let bDicts = rlDict[ReadingList.booksKey] as? [[String: Any]]
        XCTAssertEqual(bDicts!.count, bookDicts.count)
    }
}
