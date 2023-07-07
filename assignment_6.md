# Normalization


## **Question 1: Answer**

The highest normal form of the given relation scheme "student Performance (StudentName, CourseNo, EnrollmentNo, Grade)" is **3NF**.

**Candidate keys for the relation scheme are:**

* StudentName, CourseNo
* CourseNo, EnrollmentNo

**Prime attributes:** _StudentName, CourseNo, EnrollmentNo_.

**Non-prime attributes:** _Grade_


1. First Normal Form (1NF): The relation scheme satisfies 1NF as it does not contain any repeating groups, and each attribute holds atomic values.
2. Second Normal Form (2NF): Since there are no partial dependencies, the relation scheme also satisfies 2NF.
3. Third Normal Form (3NF): The relation scheme satisfies 3NF as there are no transitive dependencies that violate 3NF.

* The relation fails the BCNF because not every functional dependency is not candidate key or super key.

#
#

## **Question 2: Answer**
The given realtion  R= (A, B, C, D, E )
and functional
dependencies: {CE →D, D→B, C →A}

### A:
Candidate keys for the relation scheme are: **_{ CE }_**

**Prime attributes:** ( _E, C_).

**Non-prime attributes:** (_A, B, D_)

### B:
The highest normal form of the given relation scheme  R(A, B, C, D, E) is **1NF**.


The relation fails at the 2NF, all the functional dependencies does not satisfy the 2NF condition i.e all the non-prime attributes should be dependent on candidate keys or super keys not the proper subset of candidate keys or super keys.

### C:
Currently the relation R(A, B, C, D, E) is in **1NF**.

**STEP:1**:
The relation **R** is decomposed in to 2 relations **R1** and **R2** having **C** as common attribute.

**R1={C, A}**               
* It is in **_BCNF_**
* Candidates key: **_{ C }_**
* Dependencies: _{C →A}_

**R2={B, C, D, E}**
* It is in **_2NF_**
* Candidates key: **_{ CE }_**
* Dependencies: none

**STEP:2**:
The relation **R2** is further decomposed in to 2 relations **R3** and **R4** having **D** as common attribute.

**R3={D, B}**               
* It is in **_BCNF_**
* Candidates key: **_{ D }_**
* Dependencies: _{D →B}_

**R4={D, C, E}**               
* It is in **_BCNF_**
* Candidates key: **_{ CE }_**
* Dependencies: none

_Finally the relation **R(A, B, C, D, E)** is decomplosed into three relations **R1(C, A)**, **R3(D, B)** and **R4(D, C, E)** which all are in **BCNF**._

#
#

## **Question 3: Answer**

The highest normal form of the given relation scheme  R(A, B, C, D, E, F) is **1NF**.

**Candidate keys for the relation scheme are:**

* ABC
* ADC

**Prime attributes:** ( _A, B, C, D_).

**Non-prime attributes:** (_E, F_)

### A:
(_ABC, ADC_) are the **candidate keys** of the given relation.

### B:
* A relation is said to be in BCNF in DBMS if the relation is already in 3NF, and also, for every functional dependency (say, X->Y), X is either the super key or the candidate key. The relation is not in BCNF (Boyce-Codd Normal Form) because it fails at 2NF (Second Normal Form). In 2NF, a relation must first satisfy the conditions of 1NF (First Normal Form), and then ensure that all non-prime attributes are fully functionally dependent on the entire candidate key.

* To explain why the relation is also not in 3NF (Third Normal Form), we need to understand that 3NF builds upon the requirements of 2NF. In 3NF, a relation should satisfy the conditions of 2NF, and further ensure that there are no transitive dependencies.A transitive dependency occurs when a non-prime attribute is functionally dependent on another non-prime attribute rather than directly on the candidate key. In other words, there should be no indirect dependencies between non-prime attributes.

**_In this case, the relation fails at 2NF because a superset of the candidate key (ADC) determines a non-primary attribute(F). This violates the condition of 2NF, which requires that non-prime attributes be dependent on the entire candidate key and not just a subset of it._**


#
#

## **Question 4: Answer**


### Advantages

* **Reduced redundancy:** Normalization reduces the amount of redundant data in a database. This can improve performance, as it reduces the amount of data that needs to be stored and retrieved. It can also improve data integrity, as it reduces the chances of errors occurring when data is updated.
* **Increased data consistency:** Normalization ensures that data is consistent throughout a database. This is because each piece of data is only stored in one place, and any changes to the data are reflected in all of the tables that reference it.
* **Improved flexibility:** Normalization can make a database more flexible, as it makes it easier to add new data or change existing data. This is because the data is stored in a way that is independent of other data in the database.
* **Enhanced security:** Normalization can improve the security of a database, as it makes it more difficult for unauthorized users to access sensitive data. This is because the data is stored in a way that is not easily accessible.

### Disadvantages

* **Increased complexity:** Normalization can increase the complexity of a database, as it requires more tables and relationships. This can make it more difficult to understand and manage the database.
* **Reduced performance:** Normalization can reduce the performance of a database, as it requires more joins and lookups to retrieve data.
* **Increased storage requirements:** Normalization can increase the storage requirements of a database, as it requires more tables and columns.

#
#

## **Question 5: Answer**


The decomposition of R into R1 and R2 is:

**R1 = (S, T, U)**

**R2 = (U, V)**

This decomposition is lossless because the intersection of R1 and R2 is the attribute U, which is a key for both R1 and R2. Additionally, all of the functional dependencies are preserved in the decomposition.

To see this, note that the only way to determine the value of T in R1 is by knowing the values of S and U. Similarly, the only way to determine the value of V in R2 is by knowing the value of U. Therefore, R1 and R2 together contain all of the information that is in R.

In addition, the decomposition is **BCNF**. This is because there are no partial ans transitive functional dependencies in the original schema, and the decomposition does not introduce any new partial or transitive functional dependencies.

_Therefore, the decomposition of **R** into **R1** and **R2** is lossless and in **BCNF**._