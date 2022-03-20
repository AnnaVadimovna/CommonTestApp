import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common_test/domain/model/location.dart';
import 'package:common_test/generated/l10n.dart';
import 'package:common_test/presentation/feature/location_list/bloc/location_list_bloc.dart';

class LocationListView extends StatelessWidget {
  const LocationListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).location_list),
      ),
      body: BlocBuilder<LocationListBloc, LocationListState>(
        builder: (context, state) {
          return state.when(
            loading: () => _loading(context),
            loaded: (items) => _loaded(context, items),
            empty: () => _empty(context),
            error: (msg) => _error(context, msg),
          );
        },
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return Center(
      key: loadingKey,
      child: Column(
        children: [
          const CircularProgressIndicator(
            color: Colors.blue,
          ),
          Text(
            S.of(context).location_list_loading,
          )
        ],
      ),
    );
  }

  static List<charts.Series<Acc, num>> _createData(List<Location> items) {
    final dataX = <Acc>[];
    final dataY = <Acc>[];
    final dataZ = <Acc>[];
    int position = 0;
    for (var element in items) {
      dataX.add(Acc(position, element.xAcc));
      dataY.add(Acc(position, element.yAcc));
      dataZ.add(Acc(position, element.zAcc));
      position = position + 1;
    }
    return [
      charts.Series<Acc, int>(
        id: '“xAcc”',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Acc acc, _) => acc.position,
        measureFn: (Acc acc, _) => acc.value,
        data: dataX,
      ),
      charts.Series<Acc, int>(
        id: '“yAcc”',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Acc acc, _) => acc.position,
        measureFn: (Acc acc, _) => acc.value,
        data: dataY,
      ),
      charts.Series<Acc, int>(
        id: '“zAcc”',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Acc acc, _) => acc.position,
        measureFn: (Acc acc, _) => acc.value,
        data: dataZ,
      ),
    ];
  }

  Widget _loaded(BuildContext context, List<Location> items) {
    final seriesList = _createData(items);
    return SizedBox(
      key: contentKey,
      height: 300,
      width: double.infinity,
      child: charts.LineChart(seriesList, animate: false),
    );
  }

  Widget _empty(BuildContext context) {
    return Center(
      key: emptyKey,
      child: Column(
        children: [
          Text(
            S.of(context).location_list_empty,
          ),
          OutlinedButton(
            onPressed: () => BlocProvider.of<LocationListBloc>(context).add(const LocationListEvent.refresh()),
            child: Text(S.of(context).location_list_retry),
          ),
        ],
      ),
    );
  }

  Widget _error(BuildContext context, String? message) {
    return Center(
      key: errorKey,
      child: Column(
        children: [
          Text(
            message ?? S.of(context).location_list_error,
          ),
          OutlinedButton(
            onPressed: () => BlocProvider.of<LocationListBloc>(context).add(const LocationListEvent.refresh()),
            child: Text(S.of(context).location_list_retry),
          ),
        ],
      ),
    );
  }

  static const loadingKey = Key("loading");
  static const contentKey = Key("content");
  static const errorKey = Key("error");
  static const emptyKey = Key("empty");
}

class Acc {
  final int position;
  final double value;

  Acc(this.position, this.value);
}
