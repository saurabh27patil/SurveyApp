package core;

import java.util.ArrayList;
import java.util.List;

//import bean.WinningResult;

public class DataProcessor {
	
	
	private static final String likelihoodString="Likely,Unlikely,VeryLikely"; 
	private static final String[] likelihoodArray= likelihoodString.split(",");
	
	public List<String> completeLikelihood(String likelihoodPrefix) {
		List<String> matches = new ArrayList<String>();
		for(String possibleLikelihood: likelihoodArray) {
		if(possibleLikelihood.toUpperCase().startsWith(likelihoodPrefix.toUpperCase())) {
		matches.add(possibleLikelihood);
		}
		}
		return(matches);
		}
	
	//WinningResult wr = new WinningResult();
public float meanCal(String data) {
		
		String data1[] = data.split(",");
		float mean = 0;
		
		for (int i=0;i< data1.length;i++)
			mean = mean + Integer.parseInt(data1[i]);
		
		mean = mean / data1.length;
		return mean;
		
	}
	
	public double stdDevCal(String data, float mean){
		
		String data1[] = data.split(",");
		float sum = 0;
		double sd = 0;
		
		for (int i=0;i< data1.length;i++)
			sum += Math.pow((Integer.parseInt(data1[i]) - mean),2);
		
		sd = Math.sqrt(sum / (data1.length));
		return sd;
		
	}
	
	}


	

	




