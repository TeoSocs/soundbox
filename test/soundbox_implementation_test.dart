import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:soundbox/business_logic/entities/node.dart';
import 'package:soundbox/business_logic/implementations/soundbox_implementation.dart';
import 'package:soundbox/services/PersistenceService.dart';

class MockPersistenceService extends Mock implements PersistenceService {}

void main() {
  SounboxImpl soundbox;
  MockPersistenceService persistenceService;

  setUp(() {
    // recreate test objects before each test
    persistenceService = MockPersistenceService();
    soundbox = SounboxImpl(persistenceService);
  });

  test('goTo works as intended', () {
    final target = Node.folder("currentLocation", "/currentLocation");
    soundbox.goTo(target);
    expect(soundbox.currentLocation, target);
  });

  test('goTo fails if the target is not a folder', () {
    final wrongTarget = Node.audio("name", "/path");
    expect(() => soundbox.goTo(wrongTarget), throwsException);
  });

  test(
    'The getter .children returns asyncronously the content of [currentLocation] as list of nodes',
    () async {
      soundbox.goTo(Node.folder("currentLocation", "/currentLocation"));
      final testChildren = <Node>[
        Node.folder("folder1", "/currentLocation/folder1"),
        Node.folder("folder2", "/currentLocation/folder2"),
        Node.audio("audio1", "/currentLocation/audio1.mp3"),
        Node.audio("audio2", "/currentLocation/audio2.mp3"),
        Node.audio("audio3", "/currentLocation/audio3.mp3"),
        Node.audio("audio4", "/currentLocation/audio4.mp3"),
        Node.audio("audio5", "/currentLocation/audio5.mp3"),
      ];
      when(persistenceService.folderIn(soundbox.currentLocation)).thenAnswer(
          (_) => Future<List<Node>>.value(testChildren.sublist(0, 2)));
      when(persistenceService.audioIn(soundbox.currentLocation))
          .thenAnswer((_) => Future<List<Node>>.value(testChildren.sublist(2)));
      List<Node> testResult = await soundbox.children;
      expect(testResult, equals(testChildren));
    },
  );
}
