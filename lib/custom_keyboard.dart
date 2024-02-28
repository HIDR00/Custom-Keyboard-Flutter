import 'package:flutter/material.dart';

class CustomKeyBoard extends StatefulWidget {
  const CustomKeyBoard({super.key});

  @override
  State<CustomKeyBoard> createState() => _CustomKeyBoardState();
}

class _CustomKeyBoardState extends State<CustomKeyBoard> {
  String amount = '';
  String _answerDisplay = '';
  String inputNumber = "";

  onKeyTap(val) {
    amount = amount + val;
    setState(() {
      _answerDisplay = amount;
    });
  }

  onBackPress() {
    if (amount == "") return;
    amount = amount.substring(0, amount.length - 1);
    setState(() {
      _answerDisplay = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.brown,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
                child: Text(
              _answerDisplay,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.brown),
            )),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Your Number: $inputNumber",
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.brown),
          ),
          SizedBox(
              height: 400,
              width: 350,
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 60,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 35),
                itemBuilder: (context, index) {
                  if (index == 9) {
                    return GestureDetector(
                        onTap: () {
                          onBackPress();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.backspace_outlined,
                            color: Colors.red,
                            size: 30,
                          )),
                        ));
                  }
                  if (index == 11) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            inputNumber = _answerDisplay;
                            amount = "";
                            _answerDisplay = "";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.brown,
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          )),
                        ));
                  }
                  if (index == 10) {
                    return GestureDetector(
                      onTap: () {
                        onKeyTap("0");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          border: Border.all(
                            color: Colors.brown,
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                            child: Text(
                          "0",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      onKeyTap((index + 1).toString());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.brown,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                          child: Text(
                        "${index + 1}",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
