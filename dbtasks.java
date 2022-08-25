import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


// This Java Program is mainly about our Company Database Management System. 
// We converted our operations in SQL into Java Programming language.
public class dbtasks {

	static Connection connect = null;
	static Statement statement = null;
	static ResultSet resultSet = null;

	public static void main(String[] args) throws SQLException  {

        // We entered our informations related to our database such as name of our datase, username and password.
		

		String host = "jdbc:postgresql://10.98.98.61:5432/group12";
		String user = "group12";
		String password = "vxbYLL&S^aBetE5z";

		Scanner keyboard = new Scanner(System.in);

		// We established our connection.
		try {
		Connection connect = DriverManager.getConnection(host, user, password);
		System.out.println("Java JDBC PostgreSQL Example");
		System.out.println("Connected to PostgreSQL database!");
		Statement statement = connect.createStatement();

		String input = " ";

		System.out.println("Please select a number to get information: ");
		System.out.println("---------------------------------------------------------------------------------------------");
		System.out.println("|1-Lists the department names of department                                                  |");
		System.out.println("|2-Update a department                                                                       |");
		System.out.println("|3-Lists of devices in the company and their owners                                          |");
		System.out.println("|4-Inserts a new device information for the company                                          |");
		System.out.println("|5-Lists the Projects Of Company                                                             |");
		System.out.println("|6-Delete a project                                                                          |");
		System.out.println("|7-Exit                                                                                      |");
		System.out.println("---------------------------------------------------------------------------------------------");

		
		while (!input.equals("7")) {

			System.out.print("Selected Number: ");
			keyboard = new Scanner(System.in);
			input = keyboard.nextLine();

			// If the user enters 1, we list the departments of our Java Application.
			
			if (input.equals("1")) 
			{

				System.out.println("Lists the Departments of the Company");

				// After keeping our SQL statement in the string, we call executeQuery method to reach our query.
				// After that we can reach specific attributes of our table by using getString() method.
				
				String sql = "SELECT * FROM Department";
				resultSet = statement.executeQuery(sql);
				System.out.println(
						"----------------------------------------------------------------------------------------------");
				while (resultSet.next()) {
					String Department_ID = resultSet.getString("Department_ID");
					String Department_Name = resultSet.getString("Department_Name");
					
					System.out.println("|"+Department_ID + " " + Department_Name);
				}
				System.out.println(
						"----------------------------------------------------------------------------------------------");
			} 
			
			//If user enters 2, we update the department name of our Java Application.
			
			else if (input.equals("2")) {
				
			
				// We get the user's choice by using Scanner.

				System.out.println("First, choose a department to change its name.");
				String Department_Name = keyboard.nextLine();
				
				System.out.println("Second, update the selected name");
				String NewDepartment_Name = keyboard.nextLine();
				
				// We specified updated versions of our Department Name and previous Department Name by ? icon.
				// Secondly, we connect our database and transferred our Sql statement.
				
				String sql = "UPDATE Department SET Department_Name= ? WHERE Department_Name= ?";
				PreparedStatement updateStatement = connect.prepareStatement(sql);
				
				// We arranged our entered values by using setString() method.
				
				updateStatement.setString(1, NewDepartment_Name);
				updateStatement.setString(2, Department_Name);
				
				// We updated our current changes by using executeUpdate() method.
				
				updateStatement.executeUpdate();
				
				System.out.println("Selected name has been changed.");
						
			}

			// If user enters 3, we list informations of our Devices such as device id, device name and their related Employee.
			
			else if (input.equals("3")) {
				System.out.println("Listing of devices in the company and their owners: ");
				String sql = "SELECT * FROM Device";
				resultSet = statement.executeQuery(sql);
				System.out.println(
						"----------------------------------------------------------------------------------------------------------------------------------------------");
				while (resultSet.next()) {

					String Device_ID = resultSet.getString("Device_ID");
					String Device_Name = resultSet.getString("Device_Name");
					int Employee_ID = resultSet.getInt("Employee_ID");

					System.out.println("| Device ID = " + Device_ID + " || Device Name = " + Device_Name 
							+ " || The ID of the owner of the device = " + Employee_ID);
				}
				System.out.println(
						"----------------------------------------------------------------------------------------------------------------------------------------------");

				
			// If user enters 4, we insert a new device to our Java Application.	
				
			} else if (input.equals("4")) {

				System.out.println("Enter a new device information as specified:");
				System.out.println("(Device ID, Device Name, Employee_Id)\n");

				System.out.println("Enter the ID of the device you are going to add new.");
				String Device_ID = keyboard.nextLine();

				System.out.println("Enter the name of the device you are going to add new.");
				String Device_Name = keyboard.nextLine();

				System.out.println("Enter the ID of the employee to belong.");
				int Employee_ID = keyboard.nextInt();
				
				
				// We specified inserted versions of our device id, device name and employee id by ? icon.
				// Secondly, we connect our database and transferred our Sql statement.

				String sql = "INSERT INTO Device(Device_ID, Device_Name, Employee_ID)" + " Values (?, ?, ?)";
                
				PreparedStatement Insertstatement = connect.prepareStatement(sql);
				Insertstatement.setString(1, Device_ID);
				Insertstatement.setString(2, Device_Name);
				Insertstatement.setInt(3, Employee_ID);

				Insertstatement.executeUpdate();

				System.out.println("A new device has been inserted successfully.");

			}
			
			// If user enters 5, our Java Application lists all projects in our design.

			else if (input.equals("5")) {
				System.out.println("Lists the Projects Of Company");

				String sql = "SELECT * FROM Project";
				resultSet = statement.executeQuery(sql);
				System.out.println(
						"----------------------------------------------------------------------------------------------");
				while (resultSet.next()) {
					String Project_No = resultSet.getString("Project_No");
					String Project_Name = resultSet.getString("Project_Name");
					String Starting_Date = resultSet.getString("Starting_Date");
					String Due_Date = resultSet.getString("Due_Date");
					System.out.println(
							"|" + Project_No + "||" + Project_Name + "||" + Starting_Date + "||" + Due_Date + "|");

				}
				System.out.println(
						"----------------------------------------------------------------------------------------------");

			// For the condition that the user enters 6, we delete a project from our Project list.	
				
			} else if (input.equals("6")) {

				System.out.println("Select a project name to delete the project:");

				System.out.println("Enter the project name you are going to delete from.");
				String Project_Name = keyboard.nextLine();

				String sql = "DELETE FROM Project WHERE Project_Name = ?";

				PreparedStatement deleteStatement = connect.prepareStatement(sql);

				deleteStatement.setString(1, Project_Name);

				deleteStatement.executeUpdate();

				System.out.println("The project has been deleted successfully.");
			}
			
			// If user enters 7, we terminate the program by printing a message "Have a nice day".
			else if (input.equals("7")) {
				System.out.println("Exiting the system. Have a nice day.");
			System.exit(0);
			}

		}
		}catch(SQLException e) {
			System.out.println("Connection failure.");
			System.exit(0);
			e.printStackTrace();
		}
		connect.close();

	}

		
		

}