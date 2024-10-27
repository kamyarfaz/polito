package it.polito.bigdata.hadoop;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import java.io.IOException;

public class ReducerBigData extends Reducer<Text, IntWritable, Text, DoubleWritable> {
	@Override
	protected void reduce(Text key, Iterable<IntWritable> values, Context context)
			throws IOException, InterruptedException {
		int numerator = 0;
		int denominator = 0;

		for (IntWritable value : values) {
			denominator++;
			numerator += value.get();
		}

		double convRate = (double) numerator / denominator;

		if (convRate > 0.001)
			context.write(key, new DoubleWritable(convRate));
	}
}
