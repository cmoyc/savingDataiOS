
import Foundation

// URL
FileManager.documentDirectoryURL

// To see the URL's path use the path property
FileManager.documentDirectoryURL.path

// Using the URL Initializer (We will put the "mystery" in the documents folder)
// - fileURLWithPath: The name of the file
// - relativeTo: The document Directory URL
let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)
mysteryDataURL.path

// String to save
// - appendingPathComponent: allow us to add a file name to a directory (no need of forward slash "/")
// - appendingPathExtension: appends an extension to the given path extension
let stringURL = FileManager.documentDirectoryURL.appendingPathComponent("string").appendingPathExtension("txt")
stringURL.path
