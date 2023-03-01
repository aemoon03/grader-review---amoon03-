CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission
echo -e 'Finished cloning'

if [[ -f ./student-submission/ListExamples.java ]]
then
  echo "ListExamples.java found"
else
  echo "ListExamples.java not found"
  exit
fi

cp ./student-submission/ListExamples.java .

javac -cp $CPATH *.java
if [[ $? -eq 0 ]]
then
  echo "Code compiled properly"
else
  echo "Code did not compile properly"
  exit
fi

res=$(java -cp $CPATH org.junit.runner.JUnitCore TestListExamples | grep -c "FAILURES!!!")
if [[ $res -eq "1" ]]
then
  echo "You failed"
else
  echo "You passed"
fi
