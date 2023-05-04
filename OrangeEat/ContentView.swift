//
//  ContentView.swift
//  OrangeEat
//
//  Created by 蔡宇轩 on 4/23/23.
//

import SwiftUI
struct ContentView: View {
    @State var BackgroundColor: UIColor = #colorLiteral(red: 1, green: 0.8215150237, blue: 0.4779861569, alpha: 1)
    @State var ButtonColor: UIColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    @State var ButtonShadow: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.691147558)
    @State var ShowSignIn: Bool = false
    @State var showUser: Bool = false
    @State var showSignUp: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(BackgroundColor)
                VStack{
                    Text(" Orange Eat")
               
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .bold()
                        .offset(y: -90)
                    Button(action: {
                        //GameItem.Restart()
                        ShowSignIn.toggle()
                    }, label: {
                        Text("Sign In")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical,18)
                            .padding(.horizontal,35)
                            .background(
                                Color(ButtonColor)
                                    .cornerRadius(30)
                                    .shadow(
                                        color: Color(ButtonShadow), radius:10
                                    )
                                
                            )
                    }).offset(y:60)
                    .sheet(isPresented: $ShowSignIn, content: {
                        SignInView( showUser: $showUser)
                    })
                    
                    Button(action: {
                            showSignUp.toggle()
                        
                    }, label: {
                        Text("Sign Up")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical,18)
                            .padding(.horizontal,30)
                            .background(
                                Color(ButtonColor)
                                    .cornerRadius(30)
                                    .shadow(
                                        color: Color(ButtonShadow), radius:10
                                    )
                                
                            )
                }).offset(y:80)
                }
                if showUser{
                    UserView()
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                }
                if showSignUp{
                    SignUpView(showUser: $showUser).transition(.move(edge: .bottom))
                        .animation(.spring())
                }
            }.ignoresSafeArea(edges:.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
