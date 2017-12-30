/************************************************************************************************************************************/
/** @file		LibTableViewCell.swift
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


class LibTableViewCell : UITableViewCell {
    
    let verbose : Bool = false;
    
    let cellSelectionFade : Bool = false;

    /********************************************************************************************************************************/
	/**	@fcn		override init(style: UITableViewCellStyle, reuseIdentifier: String?)
	 *  @brief		x
	 *  @details	x
	 */
	/********************************************************************************************************************************/
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier);

        if(self.cellSelectionFade == true) {
            self.selectionStyle = UITableViewCellSelectionStyle.gray;           /* Options are 'Gray/Blue/Default/None'             */
        } else {
            self.selectionStyle = UITableViewCellSelectionStyle.none;
        }
        
        if(verbose){ print("LibTableViewCell.init():         the LibTableViewCell was initialized"); }
        
        return;
    }

    /********************************************************************************************************************************/
	/**	@fcn		init?(coder aDecoder: NSCoder)
	 *  @brief		x
	 *  @details	x
	 */
	/********************************************************************************************************************************/
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

