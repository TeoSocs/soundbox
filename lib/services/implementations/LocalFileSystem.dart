import 'package:soundbox/business_logic/entities/node.dart';
import 'package:soundbox/services/PersistenceService.dart';

class LocalFilesystem implements PersistenceService {
  @override
  Future<List<Node>> audioIn(Node node) {
    // TODO: implement audioIn
    return null;
  }

  @override
  Future<List<Node>> folderIn(Node node) {
    // TODO: implement folderIn
    return null;
  }

  @override
  // TODO: implement rootPath
  Future<String> get rootPath => null;
}
