import 'package:flutter/material.dart';


class Country {
  final String name;
  final List<StateData> states;

  Country({required this.name, required this.states});
}

class StateData {
  final String name;
  final List<District> districts;

  StateData({required this.name, required this.districts});
}

class District {
  final String name;
  final List<String> cities;

  District({required this.name, required this.cities});
}

class SearchFilterPage extends StatefulWidget {
  @override
  _SearchFilterPageState createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  List<Country> countries = [
    Country(
      name: 'India',
      states: [
        StateData(
          name: 'Tamil Nadu',
          districts: [
            District(name: 'Dharmapuri', cities: ['City 1', 'City 2']),
            District(name: 'Chennai', cities: ['City 3', 'City 4']),
          ],
        ),
        StateData(
          name: 'Karnataka',
          districts: [
            District(name: 'Bangalore', cities: ['City 5', 'City 6']),
            District(name: 'Mysore', cities: ['City 7', 'City 8']),
          ],
        ),
      ],
    ),
  ];

  String? selectedCountry;
  String? selectedState;
  String? selectedDistrict;
  String? selectedCity;
  List<String>? filteredCities;

  @override
  void initState() {
    super.initState();
    filteredCities = [];
  }

  void filterLocations() {
    if (selectedCountry != null &&
        selectedState != null &&
        selectedDistrict != null &&
        selectedCity != null) {
      var foundCountry = countries.firstWhere(
        (country) => country.name == selectedCountry,
        orElse: () => Country(name: '', states: []),
      );
      var foundState = foundCountry.states.firstWhere(
        (state) => state.name == selectedState,
        orElse: () => StateData(name: '', districts: []),
      );
      var foundDistrict = foundState.districts.firstWhere(
        (district) => district.name == selectedDistrict,
        orElse: () => District(name: '', cities: []),
      );
      setState(() {
        filteredCities = foundDistrict.cities;
      });
    } else {
      setState(() {
        filteredCities = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> countryNames =
        countries.map((country) => country.name).toList();
    List<String>? stateNames = selectedCountry == null
        ? []
        : countries
            .firstWhere((country) => country.name == selectedCountry,
                orElse: () => Country(name: '', states: []))
            .states
            .map((state) => state.name)
            .toList();
    List<String>? districtNames =
        selectedCountry == null || selectedState == null
            ? []
            : countries
                .firstWhere((country) => country.name == selectedCountry,
                    orElse: () => Country(name: '', states: []))
                .states
                .firstWhere((state) => state.name == selectedState,
                    orElse: () => StateData(name: '', districts: []))
                .districts
                .map((district) => district.name)
                .toList();
    List<String>? cityNames = selectedCountry == null ||
            selectedState == null ||
            selectedDistrict == null
        ? []
        : countries
            .firstWhere((country) => country.name == selectedCountry,
                orElse: () => Country(name: '', states: []))
            .states
            .firstWhere((state) => state.name == selectedState,
                orElse: () => StateData(name: '', districts: []))
            .districts
            .firstWhere((district) => district.name == selectedDistrict,
                orElse: () => District(name: '', cities: []))
            .cities;

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Filter Example'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 16), // Added space here
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCountry,
              isExpanded: true,
              hint: Text('Select Country'),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                  selectedState = null; // Reset state on country change
                  selectedDistrict = null; // Reset district on country change
                  selectedCity = null; // Reset city on country change
                  filterLocations();
                });
              },
              items: countryNames.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16), // Added space here
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedState,
              isExpanded: true,
              hint: Text('Select State'),
              onChanged: (value) {
                setState(() {
                  selectedState = value;
                  selectedDistrict = null; // Reset district on state change
                  selectedCity = null; // Reset city on state change
                  filterLocations();
                });
              },
              items: stateNames!.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16), // Added space here
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedDistrict,
              isExpanded: true,
              hint: Text('Select District'),
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value;
                  selectedCity = null; // Reset city on district change
                  filterLocations();
                });
              },
              items:
                  districtNames!.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16), // Added space here
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCity,
              isExpanded: true,
              hint: Text('Select City'),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
              items: cityNames!.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16), // Added space here
          ElevatedButton(
            onPressed: () {
              // Navigate to the next page when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextPage()),
              );
            },
            child: Text('Perform Action'),
          ),
        ],
      ),
    );
  }
}

// Add a new stateless widget for the next page
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('This is the next page'),
      ),
    );
  }
}
