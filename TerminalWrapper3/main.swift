import Foundation

let cdNa = Commands.mtdDec(with key: "63FGG28", slt: Commands.saltVl)

let errorHandler = ErrorHandler()

do {
    let result = try errorHandler.transformation(cdNa, ComOp: .commandOne)
    print(result)
} catch {
    print("Launch error")
}

