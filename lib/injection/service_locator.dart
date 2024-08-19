import 'package:flutter_magenta/helper/image_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ImageHelper>(ImageHelper());
}