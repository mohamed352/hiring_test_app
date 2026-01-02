import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_test_app/core/logger/app_logger.dart';
import 'package:hiring_test_app/core/resources/assets_manager.dart';
import 'package:hiring_test_app/features/home/models/stadium_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial()) {
    _loadInitialData();
  }

  void _loadInitialData() async {
    log.d('Loading initial home data', tag: LogTags.bloc);
    emit(const HomeState.loading());

    // Simulate API delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // In a real app, fetch from generic repository
    final cities = ['Cairo', 'Giza', 'Aswan', 'Asyut'];
    final stadiums = [
      const StadiumModel(
        id: '1',
        name: 'First Settlement Youth Center',
        location: 'New Cairo, Egypt',
        imagePath: ImageAssets.stadiumImage1,
        rating: 4.8,
        distance: 2.5,
        price: 150,
        description: 'In New Cairo provides sports and community...',
      ),
      const StadiumModel(
        id: '2',
        name: 'Al-Ahly Club Stadium',
        location: 'Nasr City, Egypt',
        imagePath: ImageAssets.stadiumImage2,
        rating: 4.5,
        distance: 5.0,
        price: 200,
        description: 'Famous club stadium with top facilities.',
      ),
      const StadiumModel(
        id: '3',
        name: 'Zamalek SC',
        location: 'Giza, Egypt',
        imagePath: ImageAssets.stadiumImage3,
        rating: 4.2,
        distance: 12.0,
        price: 180,
        description: 'Historic club with great atmosphere.',
      ),
    ];

    log.i('Home data loaded successfully', tag: LogTags.bloc);
    emit(
      HomeState.loaded(
        cities: cities,
        selectedCity: cities.first,
        stadiums: stadiums,
      ),
    );
  }

  void changeCity(String city) {
    state.maybeWhen(
      loaded: (cities, currentCity, stadiums) {
        log.i('City changed to: $city', tag: LogTags.bloc);
        emit(
          HomeState.loaded(
            cities: cities,
            selectedCity: city,
            stadiums: stadiums,
          ),
        );
      },
      orElse: () {},
    );
  }
}
