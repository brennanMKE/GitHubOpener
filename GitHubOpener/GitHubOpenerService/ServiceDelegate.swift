import Foundation

public class ServiceDelegate: NSObject, NSXPCListenerDelegate {

    public func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        newConnection.exportedInterface = NSXPCInterface(with: GitHubOpenerService.self)
        newConnection.exportedObject = DefaultGitHubOpenerService()
        newConnection.resume()

        return true
    }

}
