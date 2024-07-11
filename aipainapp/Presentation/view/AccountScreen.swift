import SwiftUI
import GoogleSignIn

struct AccountScreen: View {
    
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                TopBarComponent()
                SearchBarComponent()
            }
            Spacer()

            NavComponent()
        }
        .background(Color.whiteCustom)
        .navigationBarBackButtonHidden(true)
    }
    

}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
