//
//  GirlsDescription.swift
//  SwiftUIPractice37
//
//  Created by MD Tanvir Alam on 20/9/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import SwiftUI

struct GirlsDescription: View {
    var girlsVM = GirlsViewModel()
    var girls = [Girls]()
    
    init(){
        girls = girlsVM.girls
    }
    
    var body: some View {
        List(self.girls){ girl in
            GirlTemplateForList(imageName: girl.imageURL, girlName: girl.girlName, girlDescription: girl.girlDescription)
        }
        .navigationBarTitle("Girls")
    }
}

struct GirlsDescription_Previews: PreviewProvider {
    static var previews: some View {
        GirlsDescription()
    }
}
