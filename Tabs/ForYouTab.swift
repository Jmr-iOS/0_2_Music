/************************************************************************************************************************************/
/** @file		ForYouTab.swift
 *  @project    x
 * 	@brief		x
 * 	@details	x
 *
 * 	@notes		x
 *
 * 	@section	Opens
 * 	    none current
 *
 * 	@section	Legal Disclaimer
 * 		All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 		Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
// ref:

import UIKit

class ForYouTab : UIView {
    
    //UI
    var artView : UIImageView;
    
    //Data
    var m   : Music;
    var art : UIImage;
    
    
    /********************************************************************************************************************************/
	/**	@fcn		init()
	 *  @brief		x
	 *  @details	x
	 */
	/********************************************************************************************************************************/
    init(m : Music) {
        
        //Init Data
        self.m   = m;
        
        artView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        artView.center = CGPoint(x:(UIScreen.main.bounds.width/2), y: (UIScreen.main.bounds.height/2));
        
        art = m.getArt(index: 1);
        
        //Super
        super.init(frame: UIScreen.main.bounds);
        
        //Init Data
        print("ForYouTab.init():    I found: \(m.media[0].albumArtist!) - \(m.media[0].albumTitle!) is \(m.media[0].artwork != nil)");
        
        //Init UI
        backgroundColor = UIColor.red;

        artView.image = art;
        
        addSubview(artView);
        
        print("ForYouTab.init():    initialization completeX");
        
        return;
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}

