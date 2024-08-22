import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:testirusri/blocs/countries_bloc.dart';
import 'package:testirusri/models/countries_model.dart';
import 'package:testirusri/models/sorting_criteria.dart';
import 'package:testirusri/screens/components/country_list_item.dart';
import 'package:testirusri/utils/app_colors.dart';
import 'package:testirusri/widgets/shimmers/ListShimmerWidget.dart';
import 'package:testirusri/widgets/text/primary_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<SortingCriteria> _sortingCriteria = SortingCriteria.values;
  SortingCriteria _selectedCriteria = SortingCriteria.name;

  final countriesBloc = CountriesBloc()..add(GetCountries());

  List<CountriesModel> countries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Countries",
          style: TextStyle(color: appWhiteColor),
        ),
        backgroundColor: appPrimaryColor,
        actions: [
          const PrimaryText(text: "Sort By : "),
          8.width,
          //filter dropdown
          DropdownButton<SortingCriteria>(
            value: _selectedCriteria,
            iconEnabledColor: appWhiteColor,
            dropdownColor: appPrimaryColor,
            items: _sortingCriteria.map((criteria) {
              return DropdownMenuItem(
                value: criteria,
                child: PrimaryText(
                  text: criteria.name.capitalizeFirstLetter(),
                  color: appWhiteColor,
                ),
              );
            }).toList(),
            onChanged: (criteria) {
              if (criteria != null) {
                setState(() {
                  _selectedCriteria = criteria;
                });
                sortCountriesBy(criteria);
              }
            },
          ),
        ],
      ),
      // Ui state bloc
      body: BlocConsumer<CountriesBloc, CountriesState>(
        bloc: countriesBloc,
        listener: (context, state) {
          if (state is CountriesLoaded) {
            countries = List.from(state.countries)
              ..sort((a, b) => a.name.common.compareTo(b.name.common));
          }
        },
        builder: (context, state) {
          if (state is CountriesError) {
            return Center(
                child: PrimaryText(
              text: state.message,
              color: appDangerColor,
              fontWeight: FontWeight.bold,
            ));
          }

          if (state is CountriesLoaded) {
            return _countries(countries);
          }
          return ListShimmerWidget(
            itemheight: 80,
            itempadding: const EdgeInsets.symmetric(vertical: 8),
          );
        },
      ),
    );
  }

/*   FutureBuilder _body() {
    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));

    return FutureBuilder(
      future: apiService.getCountries(
          "name,capital,flags,region,languages,population,capital"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            final List<CountriesModel> countries = snapshot.data;
            return _countries(List.from(countries));
          } else {
            return const Center(child: Text('No data found'));
          }
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: appPrimaryColor,
          ));
        }
      },
    );
  } */
//countries list ui component
  Widget _countries(List<CountriesModel> countries) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: countries.length,
      itemBuilder: (BuildContext context, int index) {
        return CountryListItem(
          country: countries[index],
        );
      },
    );
  }

  //sor tCountries By
  void sortCountriesBy(SortingCriteria criteria) {
    switch (criteria) {
      case SortingCriteria.name:
        countries.sort((a, b) => a.name.common.compareTo(b.name.common));
        break;
      case SortingCriteria.capital:
        countries.sort((a, b) => a.capital.first.compareTo(b.capital.first));
        break;
      case SortingCriteria.population:
        countries.sort((a, b) => a.population.compareTo(b.population));
        break;
    }
  }
}
