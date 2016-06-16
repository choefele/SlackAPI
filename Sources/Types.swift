import Foundation

struct File {
    var id: String
    var name: String?
    var title: String?
    var userId: String?
    var created: Date?
}

struct Page {
    var count: Int
    var total: Int
    var page: Int
    var pages: Int
}
