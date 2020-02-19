import 'package:soundbox/business_logic/entities/node.dart';
import 'package:soundbox/business_logic/soundbox.dart';
import 'package:soundbox/services/PersistenceService.dart';

class SounboxImpl implements Soundbox {
  SounboxImpl(this.persistenceService);

  final PersistenceService persistenceService;

  @override
  Node currentLocation;

  @override
  Future<List<Node>> get children async {
    // currentLocation should never be a folder. If it is, something is gone seriously wrong.
    assert(currentLocation.type == NodeType.FOLDER);
    List<Node> _children = List()
      ..addAll(await persistenceService.folderIn(currentLocation))
      ..addAll(await persistenceService.audioIn(currentLocation));
    return _children;
  }

  @override
  void goTo(Node target) {
    if (target.type != NodeType.FOLDER)
      throw Exception("the goTo target is not a folder");
    currentLocation = target;
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
