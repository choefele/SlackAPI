//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import SlackAPI

PlaygroundPage.current.needsIndefiniteExecution = true

let slackClient = SlackClient(token: "xoxp-11698035268-11714152049-52250331493-5ac7d3dcd9")

//func listFiles(to: Date, pageIndex: Int, pageHandler: (Page<File>) -> Void, completionHandler: () -> Void) {
//    slackClient.listFiles(to: to, pageIndex: pageIndex) { (page) in
//        if let page = page {
//            pageHandler(page)
//            listFiles(to: to, pageIndex: page.index + 1, pageHandler: pageHandler, completionHandler: completionHandler)
//        } else {
//            completionHandler()
//        }
//    }
//}
//
//let weeks = 4
//let to = Date(timeIntervalSinceNow: Double(-60 * 60 * 24 * 7 * weeks))
//
//let pageHandler: ((Page<File>) -> Void) = { (page) in
//    print("received page \(page.elements.count)")
//}
//print("request started")
//listFiles(to: to, pageIndex: 1, pageHandler: pageHandler) {
//    print("request ended")
//    PlaygroundPage.current.finishExecution()
//}

print("request started")
slackClient.postMessageChat(text: "test") {
    print("request ended")
    PlaygroundPage.current.finishExecution()
}
