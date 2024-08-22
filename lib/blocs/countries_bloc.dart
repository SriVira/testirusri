import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testirusri/models/countries_model.dart';
import 'package:testirusri/service/api_service.dart';

abstract class CountriesEvent extends Equatable {}

class GetCountries extends CountriesEvent {
  @override
  List<Object?> get props => [];
}

abstract class CountriesState extends Equatable {}

class CountriesInitial extends CountriesState {
  @override
  List<Object?> get props => [];
}

class CountriesLoading extends CountriesState {
  @override
  List<Object?> get props => [];
}

class CountriesLoaded extends CountriesState {
  final List<CountriesModel> countries;

  CountriesLoaded({required this.countries});
  @override
  List<Object?> get props => [];
}

class CountriesError extends CountriesState {
  final String message;

  CountriesError({required this.message});
  @override
  List<Object?> get props => [];
}

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc() : super(CountriesInitial()) {
    on<CountriesEvent>((event, emit) async {
      if (event is GetCountries) {
        emit(CountriesInitial());
        try {
          emit(CountriesLoading());
          List<CountriesModel> countries = await ApiService(
                  Dio(BaseOptions(contentType: "application/json")))
              .getCountries(
                  "name,capital,flags,region,languages,population,capital");
          if (countries.isNotEmpty) {
            emit(CountriesLoaded(countries: countries));
          }else{
            
          }
        } on SocketException {
          emit(CountriesError(message: "No Internet Connection"));
        } on HttpException {
          emit(CountriesError(message: "No Service Found"));
        } on FormatException {
          emit(CountriesError(message: "Invalid Response Format"));
        } catch (e) {
          emit(CountriesError(message: e.toString()));
        }
      }
    });
  }
}
