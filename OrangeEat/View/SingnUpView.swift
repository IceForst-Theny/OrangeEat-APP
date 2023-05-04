

import SwiftUI
import FirebaseAuth
import Firebase

struct SignUpView: View {
    @State var BackgroundColor: UIColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
    @State var ButtonColor: UIColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    @State var ButtonShadow: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.691147558)
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State private var selection = 0
    @State private var storeSelect = 0
    @State var showSignIn: Bool = false
    @Binding var showUser: Bool
    @State var userStatus: String = ""
    @State var showVendor: Bool = false
    @State var selectedView: String? = nil
    @State var status = ["customer","vendor"]
    let stores = ["Big Mac","Little Willy","Golden Oak"]
    var body: some View {
        ZStack {
            Color(BackgroundColor)
            VStack {
                Text("Creat Account!")
                    .bold()
                TextField("Email", text: $email)

                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.blue)
                    .font(.headline)

                TextField("Password", text: $password)

                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.blue)
                    .font(.headline)
                Picker("Select a color", selection: $selection) {
                                ForEach(0 ..< status .count) {
                                    Text(self.status[$0]).tag($0)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                
                if (status[selection] == "vendor"){
                    Text("Your store: \(stores[storeSelect])")
                    Picker("Select an option", selection: $storeSelect) {
                        ForEach(0 ..< stores.count) { index in
                                            Text(self.stores[index])
                                        }
                    }.pickerStyle(WheelPickerStyle())
                     .frame(height: 80)
                }
                Button(action: {
                    
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                        if let error = error {
                            print("Error creating user: \(error.localizedDescription)")
                            // You can also display an alert to the user if you'd like
                        } else {
                            // User created successfully, navigate to the next screen
                            userStatus = status[selection]
                            selectedView = userStatus
                            print(userStatus)
                            if selectedView == "customer"{
                                showUser.toggle()
                                showVendor = false
                            }else if selectedView == "vendor"{
                                showVendor.toggle()
                                showUser = false
                            }
                           
                        }
                    }
                }, label: {
                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical,18)
                        .padding(.horizontal,20)
                        .background(
                            Color(ButtonColor)
                                .cornerRadius(20)
                                .shadow(
                                    color: Color(ButtonShadow), radius:10
                                )
                            
                        )
            })
//            .sheet(isPresented: $showSignIn, content: {
//                    SignInView( showUser: $showUser)
//                })
            .padding()
                Button(action: {
                    //GameItem.Restart()
                    showSignIn.toggle()
                }, label: {
                    Text("Already Have")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical,18)
                        .padding(.horizontal,36)
                        .background(
                            Color(ButtonColor)
                                .cornerRadius(20)
                                .shadow(
                                    color: Color(ButtonShadow), radius:10
                                )
                            
                        )
            })
            .sheet(isPresented: $showSignIn, content: {
                    SignInView( showUser: $showUser)
                })
            }
            
            if selectedView == "customer"{
                UserView()
                    .transition(.move(edge: .bottom))
                    .animation(.spring())
            }
            
            else if  selectedView == "vendor"{
                VendorView()
                    .transition(.move(edge: .bottom))
                    .animation(.spring())
            }
        }.ignoresSafeArea(edges:.all)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(showUser: ContentView().$showUser)
    }
}
