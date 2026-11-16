# M1: Normalization Analysis — Kanat Mobility

## Part B2: Normalization of legacy_rides to BCNF
In this section, we take the denormalized legacy table \legacy_rides\ containing historical rental data and systematically decompose it from First Normal Form (1NF) up to Boyce-Codd Normal Form (BCNF).

### 1. Initial Schema and Attributes (R)
Let the universal relation be:
mainR = (\text{ride\_id}, \text{rider\_id}, \text{rider\_name}, \text{rider\_national\_id}, \text{vehicle\_id}, \text{model\_id}, \text{model\_name}, \text{start\_zone\_id}, \text{start\_zone\_name}, \text{unlock\_fee}, \text{minute\_price})main

### 2. Functional Dependencies (FDs)
The set of functional dependencies $ identified for this relation is:
1. $\text{ride\_id} \rightarrow \text{rider\_id}, \text{rider\_name}, \text{rider\_national\_id}, \text{vehicle\_id}, \text{model\_id}, \text{model\_name}, \text{start\_zone\_id}, \text{start\_zone\_name}, \text{unlock\_fee}, \text{minute\_price}$
2. $\text{rider\_id} \rightarrow \text{rider\_name}, \text{rider\_national\_id}$
3. $\text{vehicle\_id} \rightarrow \text{model\_id}, \text{model\_name}$
4. $\text{model\_id} \rightarrow \text{model\_name}, \text{unlock\_fee}, \text{minute\_price}$
5. $\text{start\_zone\_id} \rightarrow \text{start\_zone\_name}$

### 3. Step-by-Step Normalization
* **1NF:** All attributes contain atomic values. The relation is in 1NF.
* **2NF:** Decomposing partial dependencies on candidate keys:
  * (\underline{\text{rider\_id}}, \text{rider\_name}, \text{rider\_national\_id})$
  * (\underline{\text{vehicle\_id}}, \text{model\_id})$
  * (\underline{\text{model\_id}}, \text{model\_name}, \text{unlock\_fee}, \text{minute\_price})$
  * (\underline{\text{start\_zone\_id}}, \text{start\_zone\_name})$
  * (\underline{\text{ride\_id}}, \text{rider\_id}, \text{vehicle\_id}, \text{start\_zone\_id})$
* **3NF & BCNF:** All decomposed relations satisfy BCNF since every determinant is a superkey, ensuring lossless join and dependency preservation.

---

## Part B3: Analysis of technician_assignment (3NF vs. BCNF)
We analyze the relation managing technician assignments:

main\text{TechAssignment}(\text{assignment\_id}, \text{technician\_id}, \text{zone\_id}, \text{task\_date}, \text{supervisor\_id})main

### 1. Functional Dependencies
1. $\text{assignment\_id} \rightarrow \text{technician\_id}, \text{zone\_id}, \text{task\_date}, \text{supervisor\_id}$
2. $\text{technician\_id} \rightarrow \text{supervisor\_id}$

### 2. Normal Form Evaluation
* **Candidate Key:** $\{\text{assignment\_id}\}$
* **3NF Status:** In 3NF because non-prime attributes depend transitively through superkeys.
* **BCNF Violation:** $\text{technician\_id} \rightarrow \text{supervisor\_id}$ violates BCNF because $\text{technician\_id}$ is not a superkey.

### 3. Resolution
Decomposed into:
1. (\underline{\text{technician\_id}}, \text{supervisor\_id})$
2. (\underline{\text{assignment\_id}}, \text{technician\_id}, \text{zone\_id}, \text{task\_date})$
