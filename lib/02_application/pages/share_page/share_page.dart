import 'package:broker_app/02_application/core/widgets/share_chart.dart';
import 'package:broker_app/02_application/pages/share_page/cubit/share_page_cubit.dart';
import 'package:broker_app/02_application/pages/share_page/widgets/date_range_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharePageWrapper extends StatelessWidget {
  const SharePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SharePageCubit(),
      child: const SharePage(),
    );
  }
}

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 300,
          child: BlocBuilder<SharePageCubit, SharePageState>(
            builder: (context, state) {
              if (state is! SharePageLoaded) {
                return const SizedBox(
                  height: 300,
                  child: CircularProgressIndicator(),
                );
              }
              return ShareChart(
                spots: state.positions,
                minY: state.min,
                maxY: state.max,
              );
            },
          ),
        ),
        const DateRangeSelector(),
      ]),
    );
  }
}
