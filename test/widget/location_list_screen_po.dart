import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:common_test/presentation/feature/location_list/location_list_view.dart';
import 'package:page_object/page_object.dart';

class LocationListPageObject extends PageObject {
  LocationListPageObject(Finder finder) : super(find.descendant(of: finder, matching: find.byType(LocationListView)));

  Finder get appBar => find.descendant(of: this, matching: find.byType(AppBar));
  Finder get content => find.descendant(of: this, matching: find.byKey(LocationListView.contentKey));
  Finder get empty => find.descendant(of: this, matching: find.byKey(LocationListView.emptyKey));
  Finder get error => find.descendant(of: this, matching: find.byKey(LocationListView.errorKey));
  Finder get loading => find.descendant(of: this, matching: find.byKey(LocationListView.loadingKey));
}
