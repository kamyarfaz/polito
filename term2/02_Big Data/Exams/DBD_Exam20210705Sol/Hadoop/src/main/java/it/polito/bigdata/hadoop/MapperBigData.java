package it.polito.bigdata.hadoop;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import java.io.IOException;

public class MapperBigData extends Mapper<LongWritable, Text, Text, IntWritable> {
	@Override
	protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		String[] fields = value.toString().split(",");
		String timestamp = fields[0];
		String itemId = fields[2];
		String purchased = fields[3];

		String year = timestamp.split("/")[0];

		int val;

		if (purchased.equals("true"))
			val = 1;
		else
			val = 0;

		if (year.equals("2020"))
			context.write(new Text(itemId), new IntWritable(val));
	}
}
