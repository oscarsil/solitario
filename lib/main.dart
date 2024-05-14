import 'package:flutter/material.dart';
import '/logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solitaire',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Solitaire Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(child: Gameboard())
    );
  }
}

class Gameboard extends StatefulWidget{
  @override
  State<Gameboard> createState() => _GameboardState();
}



class _GameboardState extends State<Gameboard> {


  final logic l = new logic();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(logic.activeGame == false){
                      l.shuffledeck();
                      l.placeCards();
                      logic.activeGame = true;

                    }
                  });
                },
                child: Text('New Game'),
              ),
              ElevatedButton(onPressed: () {
                setState(() {
                  l.resetGame();
                  logic.activeGame = false;
                  l.resetAfterSecondClick();
                });
              }, child: Text('Reset Game'))
            ],
          ),
          Divider(),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal, child: TopGameRow()),
        ],
      ),
    );
  }
}

class TopGameRow extends StatefulWidget{
  @override
  State<TopGameRow> createState() => _TopGameRowState();
}

class _TopGameRowState extends State<TopGameRow> {
  final logic l = new logic();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children:  [
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'CLUBS CARD SLOT';
                    l.setSecondClickOnCardSlot();
                  }else{
                    l.setfirstClick('CLUBS CARD SLOT', logic.cardslotclu);
                  }
                });
              },
              child: Container(
                  width: 80,
                  child: cardSlot('club')
              ),
            ), //CARD SLOT CLUBS
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'DIAMONDS CARD SLOT';
                    l.setSecondClickOnCardSlot();
                  }else{
                    l.setfirstClick('DIAMONDS CARD SLOT', logic.cardslotdia);
                  }
                });
              },
              child: Container(
                  width: 80,
                  child: cardSlot('diamond')
              ),
            ),//CARD SLOT DIAMOND
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'SPADES CARD SLOT';
                    l.setSecondClickOnCardSlot();
                  }else{
                    l.setfirstClick('SPADES CARD SLOT', logic.cardslotspa);
                  }
                });
              },
              child: Container(
                  width: 80,
                  child: cardSlot('spade')
              ),
            ),//CARD SLOT SPADES
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'HEARTS CARD SLOT';
                    l.setSecondClickOnCardSlot();
                  }else{
                    l.setfirstClick('HEARTS CARD SLOT', logic.cardslothea);
                  }
                });
              },
              child: Container(
                  width: 80,
                  child: cardSlot('heart')
              ),
            ),//CARD SLOT HEARTS
            Text('Deck ->'),
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    l.resetAfterSecondClick();
                  }else{
                    //first click
                    l.setfirstClick('DECK', logic.unusedDeck);
                  }
                });
              },
              child: Container(
                width: 80,
                child: deck(),
              ),
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                l.nextCard();
                l.resetAfterSecondClick();
              });
            }, child: Text('Next card')),

          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'A';
                    l.setSeconClickOnPIle();
                  }else{
                    l.setfirstClick('A', logic.A);
                  }
                });
              },
              child: Container(
                width: 80,
                child: cardcolumn(letterColumn: 'A'),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'B';
                    l.setSeconClickOnPIle();
                  }else{
                    l.setfirstClick('B', logic.B);
                  }
                });
              },
              child: Container(
                width: 80,
                child: cardcolumn(letterColumn: 'B'),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'C';
                    l.setSeconClickOnPIle();
                  }else{
                    l.setfirstClick('C', logic.C);
                  }
                });
              },
              child: Container(
                width: 80,
                child: cardcolumn(letterColumn: 'C'),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'D';
                    l.setSeconClickOnPIle();
                  }else{
                    l.setfirstClick('D', logic.D);
                  }
                });
              },
              child: Container(
                width: 80,
                child: cardcolumn(letterColumn: 'D'),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'E';
                    l.setSeconClickOnPIle();
                  }else{
                    l.setfirstClick('E', logic.E);
                  }
                });
              },
              child: Container(
                width: 80,
                child: cardcolumn(letterColumn: 'E'),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'F';
                    l.setSeconClickOnPIle();
                  }else{
                    l.setfirstClick('F', logic.F);
                  }
                });
              },
              child: Container(
                width: 80,
                child: cardcolumn(letterColumn: 'F'),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  if(logic.isFirstClick){
                    logic.secondClick = 'G';
                    l.setSeconClickOnPIle();
                  }else{
                    l.setfirstClick('G', logic.G);
                  }
                });
              },
              child: Container(
                width: 80,
                child: cardcolumn(letterColumn: 'G'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BottomColumnRow extends StatefulWidget{
  @override
  State<BottomColumnRow> createState() => _BottomColumnRowState();
}

class _BottomColumnRowState extends State<BottomColumnRow> {
  final logic l = new logic();
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if(logic.isFirstClick){
                      logic.secondClick = 'A';
                      l.setSeconClickOnPIle();
                    }else{
                      l.setfirstClick('A', logic.A);
                    }
                  });
                },
                child: Container(
                  width: 80,
                  child: cardcolumn(letterColumn: 'A'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if(logic.isFirstClick){
                      logic.secondClick = 'B';
                      l.setSeconClickOnPIle();
                    }else{
                      l.setfirstClick('B', logic.B);
                    }
                  });
                },
                child: Container(
                  width: 80,
                  child: cardcolumn(letterColumn: 'B'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if(logic.isFirstClick){
                      logic.secondClick = 'C';
                      l.setSeconClickOnPIle();
                    }else{
                      l.setfirstClick('C', logic.C);
                    }
                  });
                },
                child: Container(
                  width: 80,
                  child: cardcolumn(letterColumn: 'C'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if(logic.isFirstClick){
                      logic.secondClick = 'D';
                      l.setSeconClickOnPIle();
                    }else{
                      l.setfirstClick('D', logic.D);
                    }
                  });
                },
                child: Container(
                  width: 80,
                  child: cardcolumn(letterColumn: 'D'),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(logic.isFirstClick){
                      logic.secondClick = 'E';
                      l.setSeconClickOnPIle();
                    }else{
                      l.setfirstClick('E', logic.E);
                    }
                  });
                },
                child: Container(
                  width: 80,
                  child: cardcolumn(letterColumn: 'E'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if(logic.isFirstClick){
                      logic.secondClick = 'F';
                      l.setSeconClickOnPIle();
                    }else{
                      l.setfirstClick('F', logic.F);
                    }
                  });
                },
                child: Container(
                  width: 80,
                  child: cardcolumn(letterColumn: 'F'),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(logic.isFirstClick){
                      logic.secondClick = 'G';
                      l.setSeconClickOnPIle();
                    }else{
                      l.setfirstClick('G', logic.G);
                    }
                  });
                },
                child: Container(
                  width: 80,
                  child: cardcolumn(letterColumn: 'G'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//singlecardcode(code: '12SB')
//body: Container(
//         width: 70,
//         child:
//             cardcolumn(letterColumn: 'A')
//       ),
class singlecard extends StatelessWidget {
  final int type;
  final String number;
  final int colors;
  final Color border;

  singlecard({required this.type, required this.colors, required this.number, required this.border});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(
          side: BorderSide(
              color: border,
              width: 3
          )
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              number.toString(),
              style:
              TextStyle(color: Color(colors), fontWeight: FontWeight.bold),
            ),
            Icon(
              IconData(type, fontFamily: 'MaterialIcons'),
              color: Color(colors),
            ),
          ],
        ),
      ),
    );
  }
}

class singlecardcode extends StatelessWidget {
  final String code;
  Color border = Colors.transparent;

  singlecardcode({
    required this.code,
  });
  final logic l = new logic();

  @override
  Widget build(BuildContext context) {
    if(code == logic.activeCard){
      border = Colors.red;
    }
    var cardnumber = l.getNumber(code);
    var cardcolor = l.getColor(code);
    var cardtype = l.getIcon(code);
    return singlecard(type: cardtype, colors: cardcolor, number: cardnumber, border: border,);
  }
}

class flippedCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 80,
      child: const Card(
        color: Colors.red,
      ),
    );
  }
}
//80x56

class cardSlot extends StatefulWidget {
  final String type;
  const cardSlot(this.type);
  @override
  State<cardSlot> createState() => _cardSlotState();
}

class _cardSlotState extends State<cardSlot> {
  final logic l = new logic();
  List<String> typecards = logic.cardslotclu;
  var lastcard;
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 'club':
        typecards = logic.cardslotclu;
        break;
      case 'diamond':
        typecards = logic.cardslotdia;
        break;
      case 'heart':
        typecards = logic.cardslothea;
        break;
      case 'spade':
        typecards = logic.cardslotspa;
        break;
    }
    lastcard = typecards.last;
    setState(() {});
    return singlecardcode(code: lastcard);
  }
}

class deck extends StatelessWidget {
  final logic l = new logic();

  @override
  Widget build(BuildContext context) {
    String topcard;
    topcard = logic.unusedDeck.last;
    return singlecardcode(code: topcard);
  }
}

class cardcolumn extends StatelessWidget {
  final String letterColumn;
  final logic l = new logic();
  cardcolumn({required this.letterColumn});
  @override
  Widget build(BuildContext context) {
    final int colLength = l.getLenghtOfCards(letterColumn);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: colLength,
        itemBuilder: (BuildContext context, int index) {
          final List<String> showlist = l.getcolumn(letterColumn);
          try{
            if(showlist[index][4] == 'F'){
              return flippedCard();
            }else{
              return singlecardcode(code: showlist[index]);
            }
          } on RangeError {
            return singlecardcode(code: showlist[index]);
          }
        });
  }
}
