abstract class Soundbox {
  /// The path opened in the Soundbox
  String currentLocation;

  /// Play the [audio] in the [currentLocation]
  void play(String audio);

  /// Stop the currently playing audio
  void stop();

  /// List the content of [currentLocation]
  List<String> get children;

  /// Change [currentLocation] to [currentLocation]/[target]
  void goTo(String target);
}
