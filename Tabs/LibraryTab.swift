/************************************************************************************************************************************/
/** @file       LibraryTab.swift
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
 *      none current
 *
 *  @section    Legal Disclaimer
 *      All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 *      Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit

//@note     global vars


class LibraryTab : UIView {

    //Table
    var verbose : Bool = false;
    
    var tableView       : UITableView!;
    var libTable        : LibTableView!;
    var libTableHandler : LibTableViewHandler!;
    
    //options
    var cellBordersVisible : Bool = true;
    var usesCustomTiles    : Bool = true;
    
    //std table config
    let cellSelectionFade : Bool = true;

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
        
        print("LibraryTab.init():    initialization complete");

        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        addLibTable()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func addLibTable() {
        
        if(verbose){ print("ViewController.addCustomTable():      adding a custom table"); }
        
        libTable = LibTableView(bar: self.bar, frame:self.frame, style:UITableViewStyle.plain);
        
        //add the handler
        libTableHandler = LibTableViewHandler(items: self.bar.m.artists, table: libTable);
        
        libTable.delegate   = libTableHandler;                                    /* Set both to handle clicks & provide data       */
        libTable.dataSource = libTableHandler;
        
        //init the table
        libTable.separatorColor = UIColor.gray;
        libTable.separatorStyle = (cellBordersVisible) ? .singleLine : .none;
        
        //Safety
        libTable.backgroundColor = UIColor.black;
        
        //Set the row height
        libTable.rowHeight = 25;
        
        if(verbose){ print("LibraryTab.addLibTable():      it was shown"); }
        
        self.addSubview(libTable);
        
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
