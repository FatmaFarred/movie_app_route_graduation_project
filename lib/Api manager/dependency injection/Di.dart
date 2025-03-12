import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/dependency%20injection/Di.config.dart';


final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();