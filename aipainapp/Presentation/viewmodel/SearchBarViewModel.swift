import Combine
import Foundation

class SearchBarViewModel: ObservableObject {
    private let countries = [
        "Afghanistan", "Albania", "Algeria", "Andorra", "Angola",
        "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria"
    ]
    
    @Published var searchText = ""
    @Published var isSearching = false
    @Published var countriesList: [String] = []
    
    private var searchTextSubscription: AnyCancellable?
    
    init() {
        searchTextSubscription = $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .map { text in
                if text.isEmpty {
                    return self.countries
                } else {
                    return self.countries.filter { $0.localizedCaseInsensitiveContains(text) }
                }
            }
            .sink { [weak self] filteredCountries in
                self?.countriesList = filteredCountries
            }
    }
    
    func onSearchTextChange(_ text: String) {
        searchText = text
    }
    
    func toggleSearch() {
        isSearching.toggle()
    }
}
