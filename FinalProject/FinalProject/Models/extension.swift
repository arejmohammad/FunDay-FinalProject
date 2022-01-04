
import Foundation

extension String {
    func loclized() -> String{
//        let lang = UserDefaults.standard.object(forKey: "AppLanguages") as? [String]
//        let path = Bundle.main.path(forResource: lang?.first , ofType: "lproj")
//        let bundel = Bundle(path: path!)
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}

