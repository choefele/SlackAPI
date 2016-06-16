//
//  Parsing.swift
//  SlackAPI
//
//  Created by Claus Höfele on 16.06.16.
//
//

import Foundation

class Parser {
    class func parse(json: [String: AnyObject]) -> File? {
        guard let id = json["id"] as? String else {
            return nil
        }
        
        let name = json["name"] as? String
        let title = json["title"] as? String
        let userId = json["user"] as? String
        let createdTimeInterval = json["created"] as? TimeInterval
        let created = createdTimeInterval.flatMap({Date(timeIntervalSince1970: $0)})
        
        let file = File(id: id, name: name, title: title, userId: userId, created: created)
        return file
    }
}
