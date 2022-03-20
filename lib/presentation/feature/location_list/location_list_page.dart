import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common_test/app/di/di.dart';
import 'package:common_test/domain/repository/location_repository.dart';
import 'package:common_test/presentation/feature/location_list/location_list_view.dart';

import 'bloc/location_list_bloc.dart';

class LocationListPage extends StatelessWidget {
  const LocationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LocationListBloc(
        getIt.get<LocationRepository>(),
      ),
      child: const LocationListView(),
    );
  }
}
