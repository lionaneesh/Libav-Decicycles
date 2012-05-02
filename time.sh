LEAST_ARGS=3
E_BADARGS=65
MAX=10
count=1
sum=0

if [ $# -lt $LEAST_ARGS ]
then
  echo "Usage: `basename $0` {command which outputs decicycles}"
  echo "Example: ./avconv -cpuflags mmx -i file.test -f crc - "
  exit $E_BADARGS
fi

while [ $count -lt $MAX ]
do
	# We only care about the last line because it represents the most runs.
	cycle=`$@ 2>&1 | grep -oh '[0-9]* decicycles' | grep -oh '[0-9]*' | tail -1`
	sum=$[$sum+$cycle]
	count=$[$count+1]
done

let average=$sum/$count

echo "Average Decicycles : $average"