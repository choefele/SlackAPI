import Foundation
import PlaygroundSupport

// https://github.com/TetraEtc/Slack-File-Deleter/blob/master/file_deleter.py
// https://api.slack.com/methods/files.list/test

PlaygroundPage.current.needsIndefiniteExecution = true

struct File {
    var id: String
    var name: String?
    var title: String?
    var userId: String?
}

let weeks = 4
let to = Int(Date(timeIntervalSinceNow: Double(-60 * 60 * 24 * 7 * weeks)).timeIntervalSince1970)
let token = "xoxp-11698035268-11714152049-51205337233-2798bf3259"
let types = "all"
let count = 5
let apiURL = URL(string: "https://slack.com/api/files.list?token=\(token)&types=\(types)&count=\(count)&ts_to=\(to)")!

let session = URLSession(configuration: URLSessionConfiguration.default())
let dataTask = session.dataTask(with: apiURL) { (data, response, error) in
    defer {
        PlaygroundPage.current.finishExecution()
    }
    print("request ended")
    
    guard let data = data else {
        return
    }
    
    let jsonObject = try? JSONSerialization.jsonObject(with: data)
    guard let jsonDictionary = jsonObject as? [String: AnyObject] else {
        return
    }

    print(jsonDictionary["paging"]?["total"])
    
    var files = [File]()
    let jsonFiles = jsonDictionary["files"] as? [[String: AnyObject]] ?? []
    for jsonFile in jsonFiles {
        guard let id = jsonFile["id"] as? String else {
            continue
        }
        
        let name = jsonFile["name"] as? String
        let title = jsonFile["title"] as? String
        let userId = jsonFile["user"] as? String
        let created = jsonFile["created"] as? Double ?? 0
        let createdDate = Date(timeIntervalSince1970: created)

        print("\(id) \(createdDate)")
        
        let file = File(id: id, name: name, title: title, userId: userId)
        files.append(file)
    }
}
dataTask.resume()
print("request started")
