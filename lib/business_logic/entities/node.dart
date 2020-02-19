enum NodeType { AUDIO, FOLDER }

class Node {
  Node(this.type, this.name, this.path);

  Node.folder(this.name, this.path) : this.type = NodeType.FOLDER;

  Node.audio(this.name, this.path) : this.type = NodeType.AUDIO;

  NodeType type;
  String name;
  String path;
}
