# fawry-task



# mygrep.sh

`mygrep.sh` is a simple script that mimics the behavior of the `grep` command with basic functionality and some additional options. It searches for a string in a text file and provides various features such as showing line numbers and inverting the match.

## Usage

bash
./mygrep.sh [options] search_string file


### Options:
- `-n` : Show line numbers for each match.
- `-v` : Invert the match (show lines that do **not** match the string).
- `--help` : Display this help message.

### **How to test:**
1. To test the script, create a file called `testfile.txt` with the following content:

   Hello world
   This is a test
   another test line
   HELLO AGAIN
   Don't match this line
   Testing one two three


2. Run the script with the appropriate options:

   ./mygrep.sh hello testfile.txt
   ./mygrep.sh -n hello testfile.txt
   ./mygrep.sh -vn hello testfile.txt
   ./mygrep.sh -v testfile.txt


### **How to Run the Script:**
1. Make the script executable:
   
   chmod +x mygrep.sh

### **Contact:**
For any issues, contact [Mohamed662172 on GitHub](https://github.com/Mohamed662172).
