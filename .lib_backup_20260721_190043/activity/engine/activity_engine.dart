import '../repositories/activity_repository.dart';

class ActivityEngine {
  ActivityEngine(this.activityRepository);
  final ActivityRepository activityRepository;

  Future<void> initialize() async {}
}
