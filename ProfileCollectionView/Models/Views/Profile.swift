//
//  Profile.swift
//  ProfileCollectionView
//
//  Created by Liliana Porto Abdala on 13/12/22.
//

import UIKit

class Profile: NSObject {
    var id: Int?  // : atribui o tipo, = atribui o tipo e recebe valor.
    var name: String?
    var desc: String?
    var image: String?
    
    init (id: Int?, name: String?, desc: String?, image: String?) {
        self.id = id // especifica e fala que ta fora. 
        self.name = name
        self.desc = desc
        self.image = image
        
    }
}
