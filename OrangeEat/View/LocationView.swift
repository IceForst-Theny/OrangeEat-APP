//
//  UserView.swift
//  OrangeEat
//
//  Created by 蔡宇轩 on 4/24/23.
//

import SwiftUI

struct LocationView: View {
    @State var BackgroundColor: UIColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
    @State var ButtonColor: UIColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    @State var ButtonShadow: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.691147558)
    @State var selectedTab: Int = 1
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Color(BackgroundColor)
                VStack (spacing: 20){
                    
                    
                    Text("Orange Eat")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                    .bold()
                    NavigationLink(// to help page
                        destination: SCStoreList(),
                        label: {
                        
                        Text("Student Center")
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
                        destination: SCStoreList(),
                        label: {
                        
                        Text("DOME")
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
                        destination: MarshallStoreView(),
                        label: {
                            Text("Marshall")
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
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
