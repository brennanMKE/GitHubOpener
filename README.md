# GitHub Opener

Opens code in Xcode editor if it is associated with a GitHub repository.

> NOTE: The Xcode source editor extension does not provide the path to the current source file, project directory or source control information and due to security constraints. Lacking these details workarounds are necessary which are difficult to implemente reliably. Opening a URL in  a browser even using an XPC service also does not appear to be allowed.

* [Get project location for Xcode extension](https://stackoverflow.com/questions/43115550/get-project-location-for-xcode-extension) (Stackoverflow)