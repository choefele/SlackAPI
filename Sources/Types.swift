import Foundation

public struct File {
    public var id: String
    public var name: String?
    public var title: String?
    public var userId: String?
    public var created: Date?
}

public struct Page<T> {
    public var elements: [T]
    public var count: Int
    public var total: Int
    public var currentPage: Int
    public var pages: Int
}
