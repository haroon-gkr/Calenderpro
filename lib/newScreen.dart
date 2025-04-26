import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter/services.dart';

class Newscreen extends StatefulWidget {
  const Newscreen({super.key});

  @override
  State<Newscreen> createState() => _NewscreenState();
}

class _NewscreenState extends State<Newscreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  dynamic daysValue;
  dynamic monthValue;
  dynamic yearValue;
  dynamic daysResult;
  dynamic monthResult;

  String getWeekday(int day, int month, int year) {
    try {
      final date = DateTime(year, month, day);
      // Fix weekday calculation by adjusting for proper output
      return [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ][(date.weekday - 1) % 7]; // Ensure correct mapping of the weekdays
    } catch (_) {
      return 'Invalid date';
    }
  }

  String getMonthName(int month) {
    return [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ][month - 1];
  }

  void submit() {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();

      final int? day = int.tryParse(daysValue);
      final int? month = int.tryParse(monthValue);
      final int? year = int.tryParse(yearValue);

      // Validation for valid day, month, and year ranges
      if (day == null ||
          month == null ||
          year == null ||
          day < 1 ||
          day > 31 ||
          month < 1 ||
          month > 12 ||
          year < 1) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Please enter valid day (1-31), month (1-12), and year.',
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      setState(() {
        daysResult = getWeekday(day, month, year);
        monthResult = getMonthName(month);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: Text(
              "Dynamic Calender",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 3,
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 65, 173, 68),
                    Color.fromARGB(255, 241, 241, 241),
                  ],
                  end: Alignment.topRight,
                  begin: Alignment.bottomLeft,
                ),
              ),
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  label: Text('Enter Date'),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                validator: FormBuilderValidators.required(),
                                maxLength: 2,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    daysValue = val;
                                  });
                                },
                              ),
                            ),
                            Text('Date'),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  label: Text('Enter Month'),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                validator: FormBuilderValidators.required(),
                                maxLength: 2,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    monthValue = val;
                                  });
                                },
                              ),
                            ),
                            Text('Month'),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  label: Text('Enter Year'),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                validator: FormBuilderValidators.required(),
                                maxLength: 4,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    yearValue = val;
                                  });
                                },
                              ),
                            ),
                            Text('Year'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text("Day: $daysResult"),
                    Text("Month: $monthResult"),
                    Text("Year: $yearValue"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
