import Foundation
import XcodeKit
import GitHubOpenerKit
import GitHubOpenerService

class OpenOnGitHubCommand: NSObject, XCSourceEditorCommand {

    let support = CommandSupport()

    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.

        // NOTE: The Xcode source editor extension does not provide the path to the current source file,
        // project directory or source control information and due to security constraints. Lacking these
        // details workarounds are necessary which are difficult to implemente reliably. Opening a URL in
        // a browser even using an XPC service also does not appear to be allowed.

        // TODO: implement feature here

        // 1. get project directory
        // 2. collect git fetch URL (git remove -v | grep "(fetch)"
        // 3. extract repository and determine branch and file path
        // 4. create URL and pass to XPC service to open URL in browser
        // 5. profit?

        print("Open on GitHub")
        let fileURL = support.createURL(repository: "apple/swift", filePath: "stdlib/Core.swift", start: 30, end: 40)
        support.openOnGitHub(fileURL: fileURL)

        completionHandler(nil)
    }

}

//    var line: String = ""
//    let selections: [XCSourceTextRange]? = invocation.buffer.selections as? [XCSourceTextRange]
//    if let selections = selections {
//        if selections[0].start.line != selections[0].end.line ||
//            selections[0].start.column != selections[0].end.column {
//            let start = selections[0].start.line + 1
//            let end = selections[0].end.column > 0 ? selections[0].end.line + 1 : selections[0].end.line
//            line = (start != end) ? "L\(start)-L\(end)" : "L\(start)"
//        }
//    }
//
//    let semaphore = DispatchSemaphore(value: 0)
//    helper.open(with: line) {
//        semaphore.signal()
//    }
//    _ = semaphore.wait(timeout: .now() + 5)
