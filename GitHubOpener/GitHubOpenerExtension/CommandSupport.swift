import Foundation
import XcodeKit
import GitHubOpenerKit
import GitHubOpenerService

struct CommandSupport {
    let serviceName = "com.smallsharptools.GitHubOpenerService"

    func getRemoteService(serviceProtocol: Protocol) -> GitHubOpenerService {
        let connection = NSXPCConnection(serviceName: serviceName)
        connection.remoteObjectInterface = NSXPCInterface(with: serviceProtocol.self)
        connection.resume()
        guard let service = connection.remoteObjectProxy as? GitHubOpenerService else {
            fatalError("Helper protocol not valid")
        }
        return service
    }

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

    func openOnGitHub(fileURL: URL) {
        let service = getRemoteService(serviceProtocol: GitHubOpenerService.self)
//        let fileURL = URL(string: "https://github.com/")!
        service.openOnGitHub(fileURL)
    }

    func getLines(invocation: XCSourceEditorCommandInvocation) -> Lines {
        if let selections = invocation.buffer.selections as? [XCSourceTextRange],
            let first = selections.first {
            let start = first.start.line
            let end = first.end.line

            print("start: \(start), end: \(end)")
            let lines = Lines(start: start, end: end)
            return lines
        }

        let lines = Lines(start: 0, end: 0)
        return lines
    }

}
