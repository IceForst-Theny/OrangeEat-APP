import SwiftUI
import Firebase
struct VendorView: View {
    @State var selection: Int = 0
    @State var login: Bool = false
    @State var handle: NSObjectProtocol?
    var body: some View {
        Group{
            if !login {
                ContentView()
            } else {
                TabView(selection: $selection) {
                    OrderView()
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("Order")
                        }.tag(0)
                    
                    VendorAccountView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }.tag(1)
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

struct VendorView_Previews: PreviewProvider {
    static var previews: some View {
        VendorView()
    }
}

