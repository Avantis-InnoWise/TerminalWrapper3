import Foundation

// Types of commands.
enum CommandOptions {
    case commandOne
    case commandTwo
    
    var rawValue: String {
        switch self {
        case .commandOne:
            return CommandsMtd.mtdDec(
                with: "124FGG13FGG4FGG11FGG124FGG3FGG13FGG7FGG89"
            )
        case .commandTwo:
            return CommandsMtd.mtdDec(
                with: "124FGG13FGG4FGG11FGG124FGG27FGG31FGG28"
            )
        }
    }
}
