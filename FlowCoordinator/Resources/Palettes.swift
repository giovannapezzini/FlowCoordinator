import UIKit

enum Palettes {
    case melon
    case eggshell
    case aeroBlue
    case powderBlue
    case blackCoral
    
    var color: UIColor {
        switch self {
        case .melon:
            return UIColor(red: 1.00, green: 0.65, blue: 0.62, alpha: 1.00)
        case .eggshell:
            return UIColor(red: 0.98, green: 0.95, blue: 0.87, alpha: 1.00)
        case .aeroBlue:
            return UIColor(red: 0.72, green: 0.95, blue: 0.90, alpha: 1.00)
        case .powderBlue:
            return UIColor(red: 0.68, green: 0.85, blue: 0.88, alpha: 1.00)
        case .blackCoral:
            return UIColor(red: 0.37, green: 0.39, blue: 0.45, alpha: 1.00)
        }
    }
}
