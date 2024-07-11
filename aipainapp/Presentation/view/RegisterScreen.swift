import SwiftUI
import GoogleSignIn

struct RegisterScreen: View {

@StateObject var googleLoginViewModel = GoogleLoginViewModel(googleLoginRepository: GoogleLoginRepositoryImpl(apiService: ApiServiceImpl())) 
@StateObject var facebookLoginViewModel = FacebookLoginViewModel(facebookLoginRepository: FacebookLoginRepositoryImpl(apiService: ApiServiceImpl()))
@State private var username: String = ""
@State private var password: String = ""
    
var body: some View {
NavigationView {
VStack(spacing: 10) {
    Spacer() // Remove extra Spacer
    
    Text("Register")
        .font(.title)
    
    Image("Login")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 200, height: 200)
    
    VStack(spacing: 10) {
        TextField("Email", text: $username)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.system(size: 12))

        SecureField("Password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.system(size: 12))
        
        HStack {
            Text("Forgot Password?")
            .font(.system(size: 12))
            .frame(minWidth: 150, alignment: .leading)

            Button(action: {
                // Handle Forgot Password action
            }) {
                Text("Reset")
                .font(.system(size: 12))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
        Button(action: {
            // Handle Login action
        }) {
            Text("Login")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.salmon)
                .cornerRadius(5)
                .font(.system(size: 12))

        }
        
        HStack {
            Text("Don't have an account?")
            .font(.system(size: 12))
            .frame(minWidth: 150, alignment: .leading)
            
            Button(action: {
                // Handle Sign Up action
            }) {
                Text("Sign up")
                .font(.system(size: 12))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
        Divider()
        
        Text("OR")
            .padding(.top, 18)
            .padding(.bottom, 18)
            .font(.system(size: 12))

        
        HStack {
            Image("google")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.trailing, 4)
                .onTapGesture {
                    googleLoginViewModel.handleLogin()
                }

            Image("facebook")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.leading, 4)
                .onTapGesture {
                  facebookLoginViewModel.handleLogin()
              }
        }
    }
    .padding(.horizontal, 70)
    .padding(.top, 20)
    .background(Color.whiteCustom)
    
    Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    .background(Color.whiteCustom)
}
}
    
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}



