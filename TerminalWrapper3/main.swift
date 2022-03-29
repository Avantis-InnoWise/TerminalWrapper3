import Foundation

let dnst = Commands.mtdDec(with: "63FGG28", slat: Commands.saltVl)

let errorHandler = ErrorHandler()

do {
    let result = try errorHandler.transformation(dnst, ComOp: .commandOne)
    print(result)
} catch {
    print("Launch error")
}

