import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/Home.dart';
import '../widgets/TabChip.dart';

var indexControl = Get.put(categoriesTabController());

List<Tab> categoryTabs = [
  Tab(
    child: TabChip(
      text: 'Recent',
      indexIs: 0,
    ),
  ),
  Tab(
    child: TabChip(
      text: 'Trending',
      indexIs: 1,
    ),
  ),
  Tab(
      child: TabChip(
    text: 'Entertainment',
    indexIs: 2,
  )),
  Tab(
    child: TabChip(
      text: 'Technology',
      indexIs: 3,
    ),
  ),
  Tab(
    child: TabChip(
      text: 'Fashion',
      indexIs: 4,
    ),
  ),
  Tab(
    child: TabChip(
      text: 'News',
      indexIs: 5,
    ),
  ),
  Tab(
    child: TabChip(
      text: 'History',
      indexIs: 6,
    ),
  ),
];
