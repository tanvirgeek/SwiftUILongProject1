//
//  Girls.swift
//  SwiftUIPractice37
//
//  Created by MD Tanvir Alam on 20/9/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Girls:Identifiable {
    let id = UUID()
    let girlName: String
    let girlDescription:String
    let imageURL:String
}

extension Girls{
    public static func getAllGrils()->[Girls]{
        return [
            Girls(girlName: "Ifa", girlDescription: "Ifa is one of the hottest girls in town. She looks like an indian actress dia mirza", imageURL: "diamond"),
            Girls(girlName: "Shuvo", girlDescription: "Shuvo is the daughter of the judge. She looked beautiful", imageURL: "tanvirgeek"),
            Girls(girlName: "Shuv", girlDescription: "Shuvo is the daughter of the judge. She looked beautiful", imageURL: "tanvirgeek")
        ]
    }
}
