package it.polito.bigdata.hadoop.exercise1;

import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.mapreduce.Reducer;

/**
 * Exercise 1 - Reducer
 */
class ReducerBigData extends Reducer<Text, // Input key type
		NullWritable, // Input value type
		IntWritable, // Output key type
		NullWritable> { // Output value type

	int numDistinctFailures;

	protected void setup(Context context) {
		numDistinctFailures = 0;
	}

	protected void reduce(Text key, // Input key type
			Iterable<NullWritable> values, // Input value type
			Context context) throws IOException, InterruptedException {

		// Increment the number of distinct failure types
		numDistinctFailures++;
	}

	protected void cleanup(Context context) throws IOException, InterruptedException {
		// Emit (numDistinctFailures, NullWritbale)
		context.write(new IntWritable(numDistinctFailures), NullWritable.get());
	}

}
