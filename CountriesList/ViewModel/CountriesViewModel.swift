import Foundation

class CountriesViewModel {
    var countries: [Country] = []
    var filteredCountries: [Country] = []
    var onCountriesFetched: (() -> Void)?
    
    func fetchCountries() {
        APIManager.shared.fetchCountries { [weak self] result in
            switch result {
            case .success(let countries):
                self?.countries = countries
                self?.filteredCountries = countries
                self?.onCountriesFetched?()
            case .failure(let error):
                print("Error fetching countries: \(error)")
            }
        }
    }
    
    func filterCountries(with query: String) {
        if query.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter { country in
                let nameMatch = country.name.lowercased().contains(query.lowercased())
                let regionMatch = country.region.lowercased().contains(query.lowercased())
                let capitalMatch = country.capital.lowercased().contains(query.lowercased())
                
                return nameMatch || regionMatch || capitalMatch
            }
        }
        onCountriesFetched?()
    }
}
