package it.polito.bigdata.hadoop.exercise1;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

/**
 * Exercise 1 - Mapper
 */
class MapperBigData extends Mapper<LongWritable, // Input key type
		Text, // Input value type
		Text, // Output key type
		NullWritable> {// Output value type

	protected void map(LongWritable key, // Input key type
			Text value, // Input value type
			Context context) throws IOException, InterruptedException {

		// Split record
		// R15,FCode122,2018/01/01,06:40:21
		String[] fields = value.toString().split(",");

		String failureType = fields[1];
		String date = fields[2];

		// Select only data related to year 2018
		if (date.startsWith("2018")) {
			// Emit (failureType, NullWritable)
			context.write(new Text(failureType), NullWritable.get());
		}
	}

}
