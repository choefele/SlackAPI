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
    public var index: Int
    public var totalNumberOfElements: Int
    public var totalNumberOfPages: Int
}
