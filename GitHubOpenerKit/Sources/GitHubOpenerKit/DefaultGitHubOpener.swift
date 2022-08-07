import Foundation
#if canImport(AppKit)
import AppKit
#endif

struct DefaultGitHubOpener {
    func createURL(repository: String,
                          branch: String = "main",
                          filePath: String,
                          start: Int? = nil,
                          end: Int? = nil) -> URL {
        var urlString = "https://github.com/\(repository)/blob/\(branch)/\(filePath)"
        if let start = start, start > 0 {
            urlString += "#L\(start)"
            if let end = end, end > start {
                urlString += "-L\(end)"
            }
        }
        let url = URL(string: urlString)!
        return url
    }
}
