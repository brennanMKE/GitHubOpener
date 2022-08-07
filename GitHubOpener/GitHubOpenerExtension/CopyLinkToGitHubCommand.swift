import Foundation
import XcodeKit
import GitHubOpenerKit
import GitHubOpenerService

class CopyLinkToGitHubCommand: NSObject, XCSourceEditorCommand {
    struct Constants {
        static let serviceName = ""
    }

    let support = CommandSupport()

    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.

        // TODO: implement feature here

        // 1. get project directory
        // 2. collect fetch URL (git remove -v | grep "(fetch)"
        // 3. extract repository and determine branch and file path
        // 4. create URL and pass to XPC service to open URL in browser
        // 5. profit?

//        let connection = support.connect(serviceName: Constants.serviceName, serviceProtocol: GitHubOpenerService.self)
//        let service = support.getRemoteService(connection: connection)
//        gatherDetails(invocation: invocation)

        Task {
//            service.openGitHub(_:)
            print("Copy link to GitHub")
            completionHandler(nil)
        }
    }

}
