###build
./gradlew clean fatJar;

###modules

#Sample queries from the subjects, predicates or objects
java -cp build/libs/BEAR-all-1.0.jar GetQueries
usage: Main
 -e <arg>    epsilon value
 -h,--help   show help.
 -i <arg>    the statistic file
 -o <arg>    output directory
 -s <arg>    number of maximum URLs