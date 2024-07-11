import SwiftUI

struct NavComponent: View {
    @State private var selection: String? = nil

    var body: some View {
        HStack(spacing: 0) {
            NavigationLink(destination: PrimaryScreen(), tag: "main", selection: $selection) {
                Image("Home")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top, 15)
                    .padding(.leading, 40)
                    .onTapGesture {
                        selection = "main"
                    }
            }
            Spacer()
            NavigationLink(destination: FavouritesScreen(), tag: "favourites", selection: $selection) {
                Image("Favourites")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top, 15)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        selection = "favourites"
                    }
            }
            Spacer()
            NavigationLink(destination: ConfigScreen(), tag: "config", selection: $selection) {
                Image("Config")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top, 15)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        selection = "config"
                    }
            }
            Spacer()
            NavigationLink(destination: AccountScreen(), tag: "account", selection: $selection) {
                Image("Account")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top, 15)
                    .padding(.trailing, 40)
                    .onTapGesture {
                        selection = "account"
                    }
            }
        }
        .frame(height: 40)
        .background(Color.customGray)
    }
}


struct NavComponent_Previews: PreviewProvider {
    static var previews: some View {
        NavComponent()
    }
}
