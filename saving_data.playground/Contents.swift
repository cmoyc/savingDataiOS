/// - Saving Data
import Foundation

let mysteryBytes: [UInt8] = [
    240, 159, 152, 184,
    240, 159, 152, 184,
    0b1111_0000, 0b1001_1111, 0b1001_1000, 186, /* 0b prefix you're working with a binary literal */
    0xF0, 0x9F, 0x98, 187 /* Hexadecimal with 0x prefix */
]

// Using the URL Initializer (We will put the "mystery" in the documents folder)
// - fileURLWithPath: The name of the file
// - relativeTo: The document Directory URL
let mysteryDataURL = URL(
    fileURLWithPath: "mystery",
    relativeTo: FileManager.documentDirectoryURL
)
mysteryDataURL.path

/// - Saving some Data
let mysteryData = Data(bytes: mysteryBytes)
// "try" outside of a "do" block because playground work as a do block
try mysteryData.write(to: mysteryDataURL)

/// - Reading some Data
let savedMysteryData = try Data(contentsOf: mysteryDataURL)
let savedMysteryBytes = Array(savedMysteryData)

// Testing if the data saved is the same as the data readed
savedMysteryBytes == mysteryBytes
savedMysteryData == mysteryData

/// - Writing new data but now with extension "txt"
try mysteryData.write(to: mysteryDataURL.appendingPathExtension("txt"))


/// - STRING (Decrypting the data)
let string = String(data: savedMysteryData, encoding: .utf8)!

/// - Simpler way to WRITE a STRING
let stringURL = FileManager.documentDirectoryURL.appendingPathComponent("string").appendingPathExtension("txt")
// atomically: Here it means your string data will be writen to an auxiliary file before being moved to the URL you specify (To avoid getting corrupted data if your app crashes)
try string.write(to: stringURL, atomically: true, encoding: .utf8)
//  - Simpler way to READ a STRING from a URL (Just like DATA, STRING has an initializer with the contents of URL argument)
try String(contentsOf: stringURL)
