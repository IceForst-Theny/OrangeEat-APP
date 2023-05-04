
import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import Firebase

struct VendorAccountView: View {
    @State var BackgroundColor: UIColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
    @State var ButtonColor: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.7997464818)
    @State var ButtonShadow: UIColor = #colorLiteral(red: 0.7098039216, green: 0.2862745098, blue: 0.3568627451, alpha: 0.691147558)
    @State private var profileImage: UIImage? = nil
    @State private var defaultProfileImage: UIImage = UIImage(named: "defaultProfileImage") ?? UIImage(systemName: "person.fill")!
    // Replace with your default profile image
    @State private var username: String = ""
    @State private var country: String = ""
    @State private var age: String = ""
    @State private var review: String = ""
    @State private var isShowingImagePicker: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(BackgroundColor)
                VStack {
                    Color(BackgroundColor)
                    if let profileImage = profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    } else {
                        Image(uiImage: defaultProfileImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    }
                    
                    Button("Select Profile Image") {
                        isShowingImagePicker.toggle()
                    }
                    
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    TextField("Country", text: $country)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    Button(action: saveProfileData) {
                        Text("Save Profile Data")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .navigationBarItems(trailing: Button("Sign Out", action: venderSignOut))
                    .padding(.top)
                    
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Profile Setup")
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(selectedImage: $profileImage, isPresented: $isShowingImagePicker)
            }
            .onAppear(perform: fetchProfileData)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func saveProfileData() {
        // Upload profile image to Firebase Storage
        if let profileImage = profileImage, let imageData = profileImage.jpegData(compressionQuality: 0.75) {
            let storageRef = Storage.storage().reference().child("profileImages/\(UUID().uuidString).jpg")
            storageRef.putData(imageData, metadata: nil) { metadata, error in
                if let error = error {
                    self.alertTitle = "Error"
                    self.alertMessage = error.localizedDescription
                    self.showAlert = true
                } else {
                    storageRef.downloadURL { url, error in
                        if let error = error {
                            self.alertTitle = "Error"
                            self.alertMessage = error.localizedDescription
                            self.showAlert = true
                        } else if let url = url {
                            saveProfileDataToFirestore(imageURL: url.absoluteString)
                        }
                    }
                }
            }
        } else {
            saveProfileDataToFirestore(imageURL: nil)
        }
    }
    
    func saveProfileDataToFirestore(imageURL: String?) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        let profileData: [String: Any] = [
            "username": username,
            "country": country,
            "age": age,
            "review" : review,
            "profileImageURL": imageURL ?? ""
        ]
        
        db.collection("vendorinfo").document(userID).setData(profileData) { error in
            if let error = error {
                self.alertTitle = "Error"
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else {
                self.alertTitle = "Success"
                self.alertMessage = "Profile data saved successfully."
                self.showAlert = true
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            
        } catch let signOutError as NSError {
            alertTitle = "Error"
            alertMessage = "Error signing out: \(signOutError.localizedDescription)"
            showAlert = true
        }
    }
    
    func fetchProfileData() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        
        db.collection("userinfo").document(userID).getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data()
                username = data?["username"] as? String ?? ""
                country = data?["country"] as? String ?? ""
                age = data?["age"] as? String ?? ""
                
                if let imageURL = data?["profileImageURL"] as? String, !imageURL.isEmpty {
                    fetchProfileImage(imageURL: imageURL)
                }
            } else {
                print("Document does not exist")
            }
        }
    }

    func fetchProfileImage(imageURL: String) {
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: imageURL)
        
        storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error downloading profile image: \(error.localizedDescription)")
            } else if let data = data {
                if let image = UIImage(data: data) {
                    profileImage = image
                }
            }
        }
    }
    
    func venderSignOut() {
        do {
            try Auth.auth().signOut()
            
        } catch let signOutError as NSError {
            alertTitle = "Error"
            alertMessage = "Error signing out: \(signOutError.localizedDescription)"
            showAlert = true
        }
    }
}

struct VendorAccountView_Previews: PreviewProvider {
    static var previews: some View {
        VendorAccountView()
    }
}

