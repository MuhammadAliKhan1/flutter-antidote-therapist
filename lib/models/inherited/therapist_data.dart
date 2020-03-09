import 'package:antidote/models/therapist_model.dart';
import 'package:flutter/widgets.dart';

class TherapistInherit extends InheritedWidget {
  Therapist therapistData;

  TherapistInherit({
    Key key,
    @required this.therapistData,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(TherapistInherit oldWidget) =>
      therapistData != oldWidget.therapistData;
  static TherapistInherit of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TherapistInherit>();
  }
}
