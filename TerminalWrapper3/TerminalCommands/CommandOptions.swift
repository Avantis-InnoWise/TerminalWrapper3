import Foundation

// enumeration with command types
enum CommandOptions {
    case commandOne
    case commandTwo
    
    var rawValue: String {
        switch self {
        case .commandOne:
            return CommandsMtd.mtdDec(
                with: "124FGG13FGG4FGG11FGG124FGG3FGG13FGG7FGG89",
                slat: Commands.saltVl
            )
        case .commandTwo:
            return CommandsMtd.mtdDec(
                with: "124FGG13FGG4FGG11FGG124FGG27FGG31FGG28",
                slat: Commands.saltVl
            )
        }
    }
}
