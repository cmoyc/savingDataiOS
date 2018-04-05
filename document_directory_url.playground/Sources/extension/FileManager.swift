import Foundation

// Encapsulating the computed property as static to easy access, and public to be visible for the playground
public extension FileManager {
    /// - Accessing the default FileManager
    static var documentDirectoryURL: URL {
        // for: You dictate that you want a Document Directory "Documents"
        // in: User Domain Mask is how you tell the FileManager that the directory belongs to the user.
        // returns an array of URLs, so if we are only looking for one use the optional ".first" (it's safe to force unwrapped)
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
