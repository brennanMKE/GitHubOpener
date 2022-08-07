import XCTest
@testable import GitHubOpenerKit

final class GitHubOpenerTests: XCTestCase {
    func testGitHubOpener() throws {
        let url = GitHubOpener.createURL(repository: "acme/tools", filePath: "public/Tools.swift", line: 31, nextLine: 40)
        XCTAssertTrue(url.absoluteString.contains("acme/tools"))
        XCTAssertTrue(url.absoluteString.contains("public/Tools.swift"))
        XCTAssertTrue(url.absoluteString.contains("#L31-L40"))
        print(url.absoluteString)
    }
}
