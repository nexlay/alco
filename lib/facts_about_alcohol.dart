class AlcoholFacts {
  int _factNumber = 0;
  List<String> _factsList = [
    'Alcohol has no effect on the life cycle of brain cells. In fact, some alcohol consumption may even benefit the brain. Researchers have found that red wine can prevent the onset of dementia in old age. However, people who drink large amounts of alcohol for long periods of time can develop serious changes in the brain and mental impairment.',
    'Advertising of alcoholic beverages does not promote or result in alcohol abuse. Researchers have found that alcohol advertising merely strengthens the brand recognition of advertised alcoholic beverages.',
    'Alcohol is a depressant – and an antidepressant, albeit briefly. In modest amounts, alcohol can provide feelings of euphoria, well-being, and relaxation, which is probably why half the population in the United States consumes alcohol. It also has an evil twin, and can cause some people to become angry or depressed while under its influence. Individuals who are dependent on alcohol may also suffer from long-term emotional and psychological issues.',
    'If you’re intoxicated, drinking coffee won’t make you sober. Alcohol dissipates from the body at a rate of about .015% blood alcohol content (BAC) per hour. If you do drink coffee, you will still need a full hour to expel the alcohol in your system if your BAC is .015%. Gender, age, and weight do not affect this dissipation rate – only time.',
    'The easiest and most convenient way to keep track of your alcohol level is by using a breathalyzer.  BACtrack Professional Grade Breathalyzers deliver police-grade accuracy and consistency every time you test, for professionals and individuals who need the most reliable results. ',
    'To mix or not to mix? Whether you mix your drinks or not, you will still become intoxicated--although there is some evidence that what you mix your drinks with could affect your BAC. ',
    'A standard drink of beer, wine, or liquor each contains the same volume of alcohol. Standard drinks are measured as 12 ounces of beer, 5 ounces of wine, or 1.5 ounces of distilled spirits.',
    '“Lightweight” drinkers may have a hidden advantage over people who seem to have a higher tolerance of alcohol and can drink heavily without appearing to become intoxicated. Alcohol tolerance can indicate the onset of, or an existing dependency on alcohol. ',
    'The world’s oldest know recipe is for beer.',
    'Men who drink moderate amounts of alcohol have fewer problems with erectile function than men drink excessively – or don’t drink at all. The Keogh Institute for Medical Research in Western Australia reports that 30% of men studied who consumed up to four drinks a day for up to five days a week enjoyed a "favorable association" with positive erectile function (ED). Weekend drinkers and binge drinkers also experienced lower rates of ED than those who drank one day a week or less, according to the research. ',
    'Although alcohol has caloric value, research has shown that alcohol consumption does not result in significant weight gain in men and is even associated with modest weight loss in women. A study by the Journal of Nutrition found that beer drinkers, on average, had no more body fat than non-drinkers. Lifestyle and genetics are more likely to cause weight gain than alcohol. ',
    'Alcohol doesn’t cause alcoholism – necessarily. The Florida Bureau of Alcoholic Rehabilitation (FBAR) reports that "Alcohol no more causes alcoholism than sugar causes diabetes." FBAR further notes that if alcohol caused alcoholism, all drinkers would be alcoholics. In reality, only a small percentage of people who consume alcohol qualify as alcohol-dependent. Alcoholics Anonymous also posits that some people are born with a predisposition toward alcohol dependency. '
  ];

  void nextFact() {
    if (_factNumber < _factsList.length - 1) {
      _factNumber++;
    } else if (_factNumber == _factsList.length - 1) {
      _factNumber = 0;
    }
  }

  String getFact() {
    return _factsList[_factNumber];
  }
}
