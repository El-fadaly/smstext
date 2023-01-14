import 'package:get_it/get_it.dart';
import 'package:smstest/presentaion/view_models/home_view_model.dart';

GetIt dependencyInjection = GetIt.instance;

Future setupDependencyInjection() async {
  dependencyInjection.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(),
  );
}
