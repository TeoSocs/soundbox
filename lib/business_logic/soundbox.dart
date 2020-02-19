import 'package:soundbox/business_logic/entities/node.dart';

abstract class Soundbox {
  /// The path opened in the Soundbox
  Node currentLocation;

  /// Play the [audio] in the [currentLocation]
  void play(Node audio);

  /// Stop the currently playing audio
  void stop();

  /// List the content of [currentLocation]
  Future<List<Node>> get children;

  /// Change [currentLocation] to [currentLocation]/[target]
  void goTo(Node target);
}
