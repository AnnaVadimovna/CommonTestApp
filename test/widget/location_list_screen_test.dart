import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:common_test/domain/model/location.dart';
import 'package:common_test/domain/model/location_resolution.dart';
import 'package:common_test/domain/repository/location_repository.dart';
import 'package:common_test/presentation/feature/location_list/location_list_page.dart';

import 'location_list_screen_po.dart';
import 'location_list_screen_test.mocks.dart';
import 'testable_widget.dart';

@GenerateMocks([LocationRepository])
void main() async {
  final getIt = GetIt.instance;
  tearDown(() {
    getIt.reset(dispose: true);
  });

  testWidgets('Loading is shown', (WidgetTester tester) async {
    final repository = MockLocationRepository();
    when(repository.getLocationList()).thenAnswer((_) async => const LocationResolution.error("ERROR"));
    getIt.registerSingleton<LocationRepository>(repository);

    await tester.pumpWidget(makeTestableWidget(child: const LocationListPage()));
    await tester.pump();

    final screen = LocationListPageObject(find.byType(LocationListPage));

    expect(screen.loading, findsOneWidget);
    expect(screen.content, findsNothing);
    expect(screen.error, findsNothing);
    expect(screen.empty, findsNothing);
  });

  testWidgets('Error is shown', (WidgetTester tester) async {
    final repository = MockLocationRepository();
    when(repository.getLocationList()).thenAnswer((_) async => const LocationResolution.error("ERROR"));
    getIt.registerSingleton<LocationRepository>(repository);

    await tester.pumpWidget(makeTestableWidget(child: const LocationListPage()));
    await tester.pump();
    await tester.pumpAndSettle();
    final screen = LocationListPageObject(find.byType(LocationListPage));

    expect(screen.error, findsOneWidget);
    expect(screen.content, findsNothing);
    expect(screen.loading, findsNothing);
    expect(screen.empty, findsNothing);
  });

  testWidgets('Empty is shown', (WidgetTester tester) async {
    final repository = MockLocationRepository();
    when(repository.getLocationList()).thenAnswer((_) async => const LocationResolution.success([], false));
    getIt.registerSingleton<LocationRepository>(repository);

    await tester.pumpWidget(makeTestableWidget(child: const LocationListPage()));
    await tester.pump();
    await tester.pumpAndSettle();
    final screen = LocationListPageObject(find.byType(LocationListPage));

    expect(screen.error, findsNothing);
    expect(screen.content, findsNothing);
    expect(screen.loading, findsNothing);
    expect(screen.empty, findsOneWidget);
  });

  testWidgets('Content is shown', (WidgetTester tester) async {
    final repository = MockLocationRepository();
    when(repository.getLocationList()).thenAnswer((_) async => LocationResolution.success([_stub()], false));
    getIt.registerSingleton<LocationRepository>(repository);

    await tester.pumpWidget(makeTestableWidget(child: const LocationListPage()));
    await tester.pump();
    await tester.pumpAndSettle();
    final screen = LocationListPageObject(find.byType(LocationListPage));

    expect(screen.error, findsNothing);
    expect(screen.content, findsOneWidget);
    expect(screen.loading, findsNothing);
    expect(screen.empty, findsNothing);
  });
}

Location _stub() {
  return Location(
    bearing: 0,
    datetime: DateTime.now(),
    distanceFromLast: 0,
    gpsStatus: "",
    lat: 0,
    lon: 0,
    speed: 0,
    xAcc: 0,
    yAcc: 0,
    zAcc: 0,
  );
}
