
### This homework is written by 張永濬 (312707048)

## **CH15.20** ##

## This exercise uses data from the STAR experiment introduced to illustrate fixed and random effects for grouped data. In the STAR experiment, children were randomly assigned within schools into three types of classes: small classes with 13–17 students, regular-sized classes with 22–25 students, and regular-sized classes with a full-time teacher aide to assist the teacher. Student scores on achievement tests were recorded as well as some information about the students, teachers, and schools. Data for the kindergarten classes are contained in the data file star.

## ch15.20(a)
Estimate a regression equation (with no fixed or random effects) where READSCORE is related to SMALL, AIDE, TCHEXPER, BOY, WHITE_ASIAN, and FREELUNCH. Discuss the results. Do students perform better in reading when they are in small classes? Does a teacher’s aide improve scores? Do the students of more experienced teachers score higher on reading tests? Does the student’s sex or race make a difference?

## **Ans.**
1. We estimate that the average reading score will be 5.8 points higher if the students are in a small class instead of a regular sized class. The coefficient is significantly different from zero using a 1% level of significance.
2. Having a teacher aide makes no significant improvement on the average reading score relative to the regular sized class.
3. Each year of teaching experience is estimated to increase average reading score by 0.49 points.
4. Boys are estimated to have 6 point lower reading scores than girl.
5. White or Asian students are estimated to have reading scores 3.91 points higher than black students.
6. Those students who receive a free lunch are predicted to have an average reading score that is 14.8 points lower than those who do not.

| Coefficients| Estimate | 
|-------------|----------|
| small       |   5.8 ***     |
| aide        |   0.82        |
|  tchexper   |   0.49 ***    |
| boy         |  -6.16 ***   |
| white_asian |   3.91  ***   |
| freelunch   | -14.8 ***   |













