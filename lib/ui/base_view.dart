import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_test/core/helper/dependency_injection.dart';
import 'package:unit_test/core/viewmodels/base_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function? onModelReady;

  const BaseView({Key? key, required this.builder, this.onModelReady})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BaseViewState<T>();
  }
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = injector<T>();

  @override
  void initState() {
    widget.onModelReady!(model);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
