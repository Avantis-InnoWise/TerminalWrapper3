import Foundation

enum CommandsMtd {
    // Encrypting the string we pass as an argument.
    static func mtdEnc(with str: String) -> String {
        // The salt is this value - "SomeSalt123456dgsdgqg" and has the type utf8.
        let phsl = [UInt8]("SomeSalt123456dgsdgqg".utf8)
        var arren = [UInt8]()
        let wrd = [UInt8](str.utf8) // Original text in utf8.
        for st in wrd.enumerated() {
            // Сombine salt and the original string.
            arren.append(st.element ^ phsl[st.offset % phsl.count])
        }
        // Creating a string from an array of numbers using a separator with a value - "FGG".
        return arren.map { String($0) }.joined(separator: "FGG")
    }
    // Decoding the string we pass as an argument
    static func mtdDec(with str: String) -> String {
        let phsl = [UInt8]("SomeSalt123456dgsdgqg".utf8) // Salt in utf8.
        var arren = [UInt8]()
        for st in str.components(separatedBy: "FGG").map({ UInt8($0) ?? .zero }).enumerated() {
            arren.append(st.element ^ phsl[st.offset % phsl.count])
        }
        // Creating original string
        return String(bytes: arren, encoding: .utf8) ?? ""
    }
}
