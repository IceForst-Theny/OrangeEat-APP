//
//  StoreListView.swift
//  OrangeEat
//
//  Created by 蔡宇轩 on 4/23/23.
//

import SwiftUI

struct SCStoreList: View {
    @State var BackgroundColor: UIColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
    @State var ButtonColor: UIColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    @State var ButtonShadow: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.691147558)
    var body: some View {
        ZStack {
            Color(BackgroundColor)
            VStack{
                NavigationLink(// to help page
                    destination: StoresView(),
                    label: {
                        Text("Panda Express")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 70)
                            .background(
                                Color(ButtonColor)
                                    .cornerRadius(20)
                                    .shadow(
                                        color: Color(ButtonShadow), radius:10
                                    )
                                
                            )
                        
                    })
            
                
                NavigationLink(// to help page
                    destination: Dunkin_View(),
                    label: {
                        Text("DunkIn")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 70)
                            .background(
                                Color(ButtonColor)
                                    .cornerRadius(20)
                                    .shadow(
                                        color: Color(ButtonShadow), radius:10
                                    )
                                
                            )
                        
                    })
                
                
            }
            
        }.ignoresSafeArea(edges:.all)
    }
}


struct MarshallStoreView: View {
    @State var BackgroundColor: UIColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
    @State var ButtonColor: UIColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    @State var ButtonShadow: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.691147558)
    var body: some View {
        ZStack {
            Color(BackgroundColor)
            VStack{
                NavigationLink(// to help page
                    destination: FiveGuys_View(),
                    label: {
                        Text("FiveGuys")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 70)
                            .background(
                                Color(ButtonColor)
                                    .cornerRadius(20)
                                    .shadow(
                                        color: Color(ButtonShadow), radius:10
                                    )
                                
                            )
                        
                    })
            
                
                NavigationLink(// to help page
                    destination: PopEyes_View(),
                    label: {
                        Text("PopEyes")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 70)
                            .background(
                                Color(ButtonColor)
                                    .cornerRadius(20)
                                    .shadow(
                                        color: Color(ButtonShadow), radius:10
                                    )
                                
                            )
                        
                    })
                
                
            }
            
        }.ignoresSafeArea(edges:.all)
    }
}



struct StoreListView_Previews: PreviewProvider {
    static var previews: some View {
        SCStoreList()
    }
}
