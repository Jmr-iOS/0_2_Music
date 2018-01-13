/************************************************************************************************************************************/
/** @class      Music
 *  @proj       0_2 - Music
 *  @brief      x
 *  @details    x
 *
 *  @section    Hide strange unwanted Xcode logs
 *        https://stackoverflow.com/questions/37800790/hide-strange-unwanted-xcode-logs
 *
 *  @section   Music Access
 *       https://stackoverflow.com/questions/40445062/how-to-access-music-files-stored-on-the-ios-device
 *
 *  @section     Media Player Integration
 *       http://www.theappguruz.com/blog/integrating-media-player-ios-using-swift
 *
 *  @section    Authorization
 *       MPMediaLibrary.authorizationStatus
 *
 *  @section   Next Steps
 *       - Print listing of artists to console
 *
 *  @section    Media Descriptors (content to add)
 *      mood or moment for song
 *      passion or person hat you can apply to (for individual artists, albums or songs)
 *      used just like genres, for sorting & for play
 *      subview for playing song allows selection or review, making config & review easy!
 *
 *  @section    MPMediaLibraryAuthorizationStatus
 *      case notDetermined: (0)The user hasn't determined whether to authorize the use of their media library.
 *      case denied: (1)The app may not access the items in the user's media library.
 *      case restricted: (2)The app may access some of the content in the user's media library.
 *      case authorized: (3)Your app may access items in the user's media library.
 */
/************************************************************************************************************************************/
import UIKit
import MediaPlayer


class Music: NSObject {

    //Library Vars
    var query : MPMediaQuery;
    var media : [MPMediaItem];
    
    //Parse Vars
    private var artists : [String];
    
    let authLvls : [String] = ["notDetermined", "denied", "restricted", "authorized"];

    /********************************************************************************************************************************/
    /** @fcn    override init()                                                                                                     */
    /*  @brief  init the var                                                                                                        */
    /*  @post   query & media init                                                                                                  */
    /*                                                                                                                              */
    /*  @warn   access must be authorized if used on Simulator                                                                      */
    /********************************************************************************************************************************/
    override init() {

        //Init
        query = MPMediaQuery();                                         /* grab handle                                              */
        media = query.items!;                                           /* grab media listing                                       */
        artists = [];                                                   /* init empty                                               */
        
        //Super
        super.init();
        
        //Find the media
        let result = query.items;
        
        //Check auth
        let rslt : MPMediaLibraryAuthorizationStatus = MPMediaLibrary.authorizationStatus();
        let rslt_val : Int = rslt.rawValue;

        //Handle auth
        print("Music.init():                  access level on device found as '\(authLvls[rslt_val])'");
        
        if(MPMediaLibraryAuthorizationStatus.authorized != rslt) {
            print("Music.init():                  not authorized for library access, aborting");
            return;
        }
        
        //Check Media
        if(result != nil) {
            if(result!.count > 0) {
                print("Music.init():                  found", result!.count, "files");
                return;
            }
        }
        
        //Else nil
        print("Music.init():                  no music found on device");
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        func parseArtists()
     *  @brief      get listing of artists in library
     *  @details    x
     *
     *  @pre    query & media init
     *  @post   artists pop
     *
     *  @section    Notes
     *        media.count is lib size of songs
     *
     *  @section    Todo
     *      parse and store albums
     *      parse and store songs
     */
    /********************************************************************************************************************************/
    func parseArtists() {

        //Safety
        if(media.count == 0) {
            return;                                                                     /* abort when no media present              */
        }
        
        //Grab
        for i in 1...(media.count-1) {
            
            //only if found in file
            if(nil != media[i].albumArtist) {
                
                let newArtist : String = media[i].albumArtist!;
                
                //Check if existing in artists
                if(!artists.contains(newArtist)) {
                    artists.append(newArtist);                                         /* append if not found                       */
                }
            }
        }
        
        //Alphabetize
        artists.sort { $0 < $1 }
        
        //Exit
        print("Music.parseArtsists():    parse complete. Found \(artists.count) artists");
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        func getArtists() -> [String]
     *  @brief      access the library artists
     *  @details    x
     *
     *  @return     ([String]) artist names
     */
    /********************************************************************************************************************************/
    func getArtists() -> [String] {
        return artists;
    }


    /********************************************************************************************************************************/
    /** @fcn        func getArtist(i : Int) -> String
     *  @brief      get a specific artist
     *  @details    x
     *
     *  @return     (String) artist name
     */
    /********************************************************************************************************************************/
    func getArtist(i : Int) -> String {
        
        //@pre  handle empty
        if(artists.count == 0) {
            return "nil";
        }
        
        return artists[i];
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        getArt(index : Int) -> UIImage
     *  @brief      x
     *  @details    x
     *
     *  @return     (UIImage) the selected album art
     *
     *  @note       returns with default size of <200x200>
     */
    /********************************************************************************************************************************/
    func getArt(index : Int) -> UIImage {

        let art : UIImage = (self.media[index].artwork?.image(at: CGSize(width: 200, height: 200)))!;

        return art;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        getNowPlaying() -> MPMediaItem?
     *  @brief      get the song playing in Music
     *  @details    x
     */
    /********************************************************************************************************************************/
    func getNowPlaying() -> MPMediaItem? {

        let sysMP : MPMusicPlayerController & MPSystemMusicPlayerController = MPMusicPlayerController.systemMusicPlayer;

        let currItem : MPMediaItem? = sysMP.nowPlayingItem;
        
        return currItem;
    }
}


