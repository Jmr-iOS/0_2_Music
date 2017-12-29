/************************************************************************************************************************************/
/** @file		LibCustomTableView.swift
 *  @project    x
 * 	@brief		x
 * 	@details	x
 *
 * 	@notes		x
 *
 * 	@section	Opens
 * 			none current
 *
 *  @section    Reference
 *      (awesome) http://code.tutsplus.com/tutorials/ios-sdk-crafting-custom-uitableview-cells--mobile-15702
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class LibTableView : UITableView {
    
    var verbose : Bool = true;

    var bar : TabBar;
    
    var myLibCells : [LibTableViewCell] = [LibTableViewCell]();
    
    
    /********************************************************************************************************************************/
	/**	@fcn		init(bar : TabBar, frame: CGRect, style: UITableViewStyle)
	 *  @brief		x
	 *  @details	x
	 */
	/********************************************************************************************************************************/
    init(bar : TabBar, frame: CGRect, style: UITableViewStyle) {

        self.bar = bar;
        
        super.init(frame:frame, style:style);

        self.register(LibTableViewCell.self, forCellReuseIdentifier: "cell");
        
        self.translatesAutoresizingMaskIntoConstraints = false;
        
        for i in 0...(bar.getArtists().count-1) {
            
            let newCell : LibTableViewCell = LibTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "why");
            
            let cellText:String = bar.getArtists()[i];
            
            let subjectField:UILabel = UILabel(frame: CGRect(x:55, y: 25, width: 303, height:  25));
            
            subjectField.text = cellText;
            
            newCell.addSubview(subjectField);
            
            myLibCells.append(newCell);
        }
        
        
        if(verbose){ print("LibTableView.init():             the LibTableView was initialized"); }

        return;
    }
    
    
    /********************************************************************************************************************************/
	/**	@fcn		addNewCell(_ cellString : String)
	 *  @brief		x
	 *  @details	x
	 *
	 *  @section	Purpose
	 *  	x
	 *
	 *  @param		[in]	name	descrip
	 *
	 *  @param		[out]	name	descrip
	 *
	 *  @return		(type) descrip
	 *
	 *  @pre		x
	 *
	 *  @post		x
	 *
	 *  @section	Operation
	 *		x
	 *		
	 *  @section	Opens
	 *  	x
	 *
	 *  @section	Hazards & Risks
	 *  	x
	 *
	 *	@section	Todo
	 *		x
	 *
	 *  @section	Timing
	 *  	x
	 *
	 *  @note		x
	 */
	/********************************************************************************************************************************/
    func addNewCell(_ cellString : String) {
    
        
        let newCell : LibTableViewCell = LibTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "eww?");
        
        myLibCells.append(newCell);
        
        self.reloadData();
        
        if(verbose){ print("CustomTableView.addCell():    a new cell was added"); }

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

