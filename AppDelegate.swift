/************************************************************************************************************************************/
/** @file		AppDelegate.swift
 *  @project    0_0 - Music
 * 	@brief		x
 * 	@details	x
 *
 * 	@notes		x
 *
 * 	@section	Opens
 * 			none current
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?;

    var bar : TabBar;
    
    /************************************************************************************************************************************/
    /** @fcn        init()
     *  @brief      x
     *  @details    x
     */
    /************************************************************************************************************************************/
    override init() {
        
        //Init State
        self.bar = TabBar();
        super.init();

        let _ : Music = Music();

        return;
    }
    
    /********************************************************************************************************************************/
    /** @fcn        application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds);
        
        let tbc : UITabBarController = self.bar.getUITabBarController();
        
        tbc.viewControllers = self.bar.navs;
        
        self.window?.rootViewController = tbc;
        
        self.window?.makeKeyAndVisible();
        
        print("AppDelegate.application():          Application launch complete");
        
        return true;
    }
    

    func applicationWillResignActive(_ application: UIApplication)    { return; }
    func applicationDidEnterBackground(_ application: UIApplication)  { return; }
    func applicationWillEnterForeground(_ application: UIApplication) { return; }
    func applicationDidBecomeActive(_ application: UIApplication)     { return; }
    func applicationWillTerminate(_ application: UIApplication)       { return; }
}

