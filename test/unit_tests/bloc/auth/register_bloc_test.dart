import 'package:digtial_costume_platform/domain/costume/fashion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';

import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';

main() {
  test("", () {
        //arrange

        final mockTime = DateTime.now();
        final costume = Costume(
            category: "coats",
            timePeriod: "1930s",
            created: DateTime.now(),
            edited: DateTime.now(),
            fashion: Fashion.mens,
            themes: <String>["musical", "pirates", "navy"],
            colors: <String>["black", "white", "brown"],
            quantity: 1,
            storageLocation: StorageLocation(
                main: Location(id: "aNKkI9JUcgt2yIw0qRrm", location: "Loftet"),
                subLocation: Location(
                    id: 'gruFmc6JiDYgn4AY4DRb', location: "Lille Garderobe")));

        final expectedStatus = InUse(
            inUseFor: Production(
                title: "Charlie and the Chocolate Factory",
                startDate: mockTime,
                endDate: mockTime));

        //act
        costume.status = InUse(
            inUseFor: Production(
                title: "Charlie and the Chocolate Factory",
                startDate: mockTime,
                endDate: mockTime));

        //assert
        expect(costume.status, expectedStatus);
        expect(costume.storageLocation, null);
      });

  test("setting valid storage location with both a main and sublocation sets the status to in storage", () {
        //arrange

        final mockTime = DateTime.now();
        final costume = Costume(
            category: "coats",
            timePeriod: "1930s",
            created: DateTime.now(),
            edited: DateTime.now(),
            fashion: Fashion.mens,
            themes: <String>["musical", "pirates", "navy"],
            colors: <String>["black", "white", "brown"],
            quantity: 1);


        final expectedLocation = StorageLocation(
            main: Location(id: "aNKkI9JUcgt2yIw0qRrm", location: "Loftet"),
            subLocation: Location(id:'gruFmc6JiDYgn4AY4DRb', location: "Lille Garderobe"));

        final expectedStatus = InStorage(expectedLocation);

        //act
        costume.storageLocation = expectedLocation;

        //assert
        expect(costume.status, expectedStatus);
        expect(costume.storageLocation, expectedLocation);
      });

  test("creating a Costume with a storage location sets the right status", () {
        //arrange
        final expectedLocation = StorageLocation(
            main: Location(id: "aNKkI9JUcgt2yIw0qRrm", location: "Loftet"),
            subLocation: Location(id:'gruFmc6JiDYgn4AY4DRb', location: "Lille Garderobe"));

        final expectedStatus = InStorage(expectedLocation);

        //act
        final costume = Costume(
            category: "coats",
            timePeriod: "1930s",
            created: DateTime.now(),
            edited: DateTime.now(),
            fashion: Fashion.mens,
            themes: <String>["musical", "pirates", "navy"],
            colors: <String>["black", "white", "brown"],
            quantity: 1,
            storageLocation: expectedLocation
        );

        //assert
        expect(costume.status, expectedStatus);
        expect(costume.storageLocation, expectedLocation);
      });


}
