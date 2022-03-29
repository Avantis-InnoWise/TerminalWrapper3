import Foundation

let dnst = CommandsMtd.mtdDec(with: "63FGG28", slat: Commands.saltVl)

let errorHandler = ErrorHandler()

do {
    let rslt = try errorHandler.transformation(dnst, ComOp: .commandOne)
    print(rslt)
} catch {
    print("Launch error")
}

