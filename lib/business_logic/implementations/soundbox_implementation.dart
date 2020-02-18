import 'package:soundbox/business_logic/entities/node.dart';
import 'package:soundbox/business_logic/soundbox.dart';

class SounboxImpl implements Soundbox {
  @override
  Node currentLocation;

  @override
  List<Node> get children {
    // currentLocation should never be a folder. If it is, something is gone seriously wrong.
    assert(currentLocation.type == NodeType.FOLDER);
    
  }

  @override
  void goTo(Node target) {
    // TODO: implement goTo
  }

  @override
  void play(Node audio) {
    // TODO: implement play
  }

  @override
  void stop() {
    // TODO: implement stop
  }
}
