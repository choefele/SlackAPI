//
//  SlackClient.swift
//  SlackAPI
//
//  Created by Claus Höfele on 16.06.16.
//
//

import Foundation

private let SLACK_API = "https://slack.com/api"

class SlackClient {
    private let session = URLSession(configuration: URLSessionConfiguration.default())
    private let token: String
    
    init(token: String) {
        self.token = token
    }
    
    func listFiles(to: Date = Date()) {
        let types = "all"
        let count = 5

        let _ = URL(string: SLACK_API + "/files.list?token=\(token)&types=\(types)&count=\(count)&ts_to=\(to)")!
        
    }
}
