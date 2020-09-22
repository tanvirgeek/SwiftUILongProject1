//
//  GirlsViewModel.swift
//  SwiftUIPractice37
//
//  Created by MD Tanvir Alam on 21/9/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class GirlsViewModel{
    var girls = [Girls]()
    init(){
        self.girls = Girls.getAllGrils()
    }
}
