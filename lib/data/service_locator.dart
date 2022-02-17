
import 'package:geekz_challenge/data/repositories/all_news_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  sl.registerLazySingleton(() => AllNewsRepo());

}
