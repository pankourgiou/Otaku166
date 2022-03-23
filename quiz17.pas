import random

class QA:
  def __init__(self, question, correctAnswer, otherAnswers):
    self.question = question
    self.corrAnsw = correctAnswer
    self.otherAnsw = otherAnswers

qaList = [QA("Mars' equatorial rotation velocity is:", "241,17 m/s", ["115,32 m/s", "321,18 m/s"]),
QA("Uranus' equatorial rotation velocity is:", "2,59 km/s", ["3,2 km/s", "1,45 km/s", "5,18 km/s"]),
QA("Venus' equatorial rotation velocity is:", "6,52 km/h", ["7,18 km/h", "8,25 km/h", "5,72 km/h"]),
QA("Saturns' equatorial rotation velocity is:", "9,87 km/s", ["5,18 km/s", "20,19 km/s"]),
QA("Mercurys' equatorial rotation velocity is:", "10,892 km/h", ["1,18 km/h", "20,25 km/h", "3,5 km/h", "12,25 km/h"])]

corrCount = 0
random.shuffle(qaList)
for qaItem in qaList:
  print(qaItem.question)
  print("Possible answers are:")
  possible = qaItem.otherAnsw + [qaItem.corrAnsw] # square brackets turn correct answer into list for concatenating with other list
  random.shuffle(possible)
  count = 0 # list indexes start at 0 in python
  while count < len(possible):
    print(str(count+1) + ": " + possible[count])
    count += 1
  print("Please enter the number of your answer:")
  userAnsw = input()
  while not userAnsw.isdigit():
    print("That was not a number. Please enter the number of your answer:")
    userAnsw = input()
  userAnsw = int(userAnsw)
  while not (userAnsw > 0 and userAnsw <= len(possible)):
    print("That number doesn't correspond to any answer. Please enter the number of your answer:")
    userAnsw = input()
  if possible[userAnsw-1] == qaItem.corrAnsw:
    print("Your answer was correct.")
    corrCount += 1
  else:
    print("Your answer was wrong.")
    print("Correct answer was: " + qaItem.corrAnsw)
  print("")

print("You answered " + str(corrCount) + " of " + str(len(qaList)) + " questions correctly.")
