import 'package:google_stadia_app_concept/model/GameOfFriendsModal.dart';
import 'package:google_stadia_app_concept/styleguide/AppImages.dart';

import 'FriendsModel.dart';
import 'LastPlayedGameModel.dart';

class AppData {
  static final List<FriendModel> friends = [
    FriendModel(
        name: "Jennie", imagePath: AppImages.friend_jeenie, isOnline: true),
    FriendModel(
        name: "Gena", imagePath: AppImages.friend_gena, isOnline: false),
    FriendModel(
        name: "Michelle", imagePath: AppImages.friend_michelle, isOnline: true),
    FriendModel(
        name: "Trish", imagePath: AppImages.friend_trish, isOnline: false),
    FriendModel(
        name: "Jennie", imagePath: AppImages.friend_jeenie, isOnline: true),
    FriendModel(
        name: "Gena", imagePath: AppImages.friend_gena, isOnline: false),
    FriendModel(
        name: "Michelle", imagePath: AppImages.friend_michelle, isOnline: true),
    FriendModel(
        name: "Trish", imagePath: AppImages.friend_trish, isOnline: false)
  ];

  static final List<LastPlayedGameModel> lastPlayedGames = [
    LastPlayedGameModel(
        name: "Assassin's Creed Odyssey new 2019 sesson2",
        hoursPlayed: 10,
        gameProgress: 0.20,
        imagePath: AppImages.game_assassin),
    LastPlayedGameModel(
        name: "Dead Cells",
        hoursPlayed: 50,
        gameProgress: 0.80,
        imagePath: AppImages.game_dead_cells),
    LastPlayedGameModel(
        name: "Stardew Valley",
        hoursPlayed: 90,
        gameProgress: 0.95,
        imagePath: AppImages.game_stardew),
    LastPlayedGameModel(
        name: "No Man's Sky",
        hoursPlayed: 3,
        gameProgress: 0.10,
        imagePath: AppImages.game_no_mans_sky),
  ];
  static final List<GameOfFriendsModal> gamesOfFriends = [
    GameOfFriendsModal(imagePath: AppImages.game_assassin),
    GameOfFriendsModal(imagePath: AppImages.game_dead_cells),
    GameOfFriendsModal(imagePath: AppImages.game_stardew),
    GameOfFriendsModal(imagePath: AppImages.game_no_mans_sky),
  ];
}
