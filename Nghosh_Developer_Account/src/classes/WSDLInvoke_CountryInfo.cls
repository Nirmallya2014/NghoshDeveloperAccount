public class WSDLInvoke_CountryInfo {

    public WSDLInvoke_CountryInfo() { }
    
    public void getAllInfoCountries(String Country) {
    
        Country_Countryinfo_WSDL countryInfo = new Country_Countryinfo_WSDL();
        Country_Countryinfo_WSDL.FullCountryInfoAllCountries_element fullCountryInfoAllCountries = new Country_Countryinfo_WSDL.FullCountryInfoAllCountries_element();
        Country_Countryinfo_WSDL.ArrayOftCountryInfo arrayCountryInfo = new Country_Countryinfo_WSDL.ArrayOftCountryInfo();
        Country_Countryinfo_WSDL.CountryInfoServiceSoap serviceSoap = new Country_Countryinfo_WSDL.CountryInfoServiceSoap();
        
        Country_Countryinfo_WSDL.FullCountryInfoAllCountriesResponse_element response_x = new Country_Countryinfo_WSDL.FullCountryInfoAllCountriesResponse_element();
        Country_Countryinfo_WSDL.tCountryInfo counInf = new Country_Countryinfo_WSDL.tCountryInfo();
        counInf = serviceSoap.FullCountryInfo(Country);
        //arrayCountryInfo = serviceSoap.FullCountryInfoAllCountries();
        Country_Countryinfo_WSDL.FullCountryInfoResponse_element response = new Country_Countryinfo_WSDL.FullCountryInfoResponse_element();
        response.FullCountryInfoResult = counInf;
        system.debug('Details Are'+response);
        
        //Dom.Document doc = response.FullCountryInfoResult;
    }
}