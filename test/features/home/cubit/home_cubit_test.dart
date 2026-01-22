import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hiring_test_app/features/home/cubit/home_cubit.dart';
import 'package:hiring_test_app/features/home/cubit/home_state.dart';
import 'package:hiring_test_app/features/home/data/stadium_repository.dart';
import 'package:hiring_test_app/features/home/models/stadium_model.dart';
import 'package:hiring_test_app/core/resources/assets_manager.dart';

class MockStadiumRepository extends Mock implements StadiumRepository {}

void main() {
  late HomeCubit homeCubit;
  late MockStadiumRepository mockRepository;

  final tCities = ['Cairo', 'Giza'];
  final tStadiums = [
    const StadiumModel(
      id: '1',
      name: 'Test Stadium',
      location: 'Location',
      imagePath: ImageAssets.stadiumImage1,
      rating: 4.5,
      distance: 2.0,
      price: 100,
      description: 'Desc',
    ),
  ];

  setUp(() {
    mockRepository = MockStadiumRepository();
    when(() => mockRepository.getCities()).thenAnswer((_) async => tCities);
    when(() => mockRepository.getStadiums()).thenAnswer((_) async => tStadiums);
    homeCubit = HomeCubit(mockRepository, autoLoad: false);
  });

  tearDown(() {
    homeCubit.close();
  });

  group('HomeCubit', () {
    blocTest<HomeCubit, HomeState>(
      'emits [loading, loaded] when retry is called',
      build: () {
        when(() => mockRepository.getCities()).thenAnswer((_) async => tCities);
        when(
          () => mockRepository.getStadiums(),
        ).thenAnswer((_) async => tStadiums);
        return HomeCubit(mockRepository, autoLoad: false);
      },
      act: (cubit) => cubit.retry(),
      expect: () => [
        const HomeState.loading(),
        HomeState.loaded(
          cities: tCities,
          selectedCity: tCities.first,
          stadiums: tStadiums,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits loaded state with new selection when changeCity is called',
      build: () => homeCubit,
      seed: () => HomeState.loaded(
        cities: tCities,
        selectedCity: tCities.first,
        stadiums: tStadiums,
      ),
      act: (cubit) => cubit.changeCity('Giza'),
      expect: () => [
        HomeState.loaded(
          cities: tCities,
          selectedCity: 'Giza',
          stadiums: tStadiums,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, error] when repository fails',
      build: () {
        when(
          () => mockRepository.getCities(),
        ).thenThrow(Exception('Failed to load'));
        return HomeCubit(mockRepository, autoLoad: false);
      },
      act: (cubit) => cubit.retry(),
      expect: () => [
        const HomeState.loading(),
        const HomeState.error('Exception: Failed to load'),
      ],
    );
  });
}
