enum Flavor {
  dev,
  uat,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev MovieApp';
      case Flavor.uat:
        return 'UAT MovieApp';
      case Flavor.prod:
        return 'Movie App';
      default:
        return 'title';
    }
  }

}
