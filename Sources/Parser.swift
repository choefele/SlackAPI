//
//  Parsing.swift
//  SlackAPI
//
//  Created by Claus Höfele on 16.06.16.
//
//

import Foundation

public class Parser {
    public class func parseFile(JSON: [String: AnyObject]) -> File? {
        guard let id = JSON["id"] as? String else {
            return nil
        }
        
        let name = JSON["name"] as? String
        let title = JSON["title"] as? String
        let userId = JSON["user"] as? String
        let createdTimeInterval = JSON["created"] as? TimeInterval
        let created = createdTimeInterval.flatMap({Date(timeIntervalSince1970: $0)})
        
        let file = File(id: id, name: name, title: title, userId: userId, created: created)
        return file
    }

    public class func parseFiles(JSON: [[String: AnyObject]]) -> [File]? {
        var files = [File]()
        
        for jsonFile in JSON {
            guard let file = Parser.parseFile(JSON: jsonFile) else {
                continue
            }
            files.append(file)
        }
        
        return files.count > 0 ? files : nil
    }

    public class func parsePage<T>(JSON: [String: AnyObject], elements: [T]) -> Page<T>? {
        guard let totalNumberOfElements = JSON["total"] as? Int,
            let index = JSON["page"] as? Int,
            let totalNumberOfPages = JSON["pages"] as? Int else {
            return nil
        }

        let page = Page(elements: elements, index: index, totalNumberOfElements: totalNumberOfElements, totalNumberOfPages: totalNumberOfPages)
        return page
    }
}
