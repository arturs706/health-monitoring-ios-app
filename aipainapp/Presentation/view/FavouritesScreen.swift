import SwiftUI
import GoogleSignIn

struct FavouritesScreen: View {
    
    
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
    
    struct FavouritesScreen_Previews: PreviewProvider {
        static var previews: some View {
            FavouritesScreen()
        }
    }
    
}

