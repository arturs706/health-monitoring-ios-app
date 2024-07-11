import SwiftUI
import GoogleSignIn

struct ConfigScreen: View {
    
    
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

struct ConfigScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConfigScreen()
    }
}
