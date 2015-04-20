package test;

import org.apache.commons.lang.time.StopWatch;

public class StopwatchTest {
	public static void main(String[] args) {
		StopWatch obj = new StopWatch();
		obj.start();
		try {
			Thread.currentThread().sleep(1500);
		} catch (InterruptedException ie) {
			// ignore
		}
		obj.stop();
		System.out.println(obj);
	}
}
