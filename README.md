# Student Directory #

<div align="center">
  <img alt="student-directory-logo" src="https://cloud.githubusercontent.com/assets/6470014/25412104/78a3e690-2a18-11e7-91e5-01bb8815d8bf.jpg" width="100%"/>
</div>


The student directory script allows you to manage the list of students enrolled at Villains Academy.


## How to use :boom:

```shell
ruby directory.rb
```


# Exercises :runner:

1. We're using the each() method to iterate over an array of students. How can you modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter"?

2. Modify your program to only print the students whose name begins with a specific letter.

3. Modify your program to only print the students whose name is shorter than 12 characters.

4. Rewrite the each() method that prints all students using while or until control flow methods (Loops).

5. Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.

6. Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.

7. In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?

8. Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.

9. Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it used singular form when appropriate and plural form otherwise?

10. We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments).

11. Once you have completed the "Asking for user input" section, open [this file](https://raw.githubusercontent.com/anitacanita/student-directory/master/typos.rb). It's Ruby code but it has some typos. Copy it to a local file and open it in Atom without syntax highlighting. To do this, select "Plain Text" in the lower right corner of the window. []

12. What happens if the user doesn't enter any students? It will try to print an empty list. How can you use an if statement (Control Flow) to only print the list if there is at least one student in there?


## Exercise List :eyes:

- [x] 1 [Commit b91fc10](https://github.com/marioribeiro/student-directory/commit/b91fc10cab30bbbad906770043093b4050f711ec)
- [x] 2 [Commit b91fc10](https://github.com/marioribeiro/student-directory/commit/de22dbc31825a60409447c8a49dfa4899ad28faf)
- [x] 3 [Commit 8962484](https://github.com/marioribeiro/student-directory/commit/896248483b28e8b578af61a2b817fc2308430c12)
- [x] 4 [Commit 084c573](https://github.com/marioribeiro/student-directory/commit/084c5732e93042a8cfb8d4750582128aaa96142b)
- [x] 5 [Commit 7fe7779](https://github.com/marioribeiro/student-directory/commit/7fe77792d02355a1a97dc9a3fc5a2489d33da57e)
- [ ] 6
- [x] 7 [Commit 1e860a3](https://github.com/marioribeiro/student-directory/commit/1e860a33a75bb17c539a2b6279a470ee23b8e439)
- [ ] 8
- [x] 9 [Commit de22dbc](https://github.com/marioribeiro/student-directory/commit/de22dbc31825a60409447c8a49dfa4899ad28faf)
- [ ] 10
- [ ] 11
- [x] 12 [Commit 18e2fd1](https://github.com/marioribeiro/student-directory/commit/18e2fd1f2c1556cb5b285e74cbd4213fde28c054)
