import SwiftUI
import GoogleSignIn

struct LoginScreen: View {
    @StateObject private var viewModel = LoginViewModel(loginRepository: LoginRepositoryImpl(apiService: ApiServiceImpl()))
    @StateObject var googleLoginViewModel = GoogleLoginViewModel(googleLoginRepository: GoogleLoginRepositoryImpl(apiService: ApiServiceImpl()))
    @StateObject var facebookLoginViewModel = FacebookLoginViewModel(facebookLoginRepository: FacebookLoginRepositoryImpl(apiService: ApiServiceImpl()))
    @State private var showDialog = false
    @State private var dialogTitle = ""
    @State private var dialogMessage = ""
    @State private var navigateToMainScreen = false  // State for navigation
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: PrimaryScreen(), isActive: $navigateToMainScreen) { EmptyView() }
                VStack(spacing: 10) {
                    Spacer()
                    
                    Text("Login")
                        .font(.title)
                    
                    Image("Login")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    VStack(spacing: 10) {
                        TextField("Email", text: Binding(
                            get: { viewModel.username ?? "" },
                            set: { viewModel.username = $0.isEmpty ? nil : $0 }
                        ))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.system(size: 12))
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        
                        ZStack(alignment: .trailing) {
                            if viewModel.passwordVisibility {
                                TextField("Password", text: Binding(
                                    get: { viewModel.password ?? "" },
                                    set: { viewModel.password = $0.isEmpty ? nil : $0 }
                                ))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(.system(size: 12))
                                .autocapitalization(.none)
                            } else {
                                SecureField("Password", text: Binding(
                                    get: { viewModel.password ?? "" },
                                    set: { viewModel.password = $0.isEmpty ? nil : $0 }
                                ))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(.system(size: 12))
                                .autocapitalization(.none)
                            }
                            
                            Button(action: {
                                viewModel.togglePasswordVisibility()
                            }) {
                                Image(systemName: viewModel.passwordVisibility ? "eye" : "eye.slash")
                                    .font(.system(size: 13))
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing, 10)
                        }
                        HStack {
                            Text("Forgot Password?")
                                .font(.system(size: 12))
                                .frame(minWidth: 150, alignment: .leading)
                            
                            Button(action: {
                            }) {
                                Text("Reset")
                                    .font(.system(size: 12))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        Button(action: {
                            viewModel.login()
                        }) {
                            Text("Login")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.salmon)
                                .cornerRadius(5)
                                .font(.system(size: 12))
                        }
                        .disabled(viewModel.isLoading)
                        
                        if viewModel.isLoading {
                            ProgressView()
                        }
                        
                        if let errorMessage = viewModel.errorMessage {
                            Text("")
                                .onAppear {
                                    dialogTitle = "Error"
                                    dialogMessage = errorMessage
                                    showDialog = true
                                }
                        }
                        
                        if let loginResponse = viewModel.loginResponse {
                            Text("")
                                .onAppear {
                                    dialogTitle = "Success"
                                    dialogMessage = "Login successful: \(loginResponse.email)"
                                    showDialog = true
                                }
                        }
                        
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 12))
                                .frame(minWidth: 150, alignment: .leading)
                            
                            Button(action: {
                                // Sign up action
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
                
                if showDialog {
                    CustomDialogView(
                        isActive: $showDialog,
                        title: dialogTitle,
                        message: dialogMessage,
                        actionTitle: "OK",
                        onAction: {
                            if dialogTitle == "Success" {
                                navigateToMainScreen = true
                            } else {
                                showDialog = false
                            }
                        }
                    )
                }
            }
            .navigationBarBackButtonHidden(true)  // Hide the back button on LoginScreen
            .onChange(of: googleLoginViewModel.isLoggedIn) { isLoggedIn in
                if isLoggedIn {
                    dialogTitle = "Success"
                    dialogMessage = "Login successful: \(googleLoginViewModel.userEmail ?? "Unknown email")"
                    showDialog = true
                }
            }
            .onChange(of: googleLoginViewModel.loginError) { error in
                if let error = error {
                    dialogTitle = "Error"
                    dialogMessage = error
                    showDialog = true
                }
            }
            .onChange(of: facebookLoginViewModel.isLoggedIn) { isLoggedIn in
                if isLoggedIn {
                    dialogTitle = "Success"
                    dialogMessage = "Login successful: \(facebookLoginViewModel.userEmail ?? "Unknown email")"
                    showDialog = true
                }
            }
            .onChange(of: facebookLoginViewModel.loginError) { error in
                if let error = error {
                    dialogTitle = "Error"
                    dialogMessage = error
                    showDialog = true
                }
            }
        }
        .navigationBarHidden(true) // Also hide the navigation bar if needed
    }
}



struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
