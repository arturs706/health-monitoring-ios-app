import SwiftUI

struct TopBarComponent: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Add your logout action here
                }) {
                    Text("Logout")
                        .foregroundColor(Color.blackCustom)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.whiteCustom)
                        .cornerRadius(5)
                        .font(.system(size: 12))

                }
                .padding(.leading, 32)
                .padding(.top, 10)
                
                Spacer()
                
                Text("hello")
                    .padding(.trailing, 32)
                    .padding(.top, 10)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .font(.system(size: 12))

            }
            .frame(height: 55)
            .background(Color.salmon)
        }
    }
}

struct TopBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        TopBarComponent()
    }
}
