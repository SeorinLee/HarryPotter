//
//
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//
import Foundation

struct BookResponse: Codable {
    let data: [BookData]
}

struct BookData: Codable {
    let attributes: BookAttributes
}

struct BookAttributes: Codable {
    let title: String
    let coverImage: String
    let author: String
    let pages: Int
    let release_date: String
    let dedication: String
    let summary: String
    let wiki: String
    let chapters: [Chapter]
    
}

struct Chapter: Codable {
    let title: String
}

