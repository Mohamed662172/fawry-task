# fawry-task
عذرًا على اللبس! إليك النص كاملاً في تنسيق واحد لسهولة النسخ:

```
# mygrep.sh

`mygrep.sh` is a simple script that mimics the behavior of the `grep` command with basic functionality and some additional options. It searches for a string in a text file and provides various features such as showing line numbers and inverting the match.

## Usage

```bash
./mygrep.sh [options] search_string file
```

### Options:
- `-n` : Show line numbers for each match.
- `-v` : Invert the match (show lines that do **not** match the string).
- `--help` : Display this help message.

### Example Usage:

1. **Search for a string (case-insensitive) in a file:**

   ```bash
   ./mygrep.sh hello testfile.txt
   ```

   This will return all lines containing the word "hello" (case-insensitive).

2. **Search for a string and show line numbers:**

   ```bash
   ./mygrep.sh -n hello testfile.txt
   ```

   This will return all lines containing the word "hello" and display the line numbers.

3. **Invert the match (show lines that do not match):**

   ```bash
   ./mygrep.sh -v hello testfile.txt
   ```

   This will return all lines that **do not** contain the word "hello".

4. **Invert the match and show line numbers:**

   ```bash
   ./mygrep.sh -vn hello testfile.txt
   ```

   This will return all lines that do not contain the word "hello" and show the line numbers.

5. **Display help message:**

   ```bash
   ./mygrep.sh --help
   ```

   This will display the help message showing the available options and usage.

## Requirements
- Linux/Unix system with bash shell.
- The `grep` command is used internally for searching.

---

### **How to test:**
1. To test the script, create a file called `testfile.txt` with the following content:
   ```
   Hello world
   This is a test
   another test line
   HELLO AGAIN
   Don't match this line
   Testing one two three
   ```

2. Run the script with the appropriate options:
   ```bash
   ./mygrep.sh hello testfile.txt
   ./mygrep.sh -n hello testfile.txt
   ./mygrep.sh -vn hello testfile.txt
   ./mygrep.sh -v testfile.txt
   ```

---

### **Additional Notes:**
This script provides a basic implementation of `grep` with the ability to invert the match and show line numbers. It's a good starting point for learning about shell scripting and text processing.

---

### **How to Run the Script:**
1. Make the script executable:
   ```bash
   chmod +x mygrep.sh
   ```

2. Run the script:
   ```bash
   ./mygrep.sh <options> <search_string> <file_name>
   ```

---

### **License:**
This script is open-source and free to use. Modify and distribute as needed.

---

### **Contact:**
For any issues, contact [Mohamed662172 on GitHub](https://github.com/Mohamed662172).
