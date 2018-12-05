import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'def.dart';
import 'list.dart';
import 'gesture.dart';
import 'myhtttp.dart';
import 'relative-layout.dart';
import 'mywebview.dart';

const String PAGE_DEF = "默认页面";
const String PAGE_LIST = "列表";
const String PAGE_GESTURE = "画板";
const String PAGE_HTTP = "HTTP";
const String PAGE_RELATIVE = "Relative布局";
const String PAGE_WEBVIEW = "Webview";

const String PAGE_URL_DEF = "/def";
const String PAGE_URL_LIST = "/list";
const String PAGE_URL_GESTURE = "/gesture";
const String PAGE_URL_HTTP = "/http";
const String PAGE_URL_RELATIVE = "/relative";
const String PAGE_URL_WEBVIEW = "/Webview";

void main() => runApp(MaterialApp(
      title: "Valu Test",
      theme: ThemeData(primaryColor: Colors.green),
      home: ValiHomePage(),
      routes: <String, WidgetBuilder>{
        PAGE_URL_DEF: (BuildContext context) => DefPage(title: 'Default Page'),
        PAGE_URL_LIST: (BuildContext context) => RandomWords(),
        PAGE_URL_GESTURE: (BuildContext context) => SignatureApp(),
        PAGE_URL_HTTP: (BuildContext context) => HttpPage(),
        PAGE_URL_RELATIVE: (BuildContext context) => RelativeView(),
        PAGE_URL_WEBVIEW: (BuildContext context) => WebViewExample(),
      },
    ));

class ValiHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(_LifeSate());

    return Scaffold(
      appBar: AppBar(
        title: Text("Main page"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          CustomButton(PAGE_DEF,
              pressed: () => _startForResult(context, PAGE_URL_DEF)),
          CustomButton(PAGE_LIST,
              pressed: () => _gotoPage(context, PAGE_URL_LIST)),
          CustomButton(PAGE_GESTURE,
              pressed: () => _gotoPage(context, PAGE_URL_GESTURE)),
          CustomButton(PAGE_HTTP,
              pressed: () => _gotoPage(context, PAGE_URL_HTTP)),
          CustomButton(PAGE_RELATIVE,
              pressed: () => _gotoPage(context, PAGE_URL_RELATIVE)),
          CustomButton(PAGE_WEBVIEW,
              pressed: () => _gotoPage(context, PAGE_URL_WEBVIEW)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      )),
    );
  }

  void _gotoPage(BuildContext context, String page) {
    Navigator.of(context).pushNamed(page);
  }

  void _startForResult(BuildContext context, String page) async {
    var _msg = await Navigator.of(context).pushNamed(page);
    Fluttertoast.showToast(
        msg: "返回数据：$_msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        // ios
        bgcolor: "#e74c3c",
        textcolor: '#ffffff');
  }
}

class _LifeSate with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state.toString());
    Fluttertoast.showToast(
        msg: state.toString(),
        bgcolor: "#" + Colors.blueAccent.value.toRadixString(16));
  }
}
