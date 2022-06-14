import 'package:adama_agropacking_flutter_web/core/widgets/input/input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/theme_extension.dart';

enum PickerDemoType {
  date,
  time,
  range,
}

class DateInput extends StatefulWidget {
  final String placeholder;
  final String hint;

  const DateInput({
    Key? key,
    required this.placeholder,
    required this.hint,
    this.type = PickerDemoType.date,
  }) : super(key: key);

  final PickerDemoType type;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> with RestorationMixin {
  final TextEditingController controller = TextEditingController();

  final RestorableDateTime _fromDate = RestorableDateTime(DateTime.now());
  final RestorableTimeOfDay _fromTime = RestorableTimeOfDay(
    TimeOfDay.fromDateTime(DateTime.now()),
  );
  final RestorableDateTime _startDate = RestorableDateTime(DateTime.now());
  final RestorableDateTime _endDate = RestorableDateTime(DateTime.now());

  late RestorableRouteFuture<DateTime> _restorableDatePickerRouteFuture;
  late RestorableRouteFuture<DateTimeRange>
      _restorableDateRangePickerRouteFuture;
  late RestorableRouteFuture<TimeOfDay> _restorableTimePickerRouteFuture;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _selectDate(DateTime selectedDate) {
    if (selectedDate != _fromDate.value) {
      _fromDate.value = selectedDate;
      controller.text = DateFormat('dd/MM/yyyy').format(_fromDate.value);
      setState(() {});
    }
  }

  void _selectDateRange(DateTimeRange newSelectedDate) {
    setState(() {
      _startDate.value = newSelectedDate.start;
      _endDate.value = newSelectedDate.end;
    });
  }

  void _selectTime(TimeOfDay selectedTime) {
    if (selectedTime != _fromTime.value) {
      setState(() {
        _fromTime.value = selectedTime;
      });
    }
  }

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments as int),
          firstDate: DateTime(2015, 1),
          lastDate: DateTime(2100),
        );
      },
    );
  }

  static Route<TimeOfDay> _timePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    final args = arguments as List<Object>;
    final initialTime = TimeOfDay(
      hour: args[0] as int,
      minute: args[1] as int,
    );

    return DialogRoute<TimeOfDay>(
      context: context,
      builder: (context) {
        return TimePickerDialog(
          restorationId: 'time_picker_dialog',
          initialTime: initialTime,
        );
      },
    );
  }

  static Route<DateTimeRange> _dateRangePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTimeRange>(
      context: context,
      builder: (context) {
        return DateRangePickerDialog(
          restorationId: 'date_rage_picker_dialog',
          firstDate: DateTime(DateTime.now().year - 5),
          lastDate: DateTime(DateTime.now().year + 5),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime>(
      onComplete: _selectDate,
      onPresent: (navigator, arguments) {
        return navigator.restorablePush(
          _datePickerRoute,
          arguments: _fromDate.value.millisecondsSinceEpoch,
        );
      },
    );
    _restorableDateRangePickerRouteFuture =
        RestorableRouteFuture<DateTimeRange>(
      onComplete: _selectDateRange,
      onPresent: (navigator, arguments) =>
          navigator.restorablePush(_dateRangePickerRoute),
    );

    _restorableTimePickerRouteFuture = RestorableRouteFuture<TimeOfDay>(
      onComplete: _selectTime,
      onPresent: (navigator, arguments) => navigator.restorablePush(
        _timePickerRoute,
        arguments: [_fromTime.value.hour, _fromTime.value.minute],
      ),
    );
  }

  @override
  String get restorationId => 'picker_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_fromDate, 'from_date');
    registerForRestoration(_fromTime, 'from_time');
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
      _restorableDatePickerRouteFuture,
      'date_picker_route',
    );
    registerForRestoration(
      _restorableDateRangePickerRouteFuture,
      'date_range_picker_route',
    );
    registerForRestoration(
      _restorableTimePickerRouteFuture,
      'time_picker_route',
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (widget.type) {
          case PickerDemoType.date:
            _restorableDatePickerRouteFuture.present();
            break;
          case PickerDemoType.time:
            _restorableTimePickerRouteFuture.present();
            break;
          case PickerDemoType.range:
            _restorableDateRangePickerRouteFuture.present();
            break;
        }
      },
      child: Input(
        enabled: false,
        placeholder: widget.placeholder,
        textController: controller,
        hint: widget.hint,
        leading: Icon(
          Icons.calendar_month_outlined,
          color: Theme.of(context).extension<CustomColors>()!.label,
        ),
      ),
    );
  }
}
