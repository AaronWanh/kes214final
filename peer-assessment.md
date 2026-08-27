## Automate

#### The entire analysis is automated

- Data reading and cleaning is handled in a standalone script that creates intermediate output(s).

*Met spec: 1_clean_data.R is very well organized with great amount of comments for explanation on what is happening.*

- The analysis is performed in a Quarto document that reads intermediate outputs.

*Met spec: output folder made and labeled*

- Files in the R/ folder exclusively define functions and have no other side effects.

*Met spec: I only have one file in my R folder and it's where the moving_average function is defined and nothing else.*

- All scripts run without errors.

*Meets spec: All of my scripts run without errors.*

#### The analysis produces the expected output

- The Quarto document performs the data analysis (moving average).

*Mets spec: Your Quarto document looks very professional and organized! It makes understanding what you did clear and concise.*

- The Quarto document creates a figure that is a reasonable approximation of the original.

*Met specs: The figure looks great in your results, but would reccomend adding color because it is hard to distinguish Q1, Q2, and Q3 because the style of the lines look very similar at certain points.*


## Organize

#### Data are properly organized

- Raw data is contained in its own folder.

*Meets spec: All of my raw data is in the raw_data folder.*

- Outputs are contained in a separate folder from raw data.

*Met specs: It is very helpful that you labled the csv you created in the folder. I would reccomend renaming it once you are fully finished.*

#### Code is properly organized

- At least one function is defined in a script in R/ and used elsewhere in the workflow.

*Meets spec: The moving_average function is defined in a script in R/ and is used in the main analysis code. If you would like to create another function, you can develop one that extracts the relevant colums. I am going to attempt this to make it look more tidy.*

- All code in the repo (except in the scratch/ folder) is required for the analysis (i.e., no “safety blanket” code remaining)

*Meets spec: All of my code is either in the scratch/ folder or main analysis code.*


## Document

#### The repo has an effective README

- A short, but descriptive title

*Not yet: I need to make the title shorter.*

- A brief explanation of the repository’s purpose
    - Paragraphs or a bulleted list are both acceptable options
    - You may include an image or logo that represents the project

*Meets spec: I do have a brief explanation of the repo's purpose explaining we're re-generating a certain figure from a certain paper.*

- A concise description of what’s housed in the repository
    - This includes information about the repository structure or file organization

*Not yet: I'm going to do this at the end once I have all the correct files and folders organized. In your README on line 21, you said a file was named 2_clean_data, ensure you rename your folder to match. Just for conistency double check that what you call the files in the read me are the same as the name of the folders.*

- Details regarding data access
    - Any necessary information on where data lives (e.g. is it housed in the repo, on a server, in a library/package etc.) and how to access it in order to run the code

*Not yet: I describe where the data is in the repo but not how to access it in order to run the code.*

- A list of authors or current contributors (for collaborative work)
    - Consider hyperlinking collaborators’ GitHub profiles or other professional profile

*Meets spec:*

- References
    - In an appropriate, consistent format, including links.
    - Don’t forget to add references for datasets too.

*Met spec:*

#### Code follows a professional style

- All code files follow a consistent style (the Air formatter automates this).

*Meets spec: Yes, the style of my code is consistent.*

- The code has an appropriate amount of comments.
    - Comments are minimized by using meaningful variable names and helper functions.
    - Comments are used to explain the why of code, not the what.

*Meets spec: I enjoyed your comments!*