//
//  DataService.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import Foundation

class DataService {
    
    static let shared = DataService()  // 싱글톤 패턴 (앱 내에서 하나만 사용)
    
    private init() { }
    
    // JSON 파일에서 책 정보를 읽어와서 BookAttributes 배열로 반환하는 함수
    func fetchBooks() -> [BookAttributes] {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            print("data.json 파일을 찾을 수 없습니다.")
            return []
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(BookResponse.self, from: data)
            return response.data.map { $0.attributes }
        } catch {
            print("JSON 파싱 실패: \(error)")
            return []
        }
    }

}

