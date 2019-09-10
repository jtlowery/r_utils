Simple tool to perform inner joins (joining rows when they have equal values in specified columns in each file) between two files.

Steps to use:
  1. Install R (RStudio for Mac) if not already installed
  2. Create one folder with files to create chord diagrams in
      * Easiest to create this folder in Desktop and move the folder later to desired research project file (this helps in step 6)
  3. Download the create_chord.R file or this project
  4. Put chord_diagram files to be made into figures in R into the newly created folder
  5. Save files desired graph into csv (comma separated values) format if not already done so. Make sure all column names have no spaces
      * any spreadsheet software should allow saving into this format when doing 'Save As' or the equivalent
      * it can be a good precaution to take to enclose all text cells with quotation marks (particularly if there may be commas in them)
  6. Open a terminal
  7. Move working directory to the chord_diagram directory in the project
      * `cd /pathtofolder/` (e.g. `cd /Users/Anne/Downloads/r_utils-master/chord_diagram/`)
      * To find the path to the folder you can also two finger click (right click) on the folder of your choice, selected "Get Info" and find the path under "Where"
  8. Run `chmod +x create_chord.R`. This step only needs to be done once.
  9. Run the script on your desired file(s). See example command below:
      * ``./create_chord.R example_data.csv example_chord.pdf`
