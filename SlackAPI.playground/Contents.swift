//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import SlackAPI

PlaygroundPage.current.needsIndefiniteExecution = true

print("request started")
let slackClient = SlackClient(token: "")
slackClient.listFiles(to: Date()) { (files) in
    defer {
        PlaygroundPage.current.finishExecution()
    }
    print("request ended \(files?.count)")
}
