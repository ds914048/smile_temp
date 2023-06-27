import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/services/internet_connectivity/internet_connectivity_provider.dart';

/// app provider lists
List<SingleChildWidget> providers = [
  ///provider will provide Internet connectivity changes alert
  ChangeNotifierProvider.value(
    value: InternetConnectivityProvider(),
  ),
];
