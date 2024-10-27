package it.polito.bigdata.hadoop.exercise1;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

/**
 * Exercise 1 - Mapper
 */
class MapperBigData extends Mapper<LongWritable, // Input key type
		Text, // Input value type
		Text, // Output key type
		Text> {// Output value type

	protected void map(LongWritable key, // Input key type
			Text value, // Input value type
			Context context) throws IOException, InterruptedException {

		// Split record
		// Example: 2015/01/05,08:45,Car15,Engine
		String[] fields = value.toString().split(",");

		String date = fields[0];
		String carID = fields[2];
		String failureType = fields[3];

		// Select only failures of year 2018
		if (date.startsWith("2018")==true) {
			// Emit (CarID,FailureType)
			context.write(new Text(carID), new Text(failureType) );
		}
	}
}
