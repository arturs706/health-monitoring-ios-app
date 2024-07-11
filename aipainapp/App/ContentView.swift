import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        VStack {
            Spacer()
            Text("Welcome")
                .font(.title)
            Image("Welcome")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("Ai Pain Detector")
                .font(.system(size: 14))
            
            NavigationLink(destination: RegisterScreen()) {
                Text("Sign Up")
                    .foregroundColor(.blackCustom)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color.customGray)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.salmon, lineWidth: 6)
                    )
                    .padding(.horizontal, 32)
                    .padding(.top, 6)
            }
            
            NavigationLink(destination: LoginScreen()) {
                Text("Login")
                    .foregroundColor(.blackCustom)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color.customGray)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.salmon, lineWidth: 6)
                    )
                    .padding(.horizontal, 32)
                    .padding(.top, 6)
                    .padding(.bottom, 128)
            }
            
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(Color.salmon)
    }
    }
}

#Preview {
    ContentView()
}
