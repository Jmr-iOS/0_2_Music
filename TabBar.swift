/************************************************************************************************************************************/
/** @file       TabBar.swift
 *  @project    0_2 - Music
 *  @brief      x
 *  @details    x
 *
 *  @author     Justin Reina, Firmware Engineer, Jaostech
 *  @created    12/21/17
 *  @last rev   12/29/17
 *
 *  @section     Reference
 *      http://stackoverflow.com/questions/24046898/how-do-i-create-a-new-swift-project-without-using-storyboards
 *      http://stackoverflow.com/questions/24030348/how-to-create-a-button-programmatically
 *      http://stackoverflow.com/questions/24102191/make-a-uibutton-programatically-in-swift
 *
 *  @section    Music Tabs
 *      Library
 *      For You
 *      Radio
 *      Search
 *
 * @section    Opens
 *      insert tab icons
 *      table listing refreshes correctly (swipe dowm does not alter top of table)
 *
 * @section    Legal Disclaimer
 *      All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 *      Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class TabBar : NSObject {

    var tbc   : UITabBarController;
    var navs  : [UINavigationController];
    var views : [UIView];

    var libTab : LibraryTab;
    
    let names : [String] = ["Library", "For You", "Browse", "Radio", "Search"];
    
    
    /********************************************************************************************************************************/
    /** @fcn        init()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    override init() {
        
        //Init
        tbc   = UITabBarController();
        navs  = [UINavigationController]();
        views = [UIView]();
        
        libTab = LibraryTab();
        
        //Super
        super.init();
        
        //Tabs
        initTabs();

        print("TabBar.init():    initialization complete");
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        initTabs()
     *  @brief      initialize the tabs
     *  @details    x
     *
     *  @pre        global state init
     *  @post       tabs are initialized and ready for display
     */
    /********************************************************************************************************************************/
    func initTabs() {

        let N : Int = self.names.count;
        
        for i in 0..<N {
            
            let newView : UIView;
            let newViewController : UIViewController = UIViewController();
            newViewController.title = names[i];

            if(i == 0) {
                newView = LibraryTab();
            } else {
                newView = UIView();
                addMiscViewLabel(newView, vc: newViewController);
                setMiscBackgroundColor(newView);
            }
            
            views.append(newView);
            
            newViewController.view  = newView;
            
            let newNavC : UINavigationController = UINavigationController(rootViewController: newViewController);
            addTabImage(i, navController: newNavC);
            
            navs.append(newNavC);
        }
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        setMiscBackgroundColor(_ view : UIView)
     *  @brief      x
     *  @details    x
     *
     *  @param      [in] (UIView) view - view to apply background color to
     */
    /********************************************************************************************************************************/
    func setMiscBackgroundColor(_ view : UIView) {
        
        let redC   : CGFloat = CGFloat(arc4random_uniform(255))/CGFloat(255);
        let greenC : CGFloat = CGFloat(arc4random_uniform(255))/CGFloat(255);
        let blueC  : CGFloat = CGFloat(arc4random_uniform(255))/CGFloat(255);
        
        view.backgroundColor = UIColor(red: redC, green: greenC, blue: blueC, alpha: 1);
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        addMiscViewLabel(_ view : UIView, vc :UIViewController)
     *  @brief      add a unique label into the view
     *  @details    x
     *
     *  @param      [in] (UIView) view - view to apply label to
     *  @param      [in] (UIViewController) vc - main viewcontroller
     */
    /********************************************************************************************************************************/
    func addMiscViewLabel(_ view : UIView, vc :UIViewController) {
        
        let l : UILabel = UILabel(frame: UIScreen.main.bounds);
       
        l.text = "The subViews of tab '\(vc.title!)' will go here";
        l.textAlignment = .center;
        
        view.addSubview(l);
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        addTabImage(_ index : Int, navController : UINavigationController)
     *  @brief      add an image to the tab
     *  @details    x
     *
     *  @section    Opens
     *      load image based on index!
     */
    /********************************************************************************************************************************/
    func addTabImage(_ index : Int, navController : UINavigationController) {
        
        var unselected : UIImage = UIImage(named: "Triangle-Right")!;
        var selected   : UIImage = UIImage(named: "Fast-Backward")!;
        
        unselected = unselected.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        selected   =   selected.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        
        navController.tabBarItem.image         = unselected;
        navController.tabBarItem.selectedImage = selected;
        
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        init?(coder aDecoder: NSCoder)
     *  @brief      backup restore initialization
     *  @details    x
     *
     *  @param      [in] (NSCoder) aDecoder - memory query device (backup access)
     */
    /********************************************************************************************************************************/
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }

    
    /********************************************************************************************************************************/
    /** @fcn        getUITabBarController() -> UITabBarController
     *  @brief      x
     *  @details    x
     *
     *  @return        (UITabBarController) tabbar controller in use
     */
    /********************************************************************************************************************************/
    func getUITabBarController() -> UITabBarController {
        return tbc;
    }
}

