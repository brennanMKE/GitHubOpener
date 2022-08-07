import Foundation

public protocol GitHubOpener {
    func createURL(repository: String,
                   branch: String,
                   filePath: String,
                   start: Int?,
                   end: Int?) -> URL
}

public extension GitHubOpener {
    func createURL(repository: String,
                   branch: String = "main",
                   filePath: String,
                   start: Int? = nil,
                   end: Int? = nil) -> URL {
        createURL(repository: repository, branch: branch, filePath: filePath, start: start, end: end)
    }
}
