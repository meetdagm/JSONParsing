
//
//  Course.swift
//  JSONParsing
//
//  Created by Dagmawi Nadew-Assefa on 2/1/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import Foundation


struct Website: Decodable {
    
    let name: String
    let description: String
    let courses: [Course]
    
}

struct Course: Decodable{
    let id: Int
    let name: String
    let link: String
    let imageUrl : String
}


class CourseManager {
    
    private static let instance = CourseManager()
    
    static var shared: CourseManager {
        
        return instance
    }
    
    private init() {}
    
    var courses = [Course]()
    
    func getProducts(completionHandler: @escaping (Bool) -> ()) {

        let json_string = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: json_string) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if err == nil {
                guard let data = data else {return}
                do {
                    self.courses = try JSONDecoder().decode([Course].self, from: data)
                    completionHandler(true)
                }catch _{
                    completionHandler(false)
                }
                
            }
        }.resume()
    }
    
}
