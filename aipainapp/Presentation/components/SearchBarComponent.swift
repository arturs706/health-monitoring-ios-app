import SwiftUI

struct SearchBarComponent: View {
    @State private var searchText = ""
    @StateObject private var viewModel = SearchBarViewModel()
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Color.salmon
                        .cornerRadius(8)

                    TextField("Search countries", text: $searchText)
                        .padding(8)
                        .background(Color.whiteCustom)
                        .cornerRadius(6.0)
                }
                .padding(32)
            }
            .frame(height: 70)
            .background(Color.salmon)
            
            if viewModel.isSearching || !searchText.isEmpty {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.countriesList, id: \.self) { country in
                            Text(country)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .padding()
                                .onTapGesture {
                                    // Handle tap action
                                }
                        }
                    }
                    .background(Color.white.opacity(0.8))
                    .padding()
                }
            }
        }
    }
}

struct SearchBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarComponent()
    }
}
