
import Foundation
import UIKit

extension String {
    
    func loclized() -> String {
        
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
