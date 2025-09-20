			DENTAL PRACTICE HW-2
In this HW, the database referring to the ER diagram created in HW1 is created. Slight changes are made in the procedure table by adding a "procedure_minutes" column to calculate the total time taken by the procedure. This change will help in solving the 1st Question.
ALTER TABLE Procedures ADD procedure_minutes NUMBER;

Question 1:
Link: - https://livesql.oracle.com/apex/livesql/s/bchzzpw9dfonomhradqh5rimi

Assumptions:
1. Procedures time in the Procedure table is the ideal time, but it will not be the same for every operation. The time may fluctuate according to the patients condition and needs. Hence, the Schedule table has fluctuatating procedure time.
2. Even if the time varies, the procedure cost remains the same, as the cost is based on equipments used and efforts of doctor, and not on time taken.

Output: - 
Average Procedure cost: - 120+120+430+430+240 = 1340/5 = 268$.
Average Procedure time: - 65+70+160+150+105 = 550/5 = 110 minutes.


Question 2:
Link: - https://livesql.oracle.com/apex/livesql/s/bcicbcil94wdtpu3kyqg1k8x6

Assumptions:
It uses the same table as Question 1. Hence, theassumptions woud be similar to that of Question 1.

Output: - 
Lets take the date 01-05-2024, that has two appointments.
Hence, procedure cost of both = 430+430 = 840$.

This script can be used for any date the owner wishes to enter. It will print the total income earned by the practice on that particular date. 


Question 3:
Link: https://livesql.oracle.com/apex/livesql/s/bcii0jq8w4uiklh942ah84tg6

Assumptions:
1. All skills mentioned are not case sensitive. 

Output:
If you observe the table, Staff 1 and Staff 2 can do all the tasks that are inputted.
Hence, The script will display the first name of Staff 1 and Staff 2.


Question 4:
Write a query to check the efficiency with which the operations are executed. If the Procedure ideal time is more than the actual time taken, then the doctors are performing efficiently. If not, then the doctors are underwhelming in their operation time.

For this, subtract the procedure time from the procedure table from the one from Schedule table.
If the value is negative, then the doctors are going overtime. 
If it is positive or zero, then the doctors are fiiciently executing the procedure.
This can be checked by the owners on a monthly basis to keep a track of their doctors' performance.

  
Link: 
https://livesql.oracle.com/apex/livesql/s/bci24qi5en4wys0gyrgg2i545

Output: 
All operation times are a little bit ahead of procedure's ideal time. Hence, the doctors should focus on being more efficient.