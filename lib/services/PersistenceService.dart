import 'package:soundbox/business_logic/entities/node.dart';

abstract class PersistenceService {
  Future<String> get rootPath;
  Future<List<Node>> folderIn(Node node);
  Future<List<Node>> audioIn(Node node);
}
