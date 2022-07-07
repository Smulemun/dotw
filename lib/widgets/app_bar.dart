import 'package:dotw/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../entities/player.dart';

AppBar buildAppBar(Player player) {
  return AppBar(
    backgroundColor: GameColors.first,
    automaticallyImplyLeading: false,
    elevation: 0,
    centerTitle: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 15),
              child: Image.asset('assets/icon/heart.png'),
            ),
            Obx(() => Container(
                    child: Text(
                  '${player.hp.value}/${player.hpMax}',
                  style: const TextStyle(fontSize: 22, fontFamily: beaufort),
                ))),
          ],
        ),
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 15),
              child: Image.asset('assets/icon/shield.png'),
            ),
            Obx(
              () => Text(
                '${player.block}',
                style: const TextStyle(fontSize: 22, fontFamily: beaufort),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 15),
              child: Image.asset('assets/icon/coin.png'),
            ),
            Obx(() => Text(
                  '${player.money.value}',
                  style: const TextStyle(fontSize: 22, fontFamily: beaufort),
                )),
          ],
        ),
      ],
    ),
  );
}
