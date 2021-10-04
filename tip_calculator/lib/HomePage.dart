import 'package:flutter/material.dart';
import 'package:tip_calculator/AmountText.dart';

const textColor = Color(0xFF56F569);
const double defaultBillAmount = 0.0;
const int defaultTipPercentage = 15;
final TextEditingController _billAmountController =
    TextEditingController(text: defaultBillAmount.toString());
final TextEditingController _tipPercentageController =
    TextEditingController(text: defaultTipPercentage.toString());
double _billAmount = defaultBillAmount;
int _tipPercentage = defaultTipPercentage;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _billAmountController.addListener(_onBillAmountChanged);
    _tipPercentageController.addListener(_onTipAmountChanged);
  }

  _onBillAmountChanged() {
    setState(() {
      _billAmount = double.tryParse(_billAmountController.text) ?? 0.0;
    });
  }

  _onTipAmountChanged() {
    setState(() {
      _tipPercentage = int.tryParse(_tipPercentageController.text) ?? 0;
    });
  }

  _getTipAmount() => _billAmount * _tipPercentage / 100;

  _getTotalAmount() => _billAmount + _getTipAmount();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFF010101),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Tip Calculator',
              style: TextStyle(
                  color: textColor, fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            //color: Colors.white70,
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      cursorColor: Colors.white,
                      key: Key("billAmount"),
                      controller: _billAmountController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: textColor, width: 2.0),
                        ),

                        hintText: "Enter the bill amount",
                        //hintStyle: TextStyle(color: Colors.white),
                        labelText: "Bill Amount",
                        labelStyle: TextStyle(
                          fontSize: 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      cursorColor: Colors.white,
                      key: Key("tipPercentage"),
                      controller: _tipPercentageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: textColor, width: 2.0),
                        ),

                        hintText: "Enter the tip percentage",
                        //hintStyle: TextStyle(color: Colors.white),
                        labelText: "Tip Percentage",
                        labelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: textColor,
                          decorationColor: Colors.white,
                        ),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: new BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      //color: textColor,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: textColor,
                        border: Border.all(color: Color(0xFF606060)),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          AmountText(
                            text: 'Tip Amount: ${_getTipAmount()}',
                            key: Key('tipAmount'),
                          ),
                          AmountText(
                            text: 'Total Amount: ${_getTotalAmount()}',
                            key: Key('totalAmount'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _billAmountController.dispose();
    _tipPercentageController.dispose();
    super.dispose();
  }
}
