import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Quiz Topic'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(topic: 'General Knowledge'),
                ),
              );
            },
            child: Text('General Knowledge'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(topic: 'Science & Technology'),
                ),
              );
            },
            child: Text('Science & Technology'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(topic: 'Movies and TV Shows'),
                ),
              );
            },
            child: Text('Movies and TV Shows'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(topic: 'Sports'),
                ),
              );
            },
            child: Text('Sports'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(topic: 'Geography'),
                ),
              );
            },
            child: Text('Geography'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(topic: 'History'),
                ),
              );
            },
            child: Text('History'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(topic: 'Language and Words'),
                ),
              );
            },
            child: Text('Language and Words'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(topic: 'Holiday and Festivals'),
                ),
              );
            },
            child: Text('Holiday and Festivals'),
          ),
        ],
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String topic;

  QuizPage({required this.topic});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<Map<String, dynamic>> topicData;
  int currentQuestionIndex = 0;
  int score = 0;

  // Timer variables
  late Timer _timer;
  int _secondsRemaining = 10;

  @override
  void initState() {
    super.initState();
    topicData = getTopicData(widget.topic);
    startTimer();
  }

  List<Map<String, dynamic>> getTopicData(String topic) {
    if (topic == 'General Knowledge') {
      return [
        {'question': 'The Great Wall of China is visible from space.', 'answer': false},
        {'question': 'Mount Everest is the tallest mountain in the world.', 'answer': true},
        {'question': 'The Eiffel Tower is located in London.', 'answer': false},
        {'question': 'The Earth is flat.', 'answer': false},
        {'question': 'The human body has 206 bones.', 'answer': false},
        {'question': 'The Pacific Ocean is the largest ocean on Earth.', 'answer': true},
        {'question': 'Bananas are berries.', 'answer': true},
        {'question': 'The currency of Switzerland is the Euro.', 'answer': false},
        {'question': 'The sun is a planet.', 'answer': false},
        {'question': 'The Amazon River is the longest river in the world.', 'answer': true}, // Add more questions and answers
      ];
    } else if (topic == 'Science & Technology') {
      return [
        {'question': 'The chemical symbol for water is H2O2', 'answer': false},
        {'question': 'The programming language "Python" is named after the snake', 'answer': true},
        {'question': 'A light-year measures time, not distance', 'answer': false},
        {'question': 'The human brain is the largest organ in the body', 'answer': false},
        {'question': 'In computing, RAM stands for Random Access Memory', 'answer': true},
        {'question': 'The ozone layer is found in the Earths core', 'answer': false},
        {'question': 'The chemical symbol for the element gold is Au', 'answer': true},
        {'question': 'A light-emitting diode (LED) emits sound instead of light', 'answer': false},
        {'question': 'DNA stands for Deoxyribonucleic Acid', 'answer': true},
        {'question': 'The planet closest to the sun is Venus', 'answer': false},
      ];
    }
    else if (topic == 'Movies and TV Shows') {
      return [
        {'question': 'The movie "Jurassic Park" was directed by Steven Spielberg.', 'answer': true},
        {'question': 'The TV series "Friends" is set in Chicago.', 'answer': false},
        {'question': 'James Bond famous catchphrase is "Shaken, not stirred."', 'answer': true},
        {'question': 'The character Darth Vader appears in the "Star Trek" franchise.', 'answer': false},
        {'question': 'The film "The Shawshank Redemption" is based on a Stephen King novel.', 'answer': true},
        {'question': 'The animated TV show "The Simpsons" first aired in the 1980s.', 'answer': false},
        {'question': 'Tom Cruise played the lead role in the movie "Top Gun."', 'answer': true},
        {'question': 'The TV series "Breaking Bad" is set in New Mexico.', 'answer': true},
        {'question': 'The film "Titanic" is based on a true story.', 'answer': true},
        {'question': 'The character Jack Sparrow is played by Johnny Depp in the "Pirates of the Caribbean" series.', 'answer': true},
      ];
    }
    else if (topic == 'Sports') {
      return [
        {'question': 'Soccer is called "football" in every country.', 'answer': false},
        {'question': 'The Olympic Games are held every four years.', 'answer': true},
        {'question': 'Tennis is played on a rectangular court.', 'answer': true},
        {'question': 'Michael Jordan played the majority of his NBA career with the Chicago Bulls.', 'answer': true},
        {'question': 'Cricket is more popular than basketball in India.', 'answer': true},
        {'question': 'The Super Bowl is the championship game of Major League Baseball.', 'answer': false},
        {'question': 'Usain Bolt holds the world record for the marathon.', 'answer': false},
        {'question': 'Golf is played on an 18-hole course.', 'answer': true},
        {'question': 'The Tour de France is a cycling race that takes place in a single day.', 'answer': false},
        {'question': 'In volleyball, a point is scored only by the serving team.', 'answer': true},
      ];
    }
    else if (topic == 'Geography') {
      return [
        {'question': 'The Nile River is the longest river in the world.', 'answer': true},
        {'question': 'Mount Kilimanjaro is the highest mountain in Africa.', 'answer': true},
        {'question': 'The Great Barrier Reef is located in the Atlantic Ocean.', 'answer': false},
        {'question': 'Russia is the largest country in the world by land area.', 'answer': true},
        {'question': 'The capital of Canada is Toronto.', 'answer': false},
        {'question': 'The Sahara Desert is the largest hot desert in the world.', 'answer': true},
        {'question': 'The Amazon Rainforest is primarily located in Asia.', 'answer': false},
        {'question': 'The Great Wall of China is visible from the Moon.', 'answer': false},
        {'question': 'Australia is both a country and a continent.', 'answer': true},
        {'question': 'The Tropic of Cancer passes through Mexico.', 'answer': true},
      ];
    }
    else if (topic == 'History') {
      return [
        {'question': 'The Declaration of Independence was signed in 1776.', 'answer': true},
        {'question': 'The French Revolution began in the 19th century.', 'answer': false},
        {'question': 'The Battle of Gettysburg was a major turning point in the American Civil War.', 'answer': true},
        {'question': 'Genghis Khan was the founder of the Mongol Empire.', 'answer': true},
        {'question': 'The Renaissance originated in Asia.', 'answer': false},
        {'question': 'The Berlin Wall fell in 1989, marking the end of the Cold War.', 'answer': true},
        {'question': 'The ancient city of Rome was founded in the 8th century BCE.', 'answer': false},
        {'question': 'The Industrial Revolution began in the 18th century.', 'answer': true},
        {'question': 'The Magna Carta was signed in the 13th century.', 'answer': true},
        {'question': 'The Titanic sank in 1912 after hitting an iceberg.', 'answer': true},
      ];
    }
    else if (topic == 'Language and Words') {
      return [
        {'question': 'English is the most widely spoken language in the world.', 'answer': true},
        {'question': 'A palindrome is a word or phrase that reads the same backward as forward.', 'answer': true},
        {'question': 'The word "facetious" contains all five vowels.', 'answer': true},
        {'question': 'Mandarin Chinese is written using the Latin alphabet.', 'answer': false},
        {'question': 'An oxymoron is a figure of speech in which contradictory terms are combined.', 'answer': true},
        {'question': 'The word "serendipity" means a sudden and fortunate discovery.', 'answer': true},
        {'question': 'A synonym is a word that has opposite meanings.', 'answer': false},
        {'question': 'The Oxford English Dictionary was first published in the 20th century.', 'answer': true},
        {'question': 'In linguistics, "syntax" refers to the study of word meanings.', 'answer': false},
        {'question': 'The longest word in the English language is "pneumonoultramicroscopicsilicovolcanoconiosis."', 'answer': true},
      ];
    }
    else if (topic == 'Holiday and Festivals') {
      return [
        {'question': 'Diwali is a Hindu festival celebrated in India.', 'answer': true},
        {'question': 'Easter is always celebrated on the same date each year.', 'answer': false},
        {'question': 'The Chinese New Year is based on the Gregorian calendar.', 'answer': false},
        {'question': 'Oktoberfest is a traditional beer festival held in Germany.', 'answer': true},
        {'question': 'Halloween is celebrated on the last day of October.', 'answer': true},
        {'question': 'Hanukkah is also known as the Festival of Lights.', 'answer': true},
        {'question': 'Valentines Day is named after a Roman emperor.', 'answer': false},
        {'question': 'Cinco de Mayo is a Mexican holiday that commemorates a battle victory.', 'answer': true},
        {'question': 'The Winter Solstice marks the longest day of the year in the Northern Hemisphere.', 'answer': false},
        {'question': 'Mardi Gras is also known as Fat Tuesday.', 'answer': true},
      ];
    }
    return [];
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        handleAnswer(false); // Timeout, treat as a wrong answer
      }
    });
  }

  void resetTimer() {
    setState(() {
      _secondsRemaining = 10;
    });
  }

  void handleAnswer(bool userAnswer) {
    bool correctAnswer = topicData[currentQuestionIndex]['answer'];

    if (userAnswer == correctAnswer) {
      setState(() {
        score += 3;
      });
    } else {
      setState(() {
        score -= 1;
      });
    }

    if (currentQuestionIndex < topicData.length - 1) {
      // Move to the next question
      resetTimer();
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Quiz completed, navigate to the result page or show a dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Completed'),
            content: Text('Your Score: $score'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context); // Pop both the result dialog and the quiz page
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}: ${topicData[currentQuestionIndex]['question']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text('Time Remaining: $_secondsRemaining seconds'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => handleAnswer(true),
              child: Text('True'),
            ),
            ElevatedButton(
              onPressed: () => handleAnswer(false),
              child: Text('False'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}