import 'package:flutter/material.dart';
import '../../../utils/providers/base_provider.dart';
import '../../../../core/utils/global_var.dart';

import 'loading.dart';
import 'messages.dart';

class InfiniteListview<T> extends StatelessWidget {
  final BaseProvider modelProvider;
  final Future Function() loadDataFun;
  final Function(dynamic item) listItemWidget;
  final Widget? emptyDataWidget;
  final EdgeInsets? padding;
  const InfiniteListview({
    Key? key,
    required this.modelProvider,
    required this.loadDataFun,
    required this.listItemWidget,
    this.emptyDataWidget,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        modelProvider.page = 0;
        return loadDataFun();
      },
      child: ListView.builder(
        padding: padding,
        itemCount: modelProvider.dataList.length + 1,
        itemBuilder: (ctx, index) {
          // load more items
          if (index == modelProvider.dataList.length - modelProvider.nextPageThreshold && modelProvider.isMoreAvailable && !modelProvider.isBusy) {
            loadDataFun();
          }
          // handel bottom in list
          if (index == modelProvider.dataList.length) {
            if (modelProvider.isInit) return const SizedBox();
            if (modelProvider.isBusy) return const LoadingWidget();
            if (modelProvider.isIdle && modelProvider.dataList.isEmpty)
              return emptyDataWidget ?? ErrorCustomWidget(str.msg.noDataAvailable, showErrorWord: false);
          }
          // show list item
          return listItemWidget(modelProvider.dataList[index]);
        },
      ),
    );
  }
}

class InfiniteSliverList<T> extends StatelessWidget {
  final BaseProvider modelProvider;
  final Future Function() loadDataFun;
  final Function(dynamic item) listItemWidget;
  final Widget? emptyDataWidget;
  final EdgeInsets? padding;
  const InfiniteSliverList({
    Key? key,
    required this.modelProvider,
    required this.loadDataFun,
    required this.listItemWidget,
    this.emptyDataWidget,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          (ctx, index) {
            // load more items
            if (index == modelProvider.dataList.length - modelProvider.nextPageThreshold && modelProvider.isMoreAvailable && !modelProvider.isBusy) {
              loadDataFun();
            }
            // handel bottom in list
            // handel bottom in list
            if (index == modelProvider.dataList.length) {
              if (modelProvider.isInit) return const SizedBox();
              if (modelProvider.isBusy) return const LoadingWidget();
              if (modelProvider.isIdle && modelProvider.dataList.isEmpty)
                return emptyDataWidget ?? ErrorCustomWidget(str.msg.noDataAvailable, showErrorWord: false);
            }

            // show list item
            return listItemWidget(modelProvider.dataList[index]);
          },
          childCount: modelProvider.dataList.length + 1,
        ),
      ),
    );
  }
}

class InfiniteSliverGrid<T> extends StatelessWidget {
  final BaseProvider modelProvider;
  final Future Function() loadDataFun;
  final Function(dynamic item) listItemWidget;
  final int crossAxisCount;
  final double gridViewAspectRatio;
  final Widget? emptyDataWidget;
  final EdgeInsets? padding;
  const InfiniteSliverGrid({
    Key? key,
    required this.modelProvider,
    required this.loadDataFun,
    required this.listItemWidget,
    this.crossAxisCount = 3,
    this.gridViewAspectRatio = 3 / 4,
    this.emptyDataWidget,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          // load more items
          if (index == modelProvider.dataList.length - modelProvider.nextPageThreshold && modelProvider.isMoreAvailable && !modelProvider.isBusy) {
            loadDataFun();
          }
          // handel bottom in list
          if (index == modelProvider.dataList.length) {
            if (modelProvider.isInit) return const SizedBox();
            if (modelProvider.isBusy) return const LoadingWidget();
            if (modelProvider.isIdle && modelProvider.dataList.isEmpty)
              return emptyDataWidget ?? ErrorCustomWidget(str.msg.noDataAvailable, showErrorWord: false);
          }
          // show list item
          return listItemWidget(modelProvider.dataList[index]);
        },
        childCount: modelProvider.dataList.length + 1,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: gridViewAspectRatio,
      ),
    );
  }
}
