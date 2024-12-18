//ALL APIS DEFINE HERE
class AppUrl {
  //This is our base url
  static String baseUrl = "https://disease.sh/v3/covid-19/";

  //Fetch world covid states
  static String worldStatesApi = baseUrl + 'all';
  static String countriesList = baseUrl + 'countries';
}
