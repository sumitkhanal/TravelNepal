import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelnepal/justdrive/PlatformWidget/platform_alert_dialog.dart';
import 'package:travelnepal/justdrive/Services/apiPath.dart';
import 'package:travelnepal/justdrive/Services/firestoreService.dart';
import 'package:travelnepal/justdrive/SignIn/user.dart';
import 'package:travelnepal/justdrive/coupon.dart';
import 'package:travelnepal/justdrive/couponsAvailable.dart';
import 'package:travelnepal/justdrive/orderComplete.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:travelnepal/justdrive/Models/appointment.dart';
import 'package:travelnepal/justdrive/PlatformWidget/platform_exception_alert_dialog.dart';
import 'package:travelnepal/justdrive/Services/database.dart';
import 'package:travelnepal/justdrive/SignIn/auth.dart';
import 'package:travelnepal/justdrive/SignIn/authenticate.dart';
import 'package:travelnepal/justdrive/info.dart';
import 'package:travelnepal/justdrive/notification.dart';

class Booking extends StatefulWidget {
  const Booking(
      {Key key,
      @required this.database,
      this.appointment,
      this.carname,
      this.carprice})
      : super(key: key);
  final Database database;
  final Appointment appointment;
  final String carname;
  final int carprice;

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm');
  Database database;
  Appointment appointment;
  DateTime _dateTime;
  FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
    inputData();
    super.initState();
    print("init");
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid;
  void inputData() async {
    // final FirebaseUser user = await auth.currentUser();
    // uid = user.uid;
    // print(uid);
    // here you write the codes to input the data into firestore
  }

  final _service = FirestoreService.instance;
  //TODO
  Stream<List<Appointment>> appointmentsStream() => _service.collectionStream(
        path: APIPath.appointments(uid),
        builder: (data, documentId) => Appointment.fromMap(data, documentId),
      );

  final myController = TextEditingController();
  String coupon;
  int status = 0;

  String name;
  String phone;
  String address;
  String pincode;
  String city;
  String state;
  DateTime pickdate;
  DateTime dropdate;

  bool _validateAndSaveForm() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  int discount = 0;

  String textDis = '';
  CouponVerify() async {
    final appointments = await appointmentsStream().first;
    final allNames =
        appointments.map((appointment) => appointment.name).toList();
    int count = allNames.length;
    print(count);
    setState(() {});

    coupon = myController.text;
    print(coupon);
    if (coupon == 'FIRST' && count < 3) {
      status = 1;
      textDis = 'Coupon Applied';
      discount = 20;
      return PlatformAlertDialog(
        title: 'Congratulations!',
        content: 'Coupon Applied on your order.',
        defaultActionText: 'Okay',
      ).show(context);
    } else if (coupon == 'FIRST') {
      textDis = '';
      discount = 0;
      return PlatformAlertDialog(
        title: 'Not Available!',
        content: 'Coupon only for first 3 orders.',
        defaultActionText: 'Okay',
      ).show(context);
    } else if (coupon == 'EXTRA10') {
      status = 1;
      textDis = 'Coupon Applied';
      discount = 10;
      return PlatformAlertDialog(
        title: 'Congratulations!',
        content: 'Coupon Applied for 10% off.',
        defaultActionText: 'Okay',
      ).show(context);
    } else if (coupon == 'REGULAR' && count > 10) {
      status = 1;
      textDis = 'Coupon Applied';
      discount = 20;
      return PlatformAlertDialog(
        title: 'Congratulations!',
        content: 'Coupon Applied for your order.',
        defaultActionText: 'Okay',
      ).show(context);
    } else if (coupon == 'REGULAR') {
      textDis = '';
      discount = 0;
      return PlatformAlertDialog(
        title: 'Not Available!',
        content: 'Coupon only for users with more than 10 orders.',
        defaultActionText: 'Okay',
      ).show(context);
    } else {
      print(coupon);
      textDis = '';
      status = 0;
      discount = 0;
      return PlatformAlertDialog(
        title: 'Error!',
        content: 'Coupon not valid!',
        defaultActionText: 'Okay',
      ).show(context);
    }
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      if (pickdate == null || dropdate == null) {
        print("A");
        return PlatformAlertDialog(
          title: 'Alert',
          content: 'Please select dates!',
          defaultActionText: 'Okay',
        ).show(context);
      }
      try {
        print("Here");

        Timestamp _dateTSpickdate = Timestamp.fromDate(pickdate);
        Timestamp _dateTSdropdate = Timestamp.fromDate(dropdate);
        final id = widget.appointment?.id ?? documentIdFromCurrentDate();
        final carname = widget.carname;
        final carprice = widget.carprice;
        print('car' + carname);
        final Appointment appointment = Appointment(
            id: id,
            name: name,
            phone: phone,
            address: address,
            pincode: pincode,
            city: city,
            state: state,
            carname: carname,
            carprice: carprice,
            pickdate: _dateTSpickdate,
            dropdate: _dateTSdropdate,
            discount: discount);
        final _service = FirestoreService.instance;
        String uid2;
        someMethod() async {
          // FirebaseUser user = await FirebaseAuth.instance.currentUser();
          // final uid2 = user.uid;
          Future<void> createAppointment(Appointment appointment) async =>
              await _service.setData(
                path: APIPath.appointment(uid2, appointment.id),
                data: appointment.toMap(),
              );
          await createAppointment(appointment);
        }

        someMethod();

        //await database.createAppointment(appointment);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => OrderComplete(
                    carname: widget.carname,
                    carcost: widget.carprice,
                  )),
          (route) => false,
        );
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: 'Operation failed',
          exception: e,
        ).show(context);
      }
    } else {
      print("Form not filled");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Booking Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Form(
              //autovalidate: true,
              key: formkey,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        " Please fill your details:",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Name", border: OutlineInputBorder()),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Required"),
                    ]),
                    onSaved: (value) => name = value,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                          labelText: "Phone no.", border: OutlineInputBorder()),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        MinLengthValidator(10,
                            errorText: "10 digit number required")
                      ]),
                      onSaved: (value) => phone = value,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "House No. & Street name",
                          border: OutlineInputBorder()),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                      ]),
                      onSaved: (value) => address = value,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Pincode ", border: OutlineInputBorder()),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        MinLengthValidator(6,
                            errorText: "6 digit number required")
                      ]),
                      onSaved: (value) => pincode = value,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "City", border: OutlineInputBorder()),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                      ]),
                      onSaved: (value) => city = value,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "State", border: OutlineInputBorder()),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                      ]),
                      onSaved: (value) => state = value,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Select Pick up & Drop off dates:",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(_dateTime == null
                                  ? "Select"
                                  : dateFormat
                                      .format(pickdate)
                                      .toString()
                                      .substring(0, 11)),
                              ElevatedButton(
                                child: Text("Pickup Date"),
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: _dateTime == null
                                              ? DateTime.now()
                                              : _dateTime,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2028))
                                      .then((date) {
                                    setState(() {
                                      _dateTime = date;
                                      pickdate = date;
                                    });
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Text(dropdate == null
                                  ? "Select"
                                  : dateFormat
                                      .format(dropdate)
                                      .toString()
                                      .substring(0, 11)),
                              ElevatedButton(
                                child: Text('Dropoff date'),
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: _dateTime == null
                                              ? DateTime.now()
                                              : _dateTime,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2028))
                                      .then((date) {
                                    setState(() {
                                      _dateTime = date;
                                      dropdate = date;
                                    });
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Coupon:",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: myController,
                        decoration: InputDecoration(
                            labelText: "Coupon", border: OutlineInputBorder()),
                        onSaved: (value) => coupon = value,
                      ),
                      Text(textDis),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: CouponVerify,
                        child: Text("Verify"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CouponsAvailable()));
                        },
                        child: Text("View Available Coupons"),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: _submit,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 5),
                              child: Text(
                                " Confirm Your Booking ",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
//