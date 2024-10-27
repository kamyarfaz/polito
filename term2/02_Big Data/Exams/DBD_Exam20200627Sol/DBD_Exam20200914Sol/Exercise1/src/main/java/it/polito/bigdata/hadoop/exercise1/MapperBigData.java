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
		NullWritable, // Output key type
		YearOccurrences> {// Output value type

	YearOccurrences localYearOccurences;

	protected void setup(Context context) {

		localYearOccurences = new YearOccurrences();
		localYearOccurences.year = Integer.MIN_VALUE;
		localYearOccurences.numOccurrences = 0;
	}

	protected void map(LongWritable key, // Input key type
			Text value, // Input value type
			Context context) throws IOException, InterruptedException {

		// Split record
		// UID,Name,Surname,Gender,YearOfBirth
		String[] fields = value.toString().split(",");

		int yearOfBirth = Integer.parseInt(fields[4]);
		String gender = fields[3];

		if (gender.compareTo("Female") == 0) {
			// Check if this is the youngest female user (max year of birth)

			if (yearOfBirth > localYearOccurences.year) {
				// New local max year of birth
				localYearOccurences.year = yearOfBirth;
				localYearOccurences.numOccurrences = 1;
			} else if (yearOfBirth == localYearOccurences.year)
				localYearOccurences.numOccurrences++;
		}
	}

	protected void cleanup(Context context) throws IOException, InterruptedException {
		// Emit (NullWritbale, local max year of birth and local number of occurrences)
		context.write(NullWritable.get(), localYearOccurences);
	}

}
