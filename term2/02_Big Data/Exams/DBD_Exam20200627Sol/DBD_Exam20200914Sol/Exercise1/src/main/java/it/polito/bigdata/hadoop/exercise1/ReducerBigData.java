package it.polito.bigdata.hadoop.exercise1;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.mapreduce.Reducer;

/**
 * Exercise 1 - Reducer
 */
class ReducerBigData extends Reducer<NullWritable, // Input key type
		YearOccurrences, // Input value type
		IntWritable, // Output key type
		IntWritable> { // Output value type

	protected void reduce(NullWritable key, // Input key type
			Iterable<YearOccurrences> values, // Input value type
			Context context) throws IOException, InterruptedException {

		int maxYear = Integer.MIN_VALUE;
		int numOccurrences = 0;

		// Iterate over the set of values
		// Select the maximum value (year of birth of the youngest user)
		// and count its number of occurrences

		for (YearOccurrences value : values) {
			int year = value.year;
			int localOccurences = value.numOccurrences;

			if (year > maxYear) {
				maxYear = year;
				numOccurrences = localOccurences;
			} else if (year == maxYear)
				numOccurrences = numOccurrences + localOccurences;
		}

		// Emit Year of birth youngest female, number of occurrences
		context.write(new IntWritable(maxYear), new IntWritable(numOccurrences));
	}
}
