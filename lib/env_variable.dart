import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'flavors.dart';

final variablesDev = {
  'baseUrl': dotenv.env['DEFINE_DEV_BASE_URL'],
};

final variablesUat = {
  'baseUrl': dotenv.env['DEFINE_UAT_BASE_URL'],
};

final variablesProd = {
  'baseUrl': dotenv.env['DEFINE_PROD_BASE_URL'],
};

Map<String, dynamic> get environment {
  return switch (F.appFlavor) {
    Flavor.dev => variablesDev,
    Flavor.uat => variablesUat,
    Flavor.prod => variablesProd,
    null => throw UnimplementedError('baseUrl: flavor is unknown value'),
  };
}
