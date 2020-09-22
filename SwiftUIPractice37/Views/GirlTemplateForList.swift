//
//  GirlTemplateForList.swift
//  SwiftUIPractice37
//
//  Created by MD Tanvir Alam on 20/9/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import SwiftUI

struct GirlTemplateForList: View {
    
    var imageName = "diamond"
    var girlName = "Ifa"
    var girlDescription = "She is one fo the hottest Girls in town. She looks like an indian actress dia mirza"
    
    var body: some View {
        HStack{
            Image(imageName).resizable().frame(width: 100, height: 100)
            VStack(alignment: .leading){
                Text(girlName).font(.title).multilineTextAlignment(.leading)
                Text(girlDescription)
            }.padding()
            
            
        }
    }
}

struct GirlTemplateForList_Previews: PreviewProvider {
    static var previews: some View {
        GirlTemplateForList()
    }
}
