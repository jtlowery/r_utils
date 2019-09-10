Simple tool to perform inner joins (joining rows when they have equal values in specified columns in each file) between two files.

Steps to use:
  1. Install R (RStudio for Mac) if not already installed
  2. Create one folder with files to be merged and for output files to be saved to
      * Easiest to create this folder in Desktop and move the folder later to desired research project file (this helps in step 6)
  3. Download the merge_files.R file or this project
  4. Put merge_files R file into the newly created folder
  5. Save files desired to merge into csv (comma separated values) format if not already done so. Make sure all column names have no spaces
      * any spreadsheet software should allow saving into this format when doing 'Save As' or the equivalent
      * it can be a good precaution to take to enclose all text cells with quotation marks (particularly if there may be commas in them)
  6. Open a terminal
  7. Move working directory to the chord_diagram directory in the project
      * `cd /pathtofolder/` (e.g. `cd /Users/Anne/Downloads/r_utils-master/file_merge/`)
      * To find the path to the folder you can also two finger click (right click) on the folder of your choice, selected "Get Info" and find the path under "Where"
  8. Run `chmod +x merge_files.R`. This step only needs to be done once.
  9. Run the script on your desired files. See example commands below:

    * Example 1: join abc.csv (patient/sample file) and xyz.csv (database file) where column a in abc.csv is to be compared and merged with column x in xyz.csv

      ```./merge_files.R abc.csv xyz.csv a x output1.csv```
    * "a" in command line above is the column name you desire to merge. Ditto for "x" in your database files
    * again, please make sure to delete any spaces in column names and use underscore
    * Use this command to merge based on 1 column alone

    * Example 2: join abc.csv and xyz.csv where a == x OR b == y

      ```./merge_files.R abc.csv xyz.csv "a,b" "x,y" output2.csv```
    * "a, b" are column names in sample files
    * "x, y" are column names in database files
    * This command line will compared and merge files based on either of 2 columns
