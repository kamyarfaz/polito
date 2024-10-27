package it.polito.bigdata.hadoop;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


/**
 * Basic MapReduce Project - Mapper
 */
class MapperBigData extends Mapper<
                    LongWritable, // Input key type
                    Text,         // Input value type
                    Text,         // Output key type
                    IntWritable> {// Output value type
    
    protected void map(
            LongWritable key,   // Input key type
            Text value,         // Input value type
            Context context) throws IOException, InterruptedException {

            // Split each sentence in words. Use whitespace(s) as delimiter 
    		// (=a space, a tab, a line break, or a form feed)
    		// The split method returns an array of strings
            String[] fields = value.toString().split(",");
            String carModelID = fields[2];
            String date = fields[3];
            String country = fields[4];

            int year = Integer.parseInt(date.split("/")[0]);
            if(country.toLowerCase().equals("Italy") && (year == 2020 || year == 2019)) {
            	if (year == 2020 )
            		context.write(new Text(carModelID), new IntWritable(+1));
            	else
            		context.write(new Text(carModelID), new IntWritable(-1));
            		
            }
    }
}
