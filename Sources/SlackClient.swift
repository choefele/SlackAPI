//
//  SlackClient.swift
//  SlackAPI
//
//  Created by Claus Höfele on 16.06.16.
//
//

import Foundation

private let SLACK_API = "https://slack.com/api"

public class SlackClient {
    private let session = URLSession(configuration: URLSessionConfiguration.default())
    private let token: String
    
    public init(token: String) {
        self.token = token
    }
    
    public func listFiles(to: Date = Date(), pageIndex: Int = 1, completionHandler: (Page<File>?) -> Void) {
        let types = "all"
        let count = 100
        let apiURL = URL(string: SLACK_API + "/files.list?token=\(token)&types=\(types)&count=\(count)&page=\(pageIndex)&ts_to=\(to.timeIntervalSince1970)")!
        let dataTask = session.dataTask(with: apiURL) { (data, response, error) in
            if let _ = error {
                completionHandler(nil)
                return
            }
            
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data),
                let jsonDictionary = jsonObject as? [String: AnyObject],
                let jsonFiles = jsonDictionary["files"] as? [[String: AnyObject]],
                let files = Parser.parseFiles(JSON: jsonFiles),
                let jsonPage = jsonDictionary["paging"] as? [String: AnyObject],
                let page = Parser.parsePage(JSON: jsonPage, elements: files) else {
                completionHandler(nil)
                return
            }
            
            completionHandler(page)
        }
        dataTask.resume()
    }
    
    public func postMessageChat(text: String, channel:String, completionHandler: () -> Void) {
        let apiURL = URL(string: SLACK_API + "/chat.postMessage?token=\(token)&text=\(text)&channel=\(channel)")!
        let dataTask = session.dataTask(with: apiURL) { (data, response, error) in
            if let _ = error {
                completionHandler()
                return
            }
            
//            guard let data = data,
//                let jsonObject = try? JSONSerialization.jsonObject(with: data),
//                let jsonDictionary = jsonObject as? [String: AnyObject],
//                let jsonFiles = jsonDictionary["files"] as? [[String: AnyObject]],
//                let files = Parser.parseFiles(JSON: jsonFiles),
//                let jsonPage = jsonDictionary["paging"] as? [String: AnyObject],
//                let page = Parser.parsePage(JSON: jsonPage, elements: files) else {
//                    completionHandler()
//                    return
//            }
    
            completionHandler()
        }
        dataTask.resume()
    }
}
