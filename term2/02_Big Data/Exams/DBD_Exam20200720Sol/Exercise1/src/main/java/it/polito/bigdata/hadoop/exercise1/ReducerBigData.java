package it.polito.bigdata.hadoop.exercise1;

import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

/**
 * Exercise 1 - Reducer
 */
class ReducerBigData extends Reducer<Text, // Input key type
		Text, // Input value type
		Text, // Output key type
		Text> { // Output value type

	protected void reduce(Text key, // Input key type
			Iterable<Text> values, // Input value type
			Context context) throws IOException, InterruptedException {

		// Iterate over the set of values
		// Check if there is only one model type
		String mid = null;
		Boolean onlyOneModel = true;

		for (Text value : values) {
			if (mid == null)
				mid = value.toString();
			else if (mid.equals(value.toString()) == false)
				onlyOneModel = false;
		}

		// Emit brand,mid if the brand is associated to one single model
		if (onlyOneModel == true)
			context.write(new Text(key), new Text(mid));
	}
}
