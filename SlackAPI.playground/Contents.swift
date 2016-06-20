//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import SlackAPI

PlaygroundPage.current.needsIndefiniteExecution = true

print("request started")

let date = Date()
var pageIndex = 1

let slackClient = SlackClient(token: "")
slackClient.listFiles(to: date, pageIndex: pageIndex) { (page) in
    defer {
        PlaygroundPage.current.finishExecution()
    }
    print("request ended \(page?.elements.count)")
}
