package it.polito.bigdata.hadoop.exercise1;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.Writable;

public class YearOccurrences implements Writable {

	public int year;
	public int numOccurrences;

	@Override
	public void write(DataOutput out) throws IOException {
		out.writeInt(year);
		out.writeInt(numOccurrences);
	}

	@Override
	public void readFields(DataInput in) throws IOException {
		year = in.readInt();
		numOccurrences = in.readInt();
	}

}
