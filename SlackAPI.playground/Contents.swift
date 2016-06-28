//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import SlackAPI

class SlackAPIViewController : UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white()
        
        let row0: UIStackView = {
            let label = UILabel()
            label.text = "Slack API Token"
            let textField = UITextField()
            textField.borderStyle = .roundedRect
            textField.placeholder = "Enter token"
            textField.setContentHuggingPriority(UILayoutPriorityDefaultLow - 1, for: .horizontal)
            let row = UIStackView(arrangedSubviews: [label, textField])
            row.spacing = 8
            
            return row
        }()

        let row1: UIStackView = {
            let button = UIButton(type: .system)
            button.setTitle("Load files", for: UIControlState(rawValue: UInt(0)))
            button.titleLabel?.font = UILabel().font
            button.addTarget(self, action: #selector(loadFiles), for: .touchUpInside)
            let stretchingView = UIView()
            stretchingView.setContentHuggingPriority(1, for: .horizontal)
            stretchingView.backgroundColor = .clear()
            stretchingView.translatesAutoresizingMaskIntoConstraints = false
            let row = UIStackView(arrangedSubviews: [button, stretchingView])
            
            return row
        }()

        let stackView = UIStackView(arrangedSubviews: [row0, row1])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    }

    func loadFiles() {
        print("loadFiles")
    }
}

PlaygroundPage.current.liveView = SlackAPIViewController()
//PlaygroundPage.current.needsIndefiniteExecution = true

let slackClient = SlackClient(token: "")

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

//print("request started")
//slackClient.postMessageChat(text: "test", channel: "slack-api-test") {
//    print("request ended")
//    PlaygroundPage.current.finishExecution()
//}
