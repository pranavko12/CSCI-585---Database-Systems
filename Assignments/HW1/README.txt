DENTAL PRACTICE
TABLES:
1.	Insurance
2.	InsuranceBilling
3.	Staff
4.	License
5.	Patients
6.	Procedure
7.	Schedule
8.	Billing
9.	Expenditures

Insurance:
Insurance table contains the information of all the insurance companies that provide insurance to the patients. Insurance_subscriber_id is the primary key of this table. It also contains insurance_provider_name, coverage_type and amount_covered. 
It has a many to one relationship with Patients table as one patient can have multiple insurances.
It has a one to many relationship with Billing table as one insurance can cover multiple bills. 
It has a one to many relationship with the InsuranceBilling table as one insurance can cover multiple bills.


InsuranceBilling:
This is a table that the staff will use to send bill to the insurance companies. This table acts as a bridge to connect the two tables. It has the primary keys of both the tables, along with the type_of_treatment, treatment_date, amount_requested and amount_paid.
It has a one to one relationship with Staff table.


Staff:
This table contains the information of all the staff that is working here. Staff_id is the primary key. It includes the first name, last name, date of birth, address and phone number of the staff, along with staff salary and staff type.
Staff type includes office workers and medical professionals (dental hygienists, regular dentists, periodontists, endodontists, orthodontists and dental surgeons).
Staff table has a one on one relationship with expenditure to track the monthly salary of the staff.
It has a one to many relationship with the schedule table as one staff can be scheduled to have multiple appointments.

 
License:
The license table is a disjoint subtype of staff members connected over staff_type where all the staff members that have a type “medical professionals” would have their details such as type of doctor, license id, license validity stored. The business can track the license of all its medical professionals through this table.


Patients:
This table will contain information of all the patients that will come for treatment. The attribute patient_id is the primary key of this table. It also includes the first name, last name, date of birth, address and phone number of the patient. Insurance_subscriber_id, insurance_provider_name and coverage_type are the foreign keys that are taken from the Insurance Table. The column “scheduling state” is to track the state of patient at any time. The 'states', when it comes to scheduling, would be: contacted, scheduled, recently visited, up for next visit, dormant.
Patients has a one to many relationship with the Schedule table as a patient can have multiple appointments scheduled.
Similarly, it has a one to many relationship with Billing table as one patient can have multiple bills.
It has a many to many relationship with procedures table as many patients can have one procedure scheduled, and many procedures can be scheduled by one patient. 

Procedures:
This table contains all the procedures that are provided by the dental practice. This includes procedures (eg teeth cleaning), treatments (eg gum disease) and surgeries (eg tooth extraction). 
Procedure_id is the primary key. It also includes patient_id as foreign key from the Patients table. Connecting it with the patients table would help the business trac the medical history of the patients. Patients table has a many to many relationship with this table as many patients can sign up for one procedure, and many procedures can be taken up by one patient.
It has procedure_type attribute that provides the codes of type of procedures available to perform (referred from Dental coding). It also has name and cost of each procedure.
It has a many to many relationship with Schedule as many appointments can be scheduled for one procedure, and many procedures can be scheduled in one appointment.
It also has a one to one relationship with billing table as one procedure would be billed once.


Schedule:
This table is used to keep track of the daily appointments. It has appointment_id as its primary key, with patient_id from patients table, staff_id from Staff table, and Procedure_id from procedure table as foreign keys. It also has date and time of the appointment, and which room is allocated for that appointment. 
It has a one to one relationship with Billing table as one appointment would be billed once.


Billing:
Billing table is created to get the final bill amount after every treatment. It has bill_id as its primary key. It takes the appointment_id from schedule table, procedure_id from procedures table, patient_id from patient table, insurance_subscriber_id, insurance_provider_name and coverage_type from insurance table as foreign key. Other than this, it includes Amount owed by the patient, amount paid by insurance, and amount paid by patient.
All the relationships with other tables are mentioned above.
 
Expenditures:
This table can be used to track the monthly expenses of the business. It is connected to Staff table in a one to one relationship to keep a track of the salary of the staff. This table has attributes: month, year,  type of expense (loan payment, startup costs, lease, supplies restock, operational costs), name of expense (include furniture, dental equipment, software (for scheduling, billing etc), supplies, training, needles, drugs, facility cleaning, utilities, food in the breakout area, etc), cost of each expense, due date, paid or pending expense.
(Here, I am making an assumption that loan + interest is paid “monthly” for 10 years)
ANSWERING THE SCENARIOS:
1.	Loan assumed to be paid every month and can be found in Expenditures table.

2.	Medical license can be tracked in License table.

3.	Each morning, the owners can check the Schedule table to see the day’s schedule.

4.	At the end of the day, the owners can add the “cost” column of all the rows with date = dd/mm/yyyy(today’s date) to check the billable income generated by the days’ service.

5.	The cost of supplies and operations can be tracked in the Expenditures table through paid_pending attribute.

6.	Lease amount can be tracked in the Expenditures table through paid_pending attribute.

7.	The salaries of the staff can be tracked in the Expenditures table through paid_pending attribute.

8.	Finally, the monthly income can be tracked from Billing table (Get the total bill amount for that month) and the Expenditure can be tracked from the Expenditure table (get the total expenditure for that month). 
These values can be subtracted to check whether it was a profitable month or not.  
