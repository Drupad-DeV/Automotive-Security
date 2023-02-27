for i in {0..9} {A..F}; 
do for x in {0..9} {A..F}; 
do cansend vcan0 244#000000"$i$x"2A ;
echo "obase=10; ibase=16; $i$x" | bc
sleep .08;

done;
done;

