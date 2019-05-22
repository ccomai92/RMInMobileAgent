import java.rmi.*;
import java.util.*;
import java.net.*;

public class UnixClient {
	public static void main(String[] args) {
		// verify arguments
		// 0. port Number
		// 1. # of servers
		// 2. List of Sever Names
		// 3. # of Unix commands
		// 4. list of Unix commands

		// Parsing port and option
		String port = args[1];
		String option = args[0];

		// parsing server names
		int serverIpSize = Integer.parseInt(args[2]);
		String[] servers = new String[serverIpSize];

		for (int i = 0; i < serverIpSize; i++) {
			int argIndex = 3 + i;
			servers[i] = args[argIndex];
		}

		// parsing commands
		int commandSize = Integer.parseInt(args[3 + serverIpSize]); // 2 + # of ips + 1
		String[] commands = new String[commandSize];
		for (int i = 0; i < commandSize; i++) {
			// 3 + serverIpSize + 1 + i
			commands[i] = args[4 + serverIpSize + i];
		}

		// argument parsing is completed, print summary
		String summary = parseArgs(option, port, servers, commands);
		System.err.println(summary);

		Vector<String> returnValue;
		Vector<String> overallResult = new Vector<String>();

		// start timer
		Date startTime = new Date();
		try {
			// for each server, execute all given commands
			for (int i = 0; i < servers.length; i++) {

				ServerInterface serverObject = (ServerInterface) Naming
						.lookup("rmi://" + servers[i] + ":" + port + "/unixserver");
				if (option.equals("P")) {
					overallResult.addElement(
							"=========================================================================================");
				}
				for (int j = 0; j < commands.length; j++) {
					if (option.equals("P")) {
						overallResult.addElement(servers[i] + " command(" + commands[j]
								+ "):.................................................................");

					}
					try {
						returnValue = serverObject.execute(commands[j]);
						for (int k = 0; k < returnValue.size(); k++) {
							overallResult.addElement(returnValue.get(k));
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(-1);
		}

		// based on option, print result or count
		if (option.equals("P")) {
			printResult(overallResult);
		} else {
			System.out.println("Count: " + overallResult.size());
		}

		// end timer
		Date endTime = new Date();
		// print execution time
		System.err.println("Execution Time: " + (endTime.getTime() - startTime.getTime()));
	}

	// printing result of execution from every computing node
	public static void printResult(Vector<String> overallResult) {
		for (int i = 0; i < overallResult.size(); i++) {
			System.out.println(overallResult.get(i));
		}
	}

	// make summary from input arguments
	public static String parseArgs(String option, String port, String[] servers, String[] commands) {
		String result = "Print/Count: ";
		if (option.equals("P")) {
			result += "print, ";
		} else {
			result += "count, ";
		}

		result += "Port: " + port + ", nServers: " + servers.length;
		for (int i = 0; i < servers.length; i++) {
			result += ", Server" + (i + 1) + ": " + servers[i];
		}

		for (int i = 0; i < commands.length; i++) {
			result += ", Command" + (i + 1) + ": " + commands[i];
		}
		return result;
	}
}
