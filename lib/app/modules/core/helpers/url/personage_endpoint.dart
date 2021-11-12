class PersonageEndpoint {
  const PersonageEndpoint._();

  static const String url = "https://gateway.marvel.com";

  static const String v1 = '/v1/public';

  static const String personages = "$v1/characters";
  static const String comics = "$v1/comics";
  static const String creators = "$v1/creators";
  static const String events = "$v1/events";
  static const String series = "$v1/series";
  static const String stories = "$v1/stories";
}
