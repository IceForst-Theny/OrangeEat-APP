//
//  HistoryView.swift
//  OrangeEat
//
//  Created by 蔡宇轩 on 4/24/23.
//

import SwiftUI

struct HistoryView: View {
    @State var BackgroundColor: UIColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
    @State var ButtonColor: UIColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    @State var ButtonShadow: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.691147558)
    var body: some View {
        ZStack {
            Color(BackgroundColor)
            Text("History")
        }.ignoresSafeArea(edges:.all)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
