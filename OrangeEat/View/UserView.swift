//
//  test.swift
//  OrangeEat
//
//  Created by 蔡宇轩 on 4/24/23.
//

import SwiftUI
import Firebase

struct UserView: View {
    @State var login: Bool = false
    @State var handle: NSObjectProtocol?
    @State var selection: Int = 1
    var body: some View {
        Group {
            if !login {
                ContentView()
            }
            else{
                
                    TabView(selection: $selection) {
                        
                        //ZStack {
                        FavoriteView()
                        
                        //}.ignoresSafeArea(.all)
                            .tabItem{
                                Image(systemName: "heart.fill")
                                Text("Favorite")
                            }.tag(0)
                        
                        
                        LocationView()
                        
                            .tabItem{
                                Image(systemName: "house.fill")
                                Text("Home")
                              
                            }.tag(1)
                        
                        
                        HistoryView()
                            .tabItem{
                                Image(systemName: "clock.fill")
                                Text("History")
                            }.tag(2)
                        
                        
                        AccountView()
                        .tabItem{
                            Image(systemName: "person.fill")
                            Text("Account")
                        }.tag(3)
                        
                    }
                }
        }
        .onAppear{
            handle = Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    login = true
                } else {
                    login = false
                }
            }
        }
        .onDisappear{
            Auth.auth().removeStateDidChangeListener(handle!)
        }
    }

}
struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
