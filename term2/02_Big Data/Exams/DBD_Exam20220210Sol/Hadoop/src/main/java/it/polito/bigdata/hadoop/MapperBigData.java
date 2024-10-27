package it.polito.bigdata.hadoop;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import java.io.IOException;

public class MapperBigData extends Mapper<LongWritable, Text, Text, IntWritable> {
	@Override
	protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		// AppId,AppName,Price,Category,Company
		String[] fields = value.toString().split(",");
		double price = Double.parseDouble(fields[2]);
		String category = fields[3];
		String company = fields[4];


		if (category.equals("Education")) {
			if (price>0) // Non-free app 
				context.write(new Text(company), new IntWritable(1));
			else  // Free app
				context.write(new Text(company), new IntWritable(0));			
		}
	}
}
