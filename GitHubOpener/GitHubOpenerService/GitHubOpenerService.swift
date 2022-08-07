import Foundation
import os.log

#if canImport(AppKit)
import AppKit
#endif

@objc public protocol GitHubOpenerService {
    func openOnGitHub(_ fileURL: URL)
}

@objc class DefaultGitHubOpenerService: NSObject, GitHubOpenerService {
    let log  = OSLog(subsystem: "com.smallsharptools.GitHubOpenerService", category: "service")

    func openOnGitHub(_ fileURL: URL) {
        os_log(#function, log: log, type: .info)
        print("Opening URL: \(fileURL.absoluteString)")
#if canImport(AppKit)
        NSWorkspace.shared.open(fileURL)
#else
        false
#endif
    }

}
