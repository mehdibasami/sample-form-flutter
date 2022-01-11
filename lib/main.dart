import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formsample/text_input_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.purple, // navigation bar color
    statusBarColor: Colors.purple, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple[300]!,
                          Colors.purple[900]!,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Column(
                          children: const [
                            Text('انتقال وجه پایا عادی'),
                            Text('انتقال وجه پایا عادی'),
                            Text('انتقال وجه پایا عادی'),
                            Text('انتقال وجه پایا عادی'),
                            Text('انتقال وجه پایا عادی'),
                            Text('انتقال وجه پایا عادی'),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          child: Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Form(
                                      key: _formKey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            TextInputWidget(
                                              topLabel: 'سپرده مبدا',
                                              onSaved: (value) {},
                                              keyboardType:
                                                  TextInputType.number,
                                              initialValue: '',
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            TextInputWidget(
                                              topLabel: 'شماره شبا مقصد',
                                              keyboardType:
                                                  TextInputType.number,
                                              onSaved: (value) {},
                                              initialValue: '',
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            TextInputWidget(
                                              topLabel: 'بابت',
                                              textDirection: TextDirection.rtl,
                                              suffixIcon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black,
                                              ),
                                              onSaved: (value) {},
                                              initialValue: '',
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            TextInputWidget(
                                              topLabel: 'نام صاحب مقصد',
                                              textDirection: TextDirection.rtl,
                                              onSaved: (value) {},
                                              initialValue: '',
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            TextInputWidget(
                                              topLabel: 'مبلغ انتقال',
                                              keyboardType:
                                                  TextInputType.number,
                                              onSaved: (value) {},
                                              initialValue: '',
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            TextInputWidget(
                                              topLabel: 'شناسه واریز',
                                              keyboardType:
                                                  TextInputType.number,
                                              onSaved: (value) {},
                                              initialValue: '',
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            TextInputWidget(
                                              topLabel: 'توضیحات',
                                              onSaved: (value) {},
                                              initialValue: '',
                                              textDirection: TextDirection.rtl,
                                              minLines: 4,
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(18.0),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('تایید و ادامه')),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
