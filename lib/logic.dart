
import 'package:solitaire/main.dart';

class logic  {
  var Deck =
  ['01DRU','02DRU','03DRU','04DRU','05DRU','06DRU','07DRU','08DRU','09DRU','10DRU','11DRU','12DRU','13DRU',
    '01HRU','02HRU','03HRU','04HRU','05HRU','06HRU','07HRU','08HRU','09HRU','10HRU','11HRU','12HRU','13HRU',
    '01CBU','02CBU','03CBU','04CBU','05CBU','06CBU','07CBU','08CBU','09CBU','10CBU','11CBU','12CBU','13CBU',
    '01SBU','02SBU','03SBU','04SBU','05SBU','06SBU','07SBU','08SBU','09SBU','10SBU','11SBU','12SBU','13SBU',
  ];

  //Deck..shuffle()

  static List<String> cardslotclu = ['00CG'];
  static List<String> cardslothea = ['00HG'];
  static List<String> cardslotdia = ['00DG'];
  static List<String> cardslotspa = ['00SG'];
  static List<String> unusedDeck = ['00SG'];

  static List<String> allCardSlot= ['HEARTS CARD SLOT',
    'DIAMONDS CARD SLOT','CLUBS CARD SLOT','SPADES CARD SLOT'];

  static List<String> piles = ['A','B','C','D','E','F','G'];

  static  List<String> A = ['00XG'];
  static  List<String> B = ['00XG'];
  static  List<String> C = ['00XG'];
  static  List<String> D = ['00XG'];
  static  List<String> E = ['00XG'];
  static  List<String> F = ['00XG'];
  static  List<String> G = ['00XG'];
  static List<String> shuffledDeck = [];
  static String lastPile = 'x';
  static bool activeGame = false;
  static bool isFirstClick = false;
  static String activeCard = '00GX';
  static String firstClick = 'x';
  static String secondClick = 'x';
  static List<String> movingCards = [];

  static String firstcardSelected = '00GX';
  static String secondcardSelected = '00GX';
  static bool isfirstcardselected = false;

  int getIcon(String id){
    int icon;
    switch (id[2])
    {
      case 'S':
        icon = 0xf0577;
        break;
      case 'C':
        icon = 0xf054e;
        break;
      case 'D':
        icon = 0xf04ed;
        break;
      case 'H':
        icon = 0xe25b;
        break;
      default:
        icon = 0xe061;
        break;
    }
    return icon;
  }

  int getColor(String id){
    int color;
    int resultado;
    resultado = id[3].compareTo('B');
    if(resultado==0){
      color = 0xFF212121;
    }else{
      resultado = id[3].compareTo('R');
      if(resultado == 0){
        color = 0xFFB71C1C;
      }else{
        color = 0xFF9E9E9E;
      }
    }
    return color;
  }

  String getNumber(String id){
    String number;
    switch (id.substring(0,2))
    {
      case '01':
        number = 'A';
        break;
      case '10':
        number = '10';
        break;
      case '11':
        number = 'j';
        break;
      case '12':
        number = 'Q';
        break;
      case '13':
        number = 'K';
        break;
      default:
        number = id[1];
        break;
    }
    return number;
  }

  int getLenghtOfCards(String column){
    int number = 0;
    switch(column){
      case 'A':
        number = A.length;
        break;
      case 'B':
        number = B.length;
        break;
      case 'C':
        number = C.length;
        break;
      case 'D':
        number = D.length;
        break;
      case 'E':
        number = E.length;
        break;
      case 'F':
        number = F.length;
        break;
      case 'G':
        number = G.length;
        break;
    }
    return number;
  }

  List<String> getcolumn(String letter){
    List<String> correctList;
    switch(letter){
      case 'A':
        correctList = A;
        break;
      case 'B':
        correctList = B;
        break;
      case 'C':
        correctList = C;
        break;
      case 'D':
        correctList = D;
        break;
      case 'E':
        correctList = E;
        break;
      case 'F':
        correctList = F;
        break;
      case 'G':
        correctList = G;
        break;
      default:
        correctList = unusedDeck;
        break;
    }
    return correctList;
  }

  void shuffledeck(){
    Deck.shuffle();
    shuffledDeck.addAll(Deck);
    shuffledDeck.removeAt(0);
  }

  void placeCards(){
    A.add(shuffledDeck[0]);
    shuffledDeck.removeAt(0);
    A.removeAt(0);

    for(var i = 0; i<2; i++){
      B.add(flipCard(shuffledDeck[0]));
      shuffledDeck.removeAt(0);
    }
    B.removeAt(0);
    B.last = flipCard(B.last);

    for(var i = 0; i<3; i++){
      C.add(flipCard(shuffledDeck[0]));
      shuffledDeck.removeAt(0);
    }
    C.removeAt(0);
    C.last = flipCard(C.last);

    for(var i = 0; i<4; i++){
      D.add(flipCard(shuffledDeck[0]));
      shuffledDeck.removeAt(0);
    }
    D.removeAt(0);
    D.last = flipCard(D.last);

    for(var i = 0; i<5; i++){
      E.add(flipCard(shuffledDeck[0]));
      shuffledDeck.removeAt(0);
    }
    E.removeAt(0);
    E.last = flipCard(E.last);

    for(var i = 0; i<6; i++){
      F.add(flipCard(shuffledDeck[0]));
      shuffledDeck.removeAt(0);
    }
    F.removeAt(0);
    F.last = flipCard(F.last);

    for(var i = 0; i<7; i++){
      G.add(flipCard(shuffledDeck[0]));
      shuffledDeck.removeAt(0);
    }
    G.removeAt(0);
    G.last = flipCard(G.last);

    unusedDeck.addAll(shuffledDeck);
    unusedDeck.removeAt(0);
  }

  bool isFlipped(String card){
    try{
      if(card[4] == 'F'){
        return true;
      }else{
        return false;
      }
    } on RangeError{
      return false;
    }
  }

  void nextCard(){
    if(unusedDeck.length==1){
      return;
    }
    String nextcard = unusedDeck.last;
    unusedDeck.removeLast();
    unusedDeck.insert(0, nextcard);
  }


  void resetGame(){
    insertPlaceholders();
    emptySlots();
    emptyDeck();
    emptyPile();
    resetAfterSecondClick(); //last line added
  }
  //'00CG'
  void emptySlots(){
    for(int i = cardslotdia.length; i >1; i--){cardslotdia.removeLast();}
    for(int i = cardslothea.length; i >1; i--){cardslothea.removeLast();}
    for(int i = cardslotclu.length; i >1; i--){cardslotclu.removeLast();}
    for(int i = cardslotspa.length; i >1; i--) {cardslotspa.removeLast();}
  }

  void emptyPile(){
    for(int i = A.length; i >1; i--){A.removeLast();}
    for(int i = B.length; i >1; i--){B.removeLast();}
    for(int i = C.length; i >1; i--){C.removeLast();}
    for(int i = D.length; i >1; i--){D.removeLast();}
    for(int i = E.length; i >1; i--){E.removeLast();}
    for(int i = F.length; i >1; i--){F.removeLast();}
    for(int i = G.length; i >1; i--){G.removeLast();}

  }

  String flipCard(String card){
    try {
      if(card[4] == 'F'){
        return '${card.substring(0,4)}U';
      }else{
        return '${card.substring(0,4)}F';
      }
    } on  RangeError {
      return card;
    }
  }



  void emptyDeck(){
    for(int i = unusedDeck.length;i > 1; i--){unusedDeck.removeLast();}
    for(int i = shuffledDeck.length;i > 1; i--){shuffledDeck.removeLast();}
  }

  void insertPlaceholders(){
    insertPlaceHolderRefactorized(A, '00XG');
    insertPlaceHolderRefactorized(B, '00XG');
    insertPlaceHolderRefactorized(C, '00XG');
    insertPlaceHolderRefactorized(D, '00XG');
    insertPlaceHolderRefactorized(E, '00XG');
    insertPlaceHolderRefactorized(F, '00XG');
    insertPlaceHolderRefactorized(G, '00XG');
    insertPlaceHolderRefactorized(cardslotspa, '00SG');
    insertPlaceHolderRefactorized(cardslotclu, '00CG');
    insertPlaceHolderRefactorized(cardslothea, '00HG');
    insertPlaceHolderRefactorized(cardslotdia, '00DG');
    insertPlaceHolderRefactorized(unusedDeck, '00XG');
  }

  void insertPlaceHolderRefactorized(List<String> array, String placeholder){
    if(array.length != 1){
      array.insert(0, placeholder);
    }else{
      if(array.last != placeholder){
        array.insert(0, placeholder);
      }
    }
  }

  void placingCardToPileFromPileOrDeck(List<String> firstClickList, String movingCard, List<String> secondClickList, String staticCard){
    if(validatingMovingCards(movingCard, staticCard)){
      if(firstClickList.length == 1 ){
        firstClickList.insert(0, '00XG');
      }
      secondClickList.add(movingCard);
      firstClickList.removeLast();
      if(int.parse(staticCard.substring(0,2) )==0){
        secondClickList.removeAt(0);
      }
      if(piles.contains(firstClick)){
        if(firstClickList.last != '00XG'){
          flipCardAfterMovingToCardSlot();
        }
      }
    }else{
      print('cant place card , same color or wrong rank');
    }
  }

  void placingCardToPileFromCardslot(List<String> firstClickList, String movingCard, List<String> secondClickList, String staticCard ){
    if(validatingMovingCards(movingCard, staticCard)){
      if(firstClickList.length == 1 ){
        firstClickList.insert(0, getCardSlotPlaceholder(movingCard[2]));
        secondClickList.add(movingCard);
        firstClickList.removeLast();
      }
    }else{
      print('cant place card , same color or wrong rank');
    }
  }

  String getCardSlotPlaceholder(String card){
    String placeHolder;
    switch (card){
      case 'H':
        placeHolder = '00HR';
        break;
      case 'D':
        placeHolder = '00DR';
        break;
      case 'S':
        placeHolder = '00SB';
        break;
      case 'C':
        placeHolder = '00CB';
        break;
      default:
        placeHolder = '00XG';
    }
    return placeHolder;
  }

  bool validatingMovingCards(String movingCard, String staticCard){
    if(int.parse(movingCard.substring(0,2)) == 0){
      return false;
    }else{
      int movingNumber = int.parse(movingCard.substring(0,2));
      int staticNumber = int.parse(staticCard.substring(0,2));
      if(movingNumber==13 && staticNumber ==0){return true;}
      if(movingCard[3] != staticCard[3] && movingNumber+1 == staticNumber){
        return true;
      }else{
        return false;
      }
    }
  }

  void placingCardtoDiamondCardSlot(String topCard , List<String> topList){
    int topNumber =  int.parse(topCard.substring(0,2));
    int cardslotNumber = int.parse(logic.cardslotdia.last.substring(0,2));
    if(topCard[2] == 'D' && cardslotNumber+1==topNumber){
      if(topList.length==1){
        topList.insert(0, '00XG');
      }
      cardslotdia.add(topCard);
      topList.removeLast();
      if(piles.contains(firstClick)){
        if(getcolumn(firstClick).last != '00XG'){
          flipCardAfterMovingToCardSlot();
        }
      }
    }else{
      print('not compatible type');
    }
  }

  void placingCardtoHeartCardSlot(String movingCard , List<String> firstClickList){
    int topNumber =  int.parse(movingCard.substring(0,2));
    int cardslotNumber = int.parse(logic.cardslothea.last.substring(0,2));
    if(movingCard[2] == 'H' && cardslotNumber+1==topNumber){
      if(firstClickList.length==1){
        firstClickList.insert(0, '00XG');
      }
      cardslothea.add(movingCard);
      firstClickList.removeLast();
      if(piles.contains(firstClick)){
        if(getcolumn(firstClick).last != '00XG'){
          flipCardAfterMovingToCardSlot();
        }
      }
    }else{
      print('not compatible type');
    }
  }

  void placingCardtoClubsCardSlot(String topCard , List<String> topList){
    int topNumber =  int.parse(topCard.substring(0,2));
    int cardslotNumber = int.parse(logic.cardslotclu.last.substring(0,2));
    if(topCard[2] == 'C' && cardslotNumber+1==topNumber){
      if(topList.length==1){
        topList.insert(0, '00XG');
      }
      cardslotclu.add(topCard);
      topList.removeLast();
      if(piles.contains(firstClick)){
        if(getcolumn(firstClick).last != '00XG'){
          flipCardAfterMovingToCardSlot();
        }
      }
    }else{
      print('not compatible type');
    }
  }

  void placingCardtoSpadesCardSlot(String topCard , List<String> topList){
    int topNumber =  int.parse(topCard.substring(0,2));
    int cardslotNumber = int.parse(logic.cardslotspa.last.substring(0,2));
    if(topCard[2] == 'S' && cardslotNumber+1==topNumber){
      if(topList.length==1){
        topList.insert(0, '00XG');
      }
      cardslotspa.add(topCard);
      topList.removeLast();
      if(piles.contains(firstClick)){
        if(getcolumn(firstClick).last != '00XG'){
          flipCardAfterMovingToCardSlot();
        }
      }
    }else{
      print('not compatible type');
    }
  }

  void setfirstClick(String firstSource, List<String> list){
    isFirstClick = true;
    firstClick = firstSource;
    activeCard = list.last;
  }

  void setSecondClickOnCardSlot(){
    if(allCardSlot.contains(firstClick)){
      resetAfterSecondClick();
    }else{
      if(piles.contains(firstClick)){
        if(activeCard == getcolumn(firstClick).last){
          SpecifyCardSlotToInsert();
          resetAfterSecondClick();
        }else{
          resetAfterSecondClick();
        }
      }else{
        //decktocardslot
        SpecifyCardSlotToInsert();
        if(activeCard != unusedDeck.last){manageDeck();}
        resetAfterSecondClick();
      }
    }
  }

  void flipCardAfterMovingToCardSlot(){
    if(getcolumn(firstClick).last != 'OOXG'){
      getcolumn(firstClick).last = flipCard(getcolumn(firstClick).last);
    }
  }

  void SpecifyCardSlotToInsert(){
    switch(secondClick){
      case 'HEARTS CARD SLOT':
        placingCardtoHeartCardSlot(activeCard, getcolumn(firstClick));
        break;
      case 'DIAMONDS CARD SLOT':
        placingCardtoDiamondCardSlot(activeCard, getcolumn(firstClick));
        break;
      case 'CLUBS CARD SLOT':
        placingCardtoClubsCardSlot(activeCard, getcolumn(firstClick));
        break;
      case 'SPADES CARD SLOT':
        placingCardtoSpadesCardSlot(activeCard, getcolumn(firstClick));
        break;
    }
  }

  void setSeconClickOnPIle(){
    if(firstClick==secondClick){
      selectingnextcardinPile(getcolumn(firstClick));
    }else{
      if(activeCard == getcolumn(firstClick).last){
        if(allCardSlot.contains(firstClick)){
          placingCardToPileFromCardslot(getcolumn(firstClick), getcolumn(firstClick).last, getcolumn(secondClick), getcolumn(secondClick).last);
          //
        }else{
          placingCardToPileFromPileOrDeck(getcolumn(firstClick), getcolumn(firstClick).last, getcolumn(secondClick), getcolumn(secondClick).last);
          if(firstClick == 'DECK'){
            manageDeck();
          }
        }
      }else{
        if(getcolumn(secondClick).last == '00XG'){
          placeMultiplecards();//last addeed code tp prevent list adding on blank
          getcolumn(secondClick).removeLast();
        }else{
          placeMultiplecards();
        }
      }
      resetAfterSecondClick();
    }
  }

  void placeMultiplecards(){
    if(validatingMovingCards(activeCard, getcolumn(secondClick).last)){
      int startOfSublist = getcolumn(firstClick).indexOf(activeCard);
      int endOfSublist = getcolumn(firstClick).length;
      if(getcolumn(firstClick).indexOf(activeCard) == 0){
        getcolumn(firstClick).insert(0, '00XG');
        startOfSublist = startOfSublist +1;
      }
      movingCards = getcolumn(firstClick).sublist(startOfSublist,endOfSublist);
      getcolumn(secondClick).addAll(movingCards);
      for(int i = movingCards.length; i >=1; i--){movingCards.removeLast();}
      getcolumn(firstClick).removeRange(startOfSublist, endOfSublist);
      if(getcolumn(firstClick).last != '00XG'){
        flipCardAfterMovingToCardSlot();
      }
    }else{
      print('cards not compatible');
    }
  }



  void selectingnextcardinPile(List<String> list){
    if(list.length==1){
      resetAfterSecondClick();
      return;
    }else{
      if(list.indexOf(activeCard)-1==-1){
        resetAfterSecondClick();
        return;
      }
      if(validateMovingUpCards(getcolumn(firstClick)) || !isFlipped(list[list.indexOf(activeCard)-1])){
        activeCard = list[list.indexOf(activeCard)-1];
      }else{
        resetAfterSecondClick();
      }
    }
  }

  bool validateMovingUpCards(List <String> list){
    int prevcard = int.parse(list[list.indexOf(activeCard)-1].substring(0,2));
    int curcard = int.parse(list[list.indexOf(activeCard)].substring(0,2));
    String colorPrevcard = list[list.indexOf(activeCard)-1][3];
    String colorCurcard =  list[list.indexOf(activeCard)][3];
    if(prevcard==curcard+1 && colorCurcard!=colorPrevcard){
      return true;
    }else{
      return false;
    }
  }



  void resetAfterSecondClick(){
    activeCard = '00GX';
    isFirstClick = false;
    firstClick = 'x';
    secondClick = 'x';
    for(int i = movingCards.length; i >=1; i--){movingCards.removeLast();}
  }

  void manageDeck(){
    if(unusedDeck.length==1){return;};
    String lastcard;
    lastcard = unusedDeck.first;
    unusedDeck.removeAt(0);
    unusedDeck.insert(unusedDeck.length, lastcard);
  }//logic for if deck only has one left

}