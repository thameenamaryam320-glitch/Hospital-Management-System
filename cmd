import java.util.ArrayList;
import java.util.Scanner;

// Patient Class
class Patient {
    int id;
    String name;
    int age;
    String disease;

    // Constructor
    Patient(int id, String name, int age, String disease) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.disease = disease;
    }

    // Display Method
    void display() {
        System.out.println("Patient ID : " + id);
        System.out.println("Name       : " + name);
        System.out.println("Age        : " + age);
        System.out.println("Disease    : " + disease);
        System.out.println("---------------------------");
    }
}

// Main Class
public class HospitalManagement {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        ArrayList<Patient> patients = new ArrayList<>();

        int choice;

        do {
            System.out.println("\n===== HOSPITAL MANAGEMENT SYSTEM =====");
            System.out.println("1. Add Patient");
            System.out.println("2. View Patients");
            System.out.println("3. Search Patient");
            System.out.println("4. Delete Patient");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");

            choice = sc.nextInt();

            switch (choice) {

                // Add Patient
                case 1:
                    System.out.print("Enter Patient ID: ");
                    int id = sc.nextInt();

                    sc.nextLine(); // consume newline

                    System.out.print("Enter Patient Name: ");
                    String name = sc.nextLine();

                    System.out.print("Enter Age: ");
                    int age = sc.nextInt();

                    sc.nextLine();

                    System.out.print("Enter Disease: ");
                    String disease = sc.nextLine();

                    patients.add(new Patient(id, name, age, disease));

                    System.out.println("Patient Added Successfully!");
                    break;

                // View Patients
                case 2:
                    if (patients.isEmpty()) {
                        System.out.println("No Patients Found!");
                    } else {
                        System.out.println("\n--- Patient Details ---");
                        for (Patient p : patients) {
                            p.display();
                        }
                    }
                    break;

                // Search Patient
                case 3:
                    System.out.print("Enter Patient ID to Search: ");
                    int searchId = sc.nextInt();

                    boolean found = false;

                    for (Patient p : patients) {
                        if (p.id == searchId) {
                            System.out.println("\nPatient Found:");
                            p.display();
                            found = true;
                        }
                    }

                    if (!found) {
                        System.out.println("Patient Not Found!");
                    }
                    break;

                // Delete Patient
                case 4:
                    System.out.print("Enter Patient ID to Delete: ");
                    int deleteId = sc.nextInt();

                    boolean removed = false;

                    for (Patient p : patients) {
                        if (p.id == deleteId) {
                            patients.remove(p);
                            removed = true;
                            System.out.println("Patient Deleted Successfully!");
                            break;
                        }
                    }

                    if (!removed) {
                        System.out.println("Patient Not Found!");
                    }
                    break;

                // Exit
                case 5:
                    System.out.println("Thank You!");
                    break;

                default:
                    System.out.println("Invalid Choice!");
            }

        } while (choice != 5);

        sc.close();
    }
}