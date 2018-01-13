/************************************************************************************************************************************/
/** @file		LibTableView.swift
 *  @project    x
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


class LibTableView : UITableView {
    
    let verbose : Bool = true;

	var myLibCells : [LibTableViewCell] = [LibTableViewCell]();

    var bar : TabBar;
    
    /********************************************************************************************************************************/
	/**	@fcn		init()
	 *  @brief		x
	 *  @details	x
	 */
	/********************************************************************************************************************************/
	init(bar : TabBar, frame: CGRect, style: UITableViewStyle) {
        
        //Init UI
        self.bar = bar;
        
        //Super
        super.init(frame:frame, style:style);
        
        self.register(LibTableViewCell.self, forCellReuseIdentifier: "cell");           /* I have no idea why we do this            */
        
        self.translatesAutoresizingMaskIntoConstraints = false;                         /* Std                                      */
  
        //@pre  handle null
        var n = (bar.getArtists().count-1);
        if(n < 0) {
            n = 0;
        }
        
        //Setup Table
        for i in 0...(n) {
            
            let newCell : LibTableViewCell = LibTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell");
            
            newCell.textLabel?.text = bar.m.getArtist(i: i);
            
            myLibCells.append(newCell);
        }
        
        if(verbose){ print("LibTableView.init():           the LibTableView was initialized"); }

        return;
    }
    
    
    /********************************************************************************************************************************/
	/**	@fcn		addNewCell(_ cellString : String)
	 *  @brief		x
	 *  @details	x
	 */
	/********************************************************************************************************************************/
	func addNewCell(_ cellString : String) {
        
        let newCell : LibTableViewCell = LibTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell");
        
        myLibCells.append(newCell);
        
        self.reloadData();
        
        if(verbose){ print("LibTableView.addCell():    a new cell was added"); }

        return;
    }
    
    
    /********************************************************************************************************************************/
	/**	@fcn		removeCell(_ index : Int)
	 *  @brief		x
	 *  @details	x
	 */
	/********************************************************************************************************************************/
	func removeCell(_ index : Int) {
        
        myLibCells.remove(at: index);
        
        self.reloadData();
        
        self.sizeToFit();
        
        //turn mode off (just cause, for demo's sake
        self.setEditing(false, animated: true);

        print("cell removed");
        
        return;
    }
    
    
    /********************************************************************************************************************************/
	/**	@fcn		getCell(_ index: Int) -> UICustomTableViewCell
	 *  @brief		x
	 *  @details	x
	 */
	/********************************************************************************************************************************/
	func getCell(_ index: Int) -> LibTableViewCell {
    
        let cell : LibTableViewCell = self.myLibCells[index];

        return cell;
    }
    
    
    /********************************************************************************************************************************/
	/**	@fcn		getCellCount() -> Int
	 *  @brief		x
	 *  @details	x
	 */
	/********************************************************************************************************************************/
	func getCellCount() -> Int {
        return myLibCells.count;
    }


	required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

