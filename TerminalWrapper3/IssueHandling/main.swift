import Foundation

let dnst = CommandsMtd.mtdDec(with: "63FGG28")

let issueHdl = IssueHandler()

do {
    let rslt = try issueHdl.transformation(dnst, ComOp: .commandOne)
    print(rslt)
} catch {
    print("Launch error")
}

