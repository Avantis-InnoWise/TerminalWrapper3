import Foundation

enum CommandsMtd {
    // encrypting the string that we pass to the method
    static func mtdEnc(with sting: String, slat: String) -> String {
        let txt = [UInt8](sting.utf8) // original text in utf8
        let cpr = [UInt8](slat.utf8) // salt in utf8
        var ecd = [UInt8]()
        for t in txt.enumerated() {
            ecd.append(t.element ^ cpr[t.offset % cpr.count]) // mix original string and salt
        }
        return ecd.map { String($0) }.joined(separator: Commands.separVl) // create string from array of numbers with separator
    }

    static func mtdDec(with key: String, slat: String) -> String {
        let cpr = [UInt8](slat.utf8) // salt in utf8
        var dcd = [UInt8]()
        for k in key.components(separatedBy: Commands.separVl).map({ UInt8($0) ?? 0 }).enumerated() {
            dcd.append(k.element ^ cpr[k.offset % cpr.count])
        } // decrypt original string
        return String(bytes: dcd, encoding: .utf8) ?? ""
    }
}
