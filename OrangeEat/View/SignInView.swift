import SwiftUI
import FirebaseAuth
import Firebase

struct SignInView: View {
    @State var BackgroundColor: UIColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
    @State var ButtonColor: UIColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    @State var ButtonShadow: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.691147558)
    @Environment(\.presentationMode) var presentationMode

    @State var email: String = ""
    @State var password: String = ""
    @State var errorAlert: Bool = false
    @Binding var showUser: Bool
    var body: some View {
        NavigationView{
            ZStack{
                Color(BackgroundColor)
                VStack{
                    Text("Login Now")
                        .bold()
                    TextField("Email", text: $email)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(.blue)
                        .font(.headline)
                    TextField("Password", text: $password)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(.blue)
                        .font(.headline)
                    
                    Button(action: {
                        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                            if let error = error {
                                print("Error signing in: \(error.localizedDescription)")
                                errorAlert.toggle()
                            } else {
                                // User signed in successfully, navigate to the next screen
                                presentationMode.wrappedValue.dismiss()
                                showUser.toggle()
                            }
                        }
                    }, label: {
                        Text("Sign In")
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
                    
                    
                    .alert(isPresented: $errorAlert, content: {
                        Alert(title: Text("Restart?"),
                              message: Text("Failed login, check your account or password"),
                              primaryButton: .destructive(Text("Cancel"), action: {
                            email = ""
                            password = ""
                        }),
                              secondaryButton: .cancel())
                    })
                    
                    
                }
               
                    
                //llllll
            }.ignoresSafeArea(edges:.all)
            
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView( showUser: ContentView().$showUser)
    }
}


