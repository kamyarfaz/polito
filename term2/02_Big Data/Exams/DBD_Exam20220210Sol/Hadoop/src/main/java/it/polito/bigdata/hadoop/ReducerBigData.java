package it.polito.bigdata.hadoop;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import java.io.IOException;

public class ReducerBigData extends Reducer<Text, IntWritable, Text, IntWritable> {
	@Override
	protected void reduce(Text key, Iterable<IntWritable> values, Context context)
			throws IOException, InterruptedException {

		int numApps = 0;
		int sumFlags = 0;

		for (IntWritable value : values) {
			numApps++;
			sumFlags = sumFlags + value.get();
		}

		if (sumFlags == 0) { // Only free apps
			context.write(key, new IntWritable(numApps));
		}
	}
}
