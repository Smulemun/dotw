import 'package:dotw/entities/enemies/move_set.dart';
import 'package:dotw/entities/entity.dart';
import 'package:dotw/entities/player.dart';
import 'package:get/state_manager.dart';

class Enemy extends Entity {
  List<MoveSet> moveSet;
  int difficulty;
  final int blockMax;
  late Rx<MoveSet> currentMove;

  Enemy({
    required super.name,
    required super.description,
    required super.hp,
    required super.hpMax,
    required super.dmg,
    required this.moveSet,
    required this.difficulty,
    required this.blockMax,
  }) : super(block: 0.obs) {
    currentMove = moveSet[0].obs; // todo: broken moveset
  }

  MoveSet getMove(int turn) {
    currentMove.value = moveSet[turn % moveSet.length];
    return currentMove.value;
  }

  void move(Player player, int turn) {
    block.value = 0;
    if (getMove(turn + 1) == MoveSet.block) {
      blockMove();
    }
    switch (getMove(turn)) {
      case MoveSet.attack:
        attack(player);
        break;
      case MoveSet.support:
        supportMove();
        break;
      case MoveSet.block:
        break;
    }
  }

  void blockMove() {
    block.value = blockMax;
  }

  void supportMove() {}

  @override
  void onDeath(Entity attacker) {
    if (attacker.runtimeType == Player && !isDead.value) {
      (attacker as Player).money.value += difficulty * 5;
    }
    super.onDeath(attacker);
  }
}
