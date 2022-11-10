# Create your grading script here

set -e

rm -rf student-submission
#git clone $1 student-submission

FILE="ListExamples.java"
echo "Making Directory..."
mkdir student-submission
echo "[SUCCESS] Directory made"
cp $FILE student-submission 

echo "Finding $FILE..."
cd student-submission


if test -f "$FILE"; then 
    echo "Found --> $FILE"
else 
    echo "Missing file"
    exit
fi
cd ..

cp "GradeServer.java" "Server.java" "TestListExamples.java" student-submission


# Check if the file compiles
javac -cp ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar" ./student-submission/*.java 
if [ $? -eq 0 ]; then
    echo "Successful Compilation"
else 
    echo "Failed to Compile"
    exit
fi

set -e

cd student-submission
java -cp ".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples
if [ $? -eq 0 ]; then
    echo "RAN!"
else 
    echo "failed to run"
    exit
fi



