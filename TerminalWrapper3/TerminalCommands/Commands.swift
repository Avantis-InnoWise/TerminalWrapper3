import Foundation

enum Commands {
    static let saltVl = "SomeSalt123456dgsdgqg" // Is a salt. We use it to mix with our original string.
    static let separVl = "FGG" // Is a separator. We use it to create string from array of numbers (UTF8), and separate encrypted string to original.

    // !!! We have to use the same salt and separator to encrypt and decrypt. If we change the parameter we should
}
