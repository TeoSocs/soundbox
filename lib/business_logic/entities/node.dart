enum NodeType { AUDIO, FOLDER }

class Node {
  NodeType type;
  List<Node> children;
  String name;
  String path;
}
