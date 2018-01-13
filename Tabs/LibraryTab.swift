/************************************************************************************************************************************/
/** @file       LibTab.swift
 *  @project    0_2 - Music
 *  @brief      x
 *  @details    x
 *
 *  @author     Justin Reina, Firmware Engineer, Jaostech
 *  @created    x
 *  @last rev   x
 *
 *
 *  @notes      x
 *
 *  @section    Opens
 *      create a large, independent table by direct copy from demo
 *      validate scrolling
 *      SLOWLY transition to artists, with incremental commits and checks
 *      rename to Library and complete
 *
 *  @section    Legal Disclaimer
 *      All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 *      Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class LibraryTab : UIView {

    //Table
    var verbose : Bool = false;

    var tableView          : LibTableView!;                                          /* uses either based on mode                */
    var libTableHandler : LibTableViewHandler!;
    
    var bar : TabBar;
    
    /********************************************************************************************************************************/
    /** @fcn        init()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    init(bar : TabBar) {
    
        self.bar = bar;
        
        super.init(frame: UIScreen.main.bounds);

        self.addLibTable();

        print("LibTab.init():                 initialization complete");
        
        return;
    }


    /********************************************************************************************************************************/
    /** @fcn        addCustomTable()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func addLibTable() {
        
        if(verbose){ print("LibraryTab.addCustomTable():      adding a custom table"); }
        
        tableView = LibTableView(bar: bar, frame:self.frame, style:UITableViewStyle.plain);
        
        //add the handler
        libTableHandler = LibTableViewHandler(table: tableView);
        
        tableView.delegate   = libTableHandler;                                         /* Set both to handle clicks & provide data */
        tableView.dataSource = libTableHandler;
        
        //init the table
        tableView.separatorColor = UIColor.black;
        tableView.separatorStyle = .singleLine;
        
        //Safety
        tableView.backgroundColor = UIColor.black;
        
        //Set the row height
        tableView.rowHeight = 25;
        
        if(verbose){ print("LibraryTab.addCustomTable():      it was shown"); }
        
        self.addSubview(tableView);
        
        return;
    }
    
    
    
    /********************************************************************************************************************************/
    /** @fcn        required init?(coder aDecoder: NSCoder)
     *  @brief      init from backup
     *  @details    x
     */
    /********************************************************************************************************************************/
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
