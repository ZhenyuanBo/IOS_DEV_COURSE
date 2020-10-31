
import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //this happens before viewDidLoad()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //locaiton of Realm file
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do{
            let _ = try Realm()
        }catch{
            print("Error initialising new realm, \(error)")
        }
        
        return true
    }
    
}

