import 'package:calenderpro/newScreen.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter/services.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  dynamic daysValue;
  dynamic monthValue;
  dynamic daysResult;
  dynamic monthResult;
  dynamic yearValue;
  dynamic yearResult;

  dynamic checkDays(dynamic days) {
    if (days == 1 || days == 8 || days == 15 || days == 22 || days == 29) {
      return "monday";
    } else if (days == 2 ||
        days == 9 ||
        days == 16 ||
        days == 23 ||
        days == 30) {
      return "tuesday";
    } else if (days == 3 ||
        days == 10 ||
        days == 17 ||
        days == 24 ||
        days == 31) {
      return "wednesday";
    } else if (days == 4 || days == 11 || days == 18 || days == 25) {
      return "thursday";
    } else if (days == 5 || days == 12 || days == 19 || days == 26) {
      return "friday";
    } else if (days == 6 || days == 13 || days == 20 || days == 27) {
      return "satday";
    } else if (days == 7 || days == 14 || days == 21 || days == 28) {
      return "sunday";
    } else
      return "Invalid number";
  }

  dynamic checkMonth(dynamic month) {
    if (month == 1)
      return "january";
    else if (month == 2)
      return "february";
    else if (month == 3)
      return "march";
    else if (month == 4)
      return "april";
    else if (month == 5)
      return "may";
    else if (month == 6)
      return "june";
    else if (month == 7)
      return "july";
    else if (month == 8)
      return "august";
    else if (month == 9)
      return "september";
    else if (month == 10)
      return "october";
    else if (month == 11)
      return "november";
    else if (month == 12)
      return "december";
    else
      return " invalid number";
  }

  void submit() {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      setState(() {
        daysResult = checkDays(int.tryParse(daysValue));
        monthResult = checkMonth(int.tryParse(monthValue));
      });
    }
  }

  void gotoAnother() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Newscreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: Text(
              "Static Calender",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: gotoAnother,
              label: Text(
                'Next Page',
                style: TextStyle(color: Color.fromARGB(255, 76, 204, 80)),
              ),
              icon: Icon(
                Icons.forward,
                color: Color.fromARGB(255, 76, 204, 80),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
            ),
          ),
        ],
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
                    const Color.fromARGB(255, 76, 204, 80),
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
                                  hint: Text('Enter Date'),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  // Border when focused
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
                                onChanged: (val) {
                                  setState(() {
                                    daysValue = val;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Date',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  label: Text('Enter Month'),
                                  hint: Text('Enter Month'),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  // Border when focused
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
                                onChanged: (val) {
                                  setState(() {
                                    monthValue = val;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Month',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  label: Text('Enter Year'),
                                  hint: Text('Enter Year'),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  // Border when focused
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
                                onChanged: (val) {
                                  setState(() {
                                    yearValue = val;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Year',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        submit();
                        print("daysResult::::$daysResult");
                        print("monthsResult::::$monthResult");
                      },
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
                    Text("Day:::: $daysResult"),
                    Text("Month:::: $monthResult"),
                    Text("Year:::: $yearValue"),
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
