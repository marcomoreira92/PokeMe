//
//  PokeMeUtils.swift
//  PokeMe
//
//  Created by mmalaqui on 12/02/2021.
//  
//

import Foundation
import UIKit

class PokeMeUtils {
    static func getXib(xibFile: XibFile) -> String {
        return xibFile.rawValue
        //TODO: use if needed specific design for iPad
        /*
        if UIDevice.current.userInterfaceIdiom == .phone {
            return xibFile.rawValue
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return xibFile.rawValue + "_iPad"
        } else {
            return ""
        }
        */
    }
}
