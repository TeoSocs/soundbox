import 'package:path_provider/path_provider.dart';
import 'package:soundbox/services/FileSystem.dart';

class LocalFileSystem implements FileSystem {
  @override
  Future<String> get rootPath async =>
      (await getApplicationDocumentsDirectory()).path;
}
