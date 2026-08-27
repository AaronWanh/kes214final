# Karolina Sienko - EDS 214 Final Project Self-Assessment

## Automate

#### The entire analysis is automated

- Data reading and cleaning is handled in a standalone script that creates intermediate output(s).

*Not yet: My data reading and cleaning are handled in their own script but there are no outputs that have been created yet.*

- The analysis is performed in a Quarto document that reads intermediate outputs.

*Not yet: Since I don't have any outputs yet, my Quarto document can't read them yet.*

- Files in the R/ folder exclusively define functions and have no other side effects.

*Meets spec: I only have one file in my R folder and it's where the moving_average function is defined and nothing else.*

- All scripts run without errors.

*Meets spec: All of my scripts run without errors.*

#### The analysis produces the expected output

- The Quarto document performs the data analysis (moving average).

*Meets spec: My Quarto document does perform all the data analysis, including calling the moving_average function.*

- The Quarto document creates a figure that is a reasonable approximation of the original.

*Not yet: I have the code for creating the figure in my Quarto document, but I made it so there was no output and inserted the image of the graph. I need to see if this is allowed or if I should just have it output the figure from the code.*


## Organize

#### Data are properly organized

- Raw data is contained in its own folder.

*Meets spec: All of my raw data is in the raw_data folder.*

- Outputs are contained in a separate folder from raw data.

*Not yet: I don't have a separate folder for my outputs yet. I need to make one and save my outputs there.*

#### Code is properly organized

- At least one function is defined in a script in R/ and used elsewhere in the workflow.

*Meets spec: The moving_average function is defined in a script in R/ and is used in the main analysis code.*

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

*Not yet: I'm going to do this at the end once I have all the correct files and folders organized.*

- Details regarding data access
    - Any necessary information on where data lives (e.g. is it housed in the repo, on a server, in a library/package etc.) and how to access it in order to run the code

*Not yet: I describe where the data is in the repo but not how to access it in order to run the code.*

- A list of authors or current contributors (for collaborative work)
    - Consider hyperlinking collaborators’ GitHub profiles or other professional profile

*Meets spec: I do list myself as an author and list Max and Ale as contributors.*

- References
    - In an appropriate, consistent format, including links.
    - Don’t forget to add references for datasets too.

*Not yet: I have the references for the paper and website where we got the data, but it's not in a nice format yet.*

#### Code follows a professional style

- All code files follow a consistent style (the Air formatter automates this).

*Meets spec: Yes, the style of my code is consistent.*

- The code has an appropriate amount of comments.
    - Comments are minimized by using meaningful variable names and helper functions.
    - Comments are used to explain the why of code, not the what.

*Meets spec: Yes, I have comments throughout my code explaining the purpose.*