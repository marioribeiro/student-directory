# Student Directory #

<div align="center">
  <img alt="student-directory-logo" src="https://cloud.githubusercontent.com/assets/6470014/25412104/78a3e690-2a18-11e7-91e5-01bb8815d8bf.jpg" width="100%"/>
</div>


The student directory script allows you to manage the list of students enrolled at Villains Academy.


## How to use :boom:

```shell
ruby directory.rb
```


# Exercises - Step 8 :runner:

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

11. Once you have completed the "Asking for user input" section, open [this file](https://raw.githubusercontent.com/anitacanita/student-directory/master/typos.rb). It's Ruby code but it has some typos. Copy it to a local file and open it in Atom without syntax highlighting. To do this, select "Plain Text" in the lower right corner of the window.

12. What happens if the user doesn't enter any students? It will try to print an empty list. How can you use an if statement (Control Flow) to only print the list if there is at least one student in there?


## Exercise List - Step 8 :eyes:

- [x] 8.1 [Commit b91fc10](https://github.com/marioribeiro/student-directory/commit/b91fc10cab30bbbad906770043093b4050f711ec)
- [x] 8.2 [Commit b91fc10](https://github.com/marioribeiro/student-directory/commit/de22dbc31825a60409447c8a49dfa4899ad28faf)
- [x] 8.3 [Commit 8962484](https://github.com/marioribeiro/student-directory/commit/896248483b28e8b578af61a2b817fc2308430c12)
- [x] 8.4 [Commit 084c573](https://github.com/marioribeiro/student-directory/commit/084c5732e93042a8cfb8d4750582128aaa96142b)
- [x] 8.5 [Commit 7fe7779](https://github.com/marioribeiro/student-directory/commit/7fe77792d02355a1a97dc9a3fc5a2489d33da57e)
- [x] 8.6 [Commit 0864582](https://github.com/marioribeiro/student-directory/commit/086458232f68bc3a1448e18a474af8d59ecce358)
- [x] 8.7 [Commit 1e860a3](https://github.com/marioribeiro/student-directory/commit/1e860a33a75bb17c539a2b6279a470ee23b8e439)
- [x] 8.8 [Commit 4d9c574](https://github.com/marioribeiro/student-directory/commit/4d9c5740d26d9bcfaa2572f7656b43ef7e6a6417)
- [x] 8.9 [Commit de22dbc](https://github.com/marioribeiro/student-directory/commit/de22dbc31825a60409447c8a49dfa4899ad28faf)
- [x] 8.10 [Commit cf2b93f](https://github.com/marioribeiro/student-directory/commit/cf2b93f4481c239987b7e8e38b1fb741e8034a7b)
- [x] 8.11 [Commit 775261a](https://github.com/marioribeiro/student-directory/commit/775261a7edc881dc4c9052aa164278f4c60c3076)
- [x] 8.12 [Commit 18e2fd1](https://github.com/marioribeiro/student-directory/commit/18e2fd1f2c1556cb5b285e74cbd4213fde28c054)

# Exercises - Step 14 :runner:

1. After we added the code to load the students from file, we ended up with adding the students to @students in two places. The lines in load_students() and input_students() are almost the same. This violates the DRY (Don't Repeat Yourself) principle. How can you extract them into a method to fix this problem?

2. How could you make the program load students.csv by default if no file is given on startup? Which methods would you need to change?

3. Continue refactoring the code. Which method is a bit too long? What method names are not clear enough? Anything else you'd change to make your code look more elegant? Why?

4. Right now, when the user choses an option from our menu, there's no way of them knowing if the action was successful. Can you fix this and implement feedback messages for the user?

5. The filename we use to save and load data (menu items 3 and 4) is hardcoded. Make the script more flexible by asking for the filename if the user chooses these menu items.

6. We are opening and closing the files manually. Read the documentation of the File class to find out how to use a code block (do...end) to access a file, so that we didn't have to close it explicitly (it will be closed automatically when the block finishes). Refactor the code to use a code block.

7. We are de-facto using CSV format to store data. However, Ruby includes a library to work with the CSV files that we could use instead of working directly with the files. Refactor the code to use this library.

8. Write a short program that reads its own source code (search StackOverflow to find out how to get the name of the currently executed file) and prints it on the screen.

## Exercise List - Step 14 :eyes:

- [x] 14.1 [Commit 386283a](https://github.com/marioribeiro/student-directory/commit/386283a1fc80d0d7b82e8e8e83fcef33c95b4767)
- [ ] 14.2
- [ ] 14.3
- [ ] 14.4
- [ ] 14.5
- [ ] 14.6
- [ ] 14.7
- [ ] 14.8
