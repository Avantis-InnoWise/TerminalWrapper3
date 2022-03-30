import Foundation

enum CommandsMtd {
    // encrypting the string that we pass to the method
    static func mtdEnc(with str: String) -> String {
        let phsl = [UInt8]("SomeSalt123456dgsdgqg".utf8) // salt in utf8
        var arren = [UInt8]()
        let wrd = [UInt8](str.utf8) // original text in utf8
        for st in wrd.enumerated() {
            arren.append(st.element ^ phsl[st.offset % phsl.count]) // mix original string and salt
        }
        return arren.map { String($0) }.joined(separator: "FGG") // create string from array of numbers with separator
    }

    static func mtdDec(with str: String) -> String {
        let phsl = [UInt8]("SomeSalt123456dgsdgqg".utf8) // salt in utf8
        var arren = [UInt8]()
        for st in str.components(separatedBy: "FGG").map({ UInt8($0) ?? .zero }).enumerated() {
            arren.append(st.element ^ phsl[st.offset % phsl.count])
        } // decrypt original string
        return String(bytes: arren, encoding: .utf8) ?? ""
    }
}
