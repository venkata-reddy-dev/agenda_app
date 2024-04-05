import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_injectable.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  asExtension: true,
)
Future<void> configureDependencies() async => sl.init();
