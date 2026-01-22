import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hiring_test_app/features/details/cubit/details_cubit.dart';
import 'package:hiring_test_app/features/details/cubit/details_state.dart';
import 'package:hiring_test_app/features/home/data/stadium_repository.dart';

class MockStadiumRepository extends Mock implements StadiumRepository {}

void main() {
  late DetailsCubit detailsCubit;
  late MockStadiumRepository mockRepository;

  final tSports = [
    'Football',
    'Tennis',
    'Ping Pong',
    'Volleyball',
    'Basketball',
  ];

  setUp(() {
    mockRepository = MockStadiumRepository();
    when(() => mockRepository.getSports()).thenAnswer((_) async => tSports);
    detailsCubit = DetailsCubit(mockRepository, autoLoad: false);
  });

  tearDown(() {
    detailsCubit.close();
  });

  group('DetailsCubit', () {
    blocTest<DetailsCubit, DetailsState>(
      'emits [loading, loaded] when retry is called',
      build: () {
        when(() => mockRepository.getSports()).thenAnswer((_) async => tSports);
        return DetailsCubit(mockRepository, autoLoad: false);
      },
      act: (cubit) => cubit.retry(),
      expect: () => [
        const DetailsState.loading(),
        DetailsState.loaded(sports: tSports, selectedSport: tSports.first),
      ],
    );

    blocTest<DetailsCubit, DetailsState>(
      'emits loaded state with new selection when selectSport is called',
      build: () => detailsCubit,
      seed: () => const DetailsState.loaded(
        sports: ['Football', 'Tennis'],
        selectedSport: 'Football',
      ),
      act: (cubit) => cubit.selectSport('Tennis'),
      expect: () => [
        const DetailsState.loaded(
          sports: ['Football', 'Tennis'],
          selectedSport: 'Tennis',
        ),
      ],
    );

    blocTest<DetailsCubit, DetailsState>(
      'emits [loading, error] when repository fails',
      build: () {
        when(
          () => mockRepository.getSports(),
        ).thenThrow(Exception('Failed to load'));
        return DetailsCubit(mockRepository, autoLoad: false);
      },
      act: (cubit) => cubit.retry(),
      expect: () => [
        const DetailsState.loading(),
        const DetailsState.error('Exception: Failed to load'),
      ],
    );
  });
}
