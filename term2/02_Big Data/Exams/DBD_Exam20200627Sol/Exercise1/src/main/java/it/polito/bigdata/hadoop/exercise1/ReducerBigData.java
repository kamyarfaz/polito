package it.polito.bigdata.hadoop.exercise1;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

/**
 * Exercise 1 - Reducer
 */
class ReducerBigData extends Reducer<Text, // Input key type
		Text, // Input value type
		Text, // Output key type
		IntWritable> { // Output value type

	
	protected void reduce(Text key, // Input key type
			Iterable<Text> values, // Input value type
			Context context) throws IOException, InterruptedException {

		// Iterate over the set of values
		// Count the number of input values and 
		// check if there are at least two different failure types  
		int numFailures = 0;
		String previousFailureType = null;
		Boolean atLeastTwoFailureTypes = false;

		for (Text value : values) {
			numFailures++;
			
			// Check if the current failureType is different from the previous one
			// If it is true there are at least two different failure types
			if( previousFailureType!=null && previousFailureType.equals(value.toString())==false) {
				atLeastTwoFailureTypes = true;
			}
			
			previousFailureType=value.toString();
		}

		// Emit the CarID and the number of failures only if 
		// - number of failures >=5
		// - there are at least two failure types for this car
		if (numFailures>=5 && atLeastTwoFailureTypes==true)
			context.write(new Text(key), new IntWritable(numFailures));
	}
}

