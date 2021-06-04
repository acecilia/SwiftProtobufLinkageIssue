import UIKit
import Framework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = UIColor.red
        window.rootViewController = rootViewController

        window.makeKeyAndVisible()

        print(Framework.sampleString)
        self.window = window
        return true
    }
}
