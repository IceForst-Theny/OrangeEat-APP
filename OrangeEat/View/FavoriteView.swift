//
//  FavoriteView.swift
//  OrangeEat
//
//  Created by 蔡宇轩 on 4/24/23.
//

import SwiftUI

struct FavoriteView: View {
    @State var BackgroundColor: UIColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
    @State var ButtonColor: UIColor = #colorLiteral(red: 0.972358048, green: 0.6485192776, blue: 0.3765782714, alpha: 1)
    @State var ButtonShadow: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.691147558)
    var body: some View {
        ZStack {
            Color(BackgroundColor)
            Text("Favorite")
        }.ignoresSafeArea(edges:.all)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
