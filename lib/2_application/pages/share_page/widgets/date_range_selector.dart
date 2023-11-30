import 'package:broker_app/2_application/pages/share_page/cubit/share_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

enum DateRange {
  intraday,
  daily,
  weekly,
  monthly,
}

class DateRangeSelector extends StatefulWidget {
  const DateRangeSelector({super.key});

  @override
  State<DateRangeSelector> createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends State<DateRangeSelector> {
  DateRange _selected = DateRange.intraday;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<DateRange>(
      segments: [
        for (var daterange in DateRange.values)
          ButtonSegment<DateRange>(
            value: daterange,
            label: Text(toBeginningOfSentenceCase(daterange.name)!),
          ),
      ],
      selected: <DateRange>{_selected},
      onSelectionChanged: (selection){
        setState(() {
          _selected = selection.first;
          BlocProvider.of<SharePageCubit>(context).reqestDaily(numberOfDays: 10);
        });
      },
    );
  }
}
