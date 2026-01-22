import 'package:hiring_test_app/features/home/models/stadium_model.dart';
import '../../../../core/resources/assets_manager.dart';

abstract class StadiumRepository {
  Future<List<String>> getCities();
  Future<List<StadiumModel>> getStadiums();
  Future<List<String>> getSports();
}

class StadiumRepositoryImpl implements StadiumRepository {
  @override
  Future<List<String>> getCities() async {
    // Simulate API delay
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return ['Cairo', 'Giza', 'Aswan', 'Asyut'];
  }

  @override
  Future<List<String>> getSports() async {
    // Simulate API delay
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return ['Football', 'Tennis', 'Ping Pong', 'Volleyball', 'Basketball'];
  }

  @override
  Future<List<StadiumModel>> getStadiums() async {
    // Simulate API delay
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return [
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
  }
}
