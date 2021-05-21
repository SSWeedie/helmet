import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Category {
  final String title;
  final String asset;

  Category({this.title, this.asset});
}

final categories = [
  Category(
    title: 'Cats',
    asset: 'assets/cat.png',
  ),
  Category(
    title: 'Dogs',
    asset: 'assets/dog.png',
  ),
  Category(
    title: 'Horses',
    asset: 'assets/horse.png',
  ),
  Category(
    title: 'Parrots',
    asset: 'assets/parrot.png',
  ),
  Category(
    title: 'Rabbits',
    asset: 'assets/rabbit.png',
  ),
];

class Pet {
  final String asset;
  final String name;
  final String description;
  final int gender;
  final String address;
  final Color color;

  Pet({
    this.asset,
    this.name,
    this.description,
    this.gender,
    this.address,
    this.color,
  });
}

final pets = [
  Pet(
    address: '28/02 Le Thi Hong',
    asset: 'assets/pet-cat1.png',
    name: 'Sola',
    description: 'Britain cat',
    gender: 0,
    color: Colors.lightBlueAccent[100],
  ),
  Pet(
    address: '28/02 Le Thi Hong',
    asset: 'assets/pet-cat2.png',
    name: 'Orion',
    description: 'Russian cat',
    gender: 1,
    color: Colors.greenAccent[100],
  ),
  Pet(
    address: '28/02 Le Thi Hong',
    asset: 'assets/pet-cat1.png',
    name: 'Nath',
    description: 'Germany cat',
    gender: 0,
    color: Colors.orangeAccent[100],
  ),
];

class MenuDrawer {
  final IconData icon;
  final String label;

  MenuDrawer({this.icon, this.label});
}

final menu = [
  MenuDrawer(label: 'Adoption', icon: FontAwesome.paw),
  MenuDrawer(label: 'Donation', icon: FontAwesome5.kiss_wink_heart),
  MenuDrawer(label: 'Add pet', icon: FontAwesome.plus),
  MenuDrawer(label: 'Favorites', icon: FontAwesome.heart),
  MenuDrawer(label: 'Messages', icon: FontAwesome5Solid.envelope),
  MenuDrawer(label: 'Profile', icon: FontAwesome.user),
];
