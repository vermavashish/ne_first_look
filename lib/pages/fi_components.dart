/*
Date: 12 February 2020
Title: FI component classes
Description: This file stores all the classes for FI form
Developer: Ashish Verma
*/ 

final List<String> fiQuestions = [
  "1. Is Residence Owned by Borrower?",
  "2. What is expected cost of the House?",
  "3. How is living Standard of the Borrower?",
  "4. Is address in Negative Area?",
  "5. Mention the Landline Number Available",
  "6. Write the mobile number of a Family Member",
  "7. Permanent address of the Borrower",
  "8. Behaviour of the Borrower",
  "9. Physical appearance of the Borrower",
  "10. Check Goodwill from neighbour and enter their details.",
  "11. Please mention Public transport Available for Borrower residence",
  "12. Is there any family member comes under negative Profile like STD PCO, Cable operator, Court, Police, Political or Financial Business",
  "13. Mention Name of the person met during the Field Visit and his Number",
  "14. Name of the dealer,broker, Old Customer and Mobile number",
  "15. Borrower Office details with number of working years and reference from office",
  "16. Give number of two neighbours of the residence",
  "17. Is there any CIBIL defaulter. Mention the reason of default and attach closer document of loan.",
];

final List<String> typeOneQ = [
  "1. Is Residence Owned by Borrower?",
  "4. Is address in Negative Area?",
];

final List<String> typeTwoQ = [
  "3. How is living Standard of the Borrower?",
  "8. Behaviour of the Borrower",
  "9. Physical appearance of the Borrower",
];

final List<String> typeThreeQ = [
  "2. What is expected cost of the House?",
  "5. Mention the Landline Number Available",
  "6. Write the mobile number of a Family Member",
  "11. Please mention Public transport Available for Borrower residence",
  "12. Is there any family member comes under negative Profile like STD PCO, Cable operator, Court, Police, Political or Financial Business",
  "15. Borrower Office details with number of working years and reference from office",
];

final List<String> typeFourQ = [
  "10. Check Goodwill from neighbour and enter their details.",
  "13. Mention Name of the person met during the Field Visit and his Number",
  "14. Name of the dealer,broker, Old Customer and Mobile number",
];

final List<String> typeFiveQ = [
  "16. Give number of two neighbours of the residence",
];

final List<String> typeSixQ = [
  "7. Permanent address of the Borrower",
];

final List<String> typeSevenQ = [
  "17. Is there any CIBIL defaulter. Mention the reason of default and attach closer document of loan.",
];

class Question1Form{
  String quest;
  bool yes;
  bool no;

  Question1Form(){
    this.quest= "";
    this.yes = false;
    this.no = false;
  }
}

class Question2Form{
  String quest;
  bool good;
  bool average;
  bool poor;

  Question2Form(){
    this.quest = "";
    this.good = false;
    this.average = false;
    this.poor = false;
  }
}

class Question3Form{
  String quest;
  String ans;

  Question3Form(){
    this.quest = "";
    this.ans = "";
  }
}

class Question4Form{
  String quest;
  String name;
  int number;

  Question4Form(){
    this.quest = "";
    this.name = "";
    this.number = 0;
  }
}

class Question5Form{
  String quest;
  String aName;
  int aNumber;
  String bName;
  int bNumber;

  Question5Form(){
    this.quest = "";
    this.aName = "";
    this.aNumber = 0;
    this.bName = "";
    this.bNumber = 0;
  }
}

class Question6Form{
  String quest;
  String ans;
  bool sameAddress;
  var addressProof;

  Question6Form(){
    this.quest="";
    this.ans = "";
    this.sameAddress = false;
    this.addressProof = null;
  }
}

class Question7Form{
  String quest;
  String ans;
  var closure;

  Question7Form(){
    this.quest = "";
    this.ans = "";
    this.closure = null;
  }
}